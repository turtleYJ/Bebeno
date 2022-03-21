<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
	// 줄바꿈
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header_shop.jsp" />

	<div class="wrap-board container">
        <div class="board-view"><!-- 상세보기 -->
            <div class="detail-header">
                <div class="tit-area">
                    <p><em class="board-badge badge-red-line">와인샵 &amp; 아울렛 </em></p>
                    <h1>${ shop.korBname }  <span class="name-en"></span></h1>
                </div><!-- .tit-area -->
            </div><!-- .detail-header -->

            <div class="detail-area dictionary">
                <div class="detail-event-place">
                    <table width="100%">
                    	<tbody>
	                        <tr>
	                            <th>주소</th>
	                            <td><a href="javascript:funMapOpen('${ shop.korBname }', '${ shop.address1 } ${ shop.address2 } ');" class="link">${ shop.address1 } ${ shop.address2 }<br></a></td>
	                            <td rowspan="2" class="text-center">
	                                <img src="https://wine21.speedgabia.com/COMPANY_MST/LOGO/0035582.jpg" alt="" class="img-clogo">
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>전화번호</th>
	                            <td>${ shop.phone }</td>
	                        </tr>
	                       	<!-- 홈페이지 관련 코드 추가할 것 -->               
                        </tbody>
               		</table>
                </div><!-- .detail-event-place -->
                <div class="detail-txt">
                    <!-- 에디터 영역 -->
                    <p>
                        
                    </p>
                    <p>${ fn:replace(shop.content, cn, br)}</p>

                    <p><br></p>
                    
                    <!-- 
                    <div style="overflow: hidden;">
				        <div class="img_container">
				        	<c:forEach var="file" items="${ shop.files }">
		        		    	<div class="inner">
				                	<img src="${ path }/resources/upload/shop/${ file.file_renamedFileName }">
				            	</div>
				        	</c:forEach>				            
				        </div>
				    </div>
				    
				    <div class="img_btn">
					    <button class="버튼1">1</button>
					    <button class="버튼2">2</button>
					    <button class="버튼3">3</button>
				    </div>
                    -->
                    <c:forEach var="file" items="${ shop.files }">
	       		    	<div>
		                	<img src="${ path }/resources/upload/shop/${ file.file_renamedFileName }" class="img-responsive center-block" style="width: 100vw; height: 35vw;">
		            	</div>
		        	</c:forEach>		
    
                    <p><br></p>
                    
                    <p>${ fn:replace(shop.content2, cn, br)}</p>
                    
                    <p></p>
                </div><!--.detail-txt -->
            </div><!--.detail-area -->
        </div><!--.board-view -->
        <div class="pagination-box">
            <button type="button" onclick="location.href='${ path }/shop/list'" id="storeListBtn" class="button button-small button-wine">목록</button>
            <c:if test="${ loginMember.no eq shop.writerNo }">
	            <button type="button" onclick="location.href='${ path }/shop/update?no=${ shop.no }'" class="button button-small button-wine">수정</button>
	            <button type="button" onclick="location.href='${ path }/shop/delete?no=${ shop.no }'" class="button button-small button-wine">삭제</button>
            </c:if>
        </div>
        

    </div>
    <script type="text/javascript">
		// Naver Map
		funMapOpen = function(Tit, Addr) {
			var PageUrl = "https://www.wine21.com/01_include/function/Lib_NaverMap.php?Title="+ encodeURIComponent(Tit) +"&Address="+ encodeURIComponent(Addr);
			window.open(PageUrl, "_blank", "width=1000, height=600");
		}
		
		
		// 버튼을 누르면
        // transform: translate(-100vw)
		// 슬라이드 기능 구현
        document.querySelector('.버튼1').addEventListener('click', function() {
            document.querySelector('.img_container').style.transform = 'translate(0vw)';
        })
        document.querySelector('.버튼2').addEventListener('click', function() {
            document.querySelector('.img_container').style.transform = 'translate(-100vw)';
        })

        document.querySelector('.버튼3').addEventListener('click', function() {
            document.querySelector('.img_container').style.transform = 'translate(-200vw)';
        })
		
    </script>
    
    <jsp:include page="/WEB-INF/views/common/footer_shop.jsp" />