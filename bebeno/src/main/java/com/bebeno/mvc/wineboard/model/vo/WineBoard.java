package com.bebeno.mvc.wineboard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WineBoard {
	private int wineBno; // 게시글 번호 

	private int wineCode; // 와인코드
	
	private String wineName; // 와인명 

	private String wineEng; // 영문명 
 
	private String wineType; // 와인종류
	
	private String wineMf; // 제조국 
	
	private String wineNational; // 지역 
	
	private String wineSl; // 당도 

	private String wineAc; // 산도
	
	private String wineBody; //바디
	
	private String wineTn; //타닌 
	
	private String wineInfo; // 상세정보 
	
	private String originalFileName; // 첨부파일원본명 
	
	private String renamedFileName; // 첨부파일변경명
	
	private int readCount; // 조회수 
	
	private String status; // 상태값 
	
	private Date createDate; // 게시물 작성일자 
	
	private Date modifyDate; // 게시물 수정일자 
	
	private String winePrice; // 와인가격 
	
	private String amount; // 와인 수량
	
}