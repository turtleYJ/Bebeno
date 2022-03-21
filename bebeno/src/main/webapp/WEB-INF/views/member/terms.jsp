<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value ="${ pageContext.request.contextPath }"/>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
<head>

<link rel="stylesheet" href="${path}/resources/css/enroll.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/css.css" /> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css" />
	<title>Home</title>
	<jsp:include page="/WEB-INF/views/common/header1.jsp" />

<script src="${ path }/js/checkBox.js"></script>

</head>
<body>
<section class="sub-contents wrap-login">

	<h2 class="wrap-tit">TERMS</h2>
	<div class="login-box box-shadow">
		<div class="login-note">
	
			<form action="" id="joinForm" name="form" method="post">
				<ul class="join_box">
			            
			    	<li class="checkBox check01">
			        	<ul class="clearfix">
			            	<li>이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</li>
			                <li class="checkAllBtn">
			                	<input type="checkbox" name="chkAll" id="chk" class="chkAll">
			                </li>
			            </ul>
			        </li>
			        
			        <li class="checkBox check02">	
			        	<ul class="clearfix">
			            	<li>이용약관 동의 (필수)</li>
			                <li class="checkBtn">
			                	<input type="checkbox" name="chk"> 
			                </li>
			            </ul>
			            <textarea name="" id="">여러분을 환영합니다.
베베노 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.
본 약관은 다양한 베베노 서비스의 이용과 관련하여 네이버 서비스를 
제공하는 베베노 주식회사(이하 ‘베베노’)와 이를 이용하는 
베베노 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 
아울러 여러분의 베베노 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</textarea>            
			        </li>
			        <li class="checkBox check03">
			        	<ul class="clearfix">
			            	<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
			                <li class="checkBtn">
			                    <input type="checkbox" name="chk">
			                </li>
			            </ul>
			
			            <textarea name="" id="">베베노 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.
본 약관은 다양한 베베노 서비스의 이용과 관련하여 네이버 서비스를 
제공하는 베베노 주식회사(이하 ‘베베노’)와 이를 이용하는 베베노 
서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 
아울러 여러분의 베베노 서비스 이용에 도움이 될 수 있는 유익한 
정보를 포함하고 있습니다.</textarea>
			         
			        </li>   
				</ul>
			    <ul class="footBtwrap clearfix">
			    	<a href="${path}/member/join" class="button button-large button-bg-basic mt0">동의 
			  		</a>
			    </ul>
			    <div class="agree-button">
			    </div>
			    <input type="button" value="비동의" class="button button-large button-bg-basic mt0" onclick="nochk()"/>&nbsp;&nbsp;&nbsp;
			    	
			</form>
		</div>
	</div>

</section> 

<!-- 
	체크박스 관련 자바스크립트 참고 사이트
	 : https://yong-nyong.tistory.com/5
 -->

<script type="text/javascript">

/* 
*/
	const ChkAll = document.querySelector('input[name=chkAll]');	
	let agreeChk = document.querySelectorAll('input[name=chk]');

	ChkAll.addEventListener('change', (e) => {

		for(let i = 0; i < agreeChk.length; i++){
  			agreeChk[i].checked = e.target.checked;
		}
	});
	
/* ================================================================ */	
	
	/* function chk(){
		 var req = document.form.req.checked;
		 var num = 0;
		 if(req == true){
		  num = 1;
		 }
		 if(num==1){
		  document.form.submit();
		 }else{
		  alert("개인정보 약관에 동의하셔야 합니다.");
		 }
	} */
	
	function nochk(){
		alert("동의하지 않으면 가입하실 수 없습니다");
		location.href="../join.jsp";
	}

</script>

</body>
</html>
