package com.bebeno.mvc.payment.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bebeno.mvc.payment.model.vo.Order;
import com.bebeno.mvc.payment.model.vo.OrderList;

@Mapper
public interface OrderMapper {

	public int paymentInsert(Order order);

	public List<OrderList> paymentSelect(String id);

	
}
