package com.bebeno.mvc.wineboard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bebeno.mvc.wineboard.model.dao.WineBoardMapper;
import com.bebeno.mvc.wineboard.model.vo.WineBoard;

@Service
public class WineBoardServiceImpl implements WineBoardService {
	
	@Autowired
	private WineBoardMapper wineboardmapper;

	@Override
	public int getWineBoardCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
	public int save(WineBoard wineboard) {
		Integer result = 0;
		
		if(wineboard.getWineBno() != 0) {
			result = wineboardmapper.updateWineBoard(wineboard);
		}else {
			result = wineboardmapper.insertWineBoard(wineboard);
		}
		return result;
	}

	@Override
	public List<WineBoard> wineBoardList() {
		
		return wineboardmapper.wineBoardList();
	}

	@Override
	public WineBoard findBoardByNo(Integer wineBno) {
		return wineboardmapper.selectWineBoardByNo(wineBno);
	}

	@Override
	@Transactional
	public int delete(int wineBno) {

		return wineboardmapper.deleteWineBoard();
	}




	
}
















