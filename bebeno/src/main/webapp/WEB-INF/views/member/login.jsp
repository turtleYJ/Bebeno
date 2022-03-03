<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value ="${ pageContext.request.contextPath }"/>   
<html>
    <head>
        <title>로그인 / 회원가입 폼 템플릿</title>  
        <link rel="stylesheet" href="${path}/resources/css/style.css">
     </head>
    <body>
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">LOGIN</button>
                    <button type="button" class="togglebtn" onclick="register()">REGISTER</button>
                </div>
                <div class="social-icons">
                    <img src="resources/images/kakao.jpg" alt="kakao">
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
            
   <table>
 			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" id="newId" placeholder="아이디(4글자이상)" required>
					<input type="button" id="checkDuplicate" value="중복검사" >
				</td> 			
 			</tr>
 			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="password" id="pass1" required>
				</td> 			
 			</tr>
 			<tr>
				<th>패스워드확인</th>
				<td>
					<input type="password" id="pass2">
				</td> 			
 			</tr>
 			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" id="userName" required>				
				</td> 			
 			</tr>
 			<tr>
				<th>휴대폰</th>
				<td>
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11">								
				</td> 			
 			</tr>
 			<tr>
				<th>이메일</th>
				<td>
					<input type="email" placeholder="abc@abc.com" name="email" id="email">												
				</td> 			
 			</tr>
 			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="address" id="address">
				</td> 			
 			</tr>
 			<tr>
				<th>생일</th>
				<td>
				<input type="text" placeholder="2022-03-01" name="birth" id="birth">												
				
				</td> 			
 			</tr> 		
 		</table> 
 		<input type="submit" id="enrollSubmit" value="가입">	
 		<input type="reset" value="취소">	
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
    </body>
</html>
