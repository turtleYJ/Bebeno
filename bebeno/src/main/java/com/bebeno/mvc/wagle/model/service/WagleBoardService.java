package com.bebeno.mvc.wagle.model.service;

import java.util.List;
import java.util.Map;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.shop.model.vo.ContentFiles;
import com.bebeno.mvc.wagle.model.vo.Reply;
import com.bebeno.mvc.wagle.model.vo.Wagle;
import com.bebeno.mvc.wagle.model.vo.WagleFile;

public interface WagleBoardService {

	List<Wagle> getWagleList();
	
	Wagle findBoardByNo(int no);

	List<WagleFile> findfileByNo(int no);
	
	Wagle delete(long no);

	int save(Wagle wagleboard);

	void fileSave(ContentFiles files);
	
	int saveReply(Member member, Reply reply);

	int updateReply(Reply reply);

	int deleteReply(int no);

	int getReplyCount(int no);

	Reply findReplyByNo(int no);
}
