package com.kh.bebeno.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bebeno.shop.model.service.ShopService;
import com.kh.bebeno.shop.model.vo.Shop;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired
	private ShopService service;
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model) {
		List<Shop> shopList = null;
		
		shopList = service.getShopList();
		
		System.out.println(shopList);
		
		model.addObject("shopList", shopList);
		model.setViewName("shop/list");
		
		return model;
	}
	
	@GetMapping("/view")
	public String view() {
		
		return "shop/view";
	}
	
	@GetMapping("/address")
	public String address() {
		
		return "shop/address";
	}
	
//	@PostMapping("/view") 
//	public ModelAndView view(
//			ModelAndView model, 
////			@SessionAttribute(name = "loginMember") Member loginMember,
//			@ModelAttribute Shop shop, @RequestParam("upfile") MultipartFile upfile) {
//		int result = 0;
//		
//		return model;
//	}
	
}
