<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value ="${ pageContext.request.contextPath }"/>   
<html>
<head>

<link rel="stylesheet" href="${path}/resources/css/loginform.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/css.css" /> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css" />
	<title>Home</title>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
</head>
<section class="sub-contents wrap-login">
	<h2 class="wrap-tit">LOGIN</h2>
    <div class="loginform">
        <h1>login</h1>
         <c:if test="${ empty loginMember }">
        <form id="login" action="${ path }/login" class="input-group" method="post">
            	
            <input type="text" name="id" class="input-field" placeholder="User ID" required>
            <input type="password"  name="password" class="input-field" placeholder="Enter Password" required>
            <input type="checkbox" name="remember" id="checkbox" class="hidden">
            <input type="submit" value="LOGIN">
            </form>
            </c:if>
     <div class="login-box-link clear">
				<a href="${ path }/member/terms">join</a>
				
	</div>
	
        <div class="forgot">
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
        </div>
    </div>
</section>
</html>