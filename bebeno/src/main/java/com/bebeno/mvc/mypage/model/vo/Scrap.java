package com.bebeno.mvc.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Scrap {
	
	private int scrapNo;
	
	private String id;

	private int wagleBoardNo;	
	
	private int wagleWriterNo;
	
	private String wagleBoardTitle;
	
	private String WagleBoardRNameFile;
	
}
