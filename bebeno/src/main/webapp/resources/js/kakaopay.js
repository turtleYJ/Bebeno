				//결제API
				$(".결제버튼").on("click","#purchase",function(){
					var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
					// 정보 동의 안하면 결제 진행 막기
					if($("#agree").is(":checked") == false){
					    alert("결제 진행을 위해 정보수집ㆍ이용 동의에 체크해주세요.");
					    return false;
					} else {
						 var purchaseDTO = {
								 
								 	member_id: ${member.member_id},
									purchase_amount: ${ totalPrice},
									purchase_delivery_fee: '3000',
									purchase_payment: $("#totalPrice").text(),
									purchase_method: 'card'
						 };
						 
						var arr = [deliveryDTO,purchaseDTO];
						
						let order_id = 0;
						let delivery_id = 0;
						let member_id = $(".member_id").val();
						//console.log(member_id);
						 
						 $.ajax({
						  	  type: 'post',
						        url:'/purchase/rest/insertPurchase/',
						        data: JSON.stringify(arr),
						        contentType:"application/json;charset=utf-8",
						        dataType:"json",
						        async: false,
						        success : function(resp){
						        	
						        	delivery_id = resp;
						        							        	
						        	$.ajax({
						  		  	  type: 'get',
						  		        url:"/purchase/rest/selectId/"+delivery_id,
						  		      async: false,
						  		     }).done(function(resp){
						  		    	  
						  		    	 order_id = resp;
						  		    	 
										 var purchaseDetailArray = [];
										 var purchaseDetailDTO = new Object();
										 
										<c:forEach var="cart" items="${carts}">
										purchaseDetailArray.push(purchaseDetailDTO = {
												purchase_id: order_id,
												md_id: ${cart.md_id},
												purchase_detail_quantity: ${cart.cart_item_count},
												purchase_detail_price: ${cart.cart_price},
											})
										</c:forEach>
												 
										
										 	
										 	if(initialTotalPrice=='0'){
										 		
										 		//0원일경우..
										 		if(confirm("결제하시겠습니까?")){
										 			$.ajax({
													  	  type: 'post',
													        url:'/purchaseDetail/rest/insertPurchaseDetail/',
													        data: JSON.stringify(purchaseDetailArray), 	
													        contentType:"application/json;charset=utf-8",
													        dataType:"json",
													        async: false,
													        success : function(resp){
												        	$.ajax({
												      	  	  type: 'delete',
												      	        url:"/cart/rest/deleteAll/"+member_id,
												      	        dataType:"json",
												      	        async: false,
												      	        success : function(resp){
												      	        	$.ajax({
												      	        		type:"post",
												      	        		url:"/coupon/rest/update/"+coupon_id
												      	        	})
												      	        }
												      	    }).done(function(resp){
												      	    	$.ajax({
											      	        		type:"post",
											      	        		url:"/point/rest/"+member_id+"/"+$("#point-num").text()
											      	        	})
											      	        	alert("결제가완료되었습니다..")
												      	    	//location.replace("/pay/rest/confirm?receipt_id="+data.receipt_id);
												      	    	location.href ="/";
												      	    	return false;
												      	    })
													    }
													        
													})
										 		}
										 	} else {
										 		
										 		BootPay.request({
													price: document.getElementById("totalPrice").innerHTML, //실제 결제되는 가격
													application_id: "61e73d6de38c3000217b806f",
													name: document.getElementById("item").innerHTML + '외', //결제창에서 보여질 이름
													pg: 'nicepay',
													method: 'card',//결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
													show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
													
													order_id: order_id, //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
													
												}).error(function (data) {
													//결제 진행시 에러가 발생하면 수행됩니다.
													//console.log(data);
												}).cancel(function (data) {
													//결제가 취소되면 수행됩니다.
													$.ajax({
													  	  type: 'delete',
													        url:'/purchase/rest/deleteId/'+delivery_id+"/"+order_id,
													        contentType:"application/json;charset=utf-8",
													        dataType:"json",
													        async: false     
													})
													//console.log(data);
												}).ready(function (data) {
													// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
													//console.log(data);
												}).close(function (data) {
												    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
												    
												    //console.log(data);
												}).done(function (data) {
													//결제가 정상적으로 완료되면 수행됩니다
													//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
												}).done(function (data) {
													//결제가 정상적으로 완료되면 수행됩니다
													//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
													$.ajax({
													  	  type: 'post',
													        url:'/purchaseDetail/rest/insertPurchaseDetail/',
													        data: JSON.stringify(purchaseDetailArray), 	
													        contentType:"application/json;charset=utf-8",
													        dataType:"json",
													        async: false,
													        success : function(resp){
												        	$.ajax({
												      	  	  type: 'delete',
												      	        url:"/cart/rest/deleteAll/"+member_id,
												      	        dataType:"json",
												      	        async: false,
												      	        success : function(resp){
												      	        	$.ajax({
												      	        		type:"post",
												      	        		url:"/coupon/rest/update/"+coupon_id
												      	        	})
												      	        }
												      	    }).done(function(resp){
												      	    	$.ajax({
											      	        		type:"post",
											      	        		url:"/point/rest/"+member_id+"/"+$("#point-num").text(), //포인트쓴만큼 차감.
											      	        		success : function(resp){
											      	        			$.ajax({ 
													      	        		type:"post",//포인트적립.
													      	        		url:"/point/rest/savePoints/"+member_id+"/"+$("#productsTotalPrice").text(),
													      	        		success : function(resp){
													      	        			$.ajax({
																				  	  type: 'patch',
																				      url:'/purchase/rest/updatePurchase/'+data.receipt_id+"/"+data.order_id
													      	        			})
													      	        		}
													      	        	})
													      	        }
											      	        	
												      	    	})
												      	    	//location.replace("/pay/rest/confirm?receipt_id="+data.receipt_id);
												      	    	location.replace("/pay/confirm?receipt_id="+data.receipt_id);
												      	    })
													    }
													        
													})
												});
										 	}
						  		     })
						        }
						     })
					}			
				 })

				 //간편결제API
				$("body").on("click","#kakao",function(){
					var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
					// 정보 동의 안하면 결제 진행 막기
					if($("#agree").is(":checked") == false){
					    alert("결제 진행을 위해 정보수집ㆍ이용 동의에 체크해주세요.");
					    return false;
					//핸드폰 유효성검사.
					}else if(!regExp.test($("#recipient_phone").val())){
						alert("폰번호를 올바르게 입력해주세요..");
						return false;
						// 상세주소가 null이면 경고 띄우기
					}else if($("#roadAddress2").val() == "") {
						alert("상세 주소를 입력해주세요.");
						return false;
					} else {
						//console.log($("#roadAddress2").val());
						var deliveryDTO = {
								 member_id: ${member.member_id},
								 delivery_address1: $("#roadAddress").val(),
								 delivery_address2: $("#roadAddress2").val(),
								 delivery_recipient: $("#recipient").val(),
								 delivery_phone: $("#recipient_phone").val()
						 };
						 
						 var purchaseDTO = {
								 
								 	member_id: ${member.member_id},
									purchase_amount: ${ totalPrice},
									purchase_delivery_fee: '3000',
									purchase_used_point: $("#point-input").val(),
									purchase_coupon: coupon_discount_rate,
									purchase_payment: $("#totalPrice").text(),
									purchase_method: 'card'
						 };
						 
						var arr = [deliveryDTO,purchaseDTO];
						
						let order_id = 0;
						let delivery_id = 0;
						let member_id = $(".member_id").val();
						//console.log(member_id);
						 
						 $.ajax({
						  	  type: 'post',
						        url:'/purchase/rest/insertPurchase/',
						        data: JSON.stringify(arr),
						        contentType:"application/json;charset=utf-8",
						        dataType:"json",
						        async: false,
						        success : function(resp){
						        	
						        	delivery_id = resp;
						        	
						        	
						        	$.ajax({
						  		  	  type: 'get',
						  		        url:"/purchase/rest/selectId/"+delivery_id,
						  		      async: false,
						  		     }).done(function(resp){
						  		    	  
						  		    	 order_id = resp;
						  		    	 
										 var purchaseDetailArray = [];
										 var purchaseDetailDTO = new Object();
										 
										<c:forEach var="cart" items="${carts}">
										purchaseDetailArray.push(purchaseDetailDTO = {
												purchase_id: order_id,
												md_id: ${cart.md_id},
												purchase_detail_quantity: ${cart.cart_item_count},
												purchase_detail_price: ${cart.cart_price},
											})
										</c:forEach>
												 
										
										 	
										 	if(initialTotalPrice=='0'){
										 		
										 		//0원일경우..
										 		if(confirm("결제하시겠씁니까?")){
										 			$.ajax({
													  	  type: 'post',
													        url:'/purchaseDetail/rest/insertPurchaseDetail/',
													        data: JSON.stringify(purchaseDetailArray), 	
													        contentType:"application/json;charset=utf-8",
													        dataType:"json",
													        async: false,
													        success : function(resp){
												        	$.ajax({
												      	  	  type: 'delete',
												      	        url:"/cart/rest/deleteAll/"+member_id,
												      	        dataType:"json",
												      	        async: false,
												      	        success : function(resp){
												      	        	$.ajax({
												      	        		type:"post",
												      	        		url:"/coupon/rest/update/"+coupon_id
												      	        	})
												      	        }
												      	    }).done(function(resp){
												      	    	$.ajax({
											      	        		type:"post",
											      	        		url:"/point/rest/"+member_id+"/"+$("#point-num").text()
											      	        	})
											      	        	alert("결제가완료되었습니다..")
												      	    	//location.replace("/pay/rest/confirm?receipt_id="+data.receipt_id);
												      	    	location.href ="/";
												      	    	return false;
												      	    })
													    }
													        
													})
										 		}
										 	} else {
										 		
										 		BootPay.request({
										 			price: document.getElementById("totalPrice").innerHTML,
										 			application_id: "61e73d6de38c3000217b806f",
										 			name: document.getElementById("item").innerHTML + '외', //결제창에서 보여질 이름
										 			pg: 'nicepay',
										 			method: 'kakao', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
										 			show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
										 			order_id: order_id,
										 		}).error(function (data) {
										 			//결제 진행시 에러가 발생하면 수행됩니다.
										 			//console.log(data);
										 		}).cancel(function (data) {
										 			//결제가 취소되면 수행됩니다.
										 			$.ajax({
													  	  type: 'delete',
													        url:'/purchase/rest/deleteId/'+delivery_id+"/"+order_id,
													        contentType:"application/json;charset=utf-8",
													        dataType:"json",  
													})
										 			//console.log(data);
										 		}).close(function (data) {
										 		    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
										 		    //console.log(data);
										 		}).done(function (data) {
													//결제가 정상적으로 완료되면 수행됩니다
													//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
													$.ajax({
													  	  type: 'post',
													        url:'/purchaseDetail/rest/insertPurchaseDetail/',
													        data: JSON.stringify(purchaseDetailArray), 	
													        contentType:"application/json;charset=utf-8",
													        dataType:"json",
													        async: false,
													        success : function(resp){
												        	$.ajax({
												      	  	  type: 'delete',
												      	        url:"/cart/rest/deleteAll/"+member_id,
												      	        dataType:"json",
												      	        async: false,
												      	        success : function(resp){
												      	        	$.ajax({
												      	        		type:"post",
												      	        		url:"/coupon/rest/update/"+coupon_id
												      	        	})
												      	        }
												      	    }).done(function(resp){
												      	    	$.ajax({
											      	        		type:"post",
											      	        		url:"/point/rest/"+member_id+"/"+$("#point-num").text(), //포인트쓴만큼 차감.
											      	        		success : function(resp){
											      	        			$.ajax({ 
													      	        		type:"post",//포인트적립.
													      	        		url:"/point/rest/savePoints/"+member_id+"/"+$("#productsTotalPrice").text(),
													      	        		success : function(resp){
													      	        			$.ajax({
																				  	  type: 'patch',
																				      url:'/purchase/rest/updatePurchase/'+data.receipt_id+"/"+data.order_id
													      	        			})
													      	        		}
													      	        	})
													      	        }
											      	        	
												      	    	})
												      	    	//location.replace("/pay/rest/confirm?receipt_id="+data.receipt_id);
												      	    	location.replace("/pay/confirm?receipt_id="+data.receipt_id);
												      	    })
													    }
													        
													})
												});
										 	}
						  		     })
						        }
						     })
					}			
				 })