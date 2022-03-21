<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/wagle_board/wagle_header.jsp" />

<body>
    <section class="wagle_view_box">
        <div id="wagle_img_box">
            <div id="test-slide" class="swiper mySwiper">
                <!-- 업로드한 파일들을 forEach문을 이용해 <img> 태그에 표시 -->
                <c:forEach var="file" items="${ wagleboard.files }"  >
                
                    <img src="${ path }/resources/upload/wagle/${ file.renamedFileName }">

                    <br><br><br>
                </c:forEach>
            </div>
        </div>
        <div class="writer_info">

        	<!-- 
            <div class="member_profile_img" th:src="${ member.profile_pic }">
        	 -->
            <div class="member_profile_img" >

                <!-- 작성목록 -->
                <a href="">
                <!-- db연결 후 삭제 -->
                <img src="${ path }/" class="member_profile_img">
            </div>
            <div class="member_nickname" th:text="${ wagleboard.writerNo }">
                <!-- db연결 후 삭제 -->
                <div class="member_nickname">${ wagleboard.nicname }</div>
            </a>
            </div>
        </div>
        <table class="wagle-info-area">
            <tr>
                <th>제목</th>
                <td>${ wagleboard.title }</td>
<%--                 <td th:text="${ wagle. }"></td> --%>
            </tr>
            <!--  
            -->
            <tr>
                <th>장소</th>
                <td>${ wagleboard.shop_no }</td>
<%--                 <td th:text="${ wagle. }"></td> --%>
            </tr>
            <!-- <div>와인 필터</div> -->
            <tr>
                <th>내용</th>
                <td>
                    ${ wagleboard.content }
                </td>
            </tr>    
        </table>
        <table>
        <th class="th_btn_box" colspan="2">
            <button class="th_btn" type="button" onclick="location.href='${ path }/wagle_board/wagle_update?no=${ wagle.no }'">수정</button>
            <button class="th_btn" type="button" onclick="location.href='${ path }/wagle_board/delete?no=${ wagle.no }" id="btnDelete">삭제</button>
            <input class="th_btn" type="button" onclick="location.href='${ path }/wagle_board/wagle_list'" value="목록으로">
            <!-- 스크랩 post로 전송하는 form -->
            <form action="${ path }/mypage/scrap" method="post" >
            	<input type="hidden" name="wagleNo" id="wagleNo" value="${wagleboard.no}">
	            <button class="th_btn" type="submit" id="scrapBtn" th:onclick="">스크랩</button>
            </form>
        </th>
        </table>
    </section>
    <section class="wagle_view_reply_box">
        <div id="wagle_reply_area">
            <!-- 댓글 -->
            <div id="comment-container">
                <h3>댓글</h3>
                  <c:if test="${ board.replyCount != 0 }">
			        <span>
			        	[&nbsp;<c:out value="${ board.replyCount }" />&nbsp;]
			        </span>
			        </c:if>
                <div class="comment-editor"> 
                    <form action="${ pageContext.request.contextPath }/wagle_board/reply" method="POST" >
                        <input type="hidden" name="boardNo" value="${ wagle_board.no }">
                        <textarea name="content" id="replyContent" cols="55" rows="3"></textarea>
                        <button type="submit" id="btn-insert">등록</button>	    			
                    </form>
                </div>
            </div>
            
            
            
            <table id="tbl-comment">
                <c:forEach var="reply" items="${ Reply.replies }">
                <tr class="level1">
                    <td>
                        <sub class="comment-writer"><c:out value="${ reply.writerId }"/></sub>
                        <sub class="comment-date"><fmt:formatDate type="date" value="${ reply.createDate }"/></sub>
                        <br>
                        <c:out value="${ reply.content }"/>
                    </td>
                    <td>
                        <c:if test="${ ! empty loginMember && loginMember.id == reply.writerId }">
                            <button class="btn-delete">삭제</button>
                        </c:if>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
	</section>
</body>
	
<script>
	$(document).ready(() => {
    	$("#btnDelete").on("click", () => {
        	if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
            	location.replace("${ pageContext.request.contextPath }/board/delete?no=${ board.no }");
            }
        })
            
        $("#replyContent").on("focus", (e) => {
        	if(${ empty loginMember }) {
            	alert("로그인 후 이용해주세요!");
                    
                $("#userId").focus();				
            }
        });
	});
</script>
<script src="${ path }/resources/js/wagle_view.js"></script>
</html>