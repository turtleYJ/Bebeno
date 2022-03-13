package com.bebeno.mvc.payment.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bebeno.mvc.payment.model.vo.Cart;

@Mapper
public interface CartMapper {

	List<Cart> cartList();



	}


