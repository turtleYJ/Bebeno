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
    <!-- css 관련 -->
	<link rel="stylesheet" href="${ path }/resources/css/css_wagle/wagle_list.css">
	<link rel="stylesheet" href="${ path }/resources/css/css_wagle/wagle_write.css">
	<link rel="stylesheet" href="${ path }/resources/css/css_wagle/wagle_write_manage.css">
	<link rel="stylesheet" href="${ path }/resources/css/css_wagle/wagle_view.css">
	
	<!-- js 관련 -->
	<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
    <!-- infinite, pinterest way -->
	<script type="text/javascript" src="${ path }/js/masonry.pkgd.min.js"></script>
	<script type="text/javascript" src="${ path }/js/infinite-scroll.pkgd.min.js"></script>
	
	<script type="text/javascript" src="${ path }/js/wagle_write.js"></script>

</head>
<body>
	<header>
    	<section class="wagle_nav">
	        <div class="wagle_buttons">
	            <ul class="wagle_btn">
	            	<a type="button" href="${ path }/wagle_board/wagle_list">
		                <li id="menu_btn">전체보기</li>
	            	</a>
	            	<a href="${ path }/wagle_board/wagle_list_filter?category=wine">
		                <li id="menu_btn">wine</li>
	            	</a>
	            	<a href="${ path }/wagle_board/wagle_list_filter?category=shop">
	                	<li id="menu_btn">shop</li>
	            	</a>
	            </ul>
	        </div>
	        <div class="wagle_my_write_box">
	            <ul class="wagle_write">
	                <li><a href="${ path }/wagle_board/wagle_write">글쓰기</a></li>
	                <li><a href="${ path }/wagle_board/wagle_manage">내 글 관리</a></li>
	            </ul>
	        </div>
	    </section>
	    <section class="wine-filter-box">
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
	                    <a class='on'></a><a class='on'></a><a ></a><a ></a><a ></a></div>
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
		</section>
	</header>