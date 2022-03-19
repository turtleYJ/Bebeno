package com.bebeno.mvc.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.payment.model.service.OrderService;
import com.bebeno.mvc.payment.model.vo.Order;
import com.bebeno.mvc.payment.model.vo.OrderList;

@Controller
public class OrderController {

	@Autowired
	private OrderService service;
	
	
	@ResponseBody
	@RequestMapping(value="/cart/addOrder", method = RequestMethod.POST)
	public Map<String, Integer> addOrder (Order order, HttpSession session) {
		Map<String, Integer> map = new HashMap<>();
		Member member = (Member)session.getAttribute("loginMember");
		order.setId(member.getId());
		
		map.put("result", service.addOrder(order));
		
		System.out.println(order);
		
		return map;
				
	}
	
	@RequestMapping(value ="/payment/orderPage", method = RequestMethod.GET)
	public void getOrderList (HttpSession session, Model model) {
		
		Member member = (Member)session.getAttribute("loginMember");
		
		System.out.println(member);
		String id = member.getId();
		
		List<OrderList> orderList = service.orderList(id);
		
		model.addAttribute("orderList", orderList);
	}
}