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
    <meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=no">
	<link rel="stylesheet" href="//fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/winecss.css" />
    <title>header</title>
</head>
<style>
@import url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,700,900");
</style>
<body class="preload">
    <div id="wrapper"> 
        
        <!-- header 영역 -->
        <header id="header"> 
            <div class="inner">
                <!-- Logo영역 (글자로만 ? )-->
                <a>
                    <span class="title" style="font: italic bold 3em/1em Georgia, serif ; color: #900000;">bebeno</span>
                </a>
                    <ul id="menubar">
                        <li id="inlinemenu"><a href="">ABOUT</a></li>
                        <li id="inlinemenu"><a href="${path}/wineboard/wineList">WINE</a></li>
                        <li id="inlinemenu"><a href="${path}/shop/list">WINE SHOP</a></li>
                        <li id="inlinemenu"><a href="">COMMUNITY</a></li>

                        <li id="inlinemenu"><a href="${ path }/member/loginform">login</a></li>
                        <li id="inlinemenu"><a href="${ path }/member/terms">join</a></li>


                    </ul>
                <!-- Nav 영역 -->
                <nav>
                    <ul>
                        <li><a href="#menu">Menu</a></li>
                    </ul>
                </nav>

            </div>
        </header>

        <!-- Menu 영역 -->
            <nav id="menu">
                <h2>Menu</h2>
                <ul>
                    <li><a href="">HOME</a></li>
                    <li><a href=""></a></li>
                    <li><a href=""></a></li>
                    <li><a href="${ path }/mypage/profile">MYPAGE</a></li>
                    <li><a href=""></a></li>
                </ul>
            </nav>
        </div>

</body>
</html>