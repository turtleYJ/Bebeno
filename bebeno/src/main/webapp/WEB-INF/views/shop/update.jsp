<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value ="${ pageContext.request.contextPath }"/>   

<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/css.css" /> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css" />
</head>

<jsp:include page="/WEB-INF/views/common/header_shop.jsp" />

        <div class="container">
            <div class="board_title">
                <strong>가게 정보 수정</strong>
            </div>
            <div class="shop_update_wrap">
                <div class="board_write">
                	<div class="update_body">
      							<form action="${ pageContext.request.contextPath }/shop/update" method="post" enctype="multipart/form-data">
        							<div class="form-row " style="padding-top: 20px">
          								<div class="form-group col-sm-6">
            								<label>한글상호</label>
            								<input type="text" name="KorBname" class="form-control" maxlength="20" value="${ shop.korBname }">
          								</div>
          								<div class="form-group col-sm-6">
            								<label>영문상호</label>
           									<input type="text" name="EngBname" class="form-control" maxlength="20" value="${ shop.engBname }">
          								</div>
        							</div>						
        							<div class="form-row">
			          					<div class="form-group col-sm-12" style="margin-bottom: 0px">
            								<label>가게 주소</label>
          								</div>
          								<div class="form-group col-sm-3">
            								<input id="member_post" type="text" class="form-control" maxlength="20" placeholder="우편번호" readonly onclick="findAddr()" value="${ shop.zipCode }">
          								</div>
          								<div class="form-group col-sm-9">
											<input id="member_addr" type="text"  name="address1" class="form-control col-lg-8" maxlength="20" placeholder="주소" value="${ shop.address1 }" readonly> <br>
          								</div>
          								<div class="form-group col-sm-12">
											<input type="text" name="address2" class="form-control" maxlength="20" placeholder="상세주소" value="${ shop.address2 }">
          								</div>
        							</div>
        							<div class="form-row">
			          					<div class="form-group col-sm-12">
            								<label>가게 전화번호</label>
											<input type="text" name="phone" class="form-control" oninput="autoHyphen(this)" maxlength="20" value="${ shop.phone }">
          								</div>
        							</div>
        							<div class="form-row">
			          					<div class="form-group col-sm-6">
											<label>대문 파일 업로드</label>
    										<input type="file" name="upfileFront">   
    										<p class="help-block">가게 전경 사진파일을 첨부하세요</p>       								
   										</div>
			          					<div class="form-group col-sm-6">
											<label>사진 업로드</label>
    										<input multiple="multiple" type="file" name="upfileContent">    								
    										<p class="help-block">가게 전경 사진파일을 첨부하세요</p>       								
   										</div>
        							</div>
        							<div class="form-row">
        								<div class="form-group col-sm-12">
        									<label>업종</label><br>
        									<input type="radio" id="rest" name="type" value="레스토랑">
											<label for="rest">레스토랑</label>&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="radio" id="wineshop" name="type" value="와인샵">
											<label for="wineshop">와인샵</label>
        								</div>
        							</div>
      							    <div class="form-row">
      							    	<div class="form-group">
	          								<label>내용</label>
	          								<textarea type="text" id="content" name="content" class="form-control" maxlength="2048" style="height: 180px;">
	          									${ shop.content }
	          								</textarea>
										</div>
      							    </div>
      							    <div class="form-row">
      							    	<div class="form-group">
	          								<label>상세 정보</label>
	          								<textarea type="text" name="Content2" class="form-control" maxlength="2048" style="height: 180px;">
												${shop.content2 }
	          								</textarea>
										</div>
      							    </div>
									<div class="bt_wrap">
										<button type="submit" onclick="Location.href='${ path }/shop/update]'" class="btn btn-primary">수정하기</button>
										<button type="button" class="btn btn-secondary" data-dismiss="modal">목록으로</button>
									</div>
								</form>
							</div>
                </div>
            </div>
        </div>  
    
        <!-- js영역 -->
    <script src="${ path }/js/jquery.min.js"></script>
	<script src="${ path }/js/browser.min.js"></script>
	<script src="${ path }/js/breakpoints.min.js"></script>
	<script src="${ path }/js/util.js"></script>
	<script src="${ path }/js/menubar.js"></script>
    <script src="${ path }/js/textselbox.js"></script>
    
    <script>
	    function findAddr(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	
		        	console.log(data);
		        	
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var roadAddr = data.roadAddress; // 도로명 주소 변수
		            var jibunAddr = data.jibunAddress; // 지번 주소 변수
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('member_post').value = data.zonecode;
		            if(roadAddr !== ''){
		                document.getElementById("member_addr").value = roadAddr;
		            } 
		            else if(jibunAddr !== ''){
		                document.getElementById("member_addr").value = jibunAddr;
		            }
		        }
		    }).open();
		}
		
		const autoHyphen = (target) => {
			target.value = target.value
			   					 .replace(/[^0-9]/, '')
			   					 .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		}	
    
    	$(document).ready(() => {
    		$('input:radio[name="type"][value="${shop.type}"]').prop('checked', true);
    	})
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    </body>
    </html>