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

<link rel="stylesheet" href="${ path }/resources/css/mypage/updatePwd.css">
<script src="${ path }/js/jquery-3.6.0.js"></script>

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
                        <label class="hidden">현재 비밀번호</label>
                        <input type="password" id="CurrentPwd" name="password" class="w100" 
                        placeholder="현재비밀번호">
                    </p>                        
                </div>
                <div class="input-box">
                    <p>
                        <label class="hidden">새 비밀번호</label>
                        <input type="password" id="NewPwd" name="newPwd" class="w100" 
                        placeholder="새 비밀번호(8~30자)">
                    </p>                        
                </div>
                <div class="input-box">
                    <p>
                        <label class="hidden">새 비밀번호 확인</label>
                        <input type="password" id="NewPwd_2" name="newPwdConfirm" class="w100" 
                        placeholder="새 비밀번호 확인" onchange="sameCheck()">
                        <br>
                        <span id="sameCheck"></span>
                    </p>                        
                </div>
                <div class="save-update-button">          
                    <button type="button" id="updatePwdBtn" class="button" style='cursor:pointer;'>정보 수정</button>
                </div>
            </div>
        </div>

    </form>
</section>	

<script>

	// 1. 새 비밀번호와 새 비밀번호 확인값이 같거나 다를 경우 표시되는 스크립트
	function sameCheck() {
		
		let newPwd = document.getElementById("NewPwd").value;
		let newPwdConfirm = document.getElementById("NewPwd_2").value;
		
		let sameCheck = document.getElementById("sameCheck");
		
		if(newPwd != "" && newPwdConfirm != "") {
			if(newPwd == newPwdConfirm) {
				sameCheck.innerHTML="비밀번호가 일치합니다."
				sameCheck.style.color="blue"				
			} else {
				sameCheck.innerHTML="비밀번호가 일치하지 않습니다."
				sameCheck.style.color="red"
			}
		}
	}

// ===========================================================================
	
	// 2. 정보 수정 버튼을 눌렀을 시 발생하는 이벤트
	$(document).ready(() => {		
		
		$("#updatePwdBtn").on("click", () => {			
			
		let newPwd = document.getElementById("NewPwd").value;
		let newPwdConfirm = document.getElementById("NewPwd_2").value;		
		
		// 1) 비밀번호 길이 제한(8 ~ 30)
		if(newPwd.length < 8 || newPwd.length > 30) {
			alert("새 비밀번호는 8~30자로 입력해 주세요")
			return false;
		}
				
		// 2-1) 새 비밀번호와 확인 비밀번호가 불일치인 경우 다시 돌아옴 
		if(newPwd != newPwdConfirm) {
			alert("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.")
			return false;
		} else {
			
		// 2-2) 새 비밀번호와 확인 비밀번호가 일치인 경우 처리할 수 있는 컨트롤러로 보냄 
			if(confirm("정말로 비밀번호를 변경하시겠습니까?")) {
				location.replace("${ pageContext.request.contextPath }/mypage/profile");				
			}			
		}
			
		});
	});

</script>

</body>
</html>