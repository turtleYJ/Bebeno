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
<title>스크랩</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/scrap.css">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

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

<!-- ================================================================================================ -->

    <form id="update-profile">

        <div class="mypage-input-box">
            
            <div class="scraps">
                <!-- 
                    <c:forEach var="scrap" items="${ scrapList }" begin="0" end="3">
                        
                        <div class="scrap">
		            		<a href="${ pageContext.request.contextPath }/spot/spotDetail?no=${ spot.no }">
		            			<img src="${ pageContext.request.contextPath }${ spot.imgPath }${ spot.no }.png" alt="스크랩이미지">
		            		</a>
		            		<div class="scrap-title">${ spot.content }</div>
		            	</div>
                        
                    </c:forEach> 
                -->
                
                <c:forEach begin="0" end="3">
                        
                	<div class="scrap">
	            		<a href="">
	            			<img src="../resources/image/city1.PNG" alt="스크랩이미지">
	            		</a>
	            		<div class="scrap-title">게시판 스크랩 제목 forEach</div>
	            	</div>
                       
                </c:forEach>  
            	
            	<div class="scrap">
            		<a>
            			<img src="../resources/image/city1.PNG" alt="스크랩이미지">
            		</a>
            		<div class="scrap-title">게시판 스크랩 제목 1</div>
            	</div>
            	<div class="scrap">
            		<a>
            			<img src="../resources/image/city1.PNG" alt="스크랩이미지">
            		</a>
            		<div class="scrap-title">게시판 스크랩 제목 2</div>
            	</div>
            	<div class="scrap">
            		<a>
            			<img src="../resources/image/city1.PNG" alt="스크랩이미지">
            		</a>
            		<div class="scrap-title">게시판 스크랩 제목 3</div>
            	</div>
            	<div class="scrap">
            		<a>
            			<img src="../resources/image/city1.PNG" alt="스크랩이미지">
            		</a>
            		<div class="scrap-title">게시판 스크랩 제목 4</div>
            	</div>
            	
            	<div class="scrap">
            		<a>
            			<img src="../resources/image/city1.PNG" alt="스크랩이미지">
            		</a>
            		<div class="scrap-title">게시판 스크랩 제목 5</div>
            	</div>
            	
            	
            </div>
        </div>

    </form>
</section>

</body>
</html>