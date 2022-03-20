package com.bebeno.mvc.mypage.model.service;

import java.util.List;

import com.bebeno.mvc.common.util.PageInfo;
import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.mypage.model.vo.Scrap;

public interface MyPageService {

	// 비밀번호 변경
	int modifyPwd(String id, String newPwd);

	// 회원 탈퇴(status 값 : Y -> N 변경)
	int deleteAccount(String id);

	// 닉네임 중복 체크
	Boolean nickCheck(String nickname);
	
	// 프로필 이미지 변경 + 닉네임 변경
	int profileImgSave(Member loginMember);

// ===============================================	
	
	// 게시판 번호로 저장할 게시판 정보 가져오기
	Scrap getWagleBoardByNo(int no);
	
	// 스크랩 세이브
	int saveScrap(Scrap scrapVo);

	//
	List<Scrap> scrapList(String id);

	// 스크랩 게시글 삭제
	int scrapDelete(int wagleBoardNo);



	
	// 스크랩 페이징 정보
//	List<Scrap> getScrapList(PageInfo pageInfo, String id);




}
