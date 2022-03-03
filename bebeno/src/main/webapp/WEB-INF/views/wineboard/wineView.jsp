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
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<body>
<section class="sub-contents wrap-wine-view clear">
    <div class="inner">
        <div class="btn_list">
            <a href="${path}/wineboard/wineList" class="button btn_list_small">목록</a>
        </div>
        <div class="clear">
            <div class="wine-top-left">
                <div class="swiper-container gallery-top swiper-container-initialized swiper-container-horizontal">
                    <div class="swiper-wrapper" >
						<c:if test="${ !empty wineboard.renamedFileName }">
                        <div class='swiper-slide'><img src="${path}/resources/upload/wineimg/${wineboard.renamedFileName}" width="400px" height="550px"/></div>
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
                        <dt class="wine-name">${wineboard.wineName}</dt>
                        <dd class="wine-name-en">${wineboard.wineEng}</dd>
                    </dl>
                    <p class="wine-price">
                        <strong>${wineboard.winePrice}</strong>    
                        <button type="button" onclick="" class="btn-wine-wish btn-pop-wine-01 btn_open">구매하기</button>                    

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
                                    <span>${wineboard.readCount}</span>
                                    </div>
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

</body>
 </html>
                    