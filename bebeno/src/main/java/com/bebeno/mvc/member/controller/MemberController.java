package com.bebeno.mvc.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.bebeno.mvc.payment.model.service.CartService;
import com.bebeno.mvc.payment.model.vo.Cart;

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
	
	/*
	 * @ResponseBody
	 *   - 일반적으로 컨트롤러 메소드의 반환형이 String일 경우 뷰의 이름을 반환한다.
	 *   - @ResponseBody 붙은 String 반환은 해당 요청을 보낸 클라이언트에 전달할 데이터를 의미한다.
	 *   
	 * jackson 라이브러리
	 *   - 자바 객체를 JSON 형태의 데이터로 변환하기 위한 라이브러리이다.(GSON, jsonSimple)
	 *   - 스프링에서는 jackson 라이브러리를 추가하고 @ResponseBody을 사용하면 리턴되는 객체를 자동으로 JSON으로 변경해서 응답한다.
	 *   
	 * @RestController
	 *   - 해당 컨트롤러의 모든 메소드에서 데이터를 반환하는 경우 사용한다. 
	 *   - @Controller와 @ResponseBody를 합쳐놓은 역할을 수행한다.
	 */
	@GetMapping("/member/jsonTest")
	@ResponseBody
	public Object jsonTest() {
//		Map<String, String> map = new HashMap<>();
//		
//		map.put("hi", "hello");
//		
//		return map;
		
		return new Member("ismoon", "1234", "문인수");
	}
	
	@PostMapping("/member/idCheck")
//	@ResponseBody
//	@ResponseBody를 사용하지 않고 ResponseEntity를 사용하는 방법 (jackson 라이브러리 추가하고 사용하자)
	public ResponseEntity<Map<String, Boolean>> idCheck(@RequestParam("userId") String userId) {
		Map<String, Boolean> map = new HashMap<>();
		
		log.info("{}", userId);
		
		map.put("duplicate", service.isDuplicateID(userId));
		
		return new ResponseEntity<Map<String,Boolean>>(map, HttpStatus.OK);
	}
	
	@GetMapping("/member/myPage")
	public String myPage() {
		
		return "member/myPage";
	}
	
	@PostMapping("/member/update")
	public ModelAndView update(
			ModelAndView model,
			@SessionAttribute(name="loginMember") Member loginMember,
			@ModelAttribute Member member) {
		int result = 0;
		
		member.setNo(loginMember.getNo());
		
		result = service.save(member);
		
		if(result > 0) {
			model.addObject("loginMember", service.findMemberById(loginMember.getId()));
			model.addObject("msg", "회원정보 수정을 완료했습니다.");
			model.addObject("location", "/member/myPage");
		} else {
			model.addObject("msg", "회원정보 수정에 실패했습니다.");
			model.addObject("location", "/member/myPage");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
	
}
