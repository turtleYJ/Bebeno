package com.bebeno.mvc.payment.model.service;

import java.util.List;

import com.bebeno.mvc.payment.model.vo.Cart;

public interface CartService {

	static List<Cart> getCartList() {
		
		return null;
	}

	Object addCart(Cart cart);


}
