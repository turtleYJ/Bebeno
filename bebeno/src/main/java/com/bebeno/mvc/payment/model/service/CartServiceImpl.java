package com.bebeno.mvc.payment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bebeno.mvc.payment.model.dao.CartMapper;
import com.bebeno.mvc.payment.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	public CartMapper cartmapper;

	public List<Cart> getCartList() {
		
		return cartmapper.cartList();
	}

	




}
