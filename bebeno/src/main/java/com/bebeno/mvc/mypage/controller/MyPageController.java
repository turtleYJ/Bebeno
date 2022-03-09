package com.bebeno.mvc.mypage.controller;

import java.lang.System.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.member.model.service.MemberService;
import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.mypage.model.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// =================================================
	
	@GetMapping("/profile")
	public String profile() {
		
		
		return "/mypage/profile";
	}
	
	// ---------------------------------
	
	// 비밀번호 수정 페이지 클릭 시 해당 뷰로 이동
	@GetMapping("/updatePwd")
	public String updatePwd() {		
		
		return "/mypage/updatePwd";
	}
	
	// ---------------------------------
	
	// 비밀번호 수정 버튼 클릭 시 작동하는 메소드(member의 vo 사용)
	@PostMapping("/updatePwd/set")
	public ModelAndView updatePwdSet(
			@RequestParam("password") String password,
			ModelAndView model,
			// @SessionAttribute : 세션영역의 어트리뷰트를 가져오는 어노테이션
			@SessionAttribute(name="loginMember") Member loginMember,
			@ModelAttribute Member member) {
		
		log.info("입력받은 password(현재비밀번호) : {}", password);
		
		
		
		
		
		
		model.addObject("msg", "비밀번호 수정");
		model.addObject("location", "/mypage/updatePwd");
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
	// ---------------------------------
	
	@GetMapping("/deleteAccount")
	public String deleteAccount() {
		
		
		return "/mypage/deleteAccount";
	}
	
	// ===========================================
	
	@GetMapping("/scrap")
	public String scrap() {
		
		
		return "/mypage/scrap";
	}
	
	// ===========================================
	
	@GetMapping("/cart")
	public String cart() {
		
		
		return "/mypage/cart";
	}
}
