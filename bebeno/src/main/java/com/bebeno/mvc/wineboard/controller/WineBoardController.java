package com.bebeno.mvc.wineboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.common.util.FileUtil;
import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.wineboard.model.service.WineBoardService;
import com.bebeno.mvc.wineboard.model.vo.WineBoard;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/wineboard")
public class WineBoardController {

	@Autowired
	private WineBoardService wineboardservice;
	
	@Autowired
	private ResourceLoader resourceLoader;

	// 게시물 리스트 페이지 
	@RequestMapping(value = "/wineList", method = RequestMethod.GET)
	public String wineBoardList(Model model, String shKeyword1) {
		List<WineBoard> list = wineboardservice.wineBoardList(shKeyword1);
		
		System.out.println(shKeyword1);
		
		model.addAttribute("list", list);
	
		return "wineboard/wineList";
	}
	
	// 상세페이지 
	@GetMapping("/wineView")
	public ModelAndView wineview(ModelAndView model, @RequestParam(value = "wineBno", required = false) Integer wineBno) {
		
		WineBoard wineboard = wineboardservice.findBoardByNo(wineBno);
		
		model.addObject("wineboard", wineboard);
		model.setViewName("wineboard/wineView");
		
		return model;
	}
	
	// 업데이트페이지 이동 
	@RequestMapping(value="/wineUpdate", method = RequestMethod.GET)
	public String getupdate(Integer wineBno, Model model) throws Exception {
			WineBoard data = wineboardservice.findBoardByNo(wineBno);
			model.addAttribute("data", data);
		
		return "/wineboard/wineUpdate";
	}
	
	// 게시물 업데이트 
	@PostMapping("/wineUpdate")
	public ModelAndView wineBoardUpdate(ModelAndView model, @ModelAttribute WineBoard wineboard) {
		
		int result;
		result = wineboardservice.save(wineboard);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
			model.addObject("location", "/wineboard/wineView?wineBno=" + wineboard.getWineBno());
		} else {
			model.addObject("msg", "게시글 수정을 실패하였습니다.");
			model.addObject("location", "/wineboard/wineUpdate?wineBno=" + wineboard.getWineBno());
		}
		
		model.setViewName("common/msg");
	  
		return model;
		
	}
	
	// 게시물 삭제
	@GetMapping("/delete")
	public ModelAndView delete(ModelAndView model, 
							@SessionAttribute("loginMember") Member loginMember ,
							@RequestParam(value = "wineBno", required = false) Integer wineBno) {
		
		int result = 0;
		WineBoard board = wineboardservice.findBoardByNo(wineBno);
		
		if(board.getWineBno() == loginMember.getNo()) {
			result = wineboardservice.delete(board.getWineBno());
		
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
				model.addObject("location", "/wineboard/wineList");
			} else {
				model.addObject("msg", "게시글 삭제를 실패하였습니다.");
				model.addObject("location", "/wineboard/wineView?wineBno=" + board.getWineBno());
			}
		} else {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("location", "/wineboard/wineList");
			}
		
			model.setViewName("common/msg");
		
			return model;
	}

	
	@GetMapping("/wineWrite")
	public String winewrite() {
		
	
		return "/wineboard/wineWrite";
	}
		
	// 게시글 등록
	@PostMapping("/wineWrite")
	public ModelAndView write(ModelAndView model, HttpServletRequest request,
			@ModelAttribute WineBoard wineboard, @RequestParam("upfile") MultipartFile upfile) {
		int result = 0;
		
		log.info("Upfile Name : {}", upfile.getOriginalFilename());
		log.info("Upfile is Empty : {}", upfile.isEmpty());
		
		if(upfile != null && !upfile.isEmpty()) {
			
			String location = null;
			String renamedFileName = null;
	
			try {
				location = resourceLoader.getResource("resources/upload/wineimg").getFile().getPath();
				renamedFileName = FileUtil.save(upfile, location);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				wineboard.setOriginalFileName(upfile.getOriginalFilename());
				wineboard.setRenamedFileName(renamedFileName);
			}
		}
		
		wineboard.setWineBno(result);
		result = wineboardservice.save(wineboard);
		
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/wineboard/wineList?wineBno=" + wineboard.getWineBno());
			
		}else {
			model.addObject("msg", "게시글 등록을 실패하였습니다.");
			model.addObject("location", "/wineboard/wineList");
		}
		model.setViewName("/common/msg");
		
		return model;
	}
		
	
}


















