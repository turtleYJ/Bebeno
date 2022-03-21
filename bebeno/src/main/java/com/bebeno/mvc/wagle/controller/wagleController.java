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
			@ModelAttribute ContentFiles files,
			@RequestParam("upfiles") MultipartFile upfiles,
			MultipartHttpServletRequest Request,
			@SessionAttribute(name = "loginMember") Member loginMember) {

		List<MultipartFile> fileList = Request.getFiles("upfiles");
		int result = 0;

		// 파일을 업로드하지 않으면 "", 파일을 업로드하면 "파일명"
		log.info("upfiles Name : {}", upfiles.getOriginalFilename());
		// 파일을 업로드하지 않으면 true, 파일을 업로드하면 false 
		log.info("upfiles is Empty : {}", upfiles.isEmpty());
		
		if(upfiles != null && !upfiles.isEmpty()) {
			
			String location = null;
			String renamedFileName = null;
	
			try {
				location = resourceLoader.getResource("resources/upload/wagle").getFile().getPath();
				renamedFileName = FileUtil.save(upfiles, location);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				wagleboard.setOriginalFileName(upfiles.getOriginalFilename());
				wagleboard.setRenamedFileName(renamedFileName);
			}
		}
		
		wagleboard.setNo(result);
		
		System.out.println(wagleboard);
		
		result = service.save(wagleboard);
		
//		for (MultipartFile mf : fileList) {
//			 if(mf != null && !mf.isEmpty()) {
//					// 파일을 저장하는 로직 작성
//					String location = null;
//					String renamedFileName = null;
////					String location = request.getSession().getServletContext().getRealPath("resources/upload/shop");
//
//					try {
//						location = resourceLoader.getResource("resources/upload/wagle").getFile().getPath();
//						renamedFileName = FileProcess.save(mf, location);
//					} catch (IOException e) {
//						e.printStackTrace();
//					}
//					
//					if(renamedFileName != null) {
//						files.setNo(wagleboard.getNo());
//						files.setFile_originalFileName(mf.getOriginalFilename());
//						files.setFile_renamedFileName(renamedFileName);
//					}
//					
//					service.fileSave(files);
//			 }
		
		
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

	
	
	@GetMapping("/wagle_manage")
	public String manage(@SessionAttribute(name = "loginMember") Member loginMember) {
		
		return "/wagle_board/wagle_write_manage";
	}
	

	
	@PostMapping("/wagle_update")
	public ModelAndView updateWagleBoard(ModelAndView model, @ModelAttribute Wagle wagleboard) {
		
		Wagle board = WagleBoardService.save(wagleboard);
		
		if(board != null && board.getNo() > 0) {
			model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
			model.addObject("location", "/wagle_board/wagle_list");
		} else {
			model.addObject("msg", "게시글이 수정을 실패하였습니다.");
			model.addObject("location", "/wagle_board/wagle_list");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/delete")
	public ModelAndView delete(ModelAndView model, 
			@RequestParam("no") long no) {
		Wagle board = null;
		
		board = WagleBoardService.delete(no);
		
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
	
	@RequestMapping("/reply")
	public ModelAndView writeReply(ModelAndView model, @ModelAttribute Wagle wagleboard, @SessionAttribute(name = "loginMember") Member member, Reply reply) {
		
		int result = 0;

		reply.setWagleNo(wagleboard.getNo());
		reply.setWriterNo(member.getNo());
		reply.setWriterId(member.getId());
		
		int boardNo = reply.getWagleNo();

		result = service.saveReply(member, reply);
		
		if(result > 0) {
			model.addObject("msg", "댓글 등록 완료!");
			model.addObject("location", "/board/view?no=" + boardNo);
		} else {
			model.addObject("msg", "댓글 등록 실패!");
			model.addObject("location", "/board/view?no=" + boardNo);	
			
		}
		
		model.setViewName("/common/msg");
		
		return model;
	}
	

}
