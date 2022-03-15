package com.bebeno.mvc.payment.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bebeno.mvc.payment.model.vo.CartList;

@Mapper
public interface CartMapper {


	List<CartList> list();

	}


