<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value ="${ pageContext.request.contextPath }"/>   
<html>
    <head>
        <title>로그인 / 회원가입 폼 템플릿</title>  
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
        <link rel="stylesheet" href="${path}/resources/css/style.css">

		<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
       <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/css.css" /> 
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header.css" />
        <link rel="stylesheet" href="${path}/resources/css/style.css">
        <link rel="stylesheet" href="${path}/resources/css/style.css">
      </head>
     
    <body>
    
        <div class="wrap">
        
                 <img src="${path}/resources/images/background0.jpg">
            <div class="form-wrap">
            
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">LOGIN</button>
                    <button type="button" class="togglebtn" onclick="register()">REGISTER</button>
                </div>
                <div class="social-icons">
                    <img src="${path}/resources/images/kakao.jpg" alt="kakao">
                </div>
                <c:if test="${ empty loginMember }">
                <form id="login" action="${ path }/login" class="input-group" method="post">
                    <input type="text" name="id" class="input-field" placeholder="User ID" required>
                    <input type="password" name="password" class="input-field" placeholder="Enter Password" required>
                    <input type="checkbox" class="checkbox"><span>Remember Password</span>
 				    <button class="submit">Login</button>
                </form>
                </c:if>
                
                 <c:if test="${ !empty loginMember }">
                ${ loginMember.name }님, 안녕하세요.
                <form action="${ path }/logout" method="post">
                <button>로그아웃</button>
                </form>
                </c:if>
                
                <form id="register" action="${ path }/member/enroll" class="input-group" method="post">
            	  <input type="text" name="id" class="input-field" placeholder="User ID" required>
            	  <input type="text" name="nickname" class="input-field" placeholder="User nickname" required>
                   	<input type="button" id="checkDuplicate" value="중복검사" >
   					<input type="password" name="password" class="input-field" placeholder="User Password" required>
   					<input type="password" class="input-field" placeholder="User Password check" required>
                    <input type="text" name="name" class="input-field" placeholder="Username" required>
                    <input type="tel" name="phone" class="input-field" placeholder="Your phone" required>
                    <input type="email" name="email" class="input-field" placeholder="abc@abc.com" required>
                    <input type="text" name="address" class="input-field" placeholder="your address" required>
                    <input type="text" name="birth" class="input-field" placeholder="2022-03-01" required>
                     <input type="checkbox" class="checkbox"><span>Terms and conditions</span>
                    <button class="submit">REGISTER</button>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
           </script>
           
          
           <script>
         // 아이디 중복 확인
        	$(document).ready(() => {
        		$("#checkDuplicate").on("click", () => {
        			let userId = $("#newId").val().trim();
        			
        			$.ajax({
        				type: "post",
        				url: "${ pageContext.request.contextPath }/member/idCheck",
        				dataType: "json",
        				data: {
        					userId
        				},
        				success: (data) => {
        					console.log(data);
        					
        					if(data.duplicate === true) {
        						alert("이미 사용중인 아이디 입니다.");
        					} else {
        						alert("사용 가능한 아이디 입니다.");						
        					}
        				},
        				error: (error) => {
        					console.log(error);
        				}
        			});
        		});		
        	});
        	
        	
        </script>
        
=======
            
</script>
>>>>>>> main
=======
        </script>
>>>>>>> parent of 7d08a80 (로그인 페이지 수정 완료 + 회원가입 약관 페이지 추가)
    </body>
</html>