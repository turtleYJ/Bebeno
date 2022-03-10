package com.bebeno.mvc.mypage.controller;

import java.lang.System.Logger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.member.model.service.MemberService;
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
			ModelAndView model,
			@RequestParam("password") String password,
			@RequestParam("newPwd") String newPwd,
			@RequestParam("newPwdConfirm") String newPwdConfirm,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute Member member) {
		
		// 1. 현재 비밀번호 맞는지 체크
		String id = loginMember.getId();
		MyPage dbMyPageVo = service.getMemberById(id);
		
		boolean isPwdRight = passwordEncoder.matches(password, dbMyPageVo.getPassword());
		
		if(isPwdRight == false) { // 현재 비밀번호와 일치하지 않을 경우
			
			model.addObject("msg", "현재 비밀번호와 일치하지 않습니다.");
			model.addObject("location", "/mypage/updatePwd");
			
			model.setViewName("common/msg");
		}
		
		// 2. 새 비밀번호, 새 비밀번호 확인 맞는지 체크
		if(newPwd.equals(newPwdConfirm) == false) { //새 비밀번호, 새 비밀번호 확인 값이 틀릴 경우
			
			model.addObject("msg", "새 비밀번호와 확인 값이 일치하지 않습니다.");
			model.addObject("location", "/mypage/updatePwd");
			
			model.setViewName("common/msg");
			
		}
		
		// 3. DB 비밀번호 변경
		
		// 3-1 새로 입력한 비밀번호 암호화...? 배운것과 달라서 일단 패스 => ServiceImpl에서 암호화 시도
		int result = 0;
		
		result = service.modifyPwd(loginMember.getId(), newPwd);
		
		// 4. 비밀번호 완료 메세지 띄우고 로그아웃 처리
		if(result > 0) {
						
			model.addObject("msg", "비밀번호 변경을 성공적으로 완료했습니다. 다시 로그인해 주세요");
			model.addObject("location", "/logout");
			
			model.setViewName("common/msg");
		} else {
			model.addObject("msg", "비밀번호 변경에 실패했습니다.");
			model.addObject("location", "/mypage/updatePwd");
			
			model.setViewName("common/msg");
		}
		
		
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
