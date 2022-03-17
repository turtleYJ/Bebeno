package com.bebeno.mvc.payment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.DATE;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
	   
		 private String order_no;
	     
		 private String id;  // member table
	     
		 private int wine_bno; // wineboard table 

		 private DATE order_date ;
	     
	     private String order_status;
	     

}
