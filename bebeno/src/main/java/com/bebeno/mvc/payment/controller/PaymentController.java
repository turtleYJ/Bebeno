package com.bebeno.mvc.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@GetMapping("/paymentPage") 
	public String payment() {
		
		return "/payment/paymentPage";
		
	}

  @PostMapping("/paymentPage")
  	public String paymentAction() {
	  
	  return "/payment/paymentPage";
  }
}
