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
<title>스크랩</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/scrap.css">

<jsp:include page="/WEB-INF/views/common/header_shop.jsp" />

</head>
<body>

<section class="mypage">

    <h2 class="title-mypage">MyPage</h2>

    <div class="my-tab">
        <ul class="list-nav">
            <li>
                <a href="${ path }/mypage/profile">정보수정</a>
            </li>
            <li id="mainNav">
                <a href="${ path }/mypage/scrap">스크랩</a>
            </li>
            <li>
                <a href="${ path }/payment/cart">장바구니</a>
            </li>
        </ul>
    </div>

<!-- ================================================================================================ -->

        <div class="mypage-input-box">
            
            <div class="scraps">

				<c:forEach var="scrap" items="${ scrapList }">
					
					<div class="scrap">
						<!-- 스크랩한 게시글을 삭제하기 위한 form -->
						<form action="${ path }/mypage/scrapDelete" method="post">
							<div class="deleteScrapBtn">
								<input type="hidden" name="wagleBoardNo" id="wagleBoardNo" 
										value="${scrap.wagleBoardNo}">
		                    	<button type="submit" class="delScrapBtn" id="delScrapBtn" 
		                    			style="border:none; background:none;">삭제</button>
		                	</div>
						</form>
		            	<a href="${ path }/wagle_board/wagle_view?no=${ scrap.wagleBoardNo }">
		            	    <!-- 
		            	    	a태그는 인라인 요소로 안에 블록 요소인 div태그를 쓰는 것을 권장하지 않는다.
		            	    	대신 section태그를 쓸 수 있다. 
		            	    -->
			            		<img src="${ path }/resources/upload/wagle/${ scrap.wagleBoardRNameFile }" alt="스크랩이미지"
			            				style="width:100%;height:80%;">
				            	<div class="scrap-title">${ scrap.wagleBoardTitle }</div>
		            	</a>
		            	
		        	</div>
				</c:forEach>            
        </div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>

	/* ajax 연동 실패... */
	/* $(document).ready(() => {
		
		$("#delScrapBtn").on("click", () => {
			
			let wagleBoardNo = $("#wagleBoardNo").val().trim();
			
			$.ajax({
				
				type: "post",
				url: "${ pageContext.request.contextPath }/mypage/scrapDelete",
				dataType: "json",
				
				data: {
					wagleBoardNo	
				},
				
				success: (result) => {
					console.log(result)
					
					if(result > 0) {
						alert("스크랩이 삭제되었습니다.");
					} else {
						alert("오류 발생");
					}
					
				},
				
				error: (error) => {
					console.log(error);
				}				
			});
		}); 
	});
		*/		

</script>

</body>
</html>