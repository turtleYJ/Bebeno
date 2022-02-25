package com.bebeno.mvc.wineboard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WineBoard {
	private int wineCode;

	private int writerNo;
	
	private String wineName;
	
	private String wineEng;

	private String writerId;
	
	private String wineType;
	
	private String wineMf;
	
	private String wineNational;
	
	private String wineSl;

	private String wineAc;
	
	private String wineBody;
	
	private String wineTn;
	
	private String wineInfo;
	
	private String originalFileName;
	
	private String renamedFileName;
	
	private int readCount;
	
	private String status;
	
	private Date createDate;
}