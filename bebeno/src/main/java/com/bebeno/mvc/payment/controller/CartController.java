package com.bebeno.mvc.payment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bebeno.mvc.member.model.vo.Member;
import com.bebeno.mvc.payment.model.service.CartService;
import com.bebeno.mvc.payment.model.vo.Cart;
import com.bebeno.mvc.payment.model.vo.CartList;


@Controller
public class CartController {
	
	
	@Autowired
	private CartService service;
	
//	@GetMapping("/cart")
//	public String list(Model model) 
//		
//		List<CartList> list = service.list();
//		
//		System.out.println(list);
//		
//		model.addAttribute("list", list);
//		
//		return "/payment/cart";
//	}
	
	@ResponseBody
	@RequestMapping(value = "/wineView/addCart", method = RequestMethod.POST)
	public Map<String, Integer> addCart(Cart cart, HttpSession session) throws Exception {
		Map<String, Integer> map = new  HashMap<>();
		Member member = (Member)session.getAttribute("loginMember");
		cart.setId(member.getId());
		
		map.put("result", service.addCart(cart)) ;
		
		return map;
			
	}
	
	@RequestMapping(value ="/payment/cart", method = RequestMethod.GET)
	public void getCartList (HttpSession session, Model model) throws Exception {
		
		Member member = (Member)session.getAttribute("loginMember");
		
		System.out.println(member);
		String id = member.getId();
		
		List<CartList> cartList = service.cartList(id);
		
		model.addAttribute("cartList", cartList);
	}
	

	@GetMapping("/orderPage")
	public String orderPage() {
		
		return "/payment/orderPage";
		
	}
}
  
  
  
  
  
  
  
  
