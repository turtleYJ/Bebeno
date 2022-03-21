package com.bebeno.mvc.payment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bebeno.mvc.payment.model.dao.CartMapper;
import com.bebeno.mvc.payment.model.vo.Cart;
import com.bebeno.mvc.payment.model.vo.CartList;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	public CartMapper mapper;

	@Override
	public int addCart(Cart cart) throws Exception {
		
		return mapper.addCart(cart);
		
	}

	@Override
	public List<CartList> cartList(String id) throws Exception {

		return mapper.cartList(id);
	}

	@Override
	public int deleteCart(int cart_id) {
		
		 return mapper.deleteCart(cart_id);
		
	}

	@Override
	public void deleteAllCart(String id) {
		mapper.deleteAllCart(id);
		
	}






}
