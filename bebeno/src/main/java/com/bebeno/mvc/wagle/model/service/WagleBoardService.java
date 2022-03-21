package com.bebeno.mvc.wagle.model.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bebeno.mvc.wagle.model.vo.Wagle;
import com.bebeno.mvc.wagle.model.vo.WagleFile;

public interface WagleBoardService {

	List<Wagle> getWagleList();
	
	Wagle findBoardByNo(int no);

	List<WagleFile> findfileByNo(int no);

	int save(Wagle wagleboard);

	int delete(int no);

	void fileSave(WagleFile files);
	
	int fileDelete(int no);
	
	List<Wagle> getWagleListByCategory(@Param("category") String category);


	
	

}
