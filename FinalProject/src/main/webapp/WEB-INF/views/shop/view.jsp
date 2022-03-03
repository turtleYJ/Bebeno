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
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shop_view.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<div class="wrap-board container">
        <div class="board-view"><!-- 상세보기 -->
            <div class="detail-header">
                <div class="tit-area">
                    <p><em class="board-badge badge-red-line">와인샵 &amp; 아울렛 </em></p>
                    <h1>꺄브 일산  <span class="name-en"></span></h1>
                </div><!-- .tit-area -->
            </div><!-- .detail-header -->

            <div class="detail-area dictionary">
                <div class="detail-event-place">
                    <table width="100%">
                                                    <tbody><tr>
                            <th>주소</th>
                            <td><a href="javascript:funMapOpen('꺄브 일산', '경기 고양시 일산동구 장항로 165 (장항동) ');" class="link">경기 고양시 일산동구 장항로 165 (장항동)<br></a></td>
                            <td rowspan="2" class="text-center">
                                <img src="https://wine21.speedgabia.com/COMPANY_MST/LOGO/0035582.jpg" alt="" class="img-clogo">
                            </td>
                        </tr>
                                                    <tr>
                            <th>전화번호</th>
                            <td>031-908-9632</td>
                        </tr>
                                                </tbody></table>
                </div><!-- .detail-event-place -->
                <div class="detail-txt">
                    <!-- 에디터 영역 -->
                    <p>
                        
                    </p>
                    <p>세심한 와인정보와 착한 가격의 환상적인 콜라보!</p>

                    <p><br></p>
                        
                    <p>와인 수입사가 직접 운영하며 아주 합리적인 가격으로 좋은 품질의 와인을 판매하는 일산 와인의 메카!</p>
                    <p><br></p>
                    <p>프랑스 보르도 1등급 와인을 비롯해 &nbsp;유기농 와인, 가성비 와인등 다양하게 구비되어 있으며 매주 다른 컨셉의 와인을 추천, 꺄브만의 특별가로 구매하실 수 있습니다.</p>
                    <p><br></p>
                    <p>와인뿐 아니라 담기는 용기까지 환경을 생각해 준비하는 꺄브! 정직하고 건강한 와인들을 만나보세요!</p>
                    <p><br></p>

                    <p><img class="shop_detailImg" src="https://wine21.speedgabia.com/COMPANY_MST/smarteditor/202202/20220204135124866844.jpg"></p>

                    <p><img class="shop_detailImg" src="https://wine21.speedgabia.com/COMPANY_MST/smarteditor/202202/20220204135136385899.jpg"></p>
                    <p><img class="shop_detailImg" src="https://wine21.speedgabia.com/COMPANY_MST/smarteditor/202202/20220204135515750112.png"></p>
                    <p><br></p>
                    <p><strong>[와인문의]</strong></p>
                    <p>전화번호 ) 031. 908. 9632</p>
                    <p>카카오채팅 ) http://pf.kakao.com/_DsRUT/chat</p>
                    <p>&nbsp;</p>
                    <p><strong>[이메일]</strong></p>
                    <p><a href="mailto:kil@lbwine.com">kil@lbwine.com</a></p>
                    <p>&nbsp;</p>
                    <p><strong>[영업일시]</strong></p>
                    <p>월~금 / 08:30 ~18:00</p><p>토, 일, 공휴일 휴무</p>
                    <p>&nbsp;</p>
                    <p><strong>[주소]</strong></p>
                    <p>경기도 고양시 일산동구 장항로 165</p>
                    <p>(1층, 장항동)</p><p>&nbsp;</p>
                    <p><strong>[오시는 길]</strong></p>
                    <p>1. 3호선 백석역 도보 20분</p>
                    <p>2. 069 마을버스 → SK 주유소 하차 (도보 5분)</p>
                    <p>&nbsp;</p>
                    <p>*주차 가능*</p>							
                    <p></p>
                    <br>
                    <p>
                    </p>
                    <p>Fantastic collaboration of meticulous wine information and reasonable price!</p>
                    <p><br></p>
                    <p>Ilsan Wine Mecca, which is directly operated by a wine importer and sells high-quality wines at very reasonable prices!</p>
                    <p><br></p>
                    <p>We have a wide variety of wines, including first-class wines from Bordeaux, France, organic wines, and value-for-money wines.</p>
                    <p>We recommend a different concept wine every week, and you can purchase it at a special price of CAVE.</p>
                    <p><br></p>
                    <p>CAVE prepares not only wine but also the container in consideration of the environment. Come and visit CAVE and meet our honest wines!<br><br></p>
                    <p></p>
                </div><!--.detail-txt -->
            </div><!--.detail-area -->
        </div><!--.board-view -->
        <div class="pagination-box">
            <button id="storeListBtn" class="button button-small button-wine">목록</button>
        </div>
        <!-- 관련상품 -->
        <div class="board-related-list">
            <div class="board-top mb-nl">
                <h2 class="cate-tit">상품리스트<span class="cate-tit-total" id="cate-tit-total-1">(50)</span></h2>
                <div class="board-top-sch">
                    <select class="cate-filter" id="inOrder1">
                        <option value="a.CREATE_DATE|DESC">최근 등록순</option>
                        <option value="b.PRICE|ASC">가격 낮은순</option>
                        <option value="b.PRICE|DESC">가격 높은순</option>
                        <option value="b.POINT2|DESC">평점순</option>
                        <!-- <option>점수 높은순</option> -->
                    </select>
                    <div class="page-top-sch">
                        <button class="btn-sch">검색</button>
                        <input type="text" id="inKeyword1" name="inKeyword1" placeholder="결과 내 검색" maxlength="30">
                    </div><!--.page-top-sch -->
                </div><!--.board-top-sch -->
            </div><!--.board-top -->
            <div class="board-list board-list-wine"><!-- 목록 10개 -->
                <ul id="wine_list_no" style="display:none;">
                    <li class="no-list">해당 상품이 없습니다.</li>
                </ul>
                <ul id="wine_list">
                <li> 											<div class="thumb"> 												<a href="javascript:goWineViewDirect(150567)"><img src="https://wine21.speedgabia.com/WINE_MST/TITLE/0150000/W0150567.jpg" alt="꼬또 데 이마스  그랑 레세르바"></a> 											</div> 											<div class="txt-area"> 												<div class="cnt-header"> 													<p class="winery"><a href="javascript:goWineViewDirect(150567)">엘 꼬또 데 리오하&nbsp;El Coto De Rioja</a></p> 													<h3> 														<a href="javascript:goWineViewDirect(150567)" class="btnView"> 															꼬또 데 이마스  그랑 레세르바 															<p class="wine-name-en">Coto de Imaz Gran Reserva</p> 														</a> 													</h3> 												</div> 												<div class="write-info wine-info wine-info-01"> 													<span class="country">스페인(Spain)</span> 													<span class="nation">리오하</span> 												</div> 												<div class="write-info wine-info wine-info-02"> 													<em class="board-badge badge-red">레드</em> 													<span class="price">81,000원 (750ml)</span> 													 													<span class="score-star"><span class="star-rating"><em style="width:80%"></em></span>4</span> 												</div> 											</div> 										</li><li> 											<div class="thumb"> 												<a href="javascript:goWineViewDirect(150566)"><img src="https://wine21.speedgabia.com/WINE_MST/TITLE/0150000/W0150566.jpg" alt="꼬또 데 이마스 레세르바"></a> 											</div> 											<div class="txt-area"> 												<div class="cnt-header"> 													<p class="winery"><a href="javascript:goWineViewDirect(150566)">엘 꼬또 데 리오하&nbsp;El Coto De Rioja</a></p> 													<h3> 														<a href="javascript:goWineViewDirect(150566)" class="btnView"> 															꼬또 데 이마스 레세르바 															<p class="wine-name-en">Coto de Imaz Reserva</p> 														</a> 													</h3> 												</div> 												<div class="write-info wine-info wine-info-01"> 													<span class="country">스페인(Spain)</span> 													<span class="nation">리오하</span> 												</div> 												<div class="write-info wine-info wine-info-02"> 													<em class="board-badge badge-red">레드</em> 													<span class="price">가격정보없음 (750ml)</span> 													 													<span class="score-star"><span class="star-rating"><em style="width:0%"></em></span>0</span> 												</div> 											</div> 										</li><li> 											<div class="thumb"> 												<a href="javascript:goWineViewDirect(147938)"><img src="https://wine21.speedgabia.com/WINE_MST/TITLE/0147000/W0147938.jpg" alt="조셉 페리에, 뀌베 로얄 브뤼"></a> 											</div> 											<div class="txt-area"> 												<div class="cnt-header"> 													<p class="winery"><a href="javascript:goWineViewDirect(147938)">조셉 페리에&nbsp;Joseph Perrier</a></p> 													<h3> 														<a href="javascript:goWineViewDirect(147938)" class="btnView"> 															조셉 페리에, 뀌베 로얄 브뤼 															<p class="wine-name-en">Joseph Perrier, Cuvee Royal Brut</p> 														</a> 													</h3> 												</div> 												<div class="write-info wine-info wine-info-01"> 													<span class="country">프랑스(France)</span> 													<span class="nation">샹빠뉴</span> 												</div> 												<div class="write-info wine-info wine-info-02"> 													<em class="board-badge badge-yellow">스파클링</em> 													<span class="price">143,000원 (750ml)</span> 													<span class="score-num"> 92점</span> 													<span class="score-star"><span class="star-rating"><em style="width:76%"></em></span>3.8</span> 												</div> 											</div> 										</li><li> 											<div class="thumb"> 												<a href="javascript:goWineViewDirect(147939)"><img src="https://wine21.speedgabia.com/WINE_MST/TITLE/0147000/W0147939.jpg" alt="조셉 페리에, 블랑 드 블랑"></a> 											</div> 											<div class="txt-area"> 												<div class="cnt-header"> 													<p class="winery"><a href="javascript:goWineViewDirect(147939)">조셉 페리에&nbsp;Joseph Perrier</a></p> 													<h3> 														<a href="javascript:goWineViewDirect(147939)" class="btnView"> 															조셉 페리에, 블랑 드 블랑 															<p class="wine-name-en">Joseph Perrier, Cuvee Royal Blanc de Blanc</p> 														</a> 													</h3> 												</div> 												<div class="write-info wine-info wine-info-01"> 													<span class="country">프랑스(France)</span> 													<span class="nation">발레 드 라 마른</span> 												</div> 												<div class="write-info wine-info wine-info-02"> 													<em class="board-badge badge-yellow">스파클링</em> 													<span class="price">198,000원 (750ml)</span> 													 													<span class="score-star"><span class="star-rating"><em style="width:76%"></em></span>3.8</span> 												</div> 											</div> 										</li><li> 											<div class="thumb"> 												<a href="javascript:goWineViewDirect(147940)"><img src="https://wine21.speedgabia.com/WINE_MST/TITLE/0147000/W0147940.jpg" alt="조셉 페리에, 뀌베 로얄 뀌베 조세핀"></a> 											</div> 											<div class="txt-area"> 												<div class="cnt-header"> 													<p class="winery"><a href="javascript:goWineViewDirect(147940)">조셉 페리에&nbsp;Joseph Perrier</a></p> 													<h3> 														<a href="javascript:goWineViewDirect(147940)" class="btnView"> 															조셉 페리에, 뀌베 로얄 뀌베 조세핀 															<p class="wine-name-en">Joseph Perrier, Cuvee Royal Cuvee Josephin</p> 														</a> 													</h3> 												</div> 												<div class="write-info wine-info wine-info-01"> 													<span class="country">프랑스(France)</span> 													<span class="nation">샹빠뉴</span> 												</div> 												<div class="write-info wine-info wine-info-02"> 													<em class="board-badge badge-yellow">스파클링</em> 													<span class="price">407,000원 (750ml)</span> 													<span class="score-num"> 95점</span> 													<span class="score-star"><span class="star-rating"><em style="width:78%"></em></span>3.9</span> 												</div> 											</div> 										</li><li> 											<div class="thumb"> 												<a href="javascript:goWineViewDirect(144567)"><img src="https://wine21.speedgabia.com/WINE_MST/TITLE/0144000/W0144567.jpg" alt="위라 위라, 처치 블록"></a> 											</div> 											<div class="txt-area"> 												<div class="cnt-header"> 													<p class="winery"><a href="javascript:goWineViewDirect(144567)">위라 위라 빈야즈&nbsp;Wirra Wirra Vineyards</a></p> 													<h3> 														<a href="javascript:goWineViewDirect(144567)" class="btnView"> 															위라 위라, 처치 블록 															<p class="wine-name-en">Wirra Wirra, Church Block</p> 														</a> 													</h3> 												</div> 												<div class="write-info wine-info wine-info-01"> 													<span class="country">호주(Australia)</span> 													<span class="nation">맥라렌 베일</span> 												</div> 												<div class="write-info wine-info wine-info-02"> 													<em class="board-badge badge-red">레드</em> 													<span class="price">58,000원 (750ml)</span> 													 													<span class="score-star"><span class="star-rating"><em style="width:72%"></em></span>3.6</span> 												</div> 											</div> 										</li><li> 											<div class="thumb"> 												<a href="javascript:goWineViewDirect(144569)"><img src="https://wine21.speedgabia.com/WINE_MST/TITLE/0144000/W0144569.jpg" alt="위라 위라, 알에스더블유"></a> 											</div> 											<div class="txt-area"> 												<div class="cnt-header"> 													<p class="winery"><a href="javascript:goWineViewDirect(144569)">위라 위라 빈야즈&nbsp;Wirra Wirra Vineyards</a></p> 													<h3> 														<a href="javascript:goWineViewDirect(144569)" class="btnView"> 															위라 위라, 알에스더블유 															<p class="wine-name-en">Wirra Wirra, RSW</p> 														</a> 													</h3> 												</div> 												<div class="write-info wine-info wine-info-01"> 													<span class="country">호주(Australia)</span> 													<span class="nation">맥라렌 베일</span> 												</div> 												<div class="write-info wine-info wine-info-02"> 													<em class="board-badge badge-red">레드</em> 													<span class="price">140,000원 (750ml)</span> 													 													<span class="score-star"><span class="star-rating"><em style="width:0%"></em></span>0</span> 												</div> 											</div> 										</li><li> 											<div class="thumb"> 												<a href="javascript:goWineViewDirect(144571)"><img src="https://wine21.speedgabia.com/WINE_MST/TITLE/0144000/W0144571.jpg" alt="위라 위라, 우드헨지 쉬라즈"></a> 											</div> 											<div class="txt-area"> 												<div class="cnt-header"> 													<p class="winery"><a href="javascript:goWineViewDirect(144571)">위라 위라 빈야즈&nbsp;Wirra Wirra Vineyards</a></p> 													<h3> 														<a href="javascript:goWineViewDirect(144571)" class="btnView"> 															위라 위라, 우드헨지 쉬라즈 															<p class="wine-name-en">Wirra Wirra, Woodhenge Shiraz</p> 														</a> 													</h3> 												</div> 												<div class="write-info wine-info wine-info-01"> 													<span class="country">호주(Australia)</span> 													<span class="nation">맥라렌 베일</span> 												</div> 												<div class="write-info wine-info wine-info-02"> 													<em class="board-badge badge-red">레드</em> 													<span class="price">82,000원 (750ml)</span> 													 													<span class="score-star"><span class="star-rating"><em style="width:0%"></em></span>0</span> 												</div> 											</div> 										</li><li> 											<div class="thumb"> 												<a href="javascript:goWineViewDirect(160991)"><img src="https://wine21.speedgabia.com/WINE_MST/TITLE/0160000/W0160991.png" alt="위라 위라, 애들레이드 샤도네이"></a> 											</div> 											<div class="txt-area"> 												<div class="cnt-header"> 													<p class="winery"><a href="javascript:goWineViewDirect(160991)">위라 위라 빈야즈&nbsp;Wirra Wirra Vineyards</a></p> 													<h3> 														<a href="javascript:goWineViewDirect(160991)" class="btnView"> 															위라 위라, 애들레이드 샤도네이 															<p class="wine-name-en">Wirra Wirra, Adelaide Chardonnay</p> 														</a> 													</h3> 												</div> 												<div class="write-info wine-info wine-info-01"> 													<span class="country">호주(Australia)</span> 													<span class="nation">애들레이드 힐즈</span> 												</div> 												<div class="write-info wine-info wine-info-02"> 													<em class="board-badge badge-blue">화이트</em> 													<span class="price">41,000원 (750ml)</span> 													 													<span class="score-star"><span class="star-rating"><em style="width:0%"></em></span>0</span> 												</div> 											</div> 										</li><li> 											<div class="thumb"> 												<a href="javascript:goWineViewDirect(160992)"><img src="https://wine21.speedgabia.com/WINE_MST/TITLE/0160000/W0160992.png" alt="위라 위라, 애들레이드 쉬라즈"></a> 											</div> 											<div class="txt-area"> 												<div class="cnt-header"> 													<p class="winery"><a href="javascript:goWineViewDirect(160992)">위라 위라 빈야즈&nbsp;Wirra Wirra Vineyards</a></p> 													<h3> 														<a href="javascript:goWineViewDirect(160992)" class="btnView"> 															위라 위라, 애들레이드 쉬라즈 															<p class="wine-name-en">Wirra Wirra, Adelaide Shiraz</p> 														</a> 													</h3> 												</div> 												<div class="write-info wine-info wine-info-01"> 													<span class="country">호주(Australia)</span> 													<span class="nation">애들레이드 힐즈</span> 												</div> 												<div class="write-info wine-info wine-info-02"> 													<em class="board-badge badge-red">레드</em> 													<span class="price">41,000원 (750ml)</span> 													 													<span class="score-star"><span class="star-rating"><em style="width:60%"></em></span>3</span> 												</div> 											</div> 										</li></ul>
            </div><!--.board-list -->
            <div class="pagination-box"><button id="WineListMoreBtn" class="button button-large button-white-gray">더보기</button></div>
        </div><!--.board-related-list -->

    </div>
</body>
</html>