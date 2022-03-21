<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지_프로파일 수정</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/profile.css">

<script src="${ path }/js/jquery-3.6.0.js"></script>

<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
 src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<jsp:include page="/WEB-INF/views/common/header_shop.jsp" />

</head>

<body>

<section class="mypage">

    <h2 class="title-mypage">MyPage</h2>

    <div class="my-tab">
        <ul class="list-nav">
            <li id="mainNav">
                <a href="${ path }/mypage/profile">정보수정</a>
            </li>
            <li>
                <a href="${ path }/mypage/scrap">스크랩</a>
            </li>
            <li>
                <a href="${ path }/payment/cart">장바구니</a>
            </li>
        </ul>
    </div>

    <div class="inner-list">
        <div class="wrab-board-wide">
            <ul class="inner-list-nav">
                <li id="subNav" >
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
    
    <form action="${ path }/mypage/profile" method="post" id="update-profile"
    		enctype="multipart/form-data">

        <div class="mypage-input-box">

            <div class="update-profile">
            
            <!--
            	프로필 이미지 변경
            		회원 가입 시 프로필 이미지 이름 값을 null값으로 받게 하고 default이미지로 프로필 이미지 설정
            		이미지 변경 시 해당 프로필 사진이름을 DB에 저장 후 경로와 연결해 보여줌  
             -->
             <c:if test="${ empty loginMember.profileImgNameO }">
            	<img src="../resources/image/profile.png" id="profileimg" alt="프로필 이미지">
            	<label for="profileImgUpdate">이미지 업로드</label>            
            	<input type="file" id="profileImgUpdate" name="profileImgUpdate" style="display: none;">				
			</c:if>
			<c:if test="${ !empty loginMember.profileImgNameO }">
				<img src="../resources/upload/profileImg/${ loginMember.profileImgNameR }" id="profileimg" alt="프로필 이미지">
            	<label for="profileImgUpdate">이미지 업로드</label>            
            	<input type="file" id="profileImgUpdate" name="profileImgUpdate" style="display: none;">
			</c:if>
            <!-- 
                <img src="../resources/image/profile.png" id="profileimg" alt="프로필">
                <a href="${ path }/mypage/updatePwd" class="profile-button" >프로필 변경</a>
                <input type="file" id="inputProfileImg" style="display: none;">
             -->
            </div>

            <div class="update-etc">
                <table>
                    <tbody>
                        <tr>
                            <th>
                                <span>회원 아이디</span>
                            </th>
                            <td class="input-item">
                                <div>${ loginMember.id }</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>이메일</span>
                            </th>
                            <td class="input-item">
                                <div>${ loginMember.email }</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>닉네임</span>
                            </th>
                            <td class="input-item">
                                <div class="input-nickname">
                                    <p>
                                        <label class="hidden" style="display: none;">닉네임</label>
                                        <input type="text" class="" id="nickname" name="nickname" 
                                        placeholder="닉네임" value="${ loginMember.nickname }">
                                        <!-- 
                                        <button type="button" class="button">중복확인</button>
                                         -->
                                        <input type="button" id="checkDuplicate" value="중복검사">
                                    </p>
                                    <input type="hidden" id="nickname_origin" name="nickname_origin" value="회원 닉네임">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>주소</span>
                            </th>
                            <td class="input-item">
                                <div>${ loginMember.address }</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>연락처</span>
                            </th>
                            <td class="input-item">
                                <div>${ loginMember.phone }</div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="save-update-button">
                    <button type="submit" class="button" id="submitBtn" disabled="disabled" >정보 수정</button>
                </div>
            </div>
        </div>
        <div class="container">
		
				<div class="form-group">
					<div class="row" style="text-align: center;">
						<h1 class="page-header" style="margin-bottom: 50px;">나의 주문 내역</h1>
						<table class="table table-hover"
							style="margin: auto; border-bottom: 1px solid #D5D5D5;">
							<thead>
								<tr>
									<th colspan="2" style="text-align: center;">상품명</th>
									<th>가격</th>
									<th>수량</th>
									<th>결제금액</th>
									<th>주문현황</th>
								</tr>
							</thead>
							<tbody style="text-align: left;">
							<c:choose>
									<c:when test="${paymentList == !null}">
										<tr style="text-align: center;"><td colspan="8"><h3>주문 내역이 없습니다.</h3></td></tr>
 									</c:when>
									<c:otherwise>
											<tr>
												<td style="text-align: center;">
												<img id="image" alt="thumbnail"
													src="${path}/resources/upload/wineimg/20220304_025333467.png" width="100px" height="120px">
											    <input type="hidden" value="${list.wineBno}" name="wineBno" id="wineBno"></td>
												<td>테스트<br></td>
												<td><fmt:formatNumber type="number"
														value="1000" />&nbsp;원</td>
												<td>1개</td>
												<td><fmt:formatNumber type="number"
														value="" />&nbsp;1000원</td>
												<td>결제완료<td>
													
															<br>
														
															<br>
														</td>
													
														<td>

														</td>
											</tr>
									</c:otherwise>
								</c:choose> 
							</tbody>
						</table>
					</div>
				</div>
			</div>        

    </form>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script type="text/javascript">

// << 프로파일 이미지 업로드 시 변경된 이미지를 바로 볼 수 있도록 하는 스크립트 >>
// 참고 사이트 : https://dongyeopblog.wordpress.com/2017/09/02/javascript-이미지-미리보여주기-preview-image-upload/

	// 프로필 사진을 넣었을 때 바로 보일 수 있도록 미리보기 하는 기능
	function readURL(input) {
		if (input.files && input.files[0]) {
	  	var reader = new FileReader();
	  
	  	reader.onload = function (e) {
	   		$('#profileimg').attr('src', e.target.result);  
	  	}
	  
	  	reader.readAsDataURL(input.files[0]);
	  	}
	}
	 
	// Id가 profileImgUpdate인 input태그에 변화가 있을 때 매개값을 readURL(input)메소드로 전달하며 실행
	// 이벤트를 바인딩해서 input에 파일이 올라올때 (input에 change를 트리거할때) 위의 함수를 this context로 실행합니다.
	$("#profileImgUpdate").change(function(){
	   readURL(this);
	});
	
	
	// 프로필 파일 이미지가 변경되었을 때 버튼활성화 및 css 변경
	$("#profileImgUpdate").change(function(){
		   btnOn(this);
		});
	
	function btnOn(input) {
		
		$("#submitBtn").attr("disabled", false);
		$("#submitBtn").css('background-color', '#c70039');
		$("#submitBtn").css('color', 'white');
	}
	
/* ------------------------------------------------------------------------------------------------------------- */
	
	// 닉네임 중복 확인
	$(document).ready(() => {
		
		$("#checkDuplicate").on("click", () => {
			
			let nickname = $("#nickname").val().trim();
			
			$.ajax({
				
				type: "post",
				url: "${ pageContext.request.contextPath }/mypage/nickCheck",
				dataType: "json",
				
				data: {
					nickname	
				},
				
				success: (data) => {
					console.log(data)
					
					
					if(data.duplicate === true) {
						alert("이미 사용중인 닉네임 입니다.");
					} else {
						alert("사용 가능한 닉네임 입니다.");
						$("#submitBtn").attr("disabled", false);
						$("#submitBtn").css('background-color', '#c70039');
						$("#submitBtn").css('color', 'white');
					}
					
				},
				
				error: (error) => {
					console.log(error);
				}				
			});
		});		
		
	});	

</script>

</body>
</html>