package com.bebeno.mvc.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bebeno.mvc.member.model.vo.Member;

@Mapper
public interface MemberMapper {
//	@Select("select * from member")
//	List<Member> findAll();
	
	Member selectMember(@Param("id") String id);

	Member findMemberById(@Param("id") String id);

	int insertMember(Member member);

	int updateMember(Member member);

	int deleteMember(int no);
	
	Member findMemberByNo(int no);
	
	String findId(Member member);

	void searchPassword(@Param("id") String id, @Param("email") String email, @Param("key") String key);
}
