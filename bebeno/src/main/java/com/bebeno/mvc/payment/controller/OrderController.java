//package com.bebeno.mvc.payment.controller;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.bebeno.mvc.payment.model.service.OrderService;
//
//@Controller
//@RequestMapping("/payment")
//public class OrderController {
//  
//	@Autowired
//	private OrderService service;
//	
//	@RequestMapping("/orderPage")
//	public String orderNow(int wineBno, String wineName, String winePrice, String amount, Model model) {
//		boolean check = service.orderNow(wineName, winePrice, amount,model);
//		if(check == false) return "forword:join";
//		
//		return "foward:orderPage";
//	}
//	
//	
//	// 결제화면 연결
//	@GetMapping("/orderPage")
//	public ModelAndView order (ModelAndView mv) {
//		mv.setViewName("/payment/orderPage");
//		return mv;
//	}
//	
//
//}
