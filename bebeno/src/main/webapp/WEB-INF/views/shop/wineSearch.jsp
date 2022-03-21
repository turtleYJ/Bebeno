<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보유 와인 검색</title>
<link rel="stylesheet" href="${path}/resources/css/cssyooil/shop_list.css">
<link rel="stylesheet" href="${path}/resources/css/mypage/cart.css">
<style type="text/css">
	.board-top-sch {
    position: relative;
    right: auto;
    top: 0;
    text-align: center;
	}
	
	header {
	  position: fixed;
	  top: 0;
	  /* width: 100% */
	  left: 0;
	  right: 0;
	  /* 생략 */
	}
	footer {
	position: fixed;
	   width:100%;
	   height:100px;
	   bottom:0;
	  text-align: center;
	  color: white;
	}
</style>
</head>
<body>
	<header>
	<div class="board-top-sch">
		<form action="${ pageContext.request.contextPath }/shop/findWine" method="get" class="form-inline mt-3">
			<select class="cate-filter" id="wineKind" name="wineKind">
				<option value="">와인종류</option>
				<option value="레드">레드</option>
				<option value="화이트">화이트</option>
				<option value="스파클링">스파클링</option>
				<option value="로제">로제</option>
				<option value="주정강화">주정강화</option>
			</select>		
			<select class="cate-filter" id="nation" name="nation">
				<option value="">제조국</option>
				<option value="호주">호주</option>
				<option value="미국">미국</option>
				<option value="프랑스">프랑스</option>
				<option value="슬로베니아">슬로베니아</option>
				<option value="이탈리아">이탈리아</option>
				<option value="독일">독일</option>
				<option value="칠레">칠레</option>
				<option value="포르투갈">포르투갈</option>
			</select>

			<div class='page-top-sch'>
				<input type='text' id='wineKeyword' name='wineKeyword' placeholder='결과 내 검색' maxlength='30' value=''>
				<button type="summit" class='btn-sch' >검색</button>
			</div>
		</form>				
	</div><!--.board-top-sch -->
	
                <input type="hidden" name="cmd" value="order">
                <div class="basketdiv" id="basket">
                    <div class="row head">

                        <div class="subdiv">
                            <div class="check">선택</div>
                            <div class="img">이미지</div>
                            <div class="pname">상품명</div>
                        </div>
                    </div>
                </div>
	</header>
	
				<div class="basketdiv" id="basket" style="padding-top: 100px; border-top: none;">
					 <c:forEach var="list" items="${wineList}">
                 	 	<div class="row data">
	                        <div class="subdiv">
	                            <div class="check"><input type="checkbox" id="wineckb" name="wineckb" value="${ list.wineBno }">&nbsp;</div>
	   
	                            <div class="img"><img src="${path}/resources/upload/wineimg/${list.renamedFileName}" width="60" height="60"></div>
	
	                            <div class="pname" style="line-height: ">
	                                <span>${list.wineName} <br>${list.wineEng}</span>
	                            </div>
	                        </div>
                    	</div>
                    	
                    	<script type="text/javascript">
                    	
                    	</script>
      				</c:forEach>
			    </div>
   	<footer>
                <div id="goorder" class="">
                    <div class="clear"></div>
                    <div class="buttongroup center-align cmd">
                        <button id="reqBtn1" class="btn btn-default">추가하기</button>
                        <button id="reqBtn2" class="btn btn-default btn-back_to_shop">취소</button>
                    </div>
                </div>
   	</footer>
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<script src="${path}/resources/js/jquery-3.6.0.js"></script>
<script src="${path}/resources/js/jquery.min.js"></script>
	
	
<script type="text/javascript">
$(document).ready(() => {
	$("#reqBtn2").on("click", () => {
		window.close();
	});
	
	$("#reqBtn1").on("click", () => {
		var wineArray = [];
        
        $('input[name="wineckb"]:checked').each(function(i){//체크된 리스트 저장
        	wineArray.push($(this).val());
        	console.log($(this).val());
        });
        
        var objParams = {
        		"shopNo" : ${shopNo},
        		"wineNoList" : wineArray
        }
        
        console.log(objParams)
        
        $.ajax({
            url         :   "${path}/shop/saveWine",
            dataType    :   "json",
            contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
            type        :   "post",
            data        :   objParams,
            success     :   function(retVal){

                if(retVal.code == "OK") {
                    alert(retVal.message);
                } else {
                    alert(retVal.message);
                }
            },
            error       :   function(request, status, error){
                console.log("등록에 실패하였습니다. 관리자에 문의하세요!");
            }
        });
	});
	
	
	
	
	
	
	
	
	
	
	
});
	



</script>
	
	
	
</body>
</html>