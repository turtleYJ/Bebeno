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
import org.springframework.web.bind.annotation.SessionAttribute;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.payment.model.service.CartService;
import com.bebeno.mvc.payment.model.service.OrderService;
import com.bebeno.mvc.payment.model.vo.Order;
import com.bebeno.mvc.payment.model.vo.OrderList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {

	@Autowired
	private OrderService orderservice;
	
	@Autowired
	private CartService cartservice;
	
	
	@GetMapping("/payment/orderPage") 
	public String orderPage(OrderList orderList, String merchant_uid, @SessionAttribute(name="loginMember") Member loginMember, HttpSession session, Model model) {
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("merchant_uid", merchant_uid);
		model.addAttribute("loginMember", loginMember);		
		
		System.out.println(loginMember);
		System.out.println(orderList.getWineName());
		System.out.println(orderList.getWinePrice());
		
		return "/payment/orderPage";
		
	}
	
	@ResponseBody
	@PostMapping("/payment/orderResult")
	public String orderResult(Order order, @SessionAttribute(name="loginMember") Member loginMember ,
						@RequestParam("wineBno") int wineBno, HttpSession session) throws Exception {
			
		
		String id = loginMember.getId();
		order.setId(id);

		orderservice.orderResult(order);
		System.out.println();
		
		return "/payment/orderResult";
	}
	
    @GetMapping("/consumerBreakdown")
    public String consumerBreakdown(@SessionAttribute(name="loginMember")Member loginMember, Model model) {
		
    	String id = loginMember.getId();
    	
    	List<OrderList> paymentList = orderservice.getPaymentList(id);
    	
    	model.addAttribute("id",id);
    	model.addAttribute("paymentList", paymentList);
    	
    	return "/mypage/profile";
    	
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    
}