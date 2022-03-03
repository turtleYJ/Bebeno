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
            <div class="scrap-list">
                <ul>
                <!-- 
                    <c:forEach var="spot" items="${ spotList }" begin="0" end="3">
                        <li>
                        <a href="${ pageContext.request.contextPath }/spot/spotDetail?no=${ spot.no }">
                            <div class="img-thumb">
                                <img src="${ pageContext.request.contextPath }${ spot.imgPath }${ spot.no }.png" alt="">
                            </div>
                            <strong>${ spot.title }</strong>
                            <p>${ spot.content }</p>
                        </a>
                        </li>
                    </c:forEach> 
                -->
                    <li>
                        <a href="">
                            <div class="img-thumb">
                                <img src="./resources/image/city1.PNG" alt="">
                            </div>
                            <Strong>게시글 제목</Strong>
                            <p>내용</p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="img-thumb">
                                <img src="./resources/image/city1.PNG" alt="">
                            </div>
                            <Strong>게시글 제목</Strong>
                            <p>내용</p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="img-thumb">
                                <img src="./resources/image/city1.PNG" alt="">
                            </div>
                            <Strong>게시글 제목</Strong>
                            <p>내용</p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="img-thumb">
                                <img src="./resources/image/city1.PNG" alt="">
                            </div>
                            <Strong>게시글 제목</Strong>
                            <p>내용</p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="img-thumb">
                                <img src="./resources/image/city1.PNG" alt="">
                            </div>
                            <Strong>게시글 제목</Strong>
                            <p>내용</p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="img-thumb">
                                <img src="./resources/image/city1.PNG" alt="">
                            </div>
                            <Strong>게시글 제목</Strong>
                            <p>내용</p>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <div class="img-thumb">
                                <img src="./resources/image/city1.PNG" alt="">
                            </div>
                            <Strong>게시글 제목</Strong>
                            <p>내용</p>
                        </a>
                    </li>
                    
                    
                </ul>
            </div>
        </div>

    </form>
</section>

</body>
</html>