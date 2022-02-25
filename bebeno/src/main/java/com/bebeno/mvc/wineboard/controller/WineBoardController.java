package com.bebeno.mvc.wineboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/wineboard")
public class WineBoardController {

	
	@RequestMapping("/wineList")
	public String WineBoardList() {
		
		return "/wineboard/wineList";
	}
	
	@RequestMapping("/wineWrite")
	public String wineWrite() {
	
		return "/wineboard/wineWrite";
	}
	@RequestMapping("/wineView")
	public String wineView() {
		
		return "/wineboard/wineView";
	}

}
