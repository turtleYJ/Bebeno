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
<!-- template관련 css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/animate.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/owl.theme.default.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/jquery.fancybox.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/aos.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/owl.carousel.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/feather/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/flaticon/font/flaticon.css" />

<!-- yooil css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main/bootstrap.min.css" />
<link rel="stylesheet" href="${path}/resources/css/cssyooil/shop_list.css">
<link rel="stylesheet" href="${path}/resources/css/cssyooil/shop_view.css">
<link rel="stylesheet" href="${path}/resources/css/cssyooil/custom.css">	

<title>header</title>

</head>
<body>
	<header>
	
		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close">
					<span class="icofont-close js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
	
		<nav class="site-nav">
			<div class="container">
				<div class="site-navigation">
					<a href="${ path }/" class="logo float-left m-0">BeBeno <span class="text-primary">.</span></a>
				
				<ul class="js-clone-nav d-none d-lg-inline-noone text-left site-menu">
					<li class="active"><a href="${ path }/">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">WINE</a></li>
					<li><a href="#">WINE SHOP</a></li>
					<li><a href="#">COMMUNITY</a></li>
					<li><a href="#">CART</a></li>
					
					<!-- 햄버거바 + 네비게이션바 -->
					
					<c:if test="${ empty loginMember }">          	
						<li><a href="${path}/member/loginform">LOGIN</a></li>
						<li><a href="${path}/member/terms">JOIN</a></li>          	
					</c:if>          
					<c:if test="${ !empty loginMember }">
						<!-- 
							Post 전송용 logout경로_탈퇴 컨트롤러 연결 시 Post방식 logout쪽으로 연결법 몰라 Get방식으로 변경 
						<li><a type="submit" onclick="document.getElementById('logoutForm').submit();">LOGOUT</a></li>
						 -->
						<li><a href="${path}/logout">LOGOUT</a></li>
						<li><a href="${path}/mypage/profile">MYPAGE</a></li>
					</c:if>
				</ul>
				
				<a href="#" class="glyphicon glyphicon-menu-hamburger" data-toggle="collapse" data-target="#main-navbar">
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
	  
	  <!-- js -->
	  <script type="text/javascript" src="${ path }/resources/smartEditor/js/service/HuskyEZCreator.js"></script>
  </header>