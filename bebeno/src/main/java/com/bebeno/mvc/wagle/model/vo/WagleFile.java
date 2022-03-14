package com.bebeno.mvc.wagle.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WagleFile {
	private int w_file_no;
	
	private int wagleNo;
	
	private String originalFileName;
	
	private String renamedFileName;
}
