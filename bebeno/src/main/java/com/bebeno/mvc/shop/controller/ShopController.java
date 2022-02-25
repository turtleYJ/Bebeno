package com.bebeno.mvc.shop.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.common.util.FileProcess;
import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.shop.model.service.ShopService;
import com.bebeno.mvc.shop.model.vo.Shop;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired
	private ShopService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
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
	
	@PostMapping("/registration") 
	public ModelAndView registration(
			ModelAndView model, 
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute Shop shop, @RequestParam("upfile") MultipartFile upfile,  @RequestParam("KorBname") String KorBname, 
			@RequestParam("EngBname") String EngBname, @RequestParam("address1") String address1, @RequestParam("address1") String address2,
			@RequestParam("phone") String phone) {
		int result = 0;

		// 파일을 업로드하지 않으면 "", 파일을 업로드하면 "파일명"
		log.info("Upfile Name : {}", upfile.getOriginalFilename());
		// 파일을 업로드하지 않으면 true, 파일을 업로드하면 false 
		log.info("Upfile is Empty : {}", upfile.isEmpty());
		
//		 1. 파일을 업로드 했는지 확인 후 파일을 저장
		if(upfile != null && !upfile.isEmpty()) {
			// 파일을 저장하는 로직 작성
			String location = null;
			String renamedFileName = null;
//			String location = request.getSession().getServletContext().getRealPath("resources/upload/board");

			try {
				location = resourceLoader.getResource("resources/upload/board").getFile().getPath();
				renamedFileName = FileProcess.save(upfile, location);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				shop.setOriginalFileName(upfile.getOriginalFilename());
				shop.setRenamedFileName(renamedFileName);
			}
		}
		
		// 2. 작성한 게시글 데이터를 데이터 베이스에 저장
		shop.setWriterNo(loginMember.getNo());
		shop.setKorBname(KorBname);
		shop.setEngBname(EngBname);
		shop.setAdrress(address1 + " " + address2);
		shop.setPhone(phone);
		
		result = service.save(shop);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/board/view?no=" + shop.getNo());
		} else {
			model.addObject("msg", "게시글 등록을 실패하였습니다.");
			model.addObject("location", "/shop/list");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
}
