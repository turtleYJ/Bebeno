package com.bebeno.mvc.wagle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/wagle_board")
public class wagleController {

	@GetMapping("/wagle_list")
	public String list() {
		
		return "/wagle_board/wagle_list";
	}
	
	@GetMapping("/wagle_write")
	public ModelAndView write(ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember
			) {
		
		model.addObject("loginMember", loginMember);
		model.setViewName("wagle_board/wagle_write");
		
		return model;
	}
	
	@GetMapping("/wagle_manage")
	public String manage() {
		
		return "/wagle_board/wagle_write_manage";
	}
}
