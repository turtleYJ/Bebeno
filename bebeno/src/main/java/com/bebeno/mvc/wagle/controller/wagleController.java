package com.bebeno.mvc.wagle.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.wagle.model.service.WagleBoardService;
//import com.bebeno.mvc.wagle.model.service.WagleBoardService;
import com.bebeno.mvc.wagle.model.vo.Wagle;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/wagle_board")
public class wagleController {
	@Autowired
	private WagleBoardService service;
//	
//	@Autowired
//	private ResourceLoader resourceLoader;
	
	@GetMapping("/wagle_list")
	public ModelAndView list(ModelAndView model) {
		List<Wagle> wagleList = null;
		
		wagleList =  service.getWagleList();
		
		System.out.println(wagleList);
		
		model.addObject("wagleList", wagleList);
		model.setViewName("wagle_board/wagle_list");
		
		return model;
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
	
	@GetMapping("/wagle_view")
	public String view() {
		
		return "/wagle_board/wagle_view";
	}
	
	@GetMapping("/wagle_update")
	public String update() {
		
		return "/wagle_board/wagle_update";
	}
}
