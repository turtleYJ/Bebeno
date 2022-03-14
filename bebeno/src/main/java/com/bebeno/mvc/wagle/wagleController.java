package com.bebeno.mvc.wagle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bebeno.mvc.shop.controller.ShopController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
<<<<<<< HEAD
@RequestMapping("/wagle_board")
public class wagleController {

	@GetMapping("/wagle_list")
=======
@RequestMapping("/wagle")
public class wagleController {

	@GetMapping("/list")
>>>>>>> feature/test
	public String list() {
		
		return "/wagle_board/wagle_list";
	}
<<<<<<< HEAD
	
	@GetMapping("/wagle_write")
	public String write() {
		
		return "/wagle_board/wagle_write";

	}
	@GetMapping("/wagle_manage")
	public String manage() {
		
		return "/wagle_board/wagle_write_manage";
	}
=======
>>>>>>> feature/test
}
