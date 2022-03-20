<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<!-- 화살표 이미지 다운받아 오는 곳 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/cart.css">
</head>
<body>

<section class="mypage">

    <h2 class="title-mypage">MyPage</h2>

    <div class="my-tab">
        <ul class="list-nav">
            <li>
                <a href="${ path }/mypage/profile">정보수정</a>
            </li>
            <li>
                <a href="${ path }/mypage/scrap">스크랩</a>
            </li>
            <li>
                <a href="${ path }/mypage/cart">장바구니</a>
            </li>
        </ul>
    </div>
    <div class="container">     
                <input type="hidden" name="cmd" value="order">
                <div class="basketdiv" id="basket">
                    <div class="row head">

                        <div class="subdiv">
                            <div class="check">선택</div>
                            <div class="img">이미지</div>
                            <div class="pname">상품명</div>
                        </div>

                        <div class="subdiv">
                            <div class="basketprice">가격</div>
                            <div class="num">수량</div>
                            <div class="sum">합계</div>
                        </div>

                        <div class="subdiv">
        
                            <div class="basketcmd">삭제</div>
                        </div>
                        <div class="split"></div>
                    </div>

					 <c:forEach var="list" items="${cartList}">
                 	   <div class="row data">
                        <div class="subdiv">
                            <div class="check"><input type="checkbox" name="buy" value="260" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
   
                            <div class="img image"><img src="${path}/resources/upload/wineimg/${list.renamedFileName}" width="60" height="60"></div>

                            <div class="pname">
                                <span>${list.wineName}</span>
                            </div>
                        </div>
                        <div class="subdiv">
                            <!-- 가격 -->
                            <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price">${list.winePrice}</div>
                            <!-- 수량 조절 -->
                            <div class="num">
                                <div class="updown">
                                    <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="2" onkeyup="javascript:basket.changePNum(1);">
                                    <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                    <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                                </div>
                            </div>
                            <!-- 가격 * 수량 -->
                            <div class="sum">${list.winePrice}</div>
                        </div>
                        <!-- 장바구니에서 삭제 -->
                        <div class="subdiv">
                            <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                        </div>
                    </div>
      			</c:forEach>
                <div class="right-align basketrowcmd">
                    <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
                    <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
                </div>
        
                <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: ${list.cart_qty}</div>
                <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: ${list.cart_qty * list.amount}원</div>
        
                <div id="goorder" class="">
                    <div class="clear"></div>
                    <div class="buttongroup center-align cmd">
                        <button type="button" class="btn btn-default order_btn">주문하기</button>
                        <button class="btn btn-default btn-back_to_shop">쇼핑 계속하기</button>
                    </div>
                </div>
	    </div>
	   </div>  
 
</section>

    <script src="${ path }/js/jquery.min.js"></script>
	<script src="${ path }/js/cart.js"></script>
	
	<script type="text/javascript">
		$(".btn-back_to_shop").click(function() {
			history.back();
		});
		
		// orderlist 담기 
        $(".order_btn").click(function(){
              
              var wineBno=${list.wineBno};
              var wineName = $("#wineName").val();
              var cartqty = $(".numBox").val();
              var renamedFileName= $("#image").attr("src");
             
           if(wineBno == 1){
        	   wineBno=1;
           }else{
        	   wineBno=${list.wineBno};
           }
           
             console.log(wineBno);
              var data = {
            	wine_bno : wineBno,
            	cart_qty : cartqty

                };
              $.ajax({
                  url : "${path}/cart/addOrder",
                  type : "post",
                  data : data,
                  success : function(result){
                   alert("성공");
                  },
                  error : function(){
                   alert("실패");
                   console.log(wineBno);
                   console.log(wineName);
                   console.log(cartqty);
                   console.log(renamedFileName);
                  }
                 });
              
                });
	
  
	</script>


</body>
</html>