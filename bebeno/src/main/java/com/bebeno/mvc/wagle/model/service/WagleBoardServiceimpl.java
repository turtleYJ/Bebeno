package com.bebeno.mvc.wagle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bebeno.mvc.wagle.model.dao.WagleBoardMapper;
import com.bebeno.mvc.wagle.model.vo.Wagle;

@Service
public class WagleBoardServiceimpl implements WagleBoardService {
	@Autowired
	private WagleBoardMapper mapper;
	
	
	@Override
	public List<Wagle> getWagleList() {
		
		return mapper.getWagleList();
	}

}
