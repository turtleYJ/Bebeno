package com.bebeno.mvc.wagle.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.common.util.FileProcess;
import com.bebeno.mvc.common.util.FileUtil;
import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.shop.model.vo.ContentFiles;
import com.bebeno.mvc.wagle.model.service.WagleBoardService;
import com.bebeno.mvc.wagle.model.vo.Reply;
import com.bebeno.mvc.wagle.model.vo.Wagle;
import com.bebeno.mvc.wagle.model.vo.WagleFile;
import com.bebeno.mvc.wineboard.model.vo.WineBoard;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/wagle_board")
public class wagleController {
	@Autowired
	private WagleBoardService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@GetMapping("/wagle_list")
	public ModelAndView list(ModelAndView model) {
		List<Wagle> wagleList = null;
		
		wagleList =  service.getWagleList();
		
		System.out.println(wagleList.get(0).getCategory());
		
		model.addObject("wagleList", wagleList);
		model.setViewName("wagle_board/wagle_list");
		
		return model;
	}
	
	@GetMapping("/wagle_list_filter") 
	public ModelAndView listFilter(ModelAndView model, @RequestParam("category") String category) {
		List<Wagle> wagleList = null;
		
		wagleList =  service.getWagleListByCategory(category);
		
		System.out.println("category : " + category);
		System.out.println("filter 후 : " + wagleList);
		
		model.addObject("wagleList", wagleList);
		model.setViewName("wagle_board/wagle_list");
		
		return model;
	}
	
	@GetMapping("/wagle_view")
	public ModelAndView view(ModelAndView model, @RequestParam("no") int no) {
			Wagle board = service.findBoardByNo(no);
			List<WagleFile> fileList = service.findfileByNo(no);	
			
			board.setFiles(fileList);
			
			model.addObject("wagleboard", board);
			model.setViewName("wagle_board/wagle_view");
			
			System.out.println(board);
			System.out.println(board.getContent());
		
			return model;
	}
	
	@GetMapping("/wagle_write")
	public String write() {
		
		return "/wagle_board/wagle_write";
	}
	
