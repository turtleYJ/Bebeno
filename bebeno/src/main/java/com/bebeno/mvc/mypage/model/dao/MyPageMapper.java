package com.bebeno.mvc.mypage.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.mypage.model.vo.MyPage;

@Mapper
public interface MyPageMapper {

	// 회원의 현재 비밀번호를 id를 통해서 가져오는 매퍼
	MyPage getMemberById(@Param("id") String id);
	
	// 비밀번호 업데이트
	int modifyPwd(
			@Param("id") String id, 
//			@Param("newPwd") String newPwd);
			@Param("encodeNewPwd") String newPwd);
	
}
