package com.bebeno.mvc.mypage.model.service;

import com.bebeno.mvc.mypage.model.vo.MyPage;

public interface MyPageService {

	// 비밀번호 변경
	int modifyPwd(String id, String newPwd);

}
