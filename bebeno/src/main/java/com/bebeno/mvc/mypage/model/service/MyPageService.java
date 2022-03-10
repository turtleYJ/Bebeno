package com.bebeno.mvc.mypage.model.service;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.mypage.model.vo.MyPage;

public interface MyPageService {

	MyPage getMemberById(String id);

	// 비밀번호 변경
	int modifyPwd(Member member);

}
