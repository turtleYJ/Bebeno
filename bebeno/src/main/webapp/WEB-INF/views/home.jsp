<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
  
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main/bootstrap.min.css" />
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/fonts/flaticon/font/flaticon.css" />

  <title>bebeno home</title>
  
</head>
<%-- <!--  <div class="site-mobile-menu site-navbar-target">
    <div class="site-mobile-menu-header">
      <div class="site-mobile-menu-close">
        <span class="icofont-close js-menu-toggle"></span>
      </div>
    </div>
    <div class="site-mobile-menu-body"></div>
  </div>
 -->

<!--   <nav class="site-nav">
    <div class="container">
      <div class="site-navigation">
        <a href="#" class="logo float-left m-0">BeBeno <span class="text-primary">.</span></a> -->

        <ul class="js-clone-nav d-none d-lg-inline-noone text-left site-menu">
          <li class="active"><a href="">Home</a></li>
          <li><a href="${path}/wineboard/wineList">WINE</a></li>
          <li><a href="${path}/shop/list">WINE SHOP</a></li>
          <li><a href="${path}/wagle_board/wagle_list">COMMUNITY</a></li>

          <c:if test="${ empty loginMember }">          	
          	<li><a href="${path}/member/loginform">LOGIN</a></li>         	
          	<li><a href="${path}/member/terms_v2">JOIN</a></li>          	
          </c:if>          
          <c:if test="${ !empty loginMember }">
          	<li><a href="${path}/mypage/profile">MYPAGE</a></li>
         	<li><a href="${path}/payment/cart">CART</a></li>
          	<li><a href="${path}/logout">LOGOUT</a></li>
          </c:if>
        </ul>

        <a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-block" data-toggle="collapse" data-target="#main-navbar">
          <span></span>
        </a>

    </div>
    </div>
</nav>  --%>

	<jsp:include page="/WEB-INF/views/common/header_main.jsp" />


  <div class="site-section">
    <div class="container">
      <div class="row align-items-center justify-content-around">

        <div class="col-lg-4 text-center">

          <div >
            <div data-jarallax-element="-100" class="jarallax">
              <h2>Wine</h2>
              <span class="d-inline-block">Wine selling</span>
             <a href="${path}/wineboard/wineList"><img src="${path}/resources/img/wine4.jpg" alt="Image" class="img-fluid my-3 my-lg-5"></a>
              <p class="line-top fig-2-text mb-4">textarea</p>
            </div>
          </div>

        </div>
        <div class="col-lg-5 mt-5">

          <div>
            <h2>Wine Shop</h2>
            <span class="d-inline-block">find wine shop</span>

            <div  class="line me-auto mb-3 mt-3"></div>

            <p class="line-top fig-2-text my-4">textarea</p>
           <a href="${path}/shop/list"><img src="${path}/resources/img/wine7.jpg" alt="Image" class="img-fluid"></a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="section-4">
    <div class="container">
      <div class="row mb-4 align-items-center">
        <div class="col-6">
          <h2 class="line-top">BeBeno Premium Wine</h2>
        </div>
        <div class="col-6 text-right">
          <a href="#" class="custom-prev-v2 js-custom-prev-v2">Prev</a>
          <span class="mx-3">/</span>
          <a href="#" class="custom-next-v2 js-custom-next-v2">Next</a>
        </div>
      </div>

      <div>
        <div class="owl-4-slider owl-carousel">
          <div class="product">
            <a href="#" class="d-block">
              <img src="${path}/resources/img/W0170702.png" alt="Image" class="img-fluid" style="width: 250px; height: 300px;">
            </a>
            <div class="text-center text-md-left">
              <h3>Murphy Goode, California Cabernet Sauvignon</h3>
              <p>머피굿, 캘리포니아 까베르네 소비뇽</p>
            </div>
          </div>

          <div class="product">
            <a href="#" class="d-block">
              <img src="${path}/resources/img/W0170660.png" alt="Image" class="img-fluid" style="width: 250px; height: 300px;">
            </a>
            <div class="text-center text-md-left">
              <h3>Maison Castel, ICE Cuvee Blanche</h3>
              <p>메종 카스텔, 아이스 뀌베 블랑쉬</p>
            </div>
          </div>

          <div class="product">
            <a href="#" class="d-block">
              <img src="${path}/resources/img/W0170695.png" alt="Image" class="img-fluid" style="width: 250px; height: 300px;">
            </a>
            <div class="text-center text-md-left">
              <h3>Punctum, Sin Sulfitos Anadidos Barrel Aged Tempranillo</h3>
              <p>풍크툼, 템프라니요</p>
            </div>
          </div>

          <div class="product">
            <a href="#" class="d-block">
              <img src="${path}/resources/img/W0170660.png" alt ="Image" class="img-fluid" style="width: 250px; height: 300px;">
            </a>
            <div class="text-center text-md-left">
              <h3>Borrasca Cava Brut</h3>
              <p>보라스카 까바 브륏</p>
            </div>
          </div>

          <div class="product">
            <a href="#" class="d-block">
              <img src="${path}/resources/img/W0170656.png" alt="Image" class="img-fluid" style="width: 250px; height: 300px;">
            </a>
            <div class="text-center text-md-left">
              <h3>Campo Viejo, Tempranillo</h3>
              <p>깜포 비에호, 템프라니요</p>
            </div>
          </div>

          <div class="product">
            <a href="#" class="d-block">
              <img src="${path}/resources/img/W0170649.png" alt="Image" class="img-fluid" style="width: 250px; height: 300px;"> 
            </a>
            <div class="text-center text-md-left">
              <h3>Mates & Lovers</h3>
              <p>메잇스 앤 러벌스</p>
            </div>
          </div>

          <div class="product">
            <a href="#" class="d-block">
              <img src="${path}/resources/img/W0170634.png" alt="Image" class="img-fluid" style="width: 250px; height: 300px;">
            </a>
            <div class="text-center text-md-left">
              <h3>Toso, Brut Millesimato</h3>
              <p>토소, 브뤼 밀레시마토</p>
            </div>
          </div>

          <div class="product">
            <a href="#" class="d-block">
              <img src="${path}/resources/img/W0170592.png" alt="Image" class="img-fluid" style="width: 250px; height: 300px;">
            </a>
            <div class="text-center text-md-left">
              <h3>Offley, 30 Years</h3>
              <p>오프리, 30년 토니 포트</p>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>

  <div class="site-footer">
    <div class="container">
      <div class="row justify-content-center text-center copyright">
        <div class="col-md-8">
          <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with team bebeno by License</a>
          </p>
        </div>
      </div>
    </div>
  </div>


  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>



  
</body>
</html>
	
