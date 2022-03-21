package com.bebeno.mvc.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WineListsOnShop {
	private int no;
	
	private int shopNo;
	
	private String korName;
	
	private String engName;
	
	private String file_originalFileName;
	
	private String file_renamedFileName;
}
