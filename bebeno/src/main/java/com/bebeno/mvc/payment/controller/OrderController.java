package com.bebeno.mvc.payment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.payment.model.service.CartService;
import com.bebeno.mvc.payment.model.service.OrderService;
import com.bebeno.mvc.payment.model.vo.Order;
import com.bebeno.mvc.payment.model.vo.OrderList;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderservice;
	
	@Autowired
	private CartService cartservice;
	
	
	@GetMapping("/payment/orderPage") 
	public String orderPage(HttpSession session, Model model) {
		
		Member member = (Member)session.getAttribute("loginMember");
		String id = member.getId();
	
		List<OrderList> orderList = orderservice.getPaymentList(id);
		
		model.addAttribute("orderList", orderList);
		
	
		return "/payment/orderPage";
		
	}
	
	@ResponseBody
	@PostMapping("/payment/orderResult")
	public String orderResult(Order order, @RequestParam("wineBno") int wineBno, HttpSession session) throws Exception {
		
		Member member = (Member)session.getAttribute("loginMember");
		order.setId(member.getId());
		
		orderservice.orderResult(order);
		cartservice.removeCart(member, wineBno);
		

		return "/payment/orderResult";
	}
	
//	@GetMapping("/mypage/profile")
//	public String myOrderList(Principal principal, Model model) {
//		String id = principal.getName();
//		
//		List<Order> paymentList = orderservice.getPaymentList(id);
//		
//		model.addAttribute("id", id);
//		model.addAttribute("paymentList",paymentList);
//		
//		return "/mypage/profile";
//		
//	}
//	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    
}