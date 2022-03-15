<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value ="${ pageContext.request.contextPath }"/>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/css.css" />
    <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/wineview.css" />
    <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/winecss.css" />
    <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css" />
  

    <title>상품 상세 페이지</title>
	<jsp:include page="/WEB-INF/views/common/header1.jsp" />
</head>
<body>
<section class="sub-contents wrap-wine-view clear">
    <div class="inner">
        <div class="btn_list">
            <a href="${path}/wineboard/wineList" class="button btn_list_small">목록</a>
        </div>
        <div class="clear">
            <div class="wine-top-left">
                <div class="swiper-container gallery-top swiper-container-initialized swiper-container-horizontal">>
                    <div class="swiper-wrapper" >
						<c:if test="${ !empty wineboard.renamedFileName }">
                        <div class='swiper-slide'><img id="image" src="${path}/resources/upload/wineimg/${wineboard.renamedFileName}" width="400px" height="550px"/></div>
                        <div class="wine-pagination"></div>
                        </c:if>
                    </div>
                    </div>
                </div>
            </div>      
            <div class="wine-top-right">
                <div class='bagde-box'>
                    <p class="dib">
                        <span class="bagde-item bagde-blue-fill">${wineboard.wineType}</span>
                        <span>${wineboard.wineMf}</span>
                        <span>${wineboard.wineNational}</span>                 </p>
                    </div>
                    <dl>
                        <dt class="wine-name" id="wineName">${wineboard.wineName}</dt>
                        <dd class="wine-name-en">${wineboard.wineEng}</dd>
                    </dl>
                    <p class="wine-price">
                        <strong>${wineboard.winePrice}</strong>      
                    </p>
                    <p>
                                            <label>수량</label>
                        <select name="amount">
                        	<c:forEach begin="1" end="5" var="i">
                        		<option class="numBox" value="${i}">${i}</option>
                        	</c:forEach>
                        </select>&nbsp;개   
                        <a href="${path}/payment/cart"><button type="button" class="btn-wine-wish btn-pop-wine-01 btn_open btn-cart cart_btn">장바구니 담기</button></a>  
                        <a href="${path}/payment/orderPage"><button type="submit" class="btn-wine-wish btn-pop-wine-01 btn_open btn-order cart_btn2">구매하기</button></a>  
                    </p> 
                    <p class="wine-price-etc">※ 수입사가 제공한 가격으로 판매처별로 가격이 다를 수 있습니다.</p>

                    <div class="wine-components">
                        <ul>
                            <li>
                                <p class="wine-c-txt">당도</p>
                                <div id="" class="filter-grade">
                                    <a class='on'></a><a class='on'></a><a class='on'></a><a class='on'></a><a class='on'></a>								</div>
                                </li>
                                <li>
                                    <p class="wine-c-txt">산도</p>
                                    <div id="" class="filter-grade">
                                        <a class='on'></a><a class='on'></a><a ></a><a ></a><a ></a>								</div>
                                    </li>
                                    <li>
                                        <p class="wine-c-txt">바디</p>
                                        <div id="" class="filter-grade">
                                            <a class='on'></a><a class='on'></a><a class='on'></a><a class='on'></a><a class='on'></a>								</div>
                                        </li>
                                        <li>
                                            <p class="wine-c-txt">타닌</p>
                                            <div id="" class="filter-grade">
                                                <a class='on'></a><a class='on'></a><a ></a><a ></a><a ></a>								</div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="wine-top-right-inner">
                                    <span>${wineboard.wineInfo}</span>
                                    </div>
                                </div>
								<div class="wineviewright">
                                    <a class="button btn_list_ch" href="${path}/wineboard/wineUpdate?wineBno=${wineboard.wineBno}">수정</a>
                                    <button type="button" class="button btn_list_del" id="btnDelete">삭제</button>
                                </div>
                            </div>
                    </section>
                        <!-- js영역 -->

                        <script src="${ path }/js/jquery.min.js"></script>
                        <script src="${ path }/js/swiper.min.js"></script>
                        <script src="${ path }/js/swiper.js"></script>
                        <script src="${ path }/js/browser.min.js"></script>
						<script src="${ path }/js/breakpoints.min.js"></script>
						<script src="${ path }/js/util.js"></script>
						<script src="${ path }/js/menubar.js"></script>

						
						<script>
						$(document).ready(() => {
							$("#btnDelete").on("click", () => {
								if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
									location.replace("${path}/wineboard/wineList");
								}
							})
						});
						

						//장바구니 담기
				            $(".cart_btn").click(function(){
				                  
				                  var wineBno=${wineboard.wineBno}+1;
				                  var wineName = $("#wineName").val();
				                  var cartqty = $(".numBox").val();
				                  var renamedFileName= $("#image").attr("src");
				                 
				               if(wineBno == 1){
				            	   wineBno=1;
				               }else{
				            	   wineBno=${wineboard.wineBno}+1;
				               }
				               
				                  
				                  
				                 console.log(wineBno);
				                  var data = {
				                	wineBno : wineBno,
				                	wineName : wineName,
				                	cartqty : cartqty,
				                	renamedFileName : renamedFileName
				                    };
				                  $.ajax({
				                      url : "/cateDetail/addCart",
				                      type : "post",
				                      data : data,
				                      success : function(result){
				                       alert("카트 담기 성공");
				                       $(".numBox").val("1");
				                      },
				                      error : function(){
				                       alert("카트 담기 실패");
				                       console.log(wineBno);
				                       console.log(cartqty);
				                       console.log(renamedFileName);
				                      }
				                     });
				                  
				                  location.href = "/wineView?wineBno=" + ${wineboard.wineName};
				                    });
				                  
						
				            //즉시구매
				               $(".cart_btn2").click(function(){
				            	  	 
				            	      var wineBno=${wineboard.wineBno}+1;
					                  var wineName = $("#wineName").val();
					                  var cartqty = $(".numBox").val();
					                  var renamedFileName= $("#image").attr("src");  
				                    
				                  if(wineBno == 1){
				                	  wineBno=1;
				                  }else{
				                	  wineBno=${wineboard.wineBno}+1;
				                  }
				                  
				                    console.log(wineBno);
				                     var data = {
							               wineBno : wineBno,
							               wineName : wineName,
							               cartqty : cartqty,
							               renamedFileName : renamedFileName
				                       };
				                     $.ajax({
				                         url : "/wineView/addCart",
				                         type : "post",
				                         data : data,
				                         success : function(result){
				                         
				                          $(".numBox").val("1");
				                         },
					                      error : function(){
						                  alert("카트 담기 실패");
						                  console.log(wineBno);
						                  console.log(cartqty);
						                  console.log(renamedFileName);
						                      }
				                        });
				                     
				                     location.href = "/payment/cart";
				                 
				                       });
						

                  	    $(".btn-cart").click(function() {
                			var check = confirm("상품이 장바구니에 담겼습니다. 확인하시겠습니까?");
                			if (check) {
                				location.assign("${path}/payment/cart");
                			} 
                		});
                		
                        $(".btn-order").click(function() {
                			var check = confirm("상품을 구매하시겠습니까?");
                			if (check) {
                				location.assign("${path}/payment/orderPage");
                			} 
                		});
     

</script>
</body>
 </html>
                    