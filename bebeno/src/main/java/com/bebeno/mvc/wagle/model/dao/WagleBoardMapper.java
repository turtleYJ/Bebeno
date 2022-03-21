package com.bebeno.mvc.wagle.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bebeno.mvc.wagle.model.vo.Reply;
import com.bebeno.mvc.wagle.model.vo.Wagle;
import com.bebeno.mvc.wagle.model.vo.WagleFile;

@Mapper
public interface WagleBoardMapper {

	List<Wagle> getWagleList();
	
	Wagle selectBoardByNo(int no);
	
	List<WagleFile> selectfilesByNo(int no);

	int updateWagleBoard(Wagle wagleboard);

	int insertWagleBoard(Wagle wagleboard);
<<<<<<< HEAD
=======

	List<Wagle> getWagleListByCategory(@Param("category") String category);

>>>>>>> main
	
	int insertReply(Map<Object, Object> map);
	
	int deleteReply(int no);

	int updateReply(Map<Object, Object> map);

	int getReplyCount(int no);
	
	Reply selectReplyByNo(int no);
	
}
