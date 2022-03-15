package com.bebeno.mvc.payment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bebeno.mvc.payment.model.service.CartService;
import com.bebeno.mvc.payment.model.vo.CartList;


@Controller
@RequestMapping("/payment")
public class CartController {
	
	
	@Autowired
	private CartService service;
	
	
////	@GetMapping("/paymentPage") 
////	public String payment() {
////		
////		return "/payment/paymentPage";
////		
////	}
////
////  @PostMapping("/paymentPage")
////  	public String paymentAction() {
////	  
////	  return "/payment/paymentPage";
////
////  }
//  
//	// 장바구니 페이지 이동
////	
////	@GetMapping("/cart")
////	public String cart() {
////		
////		
////		return "/payment/cart";
////		
////	}
//	
//	
//	@GetMapping("/cart")
//	public String showCart (Integer cart_id, Model model) throws Exception {
//		Cart cart = cartService.showCart(cart_id);
//		model.addAttribute("cart", cart);
//		
//		return "/payment/cart";
//		
//	}
//	
//	
//	@PostMapping("/cart")
//	public ModelAndView addCart (ModelAndView model, @ModelAttribute Cart cart) {
//		
//		int result = 0;
//		cart.setCart_id(result);
//		result = cartService.save(cart);
//		
//		if(result > 0) {
//			model.addObject("msg", "성공");
//			model.addObject("location", "/payment/cart?cart_id=" + cart.getCart_id());
//		} else {
//			model.addObject("msg", "실패");
//			model.addObject("location", "/payment/cart?cart_id=" + cart.getCart_id());
//			
//		}
//		
//		model.setViewName("common/msg");
//		
//		return model;
//	}
//  
//  
  
	
//	/* 장바구니 페이지 - 로그인 여부 확인 후 아이디가 담은 장바구니 정보 셋팅 후 출력*/
//	@RequestMapping(value="/cartViewProc")
//	public String cartViewProc(Model model) {
//		boolean check = service.cartViewProc(model);
//		if(check == false) return "forward:join";
//		return "forward:cart";
//	}
//	
//	/* 상품 상세 페이지에서 장바구니 담기 클릭시 */
//	@RequestMapping(value = "/cartInsert", produces = "application/json; charset=utf-8" )
//	@ResponseBody		// ajax에서 done이나, success쓰려면 리턴해줘야함(void 안됨)..!
//	public Map<String,String> cartInsert(@RequestBody Map<String,String>map) {
//		int productNum = Integer.parseInt(map.get("num"));
//		int amount = Integer.parseInt(map.get("amount"));
//		
//		boolean check = service.cartInsert(productNum, amount);
//		if(check == false) map.put("msg", "로그인 필요");
//		return map;
//	}
//	
//	/* 장바구니 페이지에서 삭제버튼 클릭시 */
//	@RequestMapping(value = "/itemDelete", produces = "application/json; charset=utf-8" )
//	@ResponseBody		
//	public Map<String,String> itemDelete(@RequestBody Map<String,String>map) {
//		int cartNum = Integer.parseInt(map.get("num"));
//		service.itemDelete(cartNum);
//		
//		return map;
//	}
//	
//	/* 장바구니 페이지에서 주문하기 눌렀을 때, 주문수량 조정했을 수 있으므로 해당 아이디의 장바구니에 담긴것 전부 업데이트*/
//	@RequestMapping(value = "/cartUpdate", produces = "application/json; charset=utf-8" )
//	@ResponseBody		
//	public boolean cartUpdate(HttpServletRequest req) {
//		return service.updateCart(req);
//	}
	
	@GetMapping("/cart")
	public String list(Model model) {
		List<CartList> list = service.list();
		
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "/payment/cart";
	}

}
  
  
  
  
  
  
  
  
