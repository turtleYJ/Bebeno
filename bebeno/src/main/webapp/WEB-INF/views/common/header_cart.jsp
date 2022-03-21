<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">

  <meta name="description" content="" />
  <meta name="keywords" content="free template, bootstrap, bootstrap4" />

  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital@0;1&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
 <!--  
 --> 
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/bootstrap.min2.css" />
<link rel="stylesheet" href="${path}/resources/css/cssyooil/bootstrap.min.cart.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/animate.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/owl.theme.default.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/jquery.fancybox.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/aos.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/owl.carousel.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/fonts/icomoon/style.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/fonts/feather/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/flaticon/font/flaticon.css" />

<!-- yooil css -->
<link rel="stylesheet" href="${path}/resources/css/cssyooil/shop_list.css">
<link rel="stylesheet" href="${path}/resources/css/cssyooil/shop_view.css">
<link rel="stylesheet" href="${path}/resources/css/cssyooil/custom.css">

<title>header</title>

<style type="text/css">
	legend {
    flex-wrap: wrap;
    }
	
</style>

</head>
<body>
	<div class="site-mobile-menu site-navbar-target">
    <div class="site-mobile-menu-header">
      <div class="site-mobile-menu-close">
        <span class="icofont-close js-menu-toggle"></span>
      </div>
    </div>
    <div class="site-mobile-menu-body"></div>
  </div>


  <nav class="site-nav">
        <div class="container headerbar" style="padding-top: 20px;">
          <div class="site-navigation">
            <a href="${path}/" class="logo float-left m-0">BeBeno <span class="text-primary">.</span></a>
            
            <c:if test="${ empty loginMember }">
	            <div class="loginbar">
			  		<a href="${path}/member/loginform" class="btnA button1">LOGIN</a>
			  		<a href="${path}/member/terms" class="btnA button2">JOIN</a>
	            </div>
            </c:if>
            
            <c:if test="${ !empty loginMember }">
	            <div class="loginbar">
			  		<a href="${path}/mypage/profile" class="btnA button1">MYPAGE</a>
			  		<a href="${path}/logout" class="btnA button2">LOGOUT</a>
	            </div>
            </c:if>
    
            <ul class="js-clone-nav d-none d-lg-inline-noone text-left site-menu">
              <li class="active"><a href="${path}/">Home</a></li>
              <li><a href="${path}/wineboard/wineList">WINE</a></li>
              <li><a href="${path}/shop/list">WINE SHOP</a></li>
              <li><a href="${path}/wagle_board/wagle_list">COMMUNITY</a></li>
    
              <c:if test="${ empty loginMember }">          	
                  <li><a href="${path}/member/loginform">LOGIN</a></li>
                  <li><a href="${path}/member/terms">JOIN</a></li>          	
              </c:if>          
              <c:if test="${ !empty loginMember }">
                  <li><a href="${path}/logout">LOGOUT</a></li>
                  <li><a href="${path}/mypage/profile">MYPAGE</a></li>
                 <li><a href="${path}/payment/cart">CART</a></li>
              </c:if>
            </ul>
            <a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-block" data-toggle="collapse" data-target="#main-navbar">
              <span></span>
            </a>
    
        </div>
        </div>
    </nav> 

  <script src="${ path }/js/jquery-3.5.1.min.js"></script>
  <script src="${ path }/js/jquery-migrate-3.0.0.min.js"></script>
  <script src="${ path }/js/popper.min.js"></script>
  <script src="${ path }/js/bootstrap.min.js"></script>
  <script src="${ path }/js/owl.carousel.min.js"></script>
  <script src="${ path }/js/aos.js"></script>
  <script src="${ path }/js/imagesloaded.pkgd.js"></script>
  <script src="${ path }/js/isotope.pkgd.min.js"></script>
  <script src="${ path }/js/jquery.animateNumber.min.js"></script>
  <script src="${ path }/js/jquery.stellar.min.js"></script>
  <script src="${ path }/js/jarallax.min.js"></script>
  <script src="${ path }/js/jarallax-element.min.js"></script>
  <script src="${ path }/js/jquery.waypoints.min.js"></script>
  <script src="${ path }/js/jquery.fancybox.min.js"></script>
  
  <script src="${ path }/js/jquery.lettering.js"></script>
  
  
  <script src="${ path }/js/TweenMax.min.js"></script>
  <script src="${ path }/js/ScrollMagic.min.js"></script>
  <script src="${ path }/js/scrollmagic.animation.gsap.min.js"></script>
  <script src="${ path }/js/debug.addIndicators.min.js"></script>
  
  
  <script src="${ path }/js/custom.js"></script>
