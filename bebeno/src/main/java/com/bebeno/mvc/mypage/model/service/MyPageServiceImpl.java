package com.bebeno.mvc.mypage.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bebeno.mvc.common.util.PageInfo;
import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.mypage.model.dao.MyPageMapper;
import com.bebeno.mvc.mypage.model.vo.Scrap;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

// ==================================================================
	

// ========================= 비밀번호 변경 ==============================
	@Override
	@Transactional
	public int modifyPwd(String id, String newPwd) {
		
		int result = 0;
		
		String encodeNewPwd = null;
		
		// 입력받은 새 비밀번호를 암호화
		encodeNewPwd = passwordEncoder.encode(newPwd);
				
		log.info("암호화 되기 전 새 비밀번호 : {}", newPwd);
		log.info("암호화 된 새 비밀번호 : {}", encodeNewPwd);
		
//		result = mapper.modifyPwd(id, newPwd);
		result = mapper.modifyPwd(id, encodeNewPwd);
		
		return result;
	}

// ==================================================================
	
	// 회원 탈퇴(status 값 : Y -> N 변경) 
	@Override
	public int deleteAccount(String id) {
		
		return mapper.deleteAccount(id);
	}

// ==================================================================
	
	// 닉네임 중복검사(profile.jsp에서 ajax 스크립트 사용 시 처리하는 메소드)
	@Override
	public Boolean nickCheck(String nickname) {
		
		Member nowNickname = mapper.getMemberByNick(nickname);
		
		// 현재 닉네임이 존재하면 true/ 없으면 false
		return nowNickname != null;
	}
	
// ==================================================================
	
	// 프로필 이미지 변경 
	@Override
	@Transactional
	public int profileImgSave(Member loginMember) {
		
		int result = 0;
		
		// update 사용
		result = mapper.insertProfileImgName(loginMember);

		
		return result;
	}
	
// ==================================================================

	// 스크랩한 리스트의 개수
	@Override
	public int getScrapListCount(String id) {
		
		
		return mapper.getScrapCount(id);
	}
	
  // -----------------------------------------------------------
	
	// PageInfo( 1. 현재 페이지, 2. 한 페이지에 보이는 페이징 수, 
	//           3. 특정 회원의 전체 스크랩의 개수, 4. 한 페이지에 표시될 스크랩의 리스트 수)
	
	// 스크랩 페이징 관련
//	@Override
//	public List<Scrap> getScrapList(PageInfo pageInfo, String id) {
//		
//		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
//		int limit = pageInfo.getListLimit();
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		
//		return mapper.scrapPaging(rowBounds, id);
//	}


	
}
