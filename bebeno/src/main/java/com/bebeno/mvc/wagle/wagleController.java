package com.bebeno.mvc.wagle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bebeno.mvc.shop.controller.ShopController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/wagle_board")
public class wagleController {

	@GetMapping("/wagle_list")
	public String list() {
		
		return "/wagle_board/wagle_list";
	}
}
