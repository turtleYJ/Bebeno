package com.bebeno.mvc.mypage.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.common.util.ProfileImgSave;
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
	
	// 비밀번호 암호화 관련 코드 - 입력값이 현재 비밀번호와 맞는지 체크하기 위해 사용
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	// 로컬저장소 경로 설정 관련 코드 - 파일 업로드 시 사용
	@Autowired
	private ResourceLoader resourceLoader;
	
// ==================================================================
	
	@GetMapping("/profile")
	public String profile() {
		
		
		return "/mypage/profile";
	}
	
	// -------------------------------------------
	
	// 회원정보(프로필 이미지, 닉네임) 변경 메소드
	@PostMapping("/profile")
	public ModelAndView profileUpdate(
			ModelAndView model,
			@RequestParam("profileImgUpdate") MultipartFile profileImg,
			@RequestParam("nickname") String nickname,
			@SessionAttribute(name="loginMember") Member loginMember) {
		
		int result = 0;
		
		log.info(loginMember.toString());
		
		log.info("회원의 닉네임 : {}", nickname);
		
		// getOriginalFilename() : 파일을 업로드 하지 않으면 ""(빈 문자열), 파일을 업로드하면 "파일명"
//		log.info("업로드한 프로필 이미지 파일의 이름 : {}", profileImg.getOriginalFilename());
		// isEmpty() : 파일을 업로드 하지 않으면 true, 파일을 업로드하면 false가 찍힘
		log.info("프로필 이미지 업로드 여부(false가 업로드 된 것) : {}", profileImg.isEmpty());
		
	// 1. 파일을 업로드 했는지 확인 후 파일 저장
		if(profileImg != null && !profileImg.isEmpty() ) {
			
			String location = null;
			String renamedFileName = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/profileImg").getFile().getPath();
				log.info("실제 로컬저장소에 저장될 경로 : {}", location);
				// ProfileImgSave.save(파일, "webapp기준 저장할 경로") 
				// 	- 파일을 실제 폴더에 저장하는 로직을 담고있는 클래스
				renamedFileName = ProfileImgSave.save(profileImg, location, loginMember);
			} catch (IOException e) {
				e.printStackTrace();
			}			
			
			if(renamedFileName != null) {
				loginMember.setProfileImgNameO(profileImg.getOriginalFilename());
				loginMember.setProfileImgNameR(renamedFileName);
			}
		}
		
	// 2. 저장한 프로필 이미지의 원래이름과 변경된 이름을 DB에 저장
		
		loginMember.setNickname(nickname); // 덤으로 닉네임 값도 변경
		
		result = service.profileImgSave(loginMember);
		
		
		if(result > 0) {
			model.addObject("msg", "프로필 정보가 변경되었습니다.");
			model.addObject("location", "/mypage/profile");
		} else {
			model.addObject("msg", "프로필 정보 변경을 실패하였습니다.");
			model.addObject("location", "/mypage/profile");
		}
	
		
		
		model.setViewName("common/msg");
		
		return model;
	}
	
// ==================================================================	
	
	@GetMapping("/updatePwd")
	public String updatePwd() {
		
//		log.info("비밀번호 변경 페이지");
		
		return "/mypage/updatePwd";
	}
	
	// -------------------------------------------
	
	// <<< 비밀번호 변경을 위한 메소드 >>>
	@PostMapping("/updatePwd")
	public ModelAndView updatePwd(
			ModelAndView model,
			@RequestParam("password") String password,
			@RequestParam("newPwd") String newPwd,
			@SessionAttribute(name="loginMember") Member loginMember) {
		
		int result = 0;
		
		log.info("로그인한 회원의 정보 : {}", loginMember);
		log.info("로그인한 회원의 비밀번호 : {}", loginMember.getPassword());
		log.info("입력받은 비밀번호, 새 비밀번호 : {}, {}", password, newPwd);
		
	// 1. 현재비밀번호와 입력값이 일치하는지 확인
		// 암호화된 현재 비밀번호와 입력한 현재 비밀번호 확인
		boolean pwdMatch = pwdEncoder.matches(password, loginMember.getPassword());		
		log.info("회원의 비밀번호와 입력받은 비밀번호 일치 비교(true/false) : {}", pwdMatch);
		
		if(pwdMatch == false) { // 현재 비밀번호와 일치하지 않는 경우
			model.addObject("msg", "현재 비밀번호와 일치하지 않습니다.");
			model.addObject("location", "/mypage/updatePwd");
			
			model.setViewName("common/msg");
		} else {
	// 2. 비밀번호 변경
			result = service.modifyPwd(loginMember.getId(), newPwd);
			
			if(result > 0) {
				model.addObject("msg", "비밀번호가 변경되었습니다. 다시 로그인 해 주세요");
				model.addObject("location", "/mypage/profile");
				
				model.setViewName("common/msg");
			} else {
				
			}
			
		}
				
		return model;
	}
	
// ==================================================================
	
	@GetMapping("/deleteAccount")
	public String deleteAccount() {
		
		
		return "/mypage/deleteAccount";
	}
	
	// -------------------------------------------
	
	// <<< 로그인 된 회원의 세션(loginMember)을 이용해 Id값을 사용하여 회원 탈퇴 >>>
	@PostMapping("/deleteAccount")
	public ModelAndView deleteAccount(
			ModelAndView model,
			@SessionAttribute(name="loginMember") Member loginMember) {
		
		int result = 0;
		
		log.info("로그인 된 회원의 Id값 : {}", loginMember.getId()); // 로그인 된 회원의 Id값이 잘 들어오는지 확인
		
		result = service.deleteAccount(loginMember.getId());
		
		if(result > 0) {
			model.addObject("msg", "정상적으로 탈퇴 되었습니다.");
			model.addObject("location", "/mypage/profile"); // <-------- 로그아웃 되도록 수정 필요
		} else {
			model.addObject("msg", "회원 탈퇴에 실패하였습니다.");
			model.addObject("location", "/mypage/profile");
		}
		
		model.setViewName("common/msg");
		
		
		return model;
	}
	
// ==================================================================
	
	
	@GetMapping("/scrap")
	public String scrap() {
		
		
		return "/mypage/scrap";
	}
	
	// -------------------------------------------
	
	
	
// ==================================================================
	
//	@GetMapping("/cart")
//	public String cart() {
//		
//		
//		return "/mypage/cart";
//	}
	
	// -------------------------------------------
}
