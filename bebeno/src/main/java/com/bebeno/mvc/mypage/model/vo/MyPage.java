package com.bebeno.mvc.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyPage {
	
	private int no;
	
	private String id;

	private String nickname;
	
	private String password;
	
	private String role;
	
	private String name;
	
	private String phone;
	
	private String email;
	
	private String address;
	
	private String birth;
	
	private String status;
	
	private Date enrollDate;
	
	private Date modifyDate;
	
}
