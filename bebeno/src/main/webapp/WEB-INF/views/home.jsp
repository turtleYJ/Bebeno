<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/css.css" /> 
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css" />
	<title>Home</title>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<body>


	<!-- scripts  -->

	<script src="${ path }/js/jquery.min.js"></script>
	<script src="${ path }/js/browser.min.js"></script>
	<script src="${ path }/js/breakpoints.min.js"></script>
	<script src="${ path }/js/util.js"></script>
	<script src="${ path }/js/menubar.js"></script>
	
</body>
</html>
