<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value ="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
 src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
	<div class="container">
			
		<c:set value="${productInfo}" var="dto"/>
		<c:set value="2500" var="del_fee"/>
		<div class="row no-gutters qnas" style="text-align: center;">
			<h1 class="page-header">주문하기</h1>
			<table class="table table-hover" style="width: 70%; margin: auto; border-bottom: 1px solid #D5D5D5;">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center;">상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>옵션</th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td><img alt="thumbnail" src="" width="50%">
							<input type="hidden" value="" name="wineCode" id="wineCode">
							</td>
							<td><br></td>
							<td><fmt:formatNumber type="number" value=""/>&nbsp;원</td>
							<td><select name="order_Qty" class="form-control order_Qty">
								<c:forEach begin="1" end="" var="stock">
									<option value=""></option>
								</c:forEach>
							</select>
							</td>
							<td>
										<div class="form-horizontal" style="text-align: left;">
											<select class="form-control" name="selected_Opt">
												<option value="S">선물 포장</option>
											</select>
										</div>
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
								</td>
						</tr>
				</tbody>
			</table>
		</div>
		
		<div class="row no-gutters" style="text-align: center; margin: 80px 0;">
		<c:set value="" var="vo"/>
			<h1 class="page-header">주문정보 확인</h1>
			<h4 style="color: red;">주문자 정보를 입력해주세요. </h4>
		</div>
		<div class="row no-gutters">
			<div class="form-horizontal">
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">ID</label>
					<div class="col-sm-8">
						<input class="form-control" id="inputId" placeholder="ID" name="userid" value="" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputName" class="col-sm-2 control-label">Name</label>
					<div class="col-sm-8">
						<input class="form-control" id="inputName" placeholder="Name" name="username" value="">
					</div>
				</div>					
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-8">
						<input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" value="">
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">Tel</label>
					<div class="col-sm-8">
						<input type="tel" class="form-control" id="inputTel" placeholder="Tel" name="tel" value="">
					</div>
				</div>		
			</div>
		</div>
		
		<div class="row no-gutters" style="text-align: center; margin: 80px 0;">
			<h1 class="page-header">결제수단 확인</h1>
			<div style="text-align: center;">
				<label style="margin-right: 50px;"><input type="radio" name="cal_info" value="transfer">&nbsp;계좌이체</label>
				<input type="radio" name="cal_info" value="card"><label>&nbsp;카드 결제</label>
			</div>
			<hr>
			<div class="row no-gutters" style="text-align: center; margin: 50px 0;">
				<label>상품가격 :&nbsp; <span id="price"></span>&nbsp;원</label>
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				</label>
				<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
				<label style="font-size: 1.5em;">총 결제금액 : <span id="totalprice"></span>&nbsp;원
				<input type="hidden" id="amount" name="totalAmount">
				</label>
			</div>
			<div>
				<button type="button" class="btn btn-primary" id="btn-kakaopay" onclick="requestPay()">결제하기</button>				
				<a href="${path}/payment/cart"><button class="btn btn-default back_btn">돌아가기</button></a>
			</div>
		</div>
	</div>
	
	<script>
	
	// import 결제 api 
	
    IMP.init('imp93088520');

    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          order_id: "${orderList.orderId}",
          name: "${orderList.name}",
          amount: "${orderList.winePrice}",
          buyer_name: "bebeno",
          buyer_email: "bebeno@bebeno.com",
          buyer_tel: "010-4242-4242",
      }, function (rsp) { // callback
          if (rsp.success) {
             	console.log("ajax 이전");
             	$.ajax({
	        		url: "${path}/payment/orderResult",
	        		type: "post",
     		    beforeSend : function(xhr) {
     		    	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
     		    },
	        		data: {
	        			wine_bno : ${orderList.wineBno},
	        			wine_name : '${orderList.wineName}',
	        			wine_price : '${orderList.winePrice}',
	        			order_id : '${orderList.orderID}'
	        		},
	        		dataType: "text",
	        		success: function(){
			        	alert("결제가 완료되었습니다.");
			        	location.href = "${path}/payment/orderResult";
	        		}
	        	});
	        	console.log("ajax 이후");
	        } else { // 실패시 실행문
	        	alert("결제가 취소되었습니다.");
	    		location.href = "${path}/payment/cart";
	        }
	    });
	}
	</script>
   
     
</body>
</html>
