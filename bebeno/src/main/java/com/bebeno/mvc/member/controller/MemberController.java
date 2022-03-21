package com.bebeno.mvc.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.bebeno.mvc.member.model.service.MemberService;
import com.bebeno.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
// Model 객체에 loginMember라는 키값으로 객체가 추가되면 해당 객체를 세션 스코프에 추가하는 어노테이션이다.
@SessionAttributes("loginMember")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/login", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login(ModelAndView model,
			@RequestParam(required = false, value = "id") String id, @RequestParam(required = false, value ="password") String password) {
		
		log.info("{}, {}", id, password);		
		
		Member loginMember = service.login(id, password);
		
		System.out.println("loginmember : " + loginMember);
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.setViewName("redirect:/");
		} else {
			model.addObject("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			model.addObject("location", "/member/loginform");
			model.setViewName("common/msg");
		}		
		
		return model;
	}


	@PostMapping("/idCheck")
	@ResponseBody
	public ResponseEntity<Map<String, Boolean>> idCheck1(
	@RequestParam("id") String id) {
		
		Map<String, Boolean> map = new HashMap<>();
		
		log.info("{}", id);
		
		map.put("duplicate", service.isDuplicateID(id));

		return new ResponseEntity<Map<String, Boolean>>(map, HttpStatus.OK);
	}
	
	// 로그아웃 처리 (SessionStatus 사용)
//	@PostMapping("/logout") -- 회원 탈퇴 시 Post쪽으로 연결시키는 법을 몰라 Get으로 변경
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		log.info("status.isComplete() : {}", status.isComplete());
		
		// SessionStatus 객체의 setComplete() 메소드로 세션 스코프로 확장된 객체들을 지워준다.
		status.setComplete();
		
		log.info("status.isComplete() : {}", status.isComplete());
		
		return "redirect:/";
	}
	
	@GetMapping("/member/loginform")
	public String login() {
		log.info("로그인 페이지 요청");
		
		return "member/loginform";
	}
	
	@GetMapping("/member/terms")
	public String enroll() {
		log.info("회원 약관 페이지 요청");
		
		return "member/terms";
	}
	
// ======================= terms_v2 ==========================
	
	@GetMapping("/member/terms_v2")
	public String enroll_test() {
		log.info("회원 약관 페이지 요청 테스트");
		
		return "member/terms_v2";
	}
	
// ======================= terms_v2 ==========================
	
	@GetMapping("/member/forgot-password")
	public String forgot() {
		log.info("회원 약관 페이지 요청");
		
		return "member/forgot-password";
	}
	
	@GetMapping("/member/join")
	public String join() {
		log.info("회원 가입 페이지 요청");
		
		return "member/join";
	}
	

	// findId
	@GetMapping("/member/findId")
	public String findId() {
		
		return "member/findId";
	}
	
	@PostMapping("/member/findId")
	public ModelAndView findId(
			ModelAndView model, @ModelAttribute Member member) {
		
		log.info("로그인, 이메일 : {},  {}", member.getName(), member.getEmail());

		String findId =service.findId(member);
		
		if(findId != null) {
			model.addObject("userID" , findId);
			log.info("찾은 아이디");
			System.out.println("찾은 아이디는" + findId);
			model.addObject("msg", "찾은 아이디는 "+ findId);
			model.addObject("location", "/member/findId");
		}else {
			model.addObject("msg", "존재하지 않는 아이디 입니다.");
			model.addObject("location", "/member/findId");
		}
			model.setViewName("common/msg");
		
		return model;
	}

	@PostMapping("/member/join")
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
		
		log.info(member.toString());
				
		int result = service.save(member);
		
		if(result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.addObject("location", "/member/join");			
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
}
