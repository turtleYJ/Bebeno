package com.bebeno.mvc.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.mypage.model.dao.MyPageMapper;
import com.bebeno.mvc.mypage.model.vo.MyPage;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mapper;

	// id값으로 회원정보 조회하기
	@Override
	public MyPage getMemberById(String id) {		
		
		return mapper.getMemberById(id);
	}

	// ========================= 비밀번호 변경 ==============================
	@Override
	@Transactional
	public int modifyPwd(Member member) {
		
		int result = 0;
		
		if(member.getNo() != 0) {
			result = mapper.modifyPwd(member);
		}
		
		return result;
	}
	
}
