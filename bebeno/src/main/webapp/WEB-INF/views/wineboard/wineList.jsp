<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=no">
    <title>와인리스트</title>
    
    <link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/css.css" /> 
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/wineview.css" />
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<link rel="stylesheet" href="//fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/fontawesome.min.css">

</head>
<body>
<script type="text/javascript">

	var sendData = {};
	sendData.rIdx = '';
	sendData.rPage = '1';
	sendData.rPageSize = '10';
	sendData.shKeyword = '';
	sendData.shCate = '';
	sendData.shOrder = 'a.CREATE_DATE|DESC';

	function getDataList(){

		$.ajax({
			type	: "POST", dataType:"json", async:"true", cache:"false", contentType:"application/x-www-form-urlencoded;charset=UTF-8",
			url		: "/13_search/proc/proc_wine_list_more.php",
			data	:  sendData,
			beforeSend: function (jqXHR) { },                           // 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
			success: function (jqXHR) {

				// console.log(jqXHR);

				if (jqXHR.status === 'OK'){
					// 총숫자 표시
					$('.cate-tit-total').html('(' + jqXHR.totalCnt + ')');

					if (jqXHR.listData.length !== 0){
						var html_div = '';
						$.each($(jqXHR.listData),function(key,value){
							html_div = "<li> \
											<div class='thumb'> \
												<a href='#'><img src='https://wine21.speedgabia.com" + value.strIMAGE_PATH + "' alt='" + value.strWINE_KNAME + "'></a> \
											</div> \
											<div class='txt-area'> \
												<div class='cnt-header'> \
													<p class='winery'><a href='#'>" + value.strWINERY_KNAME + " &nbsp; " + value.strWINERY_ENAME + "</a></p> \
													<h3> \
														<a href='#' class='btnView'> \
															" + value.strWINE_KNAME + " \
															<p class='wine-name-en'>" + value.strWINE_ENAME + "</p> \
														</a> \
													</h3> \
												</div> \
												<div class='write-info wine-info wine-info-01'> \
													<span class='country'>" + value.strNATION_DISPLAY + "</span> \
													<span class='nation'>" + value.strAREA_KNAME + "</span> \
												</div> \
												<div class='write-info wine-info wine-info-02'> \
													<em class='board-badge badge-" + value.strWINE_TYPE_CSS + "'>" + value.strWINE_TYPE_NAME + "</em> \
													<span class='price'><em>&#8361;</em> " + value.strPRICE + " (" + value.dCAPACITY + "ml)</span> \
													<span class='score-num'>95점</span> \
													<span class='score-star'><span class='star-rating'><em style='width:20%'></em></span>3.8</span> \
												</div> \
											</div> \
										</li>";

							if (html_div !== '')
								$('#wine_list').append(html_div);
						});

						$('#wine_list_no').hide();
					}
					else {
						$('#wine_list_no').show();
					}

					if (jqXHR.moreFlag === 'false')
						$('#wineListMoreBtn').hide();
					else
						$('#wineListMoreBtn').show();

					// 더보기 버튼 활성화
					$('#wineListMoreBtn').attr('disabled', false);
				}
			},
			error: function (jqXHR) { },                                // 요청 실패.
			complete: function (jqXHR) { }                              // 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
		});
	}

