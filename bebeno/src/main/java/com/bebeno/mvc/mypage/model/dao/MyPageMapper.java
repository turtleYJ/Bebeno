package com.bebeno.mvc.mypage.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.mypage.model.vo.MyPage;

@Mapper
public interface MyPageMapper {
	
	// 비밀번호 업데이트
	int modifyPwd(
			@Param("id") String id, 
			@Param("encodeNewPwd") String encodeNewPwd);
	
}
