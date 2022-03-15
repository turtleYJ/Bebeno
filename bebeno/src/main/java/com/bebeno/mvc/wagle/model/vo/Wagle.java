package com.bebeno.mvc.wagle.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Wagle {
	private int no;
	
	private int writerNo;
	
	private String wine_no;
	
	private String shop_no;
	
	private String title;
	
	private String content;
	
	private String readcount;
	
	private String status;
	
	private List<WagleFile> files;

	private String createDate;
	
	private String modifyDate;
	
	private String category;
}
