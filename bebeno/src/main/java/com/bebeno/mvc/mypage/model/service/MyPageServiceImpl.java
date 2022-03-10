package com.bebeno.mvc.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.mypage.model.dao.MyPageMapper;
import com.bebeno.mvc.mypage.model.vo.MyPage;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// id값으로 회원정보 조회하기
	@Override
	public MyPage getMemberById(String id) {		
		
		return mapper.getMemberById(id);
	}

	// ========================= 비밀번호 변경 ==============================
	@Override
	@Transactional
	public int modifyPwd(String id, String newPwd) {
		
		int result = 0;
		
		String encodeNewPwd = null;
		
		encodeNewPwd = passwordEncoder.encode(newPwd); // 비밀번호 암호화
				
//		result = mapper.modifyPwd(id, newPwd);
		result = mapper.modifyPwd(id, encodeNewPwd);
		
		return result;
	}
	
}
