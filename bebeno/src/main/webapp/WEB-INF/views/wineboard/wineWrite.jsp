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
	<jsp:include page="/WEB-INF/views/common/header1.jsp" />
</head>
<body>
    <form action="${path}/wineboard/wineWrite" name="write" method="post" enctype="multipart/form-data" >
        <div class="board_wrap">
            <div class="board_title">
                <strong>상품 등록</strong>
            </div>
            <div class="board_write_wrap">
                <div class="board_write">
                    <div class="title">
                        <dl>
                            <dt>와인명</dt>
                            <dd><input type="text" name="wineName"></dd>
                        </dl>
                    </div>
                    <div class="title">
                        <dl>
                            <dt>영문명</dt>
                            <dd><input type="text" name="wineEng"></dd>
                        </dl>
                    </div>
                    <div class="title">
                        <dl>
                            <dt>종류</dt>
                            <select id="selbox" name="wineType" style="width: 150px; height: 35px;">
                                <option value="" selected>종류 선택</option>
                                <option value="레드">레드</option>
                                <option value="화이트">화이트</option>
                                <option value="로제">로제</option>
                                <option value="네추럴">네추럴</option>
                                <option value="스파클링">스파클링</option>
                                <option value="1">기타</option><input type="text" id="directBox" name="directBox" />
                            </select>
                        </dl>
                    </div>
                    <div class="title">
                        <dl>
                            <dt>제조국</dt>
                            <select id="selbox1" name="wineNational" style="width: 150px; height: 35px;">
                                <option value="" selected>제조국 선택</option>
                                <option value="프랑스">프랑스</option>
                                <option value="이탈리아">이탈리아</option>
                                <option value="스페인">스페인</option>
                                <option value="포르투칼">포르투칼</option>
                                <option value="미국">미국</option>
                                <option value="뉴질랜드">뉴질랜드</option>
                                <option value="호주">호주</option>
                                <option value="칠레">칠레</option>
                                <option value="아르헨티나">아르헨티나</option>
                                <option value="남아프리카 공화국">남아프리카 공화국</option>
                                <option value="1">기타 국가</option><input type="text" id="directBox1" name="directBox1" />
                            </select>
                        </dl>
                    </div>
                    <div class="title">
                        <dl>
                            <dt>지역</dt>
                            <select id="selbox2" name="wineMf" style="width: 150px; height: 35px;">
                                <option value="" selected>지역 선택</option>
                                <option value="보르도">보르도</option>
                                <option value="부르고뉴">부르고뉴</option>
                                <option value="상파뉴">상파뉴</option>
                                <option value="론">론</option>
                                <option value="피에몬테">피에몬테</option>
                                <option value="토스카나">토스카나</option>
                                <option value="나파밸리">나파밸리</option>
                                <option value="리오하">리오하</option>
                                <option value="바로사 밸리">바로사 밸리</option>
                                <option>기타 지역</option><input type="text" id="directBox2" name="directBox2"></input>
                            </select>
                        </dl>
                    </div>
                    <div class="title">
                        <dl>
                            <dt>가격</dt>
                            <dd><input type="text" maxlength="10" id="price" name="winePrice" koreanCurrency="true" value="" required="required" onkeyup="inputNumberFormat(this)"></dd>
                        </dl>
                    </div>
                    <div class="title">
                        <di>
                            <dt>상품 이미지</dt>
                            <dd><input type="file" name="upfile"></dd>
                        </di>
                    </div>
                    <div class="info">
                        <dl>
                            <dt>당도</dt>
                            <select name="wineSl">
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
                            <select name="wineAc">
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
                            <select name="wineBody">
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
                            <select name="wineTn">
                                <option value="" selected>타닌 선택</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </dl>
                    </div>
                    <div class="cont" name="wineInfo">
     					 <textarea id="wineInfo" name="wineInfo" placeholder="와인 상세 정보"></textarea>
              			<!-- <input type="text" id="wineinfo" placeholder="와인 상세 정보" style="width:1250px; height:200px;"  > -->
              	
                    </div>
                </div>
                <div class="bt_wrap">
                 	<a class="on" id="register"><input type="submit" value="등록"/></a>
                    <a href="${path}/wineboard/wineList">취소</a>
    
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
        
    <script>
    function selectTest(){
        var testA = $("#selbox2 > option:selected").val(); 
        console.log(testA);

        var testB = $( "#selbox2 option:selected" ).text(); 
        console.log(testB);
     }
    
    </script>    
    </body>
    </html>