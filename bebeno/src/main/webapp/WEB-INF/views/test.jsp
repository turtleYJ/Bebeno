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
<title>Insert title here</title>
</head>
<body>
	
	<h2>Get 테스트</h2>
	
	<form action="${ path }/test" method="get">
	
		<label>이름 : <input type="text" name="userName" size="12"> </label> <br>
		<label>비밀번호 : <input type="password" name="password" size="12"> </label> <br>
		<label>비밀번호 확인 : <input type="password" name="passwordConfirm" size="12"> </label> <br>
		
		<br><br>
		
		<input type="submit" value="전송">		
	
	</form>
	
	<!-- ================================================================================================= -->
	
	<h2>Post 테스트</h2>
	
	<form action="${ path }/test" method="Post">
	
		<label>이름 : <input type="text" name="userName" size="12"> </label> <br>
		<label>비밀번호 : <input type="password" name="password" size="12"> </label> <br>
		<label>비밀번호 확인 : <input type="password" name="passwordConfirm" size="12"> </label> <br>
		
		<br><br>
		
		<input type="submit" value="전송">		
	
	</form>
	
	
</body>
</html>