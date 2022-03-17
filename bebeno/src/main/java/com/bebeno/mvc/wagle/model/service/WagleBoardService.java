package com.bebeno.mvc.wagle.model.service;

import java.util.List;

import com.bebeno.mvc.wagle.model.vo.Wagle;
import com.bebeno.mvc.wagle.model.vo.WagleFile;

public interface WagleBoardService {

	List<Wagle> getWagleList();
	
	Wagle findBoardByNo(int no);

	List<WagleFile> findfileByNo(int no);
	
	Wagle delete(long no);

	Wagle save(Wagle wagleboard);

}
