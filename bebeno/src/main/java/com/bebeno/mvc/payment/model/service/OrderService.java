package com.bebeno.mvc.payment.model.service;

import java.util.List;

import com.bebeno.mvc.payment.model.vo.Order;
import com.bebeno.mvc.payment.model.vo.OrderList;

public interface OrderService {

	public int addOrder(Order order);
	
	public List<OrderList> orderList(String id);

}
