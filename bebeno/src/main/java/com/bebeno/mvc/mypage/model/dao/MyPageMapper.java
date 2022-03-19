package com.bebeno.mvc.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.mypage.model.vo.Scrap;

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

// ==================================================================
	
	
	// 특정 회원이 스크랩 한 리스트의 개수(id값으로 가져오기)
	int getScrapCount(@Param("id") String id);

	// 스크랩 페이징 관련 매퍼
//	List<Scrap> scrapPaging(RowBounds rowBounds, @Param("id") String id);
}
