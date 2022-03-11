package com.bebeno.mvc.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.mypage.model.service.MyPageService;
import com.bebeno.mvc.mypage.model.vo.MyPage;

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
		
//		log.info("비밀번호 변경 페이지");
		
		return "/mypage/updatePwd";
	}
	
	// -------------------------------------------
	
	// 비밀번호 변경을 위한 컨트롤러 메소드
//	@PostMapping("/updatePwd")
//	public ModelAndView updatePwd(
//			ModelAndView model,
//			@RequestParam("password") String password,
//			@RequestParam("newPwd") String newPwd,
//			@SessionAttribute(name="loginMember") MyPage loginMember) {
//		
//		int result = 0;
//		
//		log.info("{}, {}", password, newPwd);
//		
////		System.out.println("입력한 현재 비밀번호 : " + password);
////		System.out.println("로그인 회원의 비밀번호 : " + loginMember.getPassword());
//		
//		// 1. 현재비밀번호와 입력값이 일치하는지 확인
//		if(password.equals(loginMember.getPassword())) {
//			System.out.println("일치");
//		}
//		
//		// 2. 비밀번호 변경
//		
//		
//		
//		model.addObject("msg", "테스트");
//		model.addObject("location", "/mypage/profile");
//		
//		model.setViewName("common/msg");
//		
//		return model;
//	}
	
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
