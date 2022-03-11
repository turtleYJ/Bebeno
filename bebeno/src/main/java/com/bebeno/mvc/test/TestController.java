package com.bebeno.mvc.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {

	@GetMapping("/test")
	public String test() {
		
		return "/test";
	}
	
	@PostMapping("/test")
	public String test(
			@RequestParam("userName") String username,
			@RequestParam("password") String password,
			@RequestParam("passwordConfirm") String passwordConfirm) {
		
		log.info("{}, {}", username, password);
		
		return "/test";
	}
	
}
