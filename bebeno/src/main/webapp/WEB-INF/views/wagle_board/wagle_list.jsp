<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>와글와글</title>
	<link rel="stylesheet" href="${ path }/resources/css/css_wagle/wagle_list.css">
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
    <header>
    </header>
    <section class="wagle_nav">
        <div class="wagle_buttons">
            <ul class="wagle_btn">
                <li id="menu_btn">전체보기</li>
                <li id="menu_btn">와인</li>
                <li id="menu_btn">바틀샵</li>
                <li id="menu_btn">와인바</li>
            </ul>
        </div>
        <div class="wagle_my_write_box">
            <ul class="wagle_write">
                <li><a href="./wagle_write.html">글쓰기</a></li>
                <li><a href="./wagle_writemanage.html">내 글 관리</a></li>
            </ul>
        </div>
    </section>
    <section class="wagle_contains">
            <div>
                <div class="wagle_item_box">
                    <!-- 출력 div -->
                    <div class="wagle_item">
                        <ul>
                            <li>
                                <a href="a">
                                    <span>
                                        <img class="wagle_thumb_img" src="${ path }/resources/image/flower1.PNG" alt="">
                                    </span>
                                    <p><strong>닉네임</strong></p>
                                    <strong>글제목</strong>
                                    <p>글내용 미리보기</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
        </div>
    </section>
    <footer></footer>
</body>
</html>
