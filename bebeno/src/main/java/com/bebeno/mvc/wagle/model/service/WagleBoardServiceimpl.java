package com.bebeno.mvc.wagle.model.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bebeno.mvc.shop.model.vo.ContentFiles;
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
			result = WagleBoardMapper.updateWagleBoard(wagleboard);
		}else {
			result = WagleBoardMapper.insertWagleBoard(wagleboard);
		}
		return result;
	}

	@Transactional
	public Wagle update(long no, String title, String writer, String content) {
		Wagle board = null;
//		Optional<Wagle> optional = repository.findById(no);
//		
//		if(optional.isPresent()) {
//			board = optional.get();
//			board.update(title, writer, content);
//		}
		
		return board;
	}
	
	@Transactional
	public Wagle delete(long no) {
//		
//		repository.deleteById(no);
//		
		return repository.findById(no).orElse(null);
	}

	@Override
	public List<WagleFile> findfilesByNo(int no) {
		
		return mapper.selectfilesByNo(no);
	}

	@Override
	@Transactional
	public void fileSave(ContentFiles files) {

		mapper.
	}
}
