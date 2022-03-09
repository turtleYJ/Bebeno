package com.bebeno.mvc.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bebeno.mvc.mypage.model.dao.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mapper;
	
}
