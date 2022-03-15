package com.bebeno.mvc.payment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bebeno.mvc.payment.model.dao.CartMapper;
import com.bebeno.mvc.payment.model.vo.CartList;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	public CartMapper mapper;

	@Override
	public List<CartList> list() {
	
		return mapper.list();
	}






}
