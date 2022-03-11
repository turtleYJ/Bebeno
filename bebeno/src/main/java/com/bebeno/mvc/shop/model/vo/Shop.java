package com.bebeno.mvc.shop.model.vo;

import java.util.List;

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
	
	private String status;
	
	private String content;
	
	private String content2;
	
	private String originalFileName;
	
	private String renamedFileName;
	
	private List<ContentFiles> files;

	private String enrollDate;
	
	private String modifyDate;
}
