<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

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
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 
</head>
<body>
	<div class="container">
			<form action="${path}/payment/orderPage" method="post">
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
				<a href="javascript:iamport"><button class="btn btn-default cal-btn" type="submit">결제하기</button></a>
				<a href="${path}/mypage/cart"><button class="btn btn-default back_btn">돌아가기</button></a>
			</div>
		</div>
		</form>
	</div>
	
	<script>
	
	function iamport(){
		//가맹점 식별코드
		IMP.init('imp30146952');
		IMP.request_pay({
		    pg : 'kcp',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '상품1' , //결제창에서 보여질 이름
		    amount : 100, //실제 결제되는 가격
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울 강남구 도곡동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
			// 결제 검증
			$.ajax({
        		type: "POST",
        		url : "/music/verifyIamport/" + rsp.imp_uid
        	}).done(function(data){
        		console.log(data);
        		//가격 비교한 후 로직 실행 (서버 검증)
        		if(rsp.paid_amount == data.response.amount){
        			$("input[name=user_no]").val('${userInfo.no}');
        			$.ajax({
        				type: "POST",
        				data : {
        					ticket_type : ticket_type,
        					time : time,
        					no : no
        				},
        				url : "/music/pay/payment.do",
    	   				success:function(res){
    	   					if(res.trim() =='true'){
    	   						alert('결제가 성공하였습니다.');
    	   						location.href='/music/pay/view.do';
    	   					}else{
    	   						alert('결제가 실패하였습니다.'); 
    	   					}
    	   				}
        			})
        		}else{
        			alert('결제 오류.');
        		}
        	});
        	
    });
	
};

	
	</script>
</body>
</html>
