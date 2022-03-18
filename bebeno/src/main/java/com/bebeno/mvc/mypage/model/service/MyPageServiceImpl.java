package com.bebeno.mvc.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.mypage.model.dao.MyPageMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

// ==================================================================
	

// ========================= 비밀번호 변경 ==============================
	@Override
	@Transactional
	public int modifyPwd(String id, String newPwd) {
		
		int result = 0;
		
		String encodeNewPwd = null;
		
		// 입력받은 새 비밀번호를 암호화
		encodeNewPwd = passwordEncoder.encode(newPwd);
				
		log.info("암호화 되기 전 새 비밀번호 : {}", newPwd);
		log.info("암호화 된 새 비밀번호 : {}", encodeNewPwd);
		
//		result = mapper.modifyPwd(id, newPwd);
		result = mapper.modifyPwd(id, encodeNewPwd);
		
		return result;
	}

// ==================================================================
	
	// 회원 탈퇴(status 값 : Y -> N 변경) 
	@Override
	public int deleteAccount(String id) {
		
		return mapper.deleteAccount(id);
	}

// ==================================================================
	
	// 닉네임 중복검사(profile.jsp에서 ajax 스크립트 사용 시 처리하는 메소드)
	@Override
	public Boolean nickCheck(String nickname) {
		
		Member nowNickname = mapper.getMemberByNick(nickname);
		
		// 현재 닉네임이 존재하면 true/ 없으면 false
		return nowNickname != null;
	}
	
// ==================================================================
	
	// 프로필 이미지 변경 
	@Override
	@Transactional
	public int profileImgSave(Member loginMember) {
		
		int result = 0;
		
		// update 사용
		result = mapper.insertProfileImgName(loginMember);

		
		return result;
	}

	
}
