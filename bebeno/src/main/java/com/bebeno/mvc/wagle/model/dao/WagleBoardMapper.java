package com.bebeno.mvc.wagle.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bebeno.mvc.wagle.model.vo.Wagle;
import com.bebeno.mvc.wagle.model.vo.WagleFile;

@Mapper
public interface WagleBoardMapper {

	List<Wagle> getWagleList();
	
	Wagle selectBoardByNo(int no);
	
	List<WagleFile> selectfilesByNo(int no);
	
	void savefile(WagleFile files);

	int updateWagleBoard(Wagle wagleboard);

	int insertWagleBoard(Wagle wagleboard);

	int deleteWagleBoard(int no);

	int deletefiles(int no);
	
	List<Wagle> getWagleListByCategory(@Param("category") String category);


}
