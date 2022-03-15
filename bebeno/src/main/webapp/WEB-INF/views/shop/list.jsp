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
	<title>shop_list</title>
	<link rel="stylesheet" href="${path}/resources/css/cssyooil/shop_list.css">
	<link rel="stylesheet" href="${path}/resources/css/cssyooil/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/css/cssyooil/custom.css">
	<style type="text/css">
		.js-load {
	    	display: none;
		}
		.js-load.active {
		    display: block;
		}
		.is_comp.js-load:after {
		    display: none;
		}
		.btn-wrap, .lists, .main {
		    display: block;
		}		
		.btn-wrap {
		    text-align: center;
		}
	</style>
</head>
<body>
	
	<div class="container">
		<div class="board-top mb-nl">
			<h2 class="cate-tit">와인샵&amp;레스토랑</h2>
			
			<div class="board-top-sch">
				<form action="${ pageContext.request.contextPath }/shop/list" method="get" class="form-inline mt-3">
					<select class="cate-filter" id="shCate" name="shCate">
						<option value="">전체</option>
						<option value="와인샵">와인샵</option>
						<option value="레스토랑">레스토랑</option>
					</select>		
					<select class="cate-filter" id="shRegionD1" name="shRegionD1">
						<option value="">전체 시도</option>
						<option value="서울">서울특별시</option>
						<option value="부산">부산광역시</option>
						<option value="대구">대구광역시</option>
						<option value="인천">인천광역시</option>
						<option value="광주">광주광역시</option>
						<option value="대전">대전광역시</option>
						<option value="울산">울산광역시</option>
						<option value="세종">세종특별자치시</option>
						<option value="경기">경기도</option>
						<option value="강원">강원도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="제주">제주특별자치도</option>
					</select>
		
					<div class='page-top-sch'>
						<input type='text' id='shKeyword' name='shKeyword' placeholder='결과 내 검색' maxlength='30' value=''>
						<button type="summit" class='btn-sch' >검색</button>
					</div>
					
					
	               <c:if test="${ loginMember.role eq 'ROLE_MANAGER' }">
						<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
	               </c:if>
				
				</form>
				
				<!-- 모달 창 -->	
				<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
					<div class="modal-dialog">
  						<div class="modal-content">
    						<div class="modal-header">
      							<h5 class="modal-title" id="modal">가게 등록</h5>
      								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
        								<span aria-hidden="true">&times;</span>
      								</button>
    						</div>
    						<div class="modal-body">
      							<form action="${ pageContext.request.contextPath }/shop/registration" method="post" enctype="multipart/form-data">
        							<div class="form-row">
          								<div class="form-group col-sm-6">
            								<label>한글상호</label>
            								<input type="text" name="KorBname" class="form-control" maxlength="20">
          								</div>
          								<div class="form-group col-sm-6">
            								<label>영문상호</label>
           									<input type="text" name="EngBname" class="form-control" maxlength="20">
          								</div>
        							</div>						
        							<div class="form-row">
			          					<div class="form-group col-sm-12" style="margin-bottom: 0px">
            								<label>가게 주소</label>
          								</div>
          								<div class="form-group col-sm-3">
            								<input id="member_post" type="text" class="form-control" maxlength="20" placeholder="우편번호" readonly onclick="findAddr()">
          								</div>
          								<div class="form-group col-sm-9">
											<input id="member_addr" type="text"  name="address1" class="form-control col-lg-8" maxlength="20" placeholder="주소" readonly> <br>
          								</div>
          								<div class="form-group col-sm-12">
											<input type="text" name="address2" class="form-control" maxlength="20" placeholder="상세주소">
          								</div>
        							</div>
        							<div class="form-row">
			          					<div class="form-group col-sm-12">
            								<label>가게 전화번호</label>
											<input type="text" name="phone" class="form-control" oninput="autoHyphen(this)" maxlength="20" placeholder="전화번호(-없이 입력)">
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
	          								<textarea type="text" name="Content" class="form-control" maxlength="2048" style="height: 180px;">
	          								</textarea>
										</div>
      							    </div>
      							    <div class="form-row">
      							    	<div class="form-group">
	          								<label>상세 정보</label>
	          								<textarea type="text" name="Content2" class="form-control" maxlength="2048" style="height: 180px;">
