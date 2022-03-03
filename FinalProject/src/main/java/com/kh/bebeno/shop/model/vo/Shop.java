package com.kh.bebeno.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Shop {
	private int no;
	
	private int writerNo;
	
	private String korName;
	
	private String engName;
	
	private String adrress;
	
	private String phone;
	
	private String bnsHour;
	
	private String type;
	
	private String imgUrl;
}
