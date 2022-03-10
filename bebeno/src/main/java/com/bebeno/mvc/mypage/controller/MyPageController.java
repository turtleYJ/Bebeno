package com.bebeno.mvc.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@RequestMapping("/profile")
	public String profile() {
		
		
		return "/mypage/profile";
	}
	
	@RequestMapping("/updatePwd")
	public String updatePwd() {
		
		
		return "/mypage/updatePwd";
	}
	
	@RequestMapping("/deleteAccount")
	public String deleteAccount() {
		
		
		return "/mypage/deleteAccount";
	}
	
	// -------------------------------------------
	
	@RequestMapping("/scrap")
	public String scrap() {
		
		
		return "/mypage/scrap";
	}
	
	// -------------------------------------------
	
	@RequestMapping("/cart")
	public String cart() {
		
		
		return "/mypage/cart";
	}
}
