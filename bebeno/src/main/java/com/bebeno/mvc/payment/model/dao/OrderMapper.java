package com.bebeno.mvc.payment.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bebeno.mvc.payment.model.vo.Order;
import com.bebeno.mvc.payment.model.vo.OrderList;

@Mapper
public interface OrderMapper {

	public int addOrder(Order order);

	public List<OrderList> orderList(@Param("id") String id);
}
