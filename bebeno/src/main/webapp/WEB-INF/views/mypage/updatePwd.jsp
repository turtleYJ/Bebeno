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
<title>비밀번호 수정</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/updatePwd.css">

</head>
<body>
	
<section class="mypage">
	
	<h2 class="title-mypage">MyPage</h2>
	
	<div class="my-tab">
	    <ul class="list-nav">
	        <li>
                <a href="${ path }/mypage/profile">정보수정</a>
            </li>
            <li>
                <a href="${ path }/mypage/scrap">스크랩</a>
            </li>
            <li>
                <a href="${ path }/mypage/cart">장바구니</a>
            </li>
	    </ul>
	</div>
	
	<form id="update-profile">
	
	    <div class="inner-list">
	        <div class="wrab-board-wide">
	            <ul class="inner-list-nav">
	                <li>
                        <a href="${ path }/mypage/profile">프로필</a>
                    </li>
                    <li>
                        <a href="${ path }/mypage/updatePwd">비밀번호 재설정</a>
                    </li>
                    <li>
                        <a href="${ path }/mypage/deleteAccount">탈퇴</a>
                    </li>
	            </ul>
	        </div>
	    </div>
	
	<!-- ================================================================================================ -->
	
        <div class="mypage-input-box">
            <div class="updatepwd-box">
                <div class="input-box">
                    <p>
                        <label class="hidden">현재비밀번호</label>
                        <input type="password" id="CurrentPwd" name="CurrentPwd" class="w100" 
                        placeholder="현재비밀번호">
                    </p>                        
                </div>
                <div class="input-box">
                    <p>
                        <label class="hidden">새비밀번호</label>
                        <input type="password" id="NewPwd" name="NewPwd" class="w100" 
                        placeholder="새 비밀번호(8~30자)">
                    </p>                        
                </div>
                <div class="input-box">
                    <p>
                        <label class="hidden">새비밀번호확인</label>
                        <input type="password" id="NewPwd_2" name="NewPwd_2" class="w100" 
                        placeholder="새 비밀번호 확인">
                    </p>                        
                </div>
                <div class="save-update-button">
                    <button type="button" id="updatePwd" class="button">비밀번호 변경</button>
                </div>
            </div>
            
        </div>

    </form>
</section>	


<!-- 비밀번호 변경 script -->
<script>

	/* 비밀번호와 비밀번호확인 값이 같은지 체크하는 스크립트 */
	function validate() {
		let pass1 = $("#NewPwd").val();
		let pass2 = $("#NewPwd_2").val();
		
		if(pass1.trim() != pass2.trim()){
			alert("비밀번호가 일치하지 않습니다.");
			$("#NewPwd").val("");
			$("#NewPwd_2").val("");
			$("#NewPwd").focus();
			
			return false;
		}
	}

</script>

</body>
</html>