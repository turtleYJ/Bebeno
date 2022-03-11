package com.bebeno.mvc.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.mypage.model.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
// ==================================================================
	
	@GetMapping("/profile")
	public String profile() {
		
		
		return "/mypage/profile";
	}
	
// ==================================================================	
	
	@GetMapping("/updatePwd")
	public String updatePwd() {
		
		
		return "/mypage/updatePwd";
	}
	
	// -------------------------------------------
	
	// 비밀번호 변경을 위한 컨트롤러 메소드
	@PostMapping("/updatePwdSet")
	public ModelAndView updatePwdSet(
			ModelAndView model) {
		
		// 1. 현재비밀번호와 입력값이 일치하는지 확인
		
		
		// 2. 비밀번호 변경
		
		
		return model;
	}
	
// ==================================================================
	
	@GetMapping("/deleteAccount")
	public String deleteAccount() {
		
		
		return "/mypage/deleteAccount";
	}
	
	// -------------------------------------------
	
	
// ==================================================================
	
	
	@GetMapping("/scrap")
	public String scrap() {
		
		
		return "/mypage/scrap";
	}
	
	// -------------------------------------------
	
	
	
// ==================================================================
	
	@GetMapping("/cart")
	public String cart() {
		
		
		return "/mypage/cart";
	}
	
	// -------------------------------------------
}
