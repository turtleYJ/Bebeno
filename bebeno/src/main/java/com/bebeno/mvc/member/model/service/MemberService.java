package com.bebeno.mvc.member.model.service;


import java.util.List;
import org.springframework.stereotype.Component;

import com.bebeno.mvc.member.model.vo.Member;

//@Transactional
@Component
public interface MemberService {

	Member findMemberById(String id);
	
	Member login(String id, String password);

	int save(Member member);

	Boolean isDuplicateID(String userId);

	int delete(int no);
	
	String findId(Member member);
}
