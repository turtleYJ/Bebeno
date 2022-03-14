package com.bebeno.mvc.shop.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContentFiles {
	private int file_no;
	
	private int shopNo;
	
	private String file_originalFileName;
	
	private String file_renamedFileName;
	
}