[와인문의]	          								
	          								
[이메일]

[영업일시]

[주소]

[오시는 길]
	          								</textarea>
										</div>
      							    </div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">등록하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 새로운 디자인의 검색 
				<form class="page-top-sch form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0 ">검색</button>
				</form>
				-->
				
				<!-- <table class="search-tb">
					<tr>
						<td>
							<input type="text" placeholder="Search" class="search">
						</td>
						<td>
							<a href="#"><img src="./baseline_search_black_24dp.png" alt="">
							</a>
						</td>
					</tr>
				</table> -->
			</div><!--.board-top-sch -->
		</div>	
		
		<!-- 
		<li>
			<div class="thumb"><a href="javascript:goStoreView(36002)" class="btnView"><img src="https://wine21.speedgabia.com/COMPANY_MST/TITLE/0036002.jpg" alt="봉쥬르와인샵"></a></div>
			<div class="txt-area">
				<div class="cnt-header">
					<h3><a href="javascript:goStoreView(36002)" class="btnView">봉쥬르와인샵 &nbsp; <span class="name-en">Bonjour Wineshop</span></a>&nbsp;
																<span class="name-en">(50)</span>
															</h3>
				</div>
				<div class="txt"><a href="javascript:goStoreView(36002)" class="btnView line02"></a></div>
				<div class="write-info">
					<em class="board-badge badge-white">와인샵</em>
					<span class="store-addr">서울 마포구</span><span class="store-tel">02-2135-2913</span>
																<span class="store-link"><a href="http://www.instagram.com/bonjour_wine" target="_blank">www.instagram.com/bonjour_wine</a></span>
													</div>
			</div>
		</li>
		-->

		<div id="js-load" class="main shop-list">
			<ul class="lists">
				<c:forEach var="store" items="${ shopList }">
					<li class="lists__item js-load">
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
				                <span class="store-addr">${ store.address }</span>
				                <span class="store-tel">${ store.phone }</span> 
				            </div>
			        	</div>
					</li>
					<hr>
				</c:forEach>
			</ul>
			<!--  
			<a href="">
				<div class="img-thumb">
				<img src="${ path }${ spot.imgPath }${ spot.no }.png" alt="">
				</div>
			</a>
			<hr>
			<a href="">
				<div class="img-thumb">
				<img src="${ path }${ spot.imgPath }${ spot.no }.png" alt="">
				</div>
			</a>
			<hr>
			<a href="">
				<div class="img-thumb">
				<img src="${ path }${ spot.imgPath }${ spot.no }.png" alt="">
				</div>
			</a>
			<hr>
			-->
		</div>
		<!--  
		<div class="pagination-box">
			<button id="storeListMoreBtn" class='button button-large button-white-gray'>
				더보기
			</button>
		</div>
		-->
		<div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="button">더보기</a> </div>
		
	</div>	
	<!-- jquery 자바스크립트 추가하기 -->
	<script src="${path}/resources/js/jquery-3.6.0.js"></script>	
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="${path}/resources/js/pooper.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="${path}/resources/js/bootstrap.min.js"></script>
	<!-- 다음(카카오) 주소찾기 API -->
	
</body>
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
	
	$(window).on('load', function () {
	    load('#js-load', '4');
	    $("#js-btn-wrap .button").on("click", function () {
	        load('#js-load', '4', '#js-btn-wrap');
	    })
	});
	 
	function load(id, cnt, btn) {
	    var shops_list = id + " .js-load:not(.active)";
	    var shops_length = $(shops_list).length;
	    var shops_total_cnt;
	    if (cnt < shops_length) {
	        shops_total_cnt = cnt;
	    } else {
	        shops_total_cnt = shops_length;
	        $('.button').hide()
	    }
	    $(shops_list + ":lt(" + shops_total_cnt + ")").addClass("active");
	}
	
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>