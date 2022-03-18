package com.bebeno.mvc.mypage.model.service;

import com.bebeno.mvc.member.model.vo.Member;

public interface MyPageService {

	// 비밀번호 변경
	int modifyPwd(String id, String newPwd);

	// 회원 탈퇴(status 값 : Y -> N 변경)
	int deleteAccount(String id);

	// 닉네임 중복 체크
	Boolean nickCheck(String nickname);
	
	// 프로필 이미지 변경 + 닉네임 변경
	int profileImgSave(Member loginMember);


}
