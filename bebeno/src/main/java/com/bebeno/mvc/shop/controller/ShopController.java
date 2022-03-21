package com.bebeno.mvc.shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.common.util.FileProcess;
import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.shop.model.service.ShopService;
import com.bebeno.mvc.shop.model.vo.ContentFiles;
import com.bebeno.mvc.shop.model.vo.Shop;
import com.bebeno.mvc.shop.model.vo.WineListsOnShop;
import com.bebeno.mvc.wineboard.model.service.WineBoardService;
import com.bebeno.mvc.wineboard.model.vo.WineBoard;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired
	private ShopService service;
	
	@Autowired
	private WineBoardService wineService;
	
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
	@PostMapping("/view")
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
			@ModelAttribute Shop shop, @ModelAttribute ContentFiles file,@RequestParam("upfileFront") MultipartFile upfileFront, MultipartHttpServletRequest mtfRequest
			) {
		
		// MultipartHttpServletRequest 인터페이스
		// MultipartHttpServletRequest의 getFiles메소드를 통해 파일들을 List형태로 받을 수 있다.
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
		
		// 2. 작성한 게시글 데이터를 데이터 베이스에 저장
		shop.setWriterNo(loginMember.getNo());
		
		System.out.println(shop);
		
		result = service.save(shop);
		
		
		// 멀티플 파일들을 업로드하고 ContentFiles vo에 저장
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
	
	@GetMapping("/update")
	public ModelAndView update(
			@SessionAttribute("loginMember") Member loginMember,
			ModelAndView model, @RequestParam("no") int no) {
		
		Shop shop = service.findShopByNo(no);
		
		if(shop.getType() == "와인샵") {
			shop.setType("wineshop");
		} else if (shop.getType() == "레스토랑") {
			shop.setType("rest");
		}
		
		if (loginMember.getNo() == shop.getWriterNo()) {			
			model.addObject("shop", shop);
			model.setViewName("shop/update");
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/shop/list");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	@PostMapping("/update")
	public ModelAndView update(ModelAndView model, 
			@SessionAttribute("loginMember") Member loginMember,
			@ModelAttribute Shop shop, @ModelAttribute ContentFiles file,@RequestParam("upfileFront") MultipartFile upfileFront, MultipartHttpServletRequest mtfRequest
			) {
		List<MultipartFile> newfileList = mtfRequest.getFiles("upfileContent");		
		List<ContentFiles> exfileList = service.findfilesByNo(shop.getNo());	
		
		log.info("newfileList : {}", newfileList.toString());
		log.info("newfileList.size : {}", newfileList.size());
		
		shop.setFiles(exfileList);
		
		int result = 0;
		
		// 로그인 이용자와 게시물 작성자가 동일하면 특정 location에 기존 파일을 제거하고 파일을 추가하는 로직
		if (loginMember.getNo() == shop.getWriterNo()) {
			if(upfileFront != null && !upfileFront.isEmpty()) {
				String renamedFileName = null;
				String location = null;
				
				try {
					location = resourceLoader.getResource("resources/upload/shop").getFile().getPath();
					
					if(shop.getRenamedFileName() != null) {
						// 이전에 업로드된 첨부파일 삭제
						FileProcess.delete(location + "/" + shop.getRenamedFileName());
					}
					
					renamedFileName = FileProcess.save(upfileFront, location);
					
					if(renamedFileName != null) {
						shop.setOriginalFileName(upfileFront.getOriginalFilename());
						shop.setRenamedFileName(renamedFileName);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			result = service.save(shop);
			
			// 새로 들어온 다중파일 리스트들이 존재하면 다음 로직을 실행한다.
			if(newfileList.get(0).getSize() != 0) {
				String location = null;
				String renamedFileName = null;
				
				try {
					location = resourceLoader.getResource("resources/upload/shop").getFile().getPath();
					
					
					// 기존의 ContentFiles객체의 파일들을 지우고 db상에서도 delete하는 로직
					
					for(int i = 0; i < shop.getFiles().size(); i++) {
						FileProcess.delete(location + "/" + shop.getFiles().get(i).getFile_renamedFileName());
					}
					service.fileDeleteByStoreNo(shop.getNo());
					
					for(MultipartFile mf : newfileList) {
						// 파일을 특정 location에 리네임파일네임으로 저장하는 로직
						renamedFileName = FileProcess.save(mf, location);
						
						// 파일이 리네임파일네임으로 저장 됐다면 file객체에 담아서 save하는 로직
						if(renamedFileName != null) {
							file.setShopNo(shop.getNo());
							file.setFile_originalFileName(mf.getOriginalFilename());
							file.setFile_renamedFileName(renamedFileName);
						}
						
						service.fileSave(file);
					}
					
					
					
					
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
					
			}
			
			
			//////////////////////
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/shop/view?no=" + shop.getNo());
			} else {
				model.addObject("msg", "게시글 수정을 실패하였습니다.");
				model.addObject("location", "/shop/update?no=" + shop.getNo());
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/shop/list");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/delete")
	public ModelAndView delete(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam("no")int no) {
		
		int result = 0;
		Shop shop = service.findShopByNo(no);
		
		if(shop.getWriterNo() == loginMember.getNo()) {
			result = service.delete(shop.getNo());
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
				model.addObject("location", "/shop/list");
			} else {
				model.addObject("msg", "게시글 삭제를 실패하였습니다.");
				model.addObject("location", "/shop/view?no=" + shop.getNo());
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/shop/list");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/findWine")
	public ModelAndView findWine(ModelAndView model, String wineKind, String nation, String wineKeyword, @RequestParam("shopNo") int shopNo) {
		List<WineBoard> wineList = null;
		
		if(wineKind == "") {
			wineKind = null;
		} 
		if(nation == "") {
			nation = null;
		}
		if(wineKeyword == "") {
			wineKeyword = null;
		} 
		
		wineList = wineService.findWineListOnShop(wineKind, nation, wineKeyword);
		
		log.info("wineKind Name : {}", wineKind);
		log.info("nation Name : {}", nation);
		log.info("wineKeyword Name : {}", wineKeyword);
		
		
		model.addObject("shopNo", shopNo);
		model.addObject("wineList", wineList);
		model.setViewName("shop/wineSearch");
		
		return model;
	}
	
	@ResponseBody
	@PostMapping("/saveWine")
	public Object saveWine(
            @RequestParam(value="wineNoList[]") List<String> wineNoList, 
            @RequestParam(value="shopNo") String shopNo
            ) {
		int[] result = new int[wineNoList.size()];
		
		ArrayList<WineListsOnShop> wineOnShop = new ArrayList<WineListsOnShop>();
//		WineListsOnShop[] wineOnShop = new WineListsOnShop[wineNoList.size()];
		WineBoard[] wines = new WineBoard[wineNoList.size()];
		
        System.out.println("=shopNo=");
        System.out.println(shopNo);
        
        System.out.println("=wine=");
        for(int i = 0; i < wineNoList.size(); i++) {
        	wines[i] =  wineService.findBoardByNo(Integer.parseInt(wineNoList.get(i)));
        	
        	wineOnShop[i].setShopNo(Integer.parseInt(shopNo));
        	wineOnShop[i].setKorName(wines[i].getWineName());
        	wineOnShop[i].setEngName(wines[i].getWineEng());
        	wineOnShop[i].setFile_originalFileName(wines[i].getOriginalFileName());
        	wineOnShop[i].setFile_renamedFileName(wines[i].getRenamedFileName());
        	
        	service.saveWinesOnShop(wineOnShop[i]);
        }
        
//        for(String wineNo : wineNoList) {
//            System.out.println(wineNo);
//            WineBoard wine =  wineService.findBoardByNo(Integer.parseInt(wineNo));
//            
//            wineOnShop[].setShopNo(wine.getWineBno());
//            
//            
//            result = service.saveWinesOnShop(Integer.parseInt(shopNo), Integer.parseInt(wineNo));
//        }
        //리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
        
        //성공했다고 처리
//        retVal.put("wineLists", wineLists);
        retVal.put("message", "등록에 성공 하였습니다.");
        
        return retVal;
 
    }
	
	
	
}
