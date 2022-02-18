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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>와인 등록 페이지</title>
 <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/css.css" /> 
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css" />
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<body>
    <form action="${ pageContext.request.contextPath }/wineboard/wineWrite" enctype="multipart/form-data" method="post">
        <div class="board_wrap">
            <div class="board_title">
                <strong>상품 등록</strong>
            </div>
            <div class="board_write_wrap">
                <div class="board_write">
                    <div class="title">
                        <dl>
                            <dt>와인코드</dt>
                            <dd><input type="text"></dd>
                        </dl>
                    </div>
                    <div class="title">
                        <dl>
                            <dt>와인명</dt>
                            <dd><input type="text"></dd>
                        </dl>
                    </div>
                    <div class="title">
                        <dl>
                            <dt>영문명</dt>
                            <dd><input type="text"></dd>
                        </dl>
                    </div>
                    <div class="title">
                        <dl>
                            <dt>종류</dt>
                            <select id="selbox" name="selbox" style="width: 150px; height: 35px;">
                                <option value="" selected>종류 선택</option>
                                <option value="Red">레드</option>
                                <option value="White">화이트</option>
                                <option value="Rose">로제</option>
                                <option value="Natural">네추럴</option>
                                <option value="Sparkling">스파클링</option>
                                <option value="etc">기타</option><input type="text" id="directBox" name="directBox" />
                            </select>
                        </dl>
                        
                    </div>
                    <div class="title">
                        <dl>
                            
                            <dt>제조국</dt>
                            <select id="selbox1" name="selbox1" style="width: 150px; height: 35px;">
                                <option value="" selected>제조국 선택</option>
                                <option value="France">프랑스</option>
                                <option value="Italia">이탈리아</option>
                                <option value="Spain">스페인</option>
                                <option value="Portuga">포르투칼</option>
                                <option value="American">미국</option>
                                <option value="NewZealand">뉴질랜드</option>
                                <option value="Australie">호주</option>
                                <option value="Chile">칠레</option>
                                <option value="Argentina">아르헨티나</option>
                                <option value="SouthAfrica">남아프리카 공화국</option>
                                <option value="otherCountries">기타 국가</option><input type="text" id="directBox1" name="directBox1" />
                            </select>
                        </dl>
                    </div>
                    <div class="title">
                        <dl>
                            <dt>지역</dt>
                            <select id="selbox2" name="selbox2" style="width: 150px; height: 35px;">
                                <option value="" selected>지역 선택</option>
                                <option value="France">보르도</option>
                                <option value="Italia">부르고뉴</option>
                                <option value="Spain">상파뉴</option>
                                <option value="Portuga">론</option>
                                <option value="American">피에몬테</option>
                                <option value="NewZealand">토스카나</option>
                                <option value="Australie">나파밸리</option>
                                <option value="Chile">리오하</option>
                                <option value="Argentina">바로사 밸리</option>
                            </select>
                        </dl>
                    </div>
                    <div class="title">
                        <dl>
                            <dt>가격</dt>
                            <dd><input type="text" maxlength="10" id="price" koreanCurrency="true" value="" required="required" onkeyup="inputNumberFormat(this)"></dd>
                        </dl>
                    </div>
                    <div class="title">
                        <di>
                            <dt>상품 이미지</dt>
                            <dd><input type="file"></dd>
                        </di>
                    </div>
                    <div class="info">
                        <dl>
                            <dt>당도</dt>
                            <select name="">
                                <option value="" selected>당도 선택</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                            
                        </dl>
                        <dl>
                            <dt>산도</dt>
                            <select name="">
                                <option value="" selected>산도 선택</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </dl>
                        <dl>
                            <dt>바디</dt>
                            <select name="">
                                <option value="" selected>바디 선택</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </dl>
                        <dl>
                            <dt>타닌</dt>
                            <select name="">
                                <option value="" selected>타닌 선택</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </dl>
                    </div>
                    <div class="cont">
                        <textarea placeholder="와인 상세 정보"></textarea>
                    </div>
                </div>
                <div class="bt_wrap">
                    <a href="view.html" class="on">등록</a>
                    <a href="list.html">취소</a>
                </div>
            </div>
        </div>  
    </form>
        <!-- js영역 -->
        
    <script src="${ path }/js/jquery.min.js"></script>
	<script src="${ path }/js/browser.min.js"></script>
	<script src="${ path }/js/breakpoints.min.js"></script>
	<script src="${ path }/js/util.js"></script>
	<script src="${ path }/js/menubar.js"></script>
    <script src="${ path }/js/textselbox.js"></script>
        
        
    </body>
    </html>