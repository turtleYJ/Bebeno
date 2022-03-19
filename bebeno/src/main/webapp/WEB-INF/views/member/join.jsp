<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value ="${ pageContext.request.contextPath }"/>   
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/join.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/css.css" /> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css" />
	<title>join</title>
	<jsp:include page="/WEB-INF/views/common/header1.jsp" />
</head>
<body>
<section class="sub-contents wrap-login">
	<h2 class="wrap-tit">REGISTER</h2>
   <div class="login-box box-shadow">
			<div class="login-note">
<form id="joinForm" action="${ path }/member/join" class="input-group" method="post">
            <ul class="join_box">
            
<div class="wrap wd668">
<div class="container">
<div class="form_txtInput">
<div class="join_form">
<table>
<colgroup>
<col width="30%"/>
<col width="auto"/>
</colgroup>
<tbody>
<tr>
<th><span>아이디</span></th>
<td><input type="text" name="id" class="input-field" placeholder="ID 를 입력하세요."></td>
</tr>
<tr>
<th><span>닉네임</span></th>
<td><input type="text" name="nickname" class="input-field" placeholder="닉네임을 입력하세요."></td>
</tr>
<tr>
<th><span>이름</span></th>
<td><input type="text" name="name" class="input-field" placeholder="성합을 입력하세요."></td>
</tr>
<tr>
<th><span>비밀번호</span></th>
<td><input type="password" name="password" class="input-field" placeholder="비밀번호를 입력해주세요."></td>
</tr>
<tr>
<th><span>비밀번호확인</span></th>
<td><input  type="password" class="input-field" placeholder="비밀번호를 확인하세요"></td>
</tr>
<tr class="email">
<th><span>이메일</span></th>
<td>
<input type="email" name="email" class="input-field" placeholder="abc@abc.com">
</td>
</tr>
<tr>
<th><span>휴대폰 번호</span></th>
<td><input type="tel" name="phone" class="input-field"placeholder=""></td>
</tr>
<tr>
<th><span>주소</span></th>
<td><input type="text" name="address" class="input-field" placeholder="주소를 입력하세요."></td>
</tr>
<tr>
<th><span>생년월일</span></th>
<td><input type="text" name="birth" class="input-field" placeholder="2022-03-01"></td>
</tr>
</tbody>
</table>
<div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span>
</div>
<input type="submit" value="REGISTER" >
</div>
</form>
</ul>
      </div>
</div>
<!-- 
<div class="btn_wrap">
<ul class="footBtwrap clearfix">
<div class="btn_wrap">
<a input type="submit" value="register">다음</a>
</div>
 -->
</ul>
</div> 
</ul>
       </div>
       </div>
       </div> 
</body>
</html>
