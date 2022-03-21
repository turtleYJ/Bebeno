package com.bebeno.mvc.wagle.model.vo;

import java.util.Date;
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
	
	private String nicname;
	
	private int wine_no;
	
	private int shop_no;
	
	private String title;
	
	private String content;
	
	private String originalFileName;
	
	private String renamedFileName;
	
	private int readcount;
	
	private int scrapcount;
	
	private String status;
	
	private List<WagleFile> files;
	
	private List<Reply> replies;

	private Date createDate;
	
	private Date modifyDate;
	
	private String category;
}
