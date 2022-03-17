package com.bebeno.mvc.payment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartList {
	
	private int cart_id;
	
	private int wine_bno;
	
	private String wineName;
	
	private String id;
	
	private String winePrice;
	
	private String amount;
	
	private int cart_qty;
	
	private String renamedFileName;
	
}
