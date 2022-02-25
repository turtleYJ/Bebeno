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
	<link rel="stylesheet" href="${path}/resources/css/cssyooil/costom.css">
	
</head>
<body>
	
	<div class="container">
		<div class="board-top mb-nl">
			<h2 class="cate-tit">와인샵&amp;레스토랑</h2>
			
			<div class="board-top-sch">
				<form action="./home.jsp" class="form-inline mt-3">
					<select class="cate-filter" id="shCate" name="shCate">
						<option value="0">전체</option>
						<option value="1">와인샵</option>
						<option value="2">레스토랑</option>
					</select>		
					<select class="cate-filter" id="shRegionD1" name="shRegionD1">
						<option value="">전체 시도</option>
						<option value="R01000">서울특별시</option>
						<option value="R02000">부산광역시</option>
						<option value="R03000">대구광역시</option>
						<option value="R04000">인천광역시</option>
						<option value="R05000">광주광역시</option>
						<option value="R06000">대전광역시</option>
						<option value="R07000">울산광역시</option>
						<option value="R08000">세종특별자치시</option>
						<option value="R09000">경기도</option>
						<option value="R10000">강원도</option>
						<option value="R11000">충청북도</option>
						<option value="R12000">충청남도</option>
						<option value="R13000">전라북도</option>
						<option value="R14000">전라남도</option>
						<option value="R15000">경상북도</option>
						<option value="R16000">경상남도</option>
						<option value="R17000">제주특별자치도</option>
					</select>
					<select class="cate-filter" id="shRegionD2" name="shRegioD2">
						<option value="">전체 시군구</option>
					</select>
		
					<div class='page-top-sch'>
						<input type='text' id='shKeyword' name='shKeyword' placeholder='결과 내 검색' maxlength='30' value=''>
						<button class='btn-sch'>검색</button>
					</div>
					
					<c:if test="${ loginMember.role == ROLE_MANAGER }">
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
											<input type="text" name="phone" class="form-control" maxlength="20" placeholder="전화번호(-없이 입력)">
          								</div>
        							</div>
        							<div class="form-row">
			          					<div class="form-group col-sm-6">
											<label>대문 파일 업로드</label>
    										<input type="file" name="upfile">   
    										<p class="help-block">가게 로고 사진파일을 첨부하세요</p>       								
   										</div>
			          					<div class="form-group col-sm-6">
											<label>사진 업로드</label>
    										<input type="file">          								
    										<p class="help-block">가게 전경 사진파일을 첨부하세요</p>       								
   										</div>
        							</div>
      							    <div class="form-row">
      							    	<div class="form-group">
	          								<label>내용</label>
	          								<textarea type="text" name="Content" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
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

		<div class="shop-list">
			<ul>
				<c:forEach var="store" items="${ shopList }" begin="0" end="10">
					<li>
						<div class="img-thumb">
							<a href="#">
								<img src="${ store.imgUrl }" alt="" class="img-thumbnail">
							</a>
						</div>
						<div class="txt-area">
				            <div class="cnt-header">
				                <h3><a href="#" class="btnView">와인컬렉터 &nbsp; <span class="name-en">Wine Collector</span></a>&nbsp;<span class="name-en">(50)</span></h3>
				            </div>
				            <div class="txt">
				                <a href="#" class="btnView line02">
				                    명품와인, 고가와인, 맛있는 가성비 와인들로 와인리스트가 좋은 와인컬렉터입니다.
				                    소장용 및 명품와인은 소장할 가치가 있는 와인들을
				                    가성비 와인들은, 저렴하지만 맛있는 와인들을 소개해드리고 있습니다.
				                    르 꼬르동 와인마스터 출신 소믈리에가 고객의 입장에서 생각하고, 친절하게 추천 드리고 있습니다.
				                </a>
				            </div>
				            <div class="write-info">
				                <em class="board-badge badge-white">와인샵</em>
				                <span class="store-addr">서울 강남구</span>
				                <span class="store-tel">02-561-4220</span>
				                <span class="store-link"><a href="http://https://cafe.naver.com/winecollector" target="_blank">https://cafe.naver.com/winecollector</a></span>
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
	
		<div class="pagination-box">
			<button id="storeListMoreBtn" class='button button-large button-white-gray'>
				더보기
			</button>
		</div>
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
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>