package com.bebeno.mvc.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.mypage.model.dao.MyPageMapper;
import com.bebeno.mvc.mypage.model.vo.MyPage;

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
		
		encodeNewPwd = passwordEncoder.encode(newPwd); // 비밀번호 암호화
				
		log.info("암호화 되기 전 새 비밀번호 : {}", newPwd);
		log.info("암호화 된 새 비밀번호 : {}", encodeNewPwd);
		
//		result = mapper.modifyPwd(id, newPwd);
		result = mapper.modifyPwd(id, encodeNewPwd);
		
		return result;
	}
	
}
