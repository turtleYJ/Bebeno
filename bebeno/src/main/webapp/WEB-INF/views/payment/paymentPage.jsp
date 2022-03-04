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
<title>결제페이지</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/pay.css" /> 
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css" />
 <jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<body>
	<form action="${path}/payment/paymentPage" method="post">
    <div class="board_wrap">
        <div class="board_title">
            <strong>Order</strong>
            <p>와인 주문내역</p>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="info">
                    <dl>
                        <dt>상품 정보</dt>
                    </dl>
                    <dl>
                        <dt>수량</dt>
                    </dl>
                    <dl id="order1">
                        <dt>주문 금액</dt>
                    </dl>  
                </div>
                <div class="cont pd_detail">
                    <li>
                        <div class="thumb">
                        <a><img src="">
                            </a>  
                        </div>
                    </li>
                    <div class="txt-area">
                        <dl>
                            <dt>와인이름 ~</dt>
                        </dl>
                        <dl>
                            <dt>1</dt>
                        </dl>
                        <dl>
                            <dt>20000</dt>
                        </dl>
                    </div>
                </div>
                <div class="cont pd_detail">
                    <li>
                        <div class="thumb">
                        <a><img src="">
                            </a>  
                        </div>
                    </li>
                    <div class="txt-area">
                        <dl>
                            <dt>와인이름 ~</dt>
                        </dl>
                        <dl>
                            <dt>1</dt>
                        </dl>
                        <dl>
                            <dt>20000</dt>
                        </dl>
                    </div>
                </div>
                <div class="info">
                    <dl>
                        <dt>상품합계</dt>
                        <dd>20000</dd>
                    </dl>
                    <dl>
                        <dt>수량</dt>
                        <dd>1</dd>
                    </dl>
                    <dl>
                        <dt>총 합계</dt>
                        <strong><dd id="total-am">20000</dd></strong>
                    </dl>  
                </div>

            </div>
            <div class="bt_wrap">
                <a href="" class="on">주문</a>
                <a href="">취소</a>
            </div>
        </div>
    </div>
</form>
</body>
</html>
