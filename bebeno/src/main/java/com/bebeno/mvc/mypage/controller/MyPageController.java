package com.bebeno.mvc.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.member.model.vo.Member;
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
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
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
	@PostMapping("/updatePwd")
	public ModelAndView updatePwd(
			ModelAndView model,
			@RequestParam("password") String password,
			@RequestParam("newPwd") String newPwd,
			@SessionAttribute(name="loginMember") Member loginMember) {
		
		int result = 0;
		
		log.info("로그인한 회원의 정보 : {}", loginMember);
		log.info("로그인한 회원의 비밀번호 : {}", loginMember.getPassword());
		log.info("입력받은 비밀번호, 새 비밀번호 : {}, {}", password, newPwd);
		
	// 1. 현재비밀번호와 입력값이 일치하는지 확인
		// 암호화된 현재 비밀번호와 입력한 현재 비밀번호 확인
		boolean pwdMatch = pwdEncoder.matches(password, loginMember.getPassword());		
		log.info("회원의 비밀번호와 입력받은 비밀번호 일치 비교(true/false) : {}", pwdMatch);
		
		if(pwdMatch == false) { // 현재 비밀번호와 일치하지 않는 경우
			model.addObject("msg", "현재 비밀번호와 일치하지 않습니다.");
			model.addObject("location", "/mypage/updatePwd");
			
			model.setViewName("common/msg");
		} else {
	// 2. 비밀번호 변경
			result = service.modifyPwd(loginMember.getId(), newPwd);
			
			if(result > 0) {
				model.addObject("msg", "비밀번호가 변경되었습니다. 다시 로그인 해 주세요");
				model.addObject("location", "/mypage/profile");
				
				model.setViewName("common/msg");
			} else {
				
			}
			
		}
				
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
