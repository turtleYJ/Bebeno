package com.bebeno.mvc.payment.model.service;

import java.util.List;

import com.bebeno.mvc.payment.model.vo.Cart;
import com.bebeno.mvc.payment.model.vo.CartList;

public interface CartService {

	public int addCart(Cart cart) throws Exception;

	public List<CartList> cartList(String id) throws Exception;

	public int deleteCart(int cart_id);

	public void deleteAllCart(String id);

	



	
}
