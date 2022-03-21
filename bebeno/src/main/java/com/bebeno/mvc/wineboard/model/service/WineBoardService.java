package com.bebeno.mvc.wineboard.model.service;

import java.util.List;

import com.bebeno.mvc.wineboard.model.vo.WineBoard;

public interface WineBoardService {

	
	int getWineBoardCount();

	int save(WineBoard wineboard);

	List<WineBoard> wineBoardList(String shKeyword1);

	WineBoard findBoardByNo(Integer wineBno);

	int delete(int wineBno);

	// Shop Filter List
	List<WineBoard> findWineListOnShop(String wineKind, String nation, String wineKeyword);


}
