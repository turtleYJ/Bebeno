package com.bebeno.mvc.wagle.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bebeno.mvc.wagle.model.dao.WagleBoardMapper;

@Service
public class WagleBoardServiceImpl {
	@Autowired
	private WagleBoardMapper mapper;
	
	
}
