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
<style type="text/css">
	.board-top-sch {
    position: relative;
    right: auto;
    top: 0;
    text-align: center;
	}
</style>
</head>
<body>
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
	
	<div class="main shop-list">
		<ul>
			<c:forEach var="wineList" items="${ wineList }">
				<li class="lists__item" style="border-bottom: 1px solid #D3D3D3">
					<div class="img-thumb" >
						<a href="${ path }/shop/view?no=${ store.no }">
							<img src="${ path }/resources/upload/shop/${ store.renamedFileName }" alt="" class="img-thumbnail">
						</a>
					</div>
					<div class="txt-area">
			            <div class="cnt-header">
			                <h3><a href="${ path }/shop/view?no=${ store.no }" class="btnView">${ store.korBname } &nbsp; <span class="name-en">${ store.engBname }</span></a>&nbsp;<span class="name-en"></span></h3>
			            </div>
			            <div class="txt">
			                <a href="${ path }/shop/view?no=${ store.no }" class="btnView line02">
			                    ${ store.content }
			                </a>
			            </div>
			            <div class="write-info">
			                <em class="board-badge badge-white">${ store.type }</em>
			                <span class="store-addr">${ store.address1 } ${ store.address2 }</span>
			                <span class="store-tel">${ store.phone }</span> 
			            </div>
		        	</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>