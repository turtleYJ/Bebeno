package com.bebeno.mvc.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Shop {
	private int no;
	
	private int writerNo;
	
	private String korBname;
	
	private String engBname;
	
	private String address;
	
	private String phone;
	
	private String bnsHour;
	
	private String type;
	
	private String imgUrl;
	
	private String status;
	
	private String content;
	
	private String originalFileName;
	
	private String renamedFileName;
	
	private String enrollDate;
	
	private String modifyDate;
}
