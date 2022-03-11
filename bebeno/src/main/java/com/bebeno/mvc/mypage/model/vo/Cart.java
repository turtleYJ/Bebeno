package com.bebeno.mvc.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	
	private String id; // member fk
	
	private int wineBno; // wineboard fk
	
	private int cartId; // 장바구니 번호 
	
	private int cart_qty; // 상품 수량

}