	@PostMapping("/wagle_write")
	public ModelAndView write(ModelAndView model,
			@ModelAttribute Wagle wagleboard,
			@ModelAttribute WagleFile files,
			@RequestParam("upfile") MultipartFile upfile,
			MultipartHttpServletRequest Request,
			@SessionAttribute(name = "loginMember") Member loginMember) {

		List<MultipartFile> fileList = Request.getFiles("upfile");
		int result = 0;

		// 파일을 업로드하지 않으면 "", 파일을 업로드하면 "파일명"
		log.info("upfile Name : {}", upfile.getOriginalFilename());
		// 파일을 업로드하지 않으면 true, 파일을 업로드하면 false 
		log.info("upfile is Empty : {}", upfile.isEmpty());
		
		if(upfile != null && !upfile.isEmpty()) {
			
			String location = null;
			String renamedFileName = null;
	
			try {
				location = resourceLoader.getResource("resources/upload/wagle").getFile().getPath();
				renamedFileName = FileUtil.save(upfile, location);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				wagleboard.setOriginalFileName(upfile.getOriginalFilename());
				wagleboard.setRenamedFileName(renamedFileName);
			}
		}
		
		wagleboard.setNo(loginMember.getNo());
		
		System.out.println(wagleboard);
		
		result = service.save(wagleboard);
		
		// 멀티플 파일들을 업로드하고 ContentFiles vo에 저장
		for (MultipartFile mf : fileList) {
			 if(mf != null && !mf.isEmpty()) {
					// 파일을 저장하는 로직 작성
					String location = null;
					String renamedFileName = null;

					try {
						location = resourceLoader.getResource("resources/upload/wagle").getFile().getPath();
						renamedFileName = FileProcess.save(mf, location);
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					if(renamedFileName != null) {
						files.setW_file_no(wagleboard.getNo());
						files.setOriginalFileName(mf.getOriginalFilename());
						files.setRenamedFileName(renamedFileName);
					}
					
					service.fileSave(files);
			 }
       }
		
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/wagle_board/wagle_list?wagleno=" + wagleboard.getNo());
			
		}else {
			model.addObject("msg", "게시글 등록을 실패하였습니다.");
			model.addObject("location", "/wagle_board/wagle_list");
		}
		model.setViewName("/common/msg");
		
		return model;
	}
	

	
	@PostMapping("/wagle_update")
	public ModelAndView updateWagleBoard(ModelAndView model, 
			@SessionAttribute("loginMember") Member loginMember,
			@ModelAttribute Wagle wagle, @ModelAttribute WagleFile file,@RequestParam("upfile") MultipartFile upfile, MultipartHttpServletRequest Request
			) {
		List<MultipartFile> newfileList = Request.getFiles("upfile");		
		List<WagleFile> exfileList = service.findfileByNo(wagle.getNo());	
		
		log.info("newfileList : {}", newfileList.toString());
		log.info("newfileList.size : {}", newfileList.size());
		
		wagle.setFiles(exfileList);
		
		int result = 0;
		
		// 로그인 이용자와 게시물 작성자가 동일하면 특정 location에 기존 파일을 제거하고 파일을 추가하는 로직
		if (loginMember.getNo() == wagle.getWriterNo()) {
			if(upfile != null && !upfile.isEmpty()) {
				String renamedFileName = null;
				String location = null;
				
				try {
					location = resourceLoader.getResource("resources/upload/wagle").getFile().getPath();
					
					if(wagle.getRenamedFileName() != null) {
						// 이전에 업로드된 첨부파일 삭제
						FileProcess.delete(location + "/" + wagle.getRenamedFileName());
					}
					
					renamedFileName = FileProcess.save(upfile, location);
					
					if(renamedFileName != null) {
						wagle.setOriginalFileName(upfile.getOriginalFilename());
						wagle.setRenamedFileName(renamedFileName);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			result = service.save(wagle);
			
			// 새로 들어온 다중파일 리스트들이 존재하면 다음 로직을 실행한다.
			if(newfileList.get(0).getSize() != 0) {
				String location = null;
				String renamedFileName = null;
				
				try {
					location = resourceLoader.getResource("resources/upload/wagle").getFile().getPath();
					
					
					// 기존의 ContentFiles객체의 파일들을 지우고 db상에서도 delete하는 로직
					
					for(int i = 0; i < wagle.getFiles().size(); i++) {
						FileProcess.delete(location + "/" + wagle.getFiles().get(i).getRenamedFileName());
					}
					service.fileDeleteByStoreNo(wagle.getNo());
					
					for(MultipartFile mf : newfileList) {
						// 파일을 특정 location에 리네임파일네임으로 저장하는 로직
						renamedFileName = FileProcess.save(mf, location);
						
						// 파일이 리네임파일네임으로 저장 됐다면 file객체에 담아서 save하는 로직
						if(renamedFileName != null) {
							file.setW_file_no(wagle.getNo());
							file.setOriginalFileName(mf.getOriginalFilename());
							file.setRenamedFileName(renamedFileName);
						}
						
						service.fileSave(file);
					}

				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
					
			}
		
		if(wagle != null && wagle.getNo() > 0) {
			model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
			model.addObject("location", "/wagle_board/wagle_list");
		} else {
			model.addObject("msg", "게시글이 수정을 실패하였습니다.");
			model.addObject("location", "/wagle_board/wagle_list");
		}
		
		model.setViewName("common/msg");
		
		
		}
		return model;
	}
	
	@GetMapping("/delete")
	public ModelAndView delete(ModelAndView model, 
			@RequestParam("no") long no) {
		Wagle board = null;
		
		board = service.delete(no);
		
		if(board == null) {
			model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
			model.addObject("location", "/wagle_board/wagle_list");
		} else {
			model.addObject("msg", "게시글이 삭제를 실패하였습니다.");
			model.addObject("location", "/wagle_board/wagle_list");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}


}
