package com.bebeno.mvc.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bebeno.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
@RequestMapping("/mypage")
public class MyPageController {
	
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
	
	// 비밀번호 수정 버튼 클릭 시 작동하는 메소드(member의 vo 사용)
	@PostMapping("/updatePwd/set")
	public String updatePwdSet(@ModelAttribute Member member) {
		
		log.info(member.toString()); // jsp에서 input의 name값과 vo 필드명의 값이 같아야 한다.
		
		return "/mypage/updatePwd";
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
