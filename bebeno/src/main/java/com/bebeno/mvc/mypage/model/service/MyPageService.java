package com.bebeno.mvc.mypage.model.service;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.mypage.model.vo.MyPage;

public interface MyPageService {

	// 비밀번호 변경
	int modifyPwd(String id, String newPwd);

	// 회원 탈퇴(status 값 : Y -> N 변경)
	int deleteAccount(String id);

	int profileImgSave(Member loginMember);

}
