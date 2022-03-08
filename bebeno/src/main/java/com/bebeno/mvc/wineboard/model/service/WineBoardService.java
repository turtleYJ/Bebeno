package com.bebeno.mvc.wineboard.model.service;

import java.util.List;

import com.bebeno.mvc.wineboard.model.vo.WineBoard;

public interface WineBoardService {

	
	int getWineBoardCount();

	int save(WineBoard wineboard);

	List<WineBoard> wineBoardList();

	WineBoard findBoardByNo(Integer wineBno);


}
