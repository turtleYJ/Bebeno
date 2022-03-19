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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.common.util.FileProcess;
import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.shop.model.service.ShopService;
import com.bebeno.mvc.shop.model.vo.ContentFiles;
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
	public ModelAndView list(ModelAndView model, String shCate, String shRegionD1, String shKeyword) {
		List<Shop> shopList = null;
		
		if(shCate == "") {
			shCate = null;
		} 
		if(shRegionD1 == "") {
			shRegionD1 = null;
		}
		if(shKeyword == "") {
			shKeyword = null;
		} 

		shopList = service.getShopList(shCate, shRegionD1, shKeyword);
		
		model.addObject("shopList", shopList);
		model.setViewName("shop/list");
		
		return model;
	}
	
	@GetMapping("/view")
	public ModelAndView view(ModelAndView model, @RequestParam("no") int no) {	

		Shop shop = service.findShopByNo(no);
		List<ContentFiles> fileList = service.findfilesByNo(no);
		
		shop.setFiles(fileList);
		
		model.addObject("shop", shop);
		model.setViewName("shop/view");
		
		System.out.println(shop);
		System.out.println(shop.getContent());
		
		return model;
	}
	
	@PostMapping("/registration") 
	public ModelAndView registration(
			ModelAndView model, 
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute Shop shop, @ModelAttribute ContentFiles file,@RequestParam("upfileFront") MultipartFile upfileFront, MultipartHttpServletRequest mtfRequest, @RequestParam("address1") String address1, @RequestParam("address2") String address2
			) {
		List<MultipartFile> fileList = mtfRequest.getFiles("upfileContent");
		int result = 0;

		// 파일을 업로드하지 않으면 "", 파일을 업로드하면 "파일명"
		log.info("upfileFront Name : {}", upfileFront.getOriginalFilename());
		// 파일을 업로드하지 않으면 true, 파일을 업로드하면 false 
		log.info("upfileFront is Empty : {}", upfileFront.isEmpty());
		
//		 1. 파일을 업로드 했는지 확인 후 파일을 저장
		if(upfileFront != null && !upfileFront.isEmpty()) {
			// 파일을 저장하는 로직 작성
			String location = null;
			String renamedFileName = null;
//			String location = request.getSession().getServletContext().getRealPath("resources/upload/shop");

			try {
				location = resourceLoader.getResource("resources/upload/shop").getFile().getPath();
				renamedFileName = FileProcess.save(upfileFront, location);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				shop.setOriginalFileName(upfileFront.getOriginalFilename());
				shop.setRenamedFileName(renamedFileName);
			}
		}
		
////		 1. 파일을 업로드 했는지 확인 후 파일을 저장(File객체에 저장)
//		if(upfileContent != null && !upfileContent.isEmpty()) {
//			ContentFiles files = new ContentFiles();
//			// 파일을 저장하는 로직 작성
//			String location = null;
//			String renamedFileName = null;
////			String location = request.getSession().getServletContext().getRealPath("resources/upload/shop");
//
//			try {
//				location = resourceLoader.getResource("resources/upload/shop").getFile().getPath();
//				renamedFileName = FileProcess.save(upfileContent, location);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//			if(renamedFileName != null) {
//				files.setShopNo(shop.getNo());
//				files.setFile_originalFileName(upfileContent.getOriginalFilename());
//				files.setFile_renamedFileName(renamedFileName);
//			}
//			
//			log.info("file : {}", files);
//		}
		
		 
		
		// 2. 작성한 게시글 데이터를 데이터 베이스에 저장
		shop.setWriterNo(loginMember.getNo());
//		shop.setKorBname(KorBname);
//		shop.setEngBname(EngBname);
		shop.setAddress(address1 + " " + address2);
//		shop.setPhone(phone);	
//		shop.setContent(Content);
		
		System.out.println(shop);
		
		result = service.save(shop);
		
		for (MultipartFile mf : fileList) {
			 if(mf != null && !mf.isEmpty()) {
					// 파일을 저장하는 로직 작성
					String location = null;
					String renamedFileName = null;
//					String location = request.getSession().getServletContext().getRealPath("resources/upload/shop");

					try {
						location = resourceLoader.getResource("resources/upload/shop").getFile().getPath();
						renamedFileName = FileProcess.save(mf, location);
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					if(renamedFileName != null) {
						file.setShopNo(shop.getNo());
						file.setFile_originalFileName(mf.getOriginalFilename());
						file.setFile_renamedFileName(renamedFileName);
					}
					
					service.fileSave(file);
			 }
       }
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/shop/list");
		} else {
			model.addObject("msg", "게시글 등록을 실패하였습니다.");
			model.addObject("location", "/shop/list");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
}
