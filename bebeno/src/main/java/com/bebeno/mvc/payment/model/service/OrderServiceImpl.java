package com.bebeno.mvc.payment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bebeno.mvc.payment.model.dao.OrderMapper;
import com.bebeno.mvc.payment.model.vo.Order;
import com.bebeno.mvc.payment.model.vo.OrderList;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	public OrderMapper mapper;
	
	@Override
	public int addOrder(Order order) {
		
		return mapper.addOrder(order);
	
	}

	@Override
	public List<OrderList> orderList(String id) {
		
		return mapper.orderList(id);
	}

}
