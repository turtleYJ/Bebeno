package com.bebeno.mvc.mypage.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bebeno.mvc.member.model.vo.Member;

@Mapper
public interface MyPageMapper {
	
	// 비밀번호 업데이트
	int modifyPwd(
			@Param("id") String id, 
			@Param("encodeNewPwd") String encodeNewPwd);

	// 회원 탈퇴(status 값 : Y -> N 변경) 
	int deleteAccount(String id);

	// 닉네임 중복체크
	Member getMemberByNick(@Param("nickname") String nickname);
	
	// 프로필 이미지 + 닉네임 변경
	int insertProfileImgName(Member loginMember);
}
