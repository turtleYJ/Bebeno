package com.bebeno.mvc.wagle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bebeno.mvc.wagle.model.dao.WagleBoardMapper;
import com.bebeno.mvc.wagle.model.vo.Wagle;
import com.bebeno.mvc.wagle.model.vo.WagleFile;

@Service
public class WagleBoardServiceimpl implements WagleBoardService {
	@Autowired
	private WagleBoardMapper mapper;
	
	
	@Override
	public List<Wagle> getWagleList() {
		
		return mapper.getWagleList();
	}

	@Override
	public Wagle findBoardByNo(int no) {
		
		return mapper.selectBoardByNo(no);
	}

	@Override
	public List<WagleFile> findfileByNo(int no) {

		return mapper.selectfilesByNo(no);
	}

	@Override
	@Transactional
	public int save(Wagle wagleboard) {
		
		Integer result = 0;
		
		if(wagleboard.getNo() != 0) {
			result = mapper.updateWagleBoard(wagleboard);
		}else {
			result = mapper.insertWagleBoard(wagleboard);
		}
		return result;
	}
	
	@Override
	public int delete(int no) {
		
		return mapper.deleteWagleBoard(no);
	}

	@Override
	@Transactional
	public void fileSave(WagleFile files) {
		
		mapper.savefile(files);
	}

	@Override
	public int fileDelete(int no) {
		
		return mapper.deletefiles(no);
	}

	@Override
	public List<Wagle> getWagleListByCategory(String category) {

		return mapper.getWagleListByCategory(category);
	}
}