</script>
	<form method='post' name='frmAllListView' id='frmAllListView'>
		<input type='hidden' name='shCate' id='shCate' value=''>
		<input type='hidden' name='shKeyword' id='shKeyword' value=''>
		<input type='hidden' name='shOrder' id='shOrder' value='a.CREATE_DATE|DESC'>
		<input type='hidden' name='Idx' id='Idx'>
		<input type='hidden' name='rPage' id='rPage' value='1'>
		<input type='hidden' name='rPageSize' id='rPageSize' value='10'>
		<input type='hidden' name='rMainFilter' id='rMainFilter' value='eyJXSU5FX1RZUEUiOltdLCJXSU5FX05BVElPTiI6W10sIldJTkVfUFJJQ0UiOltdLCJXSU5FX0ZPT0QiOltdLCJXSU5FX1RBU1RFX1NXRUVUIjowLCJXSU5FX1RBU1RFX0FDSURJVFkiOjAsIldJTkVfVEFTVEVfQk9EWSI6MCwiV0lORV9UQVNURV9UQU5OSU4iOjB9'>
		<input type='hidden' name='rListQuery' id='rListQuery' value=''>
	</form>

	<!-- contents 시작 -->
	<section class='sub-contents wrap-news clear'>
		<div class='inner'>
			<div class='wrap-board-left'>
				<div class="mb-filter">
					<div class='page-top-sch'>
						<button class='btn-sch' onclick="onSearchKeyword();">검색</button>
						<input type='text' id='shKeyword1' name='shKeyword1' placeholder='와인 검색' maxlength='30' value='' onkeydown="onEditKeyword(event);">
					</div><!--.page-top-sch -->
					<div class="r-filter">
						<button type="button" class="btn-rmenu" id="btnRfilter" aria-label="와인 검색필터"><i class="ir icon-filter"></i></button>
					</div>
				</div>
				<div class='board-top'>
					<h2 class='cate-tit'>전체와인<span class='cate-tit-total' id="lblTotalCount">(0)</span></h2>
					<div class='board-top-sch'>
						<select class='cate-filter' id='shOrder1' name='shOrder1' onchange="sortWine(this)">
							<option value='a.CREATE_DATE|DESC'  selected  >최신등록순</option>
							<option value='PRICE|ASC'  >가격낮은순</option>
							<option value='PRICE|DESC'  >가격높은순</option>
							<option value='POINT2|DESC'  >평점순</option>
						</select>
					</div><!--.board-top-sch -->
				</div><!--.board-top -->

				<div class='board-list board-list-wine'><!-- 목록 10개 -->
					<ul id='wine_list_no' style='display: none;'>
						<li class='no-list'>해당 상품이 없습니다.</li>
					</ul>
					<ul id='wine_list'>
					</ul>
				</div><!--.board-list -->
				<div class='pagination-box'><button id='wineListMoreBtn' class='button button-large button-white-gray' style="display:none;" onclick="searchWineMore();">더보기</button></div>
			</div><!--.wrap-board-left -->

			<div class='wrap-board-right wrap-menu-right'>
					<!-- 필터 검색 > 마이페이지 > 나의셀러만 적용!!! -->
					<div class="sch-wine-side sch-wine-side-top">
						<span><i class='ir icon-filter'></i>필터</span>
						<a href='javascript:ClearAll();'><i class='ir icon-reset'></i>전체초기화</a>

						<div class="a_menu">
							<!-- <button type="button" class="mob menub"><i class='ir menu'></i>필터</button> -->
							<button type="button" class="mob close">닫기</button>
						</div>
					</div>
					<!-- 필터 검색 > 마이페이지 > 나의셀러만 적용 -->

					<div class="wine-filter wine-filter-box">
					<ul id="uiSelectedList">
					</ul>
				</div><!--.wine-filter-box -->

				<!--wine type -->
				<div class="wine-type wine-filter-box">
					<h3>종류</h3>
					<ul class="box-view" id="filterListWineType">
						<li>
							<div class="winetype">
								<input id="fwt-01" type="checkbox" value="W01004" onclick="onCheckFilter('WINE_TYPE', this, 'W01004', '레드');"><label for="fwt-01">레드</label>
							</div>
						</li>
						<li>
							<div class="winetype">
								<input id="fwt-02" type="checkbox" value="W01002" onclick="onCheckFilter('WINE_TYPE', this, 'W01002', '화이트');"><label for="fwt-02">화이트</label>
							</div>
						</li>
						<li>
							<div class="winetype">
								<input id="fwt-03" type="checkbox" value="W01001" onclick="onCheckFilter('WINE_TYPE', this, 'W01001', '스파클링');"><label for="fwt-03">스파클링</label>
							</div>
						</li>
						<li>
							<div class="winetype">
								<input id="fwt-04" type="checkbox" value="W01003" onclick="onCheckFilter('WINE_TYPE', this, 'W01003', '로제');"><label for="fwt-04">로제</label>
							</div>
						</li>
						<li>
							<div class="winetype">
								<input id="fwt-05" type="checkbox" value="W01005" onclick="onCheckFilter('WINE_TYPE', this, 'W01005', '주정강화');"><label for="fwt-05">주정강화</label>
							</div>
						</li>
						<li>
							<div class="winetype">
								<input id="fwt-06" type="checkbox" value="W01999" onclick="onCheckFilter('WINE_TYPE', this, 'W01999', '기타');onCheckFilter('WINE_TYPE', this, 'W01006', '고도주');"><label for="fwt-06">기타</label>
							</div>
						</li>
					</ul>
				</div><!--.wine-filter-box -->

				<!--wine taste -->
				<div class="wine-filter-box">
					<h3>맛</h3>
					<ul class="filter-grade-box">
						<li>
							<span>당도</span>
							<div id="inputListTasteSweet" class="filter-grade">
								<a href="javascript:void(0);" value="1" onclick="onClickTaste(this, 'TASTE_SWEET', '당도', 1);">당도1</a>
								<a href="javascript:void(0);" value="2" onclick="onClickTaste(this, 'TASTE_SWEET', '당도', 2);">당도2</a>
								<a href="javascript:void(0);" value="3" onclick="onClickTaste(this, 'TASTE_SWEET', '당도', 3);">당도3</a>
								<a href="javascript:void(0);" value="4" onclick="onClickTaste(this, 'TASTE_SWEET', '당도', 4);">당도4</a>
								<a href="javascript:void(0);" value="5" onclick="onClickTaste(this, 'TASTE_SWEET', '당도', 5);">당도5</a>
							</div>
						</li>
						<li>
							<span>산도</span>
							<div id="inputListTasteAcidity" class="filter-grade">
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_ACIDITY', '산도', 1);">산도1</a>
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_ACIDITY', '산도', 2);">산도2</a>
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_ACIDITY', '산도', 3);">산도3</a>
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_ACIDITY', '산도', 4);">산도4</a>
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_ACIDITY', '산도', 5);">산도5</a>
							</div>
						</li>
						<li>
							<span>바디</span>
							<div id="inputListTasteBody" class="filter-grade">
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_BODY', '바디', 1);">바디1</a>
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_BODY', '바디', 2);">바디2</a>
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_BODY', '바디', 3);">바디3</a>
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_BODY', '바디', 4);">바디4</a>
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_BODY', '바디', 5);">바디5</a>
							</div>
						</li>
						<li>
							<span>타닌</span>
							<div id="inputListTasteTannin" class="filter-grade">
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_TANNIN', '타닌', 1);">타닌1</a>
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_TANNIN', '타닌', 2);">타닌2</a>
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_TANNIN', '타닌', 3);">타닌3</a>
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_TANNIN', '타닌', 4);">타닌4</a>
								<a href="javascript:void(0);" onclick="onClickTaste(this, 'TASTE_TANNIN', '타닌', 5);">타닌5</a>
							</div>
						</li>
					</ul>
				</div><!--.wine-filter-box -->

				<!--wine grape variety -->
				<div class="wine-type wine-filter-box inline-type">
					<h3>품종</h3>
					<div class="page-top-sch">
						<button class="btn-sch">검색</button>
						<input type="text" placeholder="품종 검색" oninput="onEditFilterGrapeVariety(this);" id="inputFilterGrapeVariety">
					</div>
					<ul class="box-view box-view-style" id="filterGrapeVarietyMaster">
						<li>
							<div class="">
								<input id="fwgv-01" type="checkbox" onclick="onCheckFilter('WINE_GRAPE_VARIETY', this, '5431', '카베르네 소비뇽');"><label for="fwgv-01">카베르네 소비뇽</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwgv-02" type="checkbox" onclick="onCheckFilter('WINE_GRAPE_VARIETY', this, '5736', '피노 누아');"><label for="fwgv-02">피노 누아</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwgv-03" type="checkbox" onclick="onCheckFilter('WINE_GRAPE_VARIETY', this, '5795', '시라/쉬라즈');"><label for="fwgv-03">시라/쉬라즈</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwgv-04" type="checkbox" onclick="onCheckFilter('WINE_GRAPE_VARIETY', this, '5672', '메를로');"><label for="fwgv-04">메를로</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwgv-05" type="checkbox" onclick="onCheckFilter('WINE_GRAPE_VARIETY', this, '5774', '산지오베제');"><label for="fwgv-05">산지오베제</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwgv-06" type="checkbox" onclick="onCheckFilter('WINE_GRAPE_VARIETY', this, '5799', '템프라니요');"><label for="fwgv-06">템프라니요</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwgv-11" type="checkbox" onclick="onCheckFilter('WINE_GRAPE_VARIETY', this, '5657', '말벡');"><label for="fwgv-11">말벡</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwgv-07" type="checkbox" onclick="onCheckFilter('WINE_GRAPE_VARIETY', this, '5470', '샤르도네');"><label for="fwgv-07">샤르도네</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwgv-08" type="checkbox" onclick="onCheckFilter('WINE_GRAPE_VARIETY', this, '5777', '소비뇽 블랑');"><label for="fwgv-08">소비뇽 블랑</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwgv-09" type="checkbox" onclick="onCheckFilter('WINE_GRAPE_VARIETY', this, '5752', '리슬링');"><label for="fwgv-09">리슬링</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwgv-12" type="checkbox" onclick="onCheckFilter('WINE_GRAPE_VARIETY', this, '5478', '슈냉 블랑');"><label for="fwgv-12">슈냉 블랑</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwgv-10" type="checkbox" onclick="onCheckFilter('WINE_GRAPE_VARIETY', this, '7160', '모스카토');"><label for="fwgv-10">모스카토</label>
							</div>
						</li>
					</ul>
					<ul class="box-view box-view-style" id="filterGrapeVarietySearch" style="display:none;"></ul>
				</div><!--.wine-filter-box -->

				<!--wine nation -->
				<div class="wine-type wine-filter-box inline-type">
					<h3>국가</h3>
					<div class="page-top-sch">
						<button class="btn-sch">검색</button>
						<input type="text" placeholder="국가 검색" oninput="onEditFilterNation(this);" id="inputFilterNation">
					</div>
					<ul class="box-view" id="filterNationMaster">
						<li>
							<div class="">
								<input id="fwn-01" type="checkbox" value="P09000000" onclick="onCheckFilter('WINE_NATION', this, 'P09000000', '프랑스');"><label for="fwn-01">프랑스</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwn-02" type="checkbox" value="P15000000" onclick="onCheckFilter('WINE_NATION', this, 'P15000000', '이탈리아');"><label for="fwn-02">이탈리아</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwn-04" type="checkbox" value="P24000000" onclick="onCheckFilter('WINE_NATION', this, 'P24000000', '스페인');"><label for="fwn-04">스페인</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwn-05" type="checkbox" value="P19000000" onclick="onCheckFilter('WINE_NATION', this, 'P19000000', '포르투갈');"><label for="fwn-05">포르투갈</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwn-03" type="checkbox" value="P11000000" onclick="onCheckFilter('WINE_NATION', this, 'P11000000', '독일');"><label for="fwn-03">독일</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwn-06" type="checkbox" value="P28000000" onclick="onCheckFilter('WINE_NATION', this, 'P28000000', '미국');"><label for="fwn-06">미국</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwn-10" type="checkbox" value="P18000000" onclick="onCheckFilter('WINE_NATION', this, 'P18000000', '뉴질랜드');"><label for="fwn-10">뉴질랜드</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwn-09" type="checkbox" value="P02000000" onclick="onCheckFilter('WINE_NATION', this, 'P02000000', '호주');"><label for="fwn-09">호주</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwn-07" type="checkbox" value="P08000000" onclick="onCheckFilter('WINE_NATION', this, 'P08000000', '칠레');"><label for="fwn-07">칠레</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwn-08" type="checkbox" value="P01000000" onclick="onCheckFilter('WINE_NATION', this, 'P01000000', '아르헨티나');"><label for="fwn-08">아르헨티나</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwn-11" type="checkbox" value="P23000000" onclick="onCheckFilter('WINE_NATION', this, 'P23000000', '남아프리카 공화국');"><label for="fwn-11">남아프리카 공화국</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwn-12" type="checkbox" value="P99000000" onclick="onCheckFilter('WINE_NATION', this, 'P99000000', '기타국가');"><label for="fwn-12">기타국가</label>
							</div>
						</li>
					</ul>
					<ul class="box-view" id="filterNationSearch" style="display:none"></ul>
				</div><!--.wine-filter-box -->

				<!--wine area -->
				<div class="wine-type wine-filter-box inline-type">
					<h3>지역</h3>
					<div class="page-top-sch">
						<button class="btn-sch">검색</button>
						<input type="text" placeholder="지역 검색" oninput="onEditFilterArea(this);" id="inputFilterArea">
					</div>
					<ul class="box-view box-view-style" id="filterAreaMaster">
						<li>
							<div class="">
								<input id="fwa-01" type="checkbox" onclick="onCheckFilter('WINE_AREA', this, 'P09030000', '보르도', 2);"><label for="fwa-01">보르도</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwa-02" type="checkbox" onclick="onCheckFilter('WINE_AREA', this, 'P09040000', '부르고뉴', 2);"><label for="fwa-02">부르고뉴</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwa-03" type="checkbox" onclick="onCheckFilter('WINE_AREA', this, 'P09060000', '샹파뉴', 2);"><label for="fwa-03">샹파뉴</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwa-04" type="checkbox" onclick="onCheckFilter('WINE_AREA', this, 'P09130000', '론', 2);"><label for="fwa-04">론</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwa-05" type="checkbox" onclick="onCheckFilter('WINE_AREA', this, 'P15120000', '피에몬테', 2);"><label for="fwa-05">피에몬테</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwa-06" type="checkbox" onclick="onCheckFilter('WINE_AREA', this, 'P15160000', '토스카나', 2);"><label for="fwa-06">토스카나</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwa-07" type="checkbox" onclick="onCheckFilter('WINE_AREA', this, 'P28011215', '나파 밸리', 4);"><label for="fwa-07">나파 밸리</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwa-08" type="checkbox" onclick="onCheckFilter('WINE_AREA', this, 'P24500000', '리오하', 2);"><label for="fwa-08">리오하</label>
							</div>
						</li>
						<li>
							<div class="">
								<input id="fwa-09" type="checkbox" onclick="onCheckFilter('WINE_AREA', this, 'P02040300', '바로사 밸리', 3);"><label for="fwa-09">바로사 밸리</label>
							</div>
						</li>
					</ul>
					<ul class="box-view box-view-style" id="filterAreaSearch" style="display:none;"></ul>
				</div><!--.wine-filter-box -->
			</div><!--.wrap-board-right -->

			<!-- script -->
			<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.js"></script>
			<link rel='stylesheet' href='/01_include/css/ion.rangeSlider.css' />
			<script type='text/javascript' src='/01_include/js/ion.rangeSlider.min.js'></script>
			<script type="text/javascript">
				var m_searchOption = new Object();
				m_searchOption.page = 1;
				m_searchOption.pageSize = 10;
			
				var m_dynamicButtonList = [];
			
				// Food
				function onEditFilterFood(ctrl) {
					// UI
					var ctrlFilterMaster = document.getElementById('filterFoodMaster');
					var ctrlFilterSearch = document.getElementById('filterFoodSearch');
			
					if(ctrl.value.length == 0) {
						ctrlFilterMaster.style.display = "block";
						ctrlFilterSearch.style.display = "none";
						return;
					}
					ctrlFilterMaster.style.display = "none";
					ctrlFilterSearch.style.display = "block";
			
					// Search
					ctrlFilterSearch.innerHTML = '';
			
					var map = {};
					map['searchText'] = ctrl.value;
					var url = '/13_search/proc/ajax_search_food.php';
					var data = MakeFormData(url, map);
			
					requestPage(url, 'post', data, undefined, onEditFilterFoodResult);
				}
				function onEditFilterFoodResult(retObj) {
					var ctrlFilterSearch = document.getElementById('filterFoodSearch');
					if(retObj.result) {
						var html = '';
						var list = JSON.parse(retObj.response);
						for(var idx = 0; idx < list.length; ++idx) {
							var obj = list[idx];
							var ctrlID = "sff_" + guid();
							var desc = obj.CATEGORY_1 + " (" + obj.CATEGORY_2 + ")";
							var strObj = Base64Encode(JSON.stringify(obj));
							html = html + "<li><div class=''><input id='" + ctrlID + "' class='dynamic' type='checkbox' onclick='onSelectFilterFood(this, \"" + strObj + "\");'><label for='" + ctrlID + "'>" + desc + "</label></div></li>";
						}
						ctrlFilterSearch.innerHTML = html;
					}
				}
				function onSelectFilterFood(ctrlInput, strObj) {
					var ctrlFilterMaster = document.getElementById('filterFoodMaster');
					var ctrlFilterSearch = document.getElementById('filterFoodSearch');
			
					var obj = JSON.parse(Base64Decode(strObj));
					var desc = obj.CATEGORY_1 + " (" + obj.CATEGORY_2 + ")";
			
					var ctrlID = "fwf-" + guid();
					var html = "<li>\
									<div class=''>\
										<input id='" + ctrlID + "' class='dynamic' type='checkbox' value='" + obj.CATEGORY_2 + "' onclick='onCheckFilter(\"WINE_FOOD\", this, \"" + obj.CATEGORY_2 + "\", \"" + desc + "\", 2);'><label for='" + ctrlID + "'>" + desc + "</label>\
									</div>\
								</li>";
			
			
					ctrlFilterMaster.style.display = "block";
					ctrlFilterSearch.style.display = "none";
			
					ctrlFilterMaster.insertAdjacentHTML('beforeend', html);
			
					if(m_dicExtraCtrl['filterFoodMaster'] === undefined || m_dicExtraCtrl['filterFoodMaster'] === null) {
						m_dicExtraCtrl['filterFoodMaster'] = [];
					}
					m_dicExtraCtrl['filterFoodMaster'].push(html);
			
					var ctrlInputFilterFood = document.getElementById('inputFilterFood');
					ctrlInputFilterFood.value = '';
					document.getElementById(ctrlID).click();
				}
				// Grape variety
				function onEditFilterGrapeVariety(ctrl) {
					// UI
					var ctrlFilterMaster = document.getElementById('filterGrapeVarietyMaster');
					var ctrlFilterSearch = document.getElementById('filterGrapeVarietySearch');
			
					if(ctrl.value.length == 0) {
						ctrlFilterMaster.style.display = "block";
						ctrlFilterSearch.style.display = "none";
						return;
					}
					ctrlFilterMaster.style.display = "none";
					ctrlFilterSearch.style.display = "block";
			
					// Search
					ctrlFilterSearch.innerHTML = '';
			
					var map = {};
					map['searchText'] = ctrl.value;
					var url = '/13_search/proc/ajax_search_grape_variety.php';
					var data = MakeFormData(url, map);
			
					requestPage(url, 'post', data, undefined, onEditFilterGrapeVarietyResult);
				}
				function onEditFilterGrapeVarietyResult(retObj) {
					var ctrlFilterMaster = document.getElementById('filterGrapeVarietyMaster');
					var ctrlFilterSearch = document.getElementById('filterGrapeVarietySearch');
					if(retObj.result) {
						var html = '';
						var list = JSON.parse(retObj.response);
						for(var idx = 0; idx < list.length; ++idx) {
							var obj = list[idx];
							var ctrlID = "sff_" + guid();
							var desc = obj.TITLE_KOR;
							var strObj = Base64Encode(JSON.stringify(obj));
			
							html = html + "<li>\
												<div class=''>\
													<input id='" + ctrlID + "' class='dynamic' type='checkbox' onclick='onSelectFilterGrapeVariety(this, \"" + strObj + "\");'><label for='" + ctrlID + "'>" + desc + "</label>\
												</div>\
											</li>";
						}
						ctrlFilterSearch.innerHTML = html;
					}
				}
				function onSelectFilterGrapeVariety(ctrlInput, strObj) {
					var ctrlFilterMaster = document.getElementById('filterGrapeVarietyMaster');
					var ctrlFilterSearch = document.getElementById('filterGrapeVarietySearch');
			
					var obj = JSON.parse(Base64Decode(strObj));
					var desc = obj.TITLE_KOR;
					var ctrlID = "fwgv-" + guid();
			
					var html = "<li>\
									<div class=''>\
										<input id='" + ctrlID + "' class='dynamic' type='checkbox' onclick='onCheckFilter(\"WINE_GRAPE_VARIETY\", this, \"" + obj.INFO_IDX + "\", \"" + obj.TITLE_KOR + "\");'><label for='" + ctrlID + "'>" + desc + "</label>\
									</div>\
								</li>";
			
					ctrlFilterMaster.style.display = "block";
					ctrlFilterSearch.style.display = "none";
			
					ctrlFilterMaster.insertAdjacentHTML('beforeend', html);
			
					if(m_dicExtraCtrl['filterGrapeVarietyMaster'] === undefined || m_dicExtraCtrl['filterGrapeVarietyMaster'] === null) {
						m_dicExtraCtrl['filterGrapeVarietyMaster'] = [];
					}
					m_dicExtraCtrl['filterGrapeVarietyMaster'].push(html);
			
					var ctrlInputFilterFood = document.getElementById('inputFilterGrapeVariety');
					ctrlInputFilterFood.value = '';
					document.getElementById(ctrlID).click();
				}
			
				// Wine style
				function onEditFilterWineStyle(ctrl) {
					// UI
					var ctrlFilterMaster = document.getElementById('filterWineStyleMaster');
					var ctrlFilterSearch = document.getElementById('filterWineStyleSearch');
			
					if(ctrl.value.length == 0) {
						ctrlFilterMaster.style.display = "block";
						ctrlFilterSearch.style.display = "none";
						return;
					}
					ctrlFilterMaster.style.display = "none";
					ctrlFilterSearch.style.display = "block";
			
					// Search
					ctrlFilterSearch.innerHTML = '';
			
					var map = {};
					map['searchText'] = ctrl.value;
					var url = '/13_search/proc/ajax_search_wine_style.php';
					var data = MakeFormData(url, map);
			
					requestPage(url, 'post', data, undefined, onEditFilterWineStyleResult);
				}
				function onEditFilterWineStyleResult(retObj) {
					var ctrlFilterMaster = document.getElementById('filterWineStyleMaster');
					var ctrlFilterSearch = document.getElementById('filterWineStyleSearch');
					if(retObj.result) {
						var html = '';
						var list = JSON.parse(retObj.response);
						for(var idx = 0; idx < list.length; ++idx) {
							var obj = list[idx];
							var ctrlID = "sff_" + guid();
							var desc = obj.TITLE_KOR;
							var strObj = Base64Encode(JSON.stringify(obj));
			
							html = "<li>\
										<div class=''>\
											<input id='" + ctrlID + "' class='dynamic' type='checkbox' onclick='onSelectFilterWineStyle(this, \"" + strObj + "\");'><label for='" + ctrlID + "'>" + desc + "</label>\
										</div>\
									</li>";
							ctrlFilterSearch.insertAdjacentHTML('beforeend', html);
						}
					}
				}
				function onSelectFilterWineStyle(ctrlInput, strObj) {
					var ctrlFilterMaster = document.getElementById('filterWineStyleMaster');
					var ctrlFilterSearch = document.getElementById('filterWineStyleSearch');
			
					var obj = JSON.parse(Base64Decode(strObj));
					var desc = obj.TITLE_KOR;
					var ctrlID = "fws-" + guid();
			
					var html = "<li>\
									<div class=''>\
										<input id='" + ctrlID + "' class='dynamic' type='checkbox'  onclick='onCheckFilter(\"WINE_STYLE\", this, \"" + obj.INFO_IDX + "\", \"" + obj.TITLE_KOR + "\");'><label for='" + ctrlID + "'>" + desc + "</label>\
									</div>\
								</li>";
			
					ctrlFilterMaster.style.display = "block";
					ctrlFilterSearch.style.display = "none";
					ctrlFilterSearch.innerHTML = "";
			
					ctrlFilterMaster.insertAdjacentHTML('beforeend', html);
			
					if(m_dicExtraCtrl['filterWineStyleMaster'] === undefined || m_dicExtraCtrl['filterWineStyleMaster'] === null) {
						m_dicExtraCtrl['filterWineStyleMaster'] = [];
					}
					m_dicExtraCtrl['filterWineStyleMaster'].push(html);
			
					var ctrlInputFilterFood = document.getElementById('inputFilterStyle');
					ctrlInputFilterFood.value = '';
					document.getElementById(ctrlID).click();
				}
			
				// Nation
				function onEditFilterNation(ctrl) {
					// UI
					var ctrlFilterMaster = document.getElementById('filterNationMaster');
					var ctrlFilterSearch = document.getElementById('filterNationSearch');
			
					if(ctrl.value.length == 0) {
						ctrlFilterMaster.style.display = "block";
						ctrlFilterSearch.style.display = "none";
						return;
					}
					ctrlFilterMaster.style.display = "none";
					ctrlFilterSearch.style.display = "block";
			
					// Search
					ctrlFilterSearch.innerHTML = '';
			
					var map = {};
					map['searchText'] = ctrl.value;
					var url = '/13_search/proc/ajax_search_nation.php';
					var data = MakeFormData(url, map);
			
					requestPage(url, 'post', data, null, onEditFilterNationResult);
				}
				function onEditFilterNationResult(retObj) {
					var ctrlFilterMaster = document.getElementById('filterNationMaster');
					var ctrlFilterSearch = document.getElementById('filterNationSearch');
					if(retObj.result) {
						var html = '';
						var list = JSON.parse(retObj.response);
						for(var idx = 0; idx < list.length; ++idx) {
							var obj = list[idx];
							var ctrlID = "sff_" + guid();
							var desc = obj.AREA_KNAME;
							var strObj = Base64Encode(JSON.stringify(obj));
			
							html = html + "<li>\
												<div class=''>\
													<input id='" + ctrlID + "' class='dynamic' type='checkbox' onclick='onSelectFilterNation(this, \"" + strObj + "\");'><label for='" + ctrlID + "'>" + desc + "</label>\
												</div>\
											</li>";
						}
						ctrlFilterSearch.innerHTML = html;
					}
				}
				function onSelectFilterNation(ctrlInput, strObj) {
					var ctrlFilterMaster = document.getElementById('filterNationMaster');
					var ctrlFilterSearch = document.getElementById('filterNationSearch');
			
					var obj = JSON.parse(Base64Decode(strObj));
					var desc = obj.NATION;
					var ctrlID = "fwn-" + guid();
			
					var html = "<li>\
									<div class=''>\
										<input id='" + ctrlID + "' class='dynamic' type='checkbox' class='dynamic' onclick='onCheckFilter(\"WINE_NATION\", this, \"" + obj.AREA_CODE + "\", \"" + obj.AREA_KNAME + "\");'><label for='" + ctrlID + "'>" + desc + "</label>\
									</div>\
								</li>";
			
			
					ctrlFilterMaster.style.display = "block";
					ctrlFilterSearch.style.display = "none";
			
					ctrlFilterMaster.insertAdjacentHTML('beforeend', html);
			
			
					if(m_dicExtraCtrl['filterNationMaster'] === undefined || m_dicExtraCtrl['filterNationMaster'] === null) {
						m_dicExtraCtrl['filterNationMaster'] = [];
					}
					m_dicExtraCtrl['filterNationMaster'].push(html);
			
					var ctrlInputFilterFood = document.getElementById('inputFilterNation');
					ctrlInputFilterFood.value = '';
			
					document.getElementById(ctrlID).click();
				}
			
				// Area
				function onEditFilterArea(ctrl) {
					// UI
					var ctrlFilterMaster = document.getElementById('filterAreaMaster');
					var ctrlFilterSearch = document.getElementById('filterAreaSearch');
			
					if(ctrl.value.length == 0) {
						ctrlFilterMaster.style.display = "block";
						ctrlFilterSearch.style.display = "none";
						return;
					}
					ctrlFilterMaster.style.display = "none";
					ctrlFilterSearch.style.display = "block";
			
					// Search
					ctrlFilterSearch.innerHTML = '';
			
					var map = {};
					map['searchText'] = ctrl.value;
					var url = '/13_search/proc/ajax_search_area.php';
					var data = MakeFormData(url, map);
			
					requestPage(url, 'post', data, null, onEditFilterAreaResult);
				}
				function onEditFilterAreaResult(retObj) {
					var ctrlFilterMaster = document.getElementById('filterAreaMaster');
					var ctrlFilterSearch = document.getElementById('filterAreaSearch');
					if(retObj.result) {
						var html = '';
						var list = JSON.parse(retObj.response);
						for(var idx = 0; idx < list.length; ++idx) {
							var obj = list[idx];
							var ctrlID = "sff_" + guid();
							var desc = obj.AREA_KNAME;
							var strObj = Base64Encode(JSON.stringify(obj));
			
							html = html + "<li>\
												<div class=''>\
													<input id='" + ctrlID + "' class='dynamic' type='checkbox' onclick='onSelectFilterArea(this, \"" + strObj + "\");'><label for='" + ctrlID + "'>" + desc + "</label>\
												</div>\
											</li>";
						}
						ctrlFilterSearch.innerHTML = html;
					}
				}
				function onSelectFilterArea(ctrlInput, strObj) {
					var ctrlFilterMaster = document.getElementById('filterAreaMaster');
					var ctrlFilterSearch = document.getElementById('filterAreaSearch');
			
					var obj = JSON.parse(Base64Decode(strObj));
					var desc = obj.AREA_KNAME;
					var ctrlID = "fwa-" + guid();
			
					var html = "<li>\
									<div class=''>\
										<input id='" + ctrlID + "' class='dynamic' type='checkbox'  onclick='onCheckFilter(\"WINE_AREA\", this, \"" + obj.AREA_CODE + "\", \"" + obj.AREA_KNAME + "\", " + obj.AREA_LEVEL + ");'><label for='" + ctrlID + "'>" + desc + "</label>\
									</div>\
								</li>";
			
					ctrlFilterMaster.style.display = "block";
					ctrlFilterSearch.style.display = "none";
			
					ctrlFilterMaster.insertAdjacentHTML('beforeend', html);
			
					if(m_dicExtraCtrl['filterAreaMaster'] === undefined || m_dicExtraCtrl['filterAreaMaster'] === null) {
						m_dicExtraCtrl['filterAreaMaster'] = [];
					}
					m_dicExtraCtrl['filterAreaMaster'].push(html);
			
					var ctrlInputFilterFood = document.getElementById('inputFilterArea');
					ctrlInputFilterFood.value = '';
					document.getElementById(ctrlID).click();
				}
			
				var m_dicFilterType = {};
				m_dicFilterType["KEY_WORD"] = "";
			
				var m_dicExtraCtrl = {};
			
				// Taste
				function onClickTaste(ctrl, type, desc, val) {
					// UI
					$(ctrl).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */
					$(ctrl).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
			
					var elementID = 'TASTE' + type;
					var ctrlElement = document.getElementById(elementID);
					if( ctrlElement !== null && ctrlElement !== undefined) {
						ctrlElement.parentNode.removeChild(ctrlElement);
					}
					var ctrlList = document.getElementById('uiSelectedList');
					var html = "<li id=" + elementID + "><p>" + desc + " " + val + "<button type='button' onclick='onClickDeleteTasteElement(\"" + type + "\", \"" + elementID + "\", \"" + ctrl.parentNode.id + "\");'>삭제</button></p></li>";
					ctrlList.innerHTML = ctrlList.innerHTML + html;
			
					// Data
					if(type in m_dicFilterType) {
						delete m_dicFilterType[type];
					}
			
					var obj = new Object();
					obj.type = type;
					obj.ctrl = ctrl;
					obj.key = val;
					obj.desc = desc;
			
					m_dicFilterType[type] = obj;
					searchWine();
				}
			
				function onClickDeleteTasteElement(type, ctrlID, inputCtrlParentID) {
					// UI
					var ctrlElement = document.getElementById(ctrlID);
					ctrlElement.parentNode.removeChild(ctrlElement);
			
					var ctrlInput = document.getElementById(inputCtrlParentID);
					$(ctrlInput).children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */
			
					// Data
					if(type in m_dicFilterType) {
						delete m_dicFilterType[type];
						searchWine();
					}
				}
			
				function onClickDeleteElement(ctrlID, inputCtrlID) {
					var ctrlInput = document.getElementById(inputCtrlID);
					ctrlInput.click();
				}
			
				function addFilterList(obj) {
					var ctrlList = document.getElementById('uiSelectedList');
					var elementID = obj.type + '-' + obj.key;
			
					var html = "<li id=" + elementID + "><p onclick='onClickDeleteElement(\"" + elementID + "\", \"" + obj.ctrl.id + "\");'>" + obj.desc + "<button type='button'>삭제</button></p></li>";
					ctrlList.innerHTML = ctrlList.innerHTML + html;
				}
				function removeFilterList(obj) {
					var elementID = obj.type + '-' + obj.key;
					var ctrlElement = document.getElementById(elementID);
					if( ctrlElement === null || ctrlElement === undefined) return;
					ctrlElement.parentNode.removeChild(ctrlElement);
				}
			
				function onCheckFilter(type, ctrl, key, desc, etc) {
					var dic = null;
					var bAdd = true;
					var obj = new Object();
					obj.type = type;
					obj.ctrl = ctrl;
					obj.key = key;
					obj.desc = desc;
					obj.etc = etc;
			
					var dicFilter = null;
					if(type in m_dicFilterType) {
						dicFilter = m_dicFilterType[type];
					}else {
						dicFilter = {};
						m_dicFilterType[type] = dicFilter;
					}
			
					if(ctrl.checked) {
						addFilterList(obj);
						if(key in dicFilter) {
							delete dicFilter[key];
						}
						dicFilter[key] = obj;
					}else {
						removeFilterList(obj);
						if(key in dicFilter) {
							delete dicFilter[key];
						}
					}
					searchWine();
				}
			
				// Keyword
				function onEditKeyword(event) {
					if(event.keyCode != 13) return;
					onSearchKeyword();
				}
				function onSearchKeyword() {
					// data;
					var ctrlInput = document.getElementById('shKeyword1');
					var keyword = ctrlInput.value;
					if( m_dicFilterType["KEY_WORD"] == keyword) return;
					m_dicFilterType["KEY_WORD"] = keyword;
			
					// ui
					var elementID = 'SEARCH_KEYWORD';
					var ctrlElement = document.getElementById(elementID);
					if( ctrlElement !== null && ctrlElement !== undefined) {
						ctrlElement.parentNode.removeChild(ctrlElement);
					}
			
					if( keyword.length > 0) {
						var ctrlList = document.getElementById('uiSelectedList');
						var html = "<li id=" + elementID + "><p>" + keyword + "<button type='button' onclick='onClickDeleteKeyword();'>삭제</button></p></li>";
						ctrlList.innerHTML = ctrlList.innerHTML + html;
					}
			
					searchWine();
				}
			
				function onClickDeleteKeyword() {
					var ctrlInput = document.getElementById('shKeyword1');
					ctrlInput.value = "";
					onSearchKeyword();
				}
			
				var priceList = [];
				var minPrice = 0;
				var maxPrice = 200000;
				var unitPrice = 10000;
				var m_nf = new Intl.NumberFormat();
				var m_priceSlider = null;
			
				function onPriceChanged(lower, upper) {
					// UI
					var ctrlList = document.getElementById('uiSelectedList');
					var elementID = 'WINE_PRICE_ELEMENT';
					var prevElement = document.getElementById(elementID);
					var type = "WINE_PRICE";
			
					if( prevElement !== null && prevElement !== undefined) {
						prevElement.parentNode.removeChild(prevElement);
					}
			
					if(lower != minPrice || upper != maxPrice) {
						var desc = m_nf.format(lower / unitPrice) + '만원 ~ ' + m_nf.format(upper / unitPrice) + '만원';
						if(upper == maxPrice)
							desc = m_nf.format(lower / unitPrice) + '만원 ~ 전체';
						var html = "<li id=" + elementID + "><p>" + desc + "<button type='button' onclick='onClickDeletePriceElement();'>삭제</button></p></li>";
						ctrlList.innerHTML = ctrlList.innerHTML + html;
			
						var obj = new Object();
						if(lower != minPrice) obj.lower = lower;
						if(upper != maxPrice) obj.upper = upper;
			
						m_dicFilterType[type] = obj;
			
					}else {
						if(type in m_dicFilterType) {
							delete m_dicFilterType[type];
						}
					}
			
					searchWine();
				}
				function onClickDeletePriceElement() {
					m_priceSlider.update({
							from : minPrice / unitPrice,
							to : maxPrice / unitPrice
						});
			
					$inputFrom = $(".js-input-from");
					$inputTo = $(".js-input-to")
					onPriceChanged(minPrice, maxPrice);
			
					$inputFrom.prop("value", '₩ 0');
					$inputTo.prop("value", '전체');
				}
			
				// Slider
				$(function() {
					var m_firstSliderEvent = true;
					for(var price = minPrice; price < maxPrice; price = price + unitPrice) {
						priceList.push('₩ ' + m_nf.format(price));
					}
					priceList.push('전체');
			
					var $range = $(".js-range-slider"),
						$inputFrom = $(".js-input-from"),
						$inputTo = $(".js-input-to"),
						instance,
						min = 0,
						max = 1000,
						from = 0,
						to = 0;
			
					$range.ionRangeSlider({
						skin: "round",
						type: "double",
						min: 0,
						//max: 200000,
						//from: 0,
						//to: 140000,
						prettify_separator: ",",
						prettify_enabled: true,
						//prefix: "₩",
						step: 1000,
						onStart: updateInputs,
						onChange: updateInputs,
						onFinish : changedInput,
						values: priceList
					});
					instance = $range.data("ionRangeSlider");
					m_priceSlider = instance;
			
					function changedInput(data) {
						updateInputs(data);
			
						if(!m_firstSliderEvent)
							onPriceChanged(data.lower, data.upper);
			
						m_firstSliderEvent = false;
					}
			
					function updateInputs (data) {
						data.lower = minPrice + unitPrice * data.from;
						data.upper = minPrice + unitPrice * data.to;
						from = '₩ ' + m_nf.format(data.lower);
			
						if(data.upper >= maxPrice) {
							to = '전체';
						}else {
							to = '₩ ' + m_nf.format(data.upper);
						}
			
						$inputFrom.prop("value", from);
						$inputTo.prop("value", to);
					}
			
					$inputFrom.on("input", function () {
						var val = $(this).prop("value");
			
						// validate
						if (val < min) {
							val = min;
						} else if (val > to) {
							val = to;
						}
			
						instance.update({
							from: val
						});
					});
			
					$inputTo.on("input", function () {
						var val = $(this).prop("value");
			
						// validate
						if (val < from) {
							val = from;
						} else if (val > max) {
							val = max;
						}
			
						instance.update({
							to: val
						});
					});
				});
			
				function checkMainFilter() {
					var ctrlInput = document.getElementById("rMainFilter");
					var strFilter = Base64Decode(ctrlInput.value);
					var filter = JSON.parse(strFilter);
			
					var idx = 0;
					var filterList = filter.WINE_TYPE;
					var inputList = document.getElementById("filterListWineType").getElementsByTagName("input");
					if(filterList !== null && filterList !== undefined) {
						for(idx = 0; idx < filterList.length; ++idx) {
							var val = filterList[idx];
							var valArray = val.split("|");
			
							for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
								if(inputList[inputIdx].value == valArray[2]) {
									inputList[inputIdx].click();
									break;
								}
							}
						}
					}
			
					filterList = filter.WINE_NATION;
					inputList = document.getElementById("filterNationMaster").getElementsByTagName("input");
					if(filterList !== null && filterList !== undefined) {
						for(idx = 0; idx < filterList.length; ++idx) {
							var val = filterList[idx];
							var valArray = val.split("|");
			
							for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
								if(inputList[inputIdx].value == valArray[2]) {
									inputList[inputIdx].click();
									break;
								}
							}
						}
					}
			
					filterList = filter.WINE_FOOD;
					inputList = document.getElementById("filterFoodMaster").getElementsByTagName("input");
					if(filterList !== null && filterList !== undefined) {
						for(idx = 0; idx < filterList.length; ++idx) {
							var val = filterList[idx];
							var valArray = val.split("|");
			
							for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
								if(inputList[inputIdx].value == valArray[2]) {
									inputList[inputIdx].click();
									break;
								}
							}
						}
					}
			
					filterList = filter.WINE_TASTE_SWEET;
					inputList = document.getElementById("inputListTasteSweet").getElementsByTagName("a");
					if(filterList !== null && filterList !== undefined) {
						for(idx = 0; idx < filterList.length; ++idx) {
							var val = filterList[idx];
							if(val > 0) {
								inputList[val - 1].click();
							}
						}
					}
					filterList = filter.WINE_TASTE_ACIDITY;
					inputList = document.getElementById("inputListTasteAcidity").getElementsByTagName("a");
					if(filterList !== null && filterList !== undefined) {
						for(idx = 0; idx < filterList.length; ++idx) {
							var val = filterList[idx];
							if(val > 0) {
								inputList[val - 1].click();
							}
						}
					}
					filterList = filter.WINE_TASTE_BODY;
					inputList = document.getElementById("inputListTasteBody").getElementsByTagName("a");
					if(filterList !== null && filterList !== undefined) {
						for(idx = 0; idx < filterList.length; ++idx) {
							var val = filterList[idx];
							if(val > 0) {
								inputList[val - 1].click();
							}
						}
					}
					filterList = filter.WINE_TASTE_TANNIN;
					inputList = document.getElementById("inputListTasteTannin").getElementsByTagName("a");
					if(filterList !== null && filterList !== undefined) {
						for(idx = 0; idx < filterList.length; ++idx) {
							var val = filterList[idx];
							if(val > 0) {
								inputList[val - 1].click();
							}
						}
					}
					filterList = filter.WINE_PRICE;
					var existMainPriceCondition = false;
					if(filterList !== null && filterList !== undefined) {
						for(idx = 0; idx < filterList.length; ++idx) {
							var val = filterList[idx];
							var valArray = val.split("|");
							var priceArray = valArray[2].split("-");
							if(priceArray[1] > maxPrice) priceArray[1] = maxPrice;
							{
								m_priceSlider.update({
										from : priceArray[0] / unitPrice,
										to : priceArray[1] / unitPrice
									});
			
			
								$inputFrom = $(".js-input-from");
								$inputTo = $(".js-input-to")
								onPriceChanged(priceArray[0], priceArray[1]);
			
								$inputFrom.prop("value", '₩ ' + m_nf.format(priceArray[0]));
								$inputTo.prop("value", '₩ ' + m_nf.format(priceArray[1]));
							}
							existMainPriceCondition = true;
						}
					}
					if(existMainPriceCondition){
						document.getElementById('checkNoPriceInfo').checked = false;
					}
				}
			
			
				function goWineViewWithParam(IDX) {
					goWineViewDirect(IDX, 'LIST');
				}
			
			/*
				function sleep(ms) {
					return new Promise(resolve => setTimeout(resolve, ms));
				}
			*/
				function checkListQuery() {
			
					clearAllCheck();
			
					var cookieKey = "LQ_WLL";
					var val = $.cookie(cookieKey);
			
					if(val === null || val === undefined || val.length == 0) return false;
			
					$.cookie(cookieKey, '', {path: "/", expires: -1});
			
					var map = JSON.parse(Base64Decode(val));
					var doubleClick = !map['goList'];
			
					// Extra Button
					m_dicExtraCtrl = JSON.parse(map['extraCtrl']);
					var ctrlList = Object.keys(m_dicExtraCtrl);
					for(var listIdx = 0; listIdx < ctrlList.length; ++listIdx) {
						var ctrlListID = ctrlList[listIdx];
						var ctrl = document.getElementById(ctrlListID);
						var buttonList = m_dicExtraCtrl[ctrlListID];
						var tmpHtml = "";
						for(var ctrlIdx = 0; ctrlIdx < buttonList.length; ++ctrlIdx) {
							tmpHtml += buttonList[ctrlIdx];
						}
						ctrl.innerHTML += tmpHtml;
					}
			
					// Filter
					var dicFilterType = JSON.parse(map['filter']);
					var filter = dicFilterType.KEY_WORD;
					if(filter !== undefined && filter !== null) {
						m_dicFilterType["KEY_WORD"] = filter;
						var elementID = 'SEARCH_KEYWORD';
						var ctrlElement = document.getElementById(elementID);
						if( ctrlElement !== null && ctrlElement !== undefined) {
							ctrlElement.parentNode.removeChild(ctrlElement);
						}
			
						if(filter.lenth > 0) {
							var ctrlList = document.getElementById('uiSelectedList');
							var html = "<li id=" + elementID + "><p>" + filter + "<button type='button' onclick='onClickDeleteKeyword();'>삭제</button></p></li>";
							ctrlList.innerHTML = ctrlList.innerHTML + html;
						}
					}
			
					// Type
					var filterList;
					var inputList;
					filter = dicFilterType.WINE_TYPE;
					if(filter !== undefined && filter !== null) {
						filterList = Object.keys(filter);
						inputList = document.getElementById("filterListWineType").getElementsByTagName("input");
						if(filterList !== null && filterList !== undefined) {
							for(idx = 0; idx < filterList.length; ++idx) {
								var val = filterList[idx];
								for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
									if(inputList[inputIdx].value == val) {
										if(inputList[inputIdx].className == 'dynamic') {
											inputList[inputIdx].click();
										}else {
											inputList[inputIdx].click();
										}
										break;
									}
								}
							}
						}
					}
					// Price
					filter = dicFilterType.WINE_PRICE;
					if(filter !== undefined && filter !== null) {
						var lower = filter.lower;
						var upper = filter.upper;
						if(upper > maxPrice) upper = maxPrice;
						{
							m_priceSlider.update({
									from : lower / unitPrice,
									to : upper / unitPrice
								});
			
			
							$inputFrom = $(".js-input-from");
							$inputTo = $(".js-input-to")
							onPriceChanged(lower, upper);
			
							$inputFrom.prop("value", '₩ ' + m_nf.format(lower));
							$inputTo.prop("value", '₩ ' + m_nf.format(upper));
						}
					}
					// Food
					filter = dicFilterType.WINE_FOOD;
					if(filter !== undefined && filter !== null) {
						filterList = Object.keys(filter);
						inputList = document.getElementById("filterFoodMaster").getElementsByTagName("input");
						if(filterList !== null && filterList !== undefined) {
							for(idx = 0; idx < filterList.length; ++idx) {
								var val = filterList[idx];
								for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
									if(inputList[inputIdx].value == val) {
										if(inputList[inputIdx].className == 'dynamic') {
											inputList[inputIdx].click();
										}else {
											inputList[inputIdx].click();
										}
										break;
									}
								}
							}
						}
					}
			
					// SWEET
					filter = dicFilterType.TASTE_SWEET;
					if(filter !== undefined && filter.key !== undefined && filter.key !== null) {
						inputList = document.getElementById("inputListTasteSweet").getElementsByTagName("a");
						var val = filter.key;
						if(val > 0) {
							if(doubleClick) inputList[val - 1].click();
							inputList[val - 1].click();
						}
					}
					// Acidity
					filter = dicFilterType.TASTE_ACIDITY;
					if(filter !== undefined && filter.key !== undefined && filter.key !== null) {
						inputList = document.getElementById("inputListTasteAcidity").getElementsByTagName("a");
						var val = filter.key;
						if(val > 0) {
							if(doubleClick) inputList[val - 1].click();
							inputList[val - 1].click();
						}
					}
					// Body
					filter = dicFilterType.TASTE_BODY;
					if(filter !== undefined && filter.key !== undefined && filter.key !== null) {
						inputList = document.getElementById("inputListTasteBody").getElementsByTagName("a");
						var val = filter.key;
						if(val > 0) {
							if(doubleClick) inputList[val - 1].click();
							inputList[val - 1].click();
						}
					}
					// Tannin
					filter = dicFilterType.TASTE_TANNIN;
					if(filter !== undefined && filter.key !== undefined && filter.key !== null) {
						inputList = document.getElementById("inputListTasteTannin").getElementsByTagName("a");
						var val = filter.key;
						if(val > 0) {
							if(doubleClick) inputList[val - 1].click();
							inputList[val - 1].click();
						}
					}
			
					// Grape Variety
					filter = dicFilterType.WINE_GRAPE_VARIETY;
					if(filter !== undefined && filter !== null) {
						filterList = Object.keys(filter);
						inputList = document.getElementById("filterGrapeVarietyMaster").getElementsByTagName("input");
						if(filterList !== null && filterList !== undefined) {
							for(idx = 0; idx < filterList.length; ++idx) {
								var val = filterList[idx];
								for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
									var eventString = inputList[inputIdx].onclick + '';
									if(eventString.indexOf(val) > 0) {
										if(inputList[inputIdx].className == 'dynamic') {
											inputList[inputIdx].click();
										}else {
											inputList[inputIdx].click();
										}
										break;
									}
								}
							}
						}
					}
			
					// Wine Style
					filter = dicFilterType.WINE_STYLE;
					if(filter !== undefined && filter !== null) {
						filterList = Object.keys(filter);
						inputList = document.getElementById("filterWineStyleMaster").getElementsByTagName("input");
						if(filterList !== null && filterList !== undefined) {
							for(idx = 0; idx < filterList.length; ++idx) {
								var val = filterList[idx];
								for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
									var eventString = inputList[inputIdx].onclick + '';
									if(eventString.indexOf(val) > 0) {
										if(inputList[inputIdx].className == 'dynamic') {
											inputList[inputIdx].click();
										}else {
											inputList[inputIdx].click();
										}
										break;
									}
								}
							}
						}
					}
			
					// Wine Nation
					filter = dicFilterType.WINE_NATION;
					if(filter !== undefined && filter !== null) {
						filterList = Object.keys(filter);
						console.log(filterList);
						inputList = document.getElementById("filterNationMaster").getElementsByTagName("input");
						if(filterList !== null && filterList !== undefined) {
							for(idx = 0; idx < filterList.length; ++idx) {
								var val = filterList[idx];
								for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
									var eventString = inputList[inputIdx].onclick + '';
									if(eventString.indexOf(val) > 0) {
										console.log(inputList[inputIdx].className);
										if(inputList[inputIdx].className == 'dynamic') {
											inputList[inputIdx].click();
										}else {
											inputList[inputIdx].click();
										}
										break;
									}
								}
							}
						}
					}
			
					// Wine Area
					filter = dicFilterType.WINE_AREA;
					if(filter !== undefined && filter !== null) {
						filterList = Object.keys(filter);
						inputList = document.getElementById("filterAreaMaster").getElementsByTagName("input");
						if(filterList !== null && filterList !== undefined) {
							for(idx = 0; idx < filterList.length; ++idx) {
								var val = filterList[idx];
								for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
									var eventString = inputList[inputIdx].onclick + '';
									if(eventString.indexOf(val) > 0) {
										if(inputList[inputIdx].className == 'dynamic') {
											inputList[inputIdx].click();
										}else {
											inputList[inputIdx].click();
										}
										break;
									}
								}
							}
						}
					}
					m_searchOption = JSON.parse(map['option']);
					m_searchOption.pageSize = m_searchOption.pageSize * m_searchOption.page;
			
					return true;
				}
				function clearAllCheck() {
					var inputList = document.getElementById("filterAreaMaster").getElementsByTagName("input");
					for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
						inputList[inputIdx].checked = false;
					}
					inputList = document.getElementById("filterNationMaster").getElementsByTagName("input");
					for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
						inputList[inputIdx].checked = false;
					}
					inputList = document.getElementById("filterWineStyleMaster").getElementsByTagName("input");
					for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
						inputList[inputIdx].checked = false;
					}
					inputList = document.getElementById("filterGrapeVarietyMaster").getElementsByTagName("input");
					for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
						inputList[inputIdx].checked = false;
					}
					inputList = document.getElementById("filterFoodMaster").getElementsByTagName("input");
					for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
						inputList[inputIdx].checked = false;
					}
					inputList = document.getElementById("filterListWineType").getElementsByTagName("input");
					for(var inputIdx = 0; inputIdx < inputList.length; ++inputIdx) {
						inputList[inputIdx].checked = false;
					}
				}
			
				var m_stopSearch = false;
			
				function searchWine() {
					if(m_stopSearch) return;
					//m_searchOption.page = 1;
			
					var tempPage = m_searchOption.page;
					m_searchOption.page = 1;
					var uiNoResult = document.getElementById('wine_list_no');
					var uiWineList = document.getElementById('wine_list');
					var uiTotalCount = document.getElementById('lblTotalCount');
					var btnMore = document.getElementById('wineListMoreBtn');
			
					m_dicFilterType["NO_PRICE"] = document.getElementById('checkNoPriceInfo').checked;
			
					var map = {};
					map['filter'] = JSON.stringify(m_dicFilterType);
					map['option'] = JSON.stringify(m_searchOption);
					var url = '/13_search/proc/ajax_wine_list.php';
					var data = MakeFormData(url, map);
			
					m_searchOption.page = tempPage;
					requestPage(url, 'post', data, undefined, searchWineResult);
			
					saveSearchOption();
				}
			
				function saveSearchOption() {
					var map = {};
					map['filter'] = JSON.stringify(m_dicFilterType);
					map['option'] = JSON.stringify(m_searchOption);
					map['extraCtrl'] = JSON.stringify(m_dicExtraCtrl);
					map['goList'] = false;
					var listQuery = Base64Encode(JSON.stringify(map));
					var cookieKey = "LQ_WL";
					$.cookie(cookieKey, listQuery, { path: "/" });
				}
				function searchWineResult(retObj) {
					var uiNoResult = document.getElementById('wine_list_no');
					var uiWineList = document.getElementById('wine_list');
					var uiTotalCount = document.getElementById('lblTotalCount');
					var btnMore = document.getElementById('wineListMoreBtn');
					if(retObj.result) {
			
						obj = JSON.parse(retObj.response);
						if( obj.TotalCnt == 0 ) {
							uiNoResult.style.display = "block";
							uiWineList.style.display = "none";
							var nf = new Intl.NumberFormat();
							uiTotalCount.innerHTML = "(" + nf.format(obj.TotalCnt) +")";
							btnMore.style.display = "none";
						}else {
							uiNoResult.style.display = "none";
							uiWineList.style.display = "block";
							wine_list.innerHTML = obj.html;
							m_searchOption.condition = obj.condition;
							var nf = new Intl.NumberFormat();
							uiTotalCount.innerHTML = "(" + nf.format(obj.TotalCnt) +")";
							if(obj.moreFlag) {
								btnMore.style.display = "initial";
							}else {
								btnMore.style.display = "none";
							}
						}
					}
				}
			
				function searchWineMore() {
					var uiNoResult = document.getElementById('wine_list_no');
					var uiWineList = document.getElementById('wine_list');
					var uiTotalCount = document.getElementById('lblTotalCount');
					var btnMore = document.getElementById('wineListMoreBtn');
			
					++m_searchOption.page;
					var map = {};
			
					map['option'] = JSON.stringify(m_searchOption);
					var url = '/13_search/proc/ajax_wine_list_more.php';
					var data = MakeFormData(url, map);
			
					requestPage(url, 'post', data, undefined, searchWineMoreResult);
			
					saveSearchOption();
				}
				function searchWineMoreResult(retObj) {
					var uiNoResult = document.getElementById('wine_list_no');
					var uiWineList = document.getElementById('wine_list');
					var uiTotalCount = document.getElementById('lblTotalCount');
					var btnMore = document.getElementById('wineListMoreBtn');
					if(retObj.result) {
						obj = JSON.parse(retObj.response);
						wine_list.innerHTML += obj.html;
						if(obj.moreFlag) {
							btnMore.style.display = "initial";
						}else {
							btnMore.style.display = "none";
						}
					}
				}
			
				function sortWine(ctrlCombo) {
					m_searchOption.page = 1;
					m_searchOption.sort = ctrlCombo.value;
					var uiNoResult = document.getElementById('wine_list_no');
					var uiWineList = document.getElementById('wine_list');
					var uiTotalCount = document.getElementById('lblTotalCount');
					var btnMore = document.getElementById('wineListMoreBtn');
			
					var map = {};
					map['filter'] = JSON.stringify(m_dicFilterType);
					map['option'] = JSON.stringify(m_searchOption);
					var url = '/13_search/proc/ajax_wine_list.php';
					var data = MakeFormData(url, map);
			
					requestPage(url, 'post', data, undefined, sortWineResult);
				}
				function sortWineResult(retObj) {
					var uiNoResult = document.getElementById('wine_list_no');
					var uiWineList = document.getElementById('wine_list');
					var uiTotalCount = document.getElementById('lblTotalCount');
					var btnMore = document.getElementById('wineListMoreBtn');
					if(retObj.result) {
						obj = JSON.parse(retObj.response);
						wine_list.innerHTML = obj.html;
						m_searchOption.condition = obj.condition;
						var nf = new Intl.NumberFormat();
						uiTotalCount.innerHTML = "(" + nf.format(obj.TotalCnt) +")";
						if(obj.moreFlag) {
							btnMore.style.display = "initial";
						}else {
							btnMore.style.display = "none";
						}
					}
				}
				function ClearAll() {
					var cookieKey = "LQ_WL";
					$.cookie(cookieKey, '', {path: "/", expires: -1});
					cookieKey = "LQ_WLL";
					$.cookie(cookieKey, '', {path: "/", expires: -1});
					location.reload();
				}
			
				$(document).ready(function () {
					m_stopSearch = true;
					if(!checkListQuery())
						checkMainFilter();
					m_stopSearch = false;
					searchWine();
			
					m_searchOption.pageSize = 10;
				});
			</script>
		
		    <!-- scripts  -->
		    <script src="${ path }/js/jquery.min.js"></script>
			<script src="${ path }/js/browser.min.js"></script>
			<script src="${ path }/js/breakpoints.min.js"></script>
			<script src="${ path }/js/util.js"></script>
			<script src="${ path }/js/menubar.js"></script>
</body>
</html>