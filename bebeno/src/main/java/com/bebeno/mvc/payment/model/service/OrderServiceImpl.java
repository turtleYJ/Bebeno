package com.bebeno.mvc.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bebeno.mvc.payment.model.dao.OrderMapper;
import com.bebeno.mvc.payment.model.vo.Order;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	public OrderMapper mapper;

	@Override
	public int orderResult(Order order) {
		
		return mapper.paymentInsert(order);
	}




}
