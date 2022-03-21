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

<link rel="stylesheet" href="${path}/resources/css/enroll_v2.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/css.css" /> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css" />
	<title>Terms_test</title>
	<jsp:include page="/WEB-INF/views/common/header1.jsp" />

<script src="${ path }/js/checkBox.js"></script>

</head>
<body>
<section class="sub-contents wrap-login">

	<h2 class="wrap-tit">TERMS</h2>
	<div class="login-box box-shadow">
		<div class="login-note"> <!-- contents -->
	
			<form action="${path}/member/join" id="joinForm" name="form" method="get">
				<div class="border">
					<div class="terms_check_all">
						<label for="checkAll">이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</label>
						<input type="checkbox" name="chkAll" id="checkAll" class="chkAll"/>
					</div>
					
					<ul class="terms_list">
					
						<li class="terms_box">
							<div class="input_box">
								<label for="termsOfService">이용약관 동의 (필수)</label>
								<input type="checkbox" name="chk" id="termsOfService" 
										value="termsOfService" required />
							</div>
							<div class="terms_content">
								여러분을 환영합니다. 베베노 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.
								본 약관은 다양한 베베노 서비스의 이용과 관련하여 네이버 서비스를 	제공하는 베베노 주식회사(이하 ‘베베노’)와 
								이를 이용하는 베베노 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 
								아울러 여러분의 베베노 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
							</div>
						</li>
						<li class="terms_box">
							<div class="input_box">
								<label for="privacyPolicy">개인정보 수집 및 이용에 대한 안내(필수)</label>
								<input type="checkbox" name="chk" id="privacyPolicy" 
										value="termsOfService" required />
							</div>
							<div class="terms_content">
								베베노 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.
								본 약관은 다양한 베베노 서비스의 이용과 관련하여 네이버 서비스를 
								제공하는 베베노 주식회사(이하 ‘베베노’)와 이를 이용하는 베베노 
								서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 
								아울러 여러분의 베베노 서비스 이용에 도움이 될 수 있는 유익한 
								정보를 포함하고 있습니다.
							</div>
						</li>
						
					</ul>
				</div>
				<button type="submit" class="button button-large mt0"
							id="agreeBtn">동의</button>
				<input type="button" value="비동의" class="disagreeBtn" onclick="nochk()"/>&nbsp;&nbsp;&nbsp;
			    	
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
	전체 동의 체크시 전체 동의가 체크되는 로직
		- 각각의 동의 체크해제 시 전체동의 체크가 해제 되지 않음
		- 버튼 비활성화에서 전체 체크 시 활성화로 변화 필요
	const ChkAll = document.querySelector('input[name=chkAll]');	
	let agreeChk = document.querySelectorAll('input[name=chk]');

	ChkAll.addEventListener('change', (e) => {

		for(let i = 0; i < agreeChk.length; i++){
  			agreeChk[i].checked = e.target.checked;
		}
	});
*/
	
	const form = document.querySelector('#joinForm'); // 데이터를 전송하는 Form
	const checkAll = document.querySelector('.terms_check_all input'); // 모두 동의 div의 input 태그 선택(전체 동의 체크박스)
	const checkBoxes = document.querySelectorAll('.input_box input'); // 각각의 체크 박스(2개)
	const submitBtn = document.querySelector('#agreeBtn'); // 동의 버튼
	
	const agreements = {
		termsOfService: false, 	// 첫번째 필수동의 체크박스
		privacyPolicy: false	// 두번째 필수동의 체크박스		
	};
	
	form.addEventListener('submit', (e) => e.preventDefault()); // 새로고침(submit) 되는 것 막기
	
	// 각각의 체크박스 상태가 변경 될 때마다 toggleCheckbox(); 메소드 실행
	checkBoxes.forEach((item) => item.addEventListener('input', toggleCheckbox));
	

	
	// 모든 체크박스 체크 여부에 따른 버튼 활성화 비활성화 관련 메소드
	function toggleSubmitButton() {
		
		const { termsOfService, privacyPolicy } = agreements;
		
		if(termsOfService && privacyPolicy) {
			submitBtn.disabled = false;
			submitBtn.style.backgroundColor = '#c70039';
			submitBtn.style.color = 'white';
		} else {
			submitBtn.disabled = true;
			submitBtn.style.backgroundColor = 'white';
			submitBtn.style.color = '';
		}
	}
	
	
	function toggleCheckbox(e) {
		const { checked, id } = e.target;
		agreements[id] = checked;
		this.parentNode.classList.toggle('active');
		
		checkAllStatus();
		toggleSubmitButton();
	}
	
	// 각각의 체크박스의 상태를 확인하여 모두 동의 체크박스의 체크 여부를 정하는 메소드
	function checkAllStatus() {
		
		const { termsOfService, privacyPolicy } = agreements;
		
		if(termsOfService && privacyPolicy) {
			checkAll.checked = true;
		} else {
			checkAll.checked = false;
		}
	}
	
	checkAll.addEventListener('click', (e) => {
		const { checked } = e.target;
		if (checked) {
			checkBoxes.forEach((item) => {
				item.checked = true;
				agreements[item.id] = true;
				item.parentNode.classList.add('active');
			});
		} else {
			checkBoxes.forEach((item) => {
				item.checked = false;
				agreements[item.id] = false;
				item.parentNode.classList.remove('active');
			});
		}
		toggleSubmitButton();
	});
	
/* ================================================================ */	
	
	function nochk(){
		alert("동의하지 않으면 가입하실 수 없습니다");
		location.href="../member/terms_v2";
	}

</script>

</body>
</html>
