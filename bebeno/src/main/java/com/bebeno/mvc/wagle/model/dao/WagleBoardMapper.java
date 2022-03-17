package com.bebeno.mvc.wagle.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bebeno.mvc.wagle.model.vo.Wagle;
import com.bebeno.mvc.wagle.model.vo.WagleFile;

@Mapper
public interface WagleBoardMapper {

	List<Wagle> getWagleList();
	
	Wagle selectBoardByNo(int no);
	
	List<WagleFile> selectfilesByNo(int no);

	int updateWagleBoard(Wagle wagleboard);

}
