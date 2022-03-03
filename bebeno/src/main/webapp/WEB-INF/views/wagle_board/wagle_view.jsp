<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세페이지</title>
    <script th:src="@{/js/jquery-3.6.0.js}"></script>
</head>
<body>
    <section>
        <div class="community-buttons">
            <div>
                <button>전체보기</button>
                <button>와인</button>
                <button>바틀샵</button>
                <button>와인바</button>
            </div>
            <div>
                <a href="./community-write.html">글쓰기</a>
                <a href="./community-writemanage.html">내 글 관리</a>
            </div>
        </div>
        <div id="community-pic-area">
            <div>
                <!-- 사진 여러장 첨부 (미리보기) -->
            </div>
        </div>
        <table id="community-info-area">
            <h1 th:text="${ board.title }">제목제목</h1>
            <tr>
                <th>상호명</th>
                <td th:text="${ bottleshop.name }"></td>
            </tr>
            <tr>
                <th>와인명</th>
                <td th:text="${ wine.name }"></td>
            </tr>
            <!-- <div>와인 필터</div> -->
            <tr>
                <th>내용</th>
                <td th:text="${ board.content }"></td>
            </tr>    
        </table>
        <div id="member_info">
            <div id="">${ member.profile_pic }</div>
            <div id="">${ member.nickname }</div>
        </div>
		<tr>
			<th colspan="2">
				<c:if test="${ ! empty loginMember && loginMember.id == board.writerId }">
					<button type="button" onclick="location.href='${ pageContext.request.contextPath }/board/update?no=${ board.no }'">수정</button>
					<button type="button" id="btnDelete">삭제</button>
				</c:if>

				<button type="button" onclick="location.href='${ pageContext.request.contextPath }/board/list'">목록으로</button>
			</th>
		</tr>
    </section>
        <div id="wagle_reply_area">
            <!-- 댓글 -->
            <div id="comment-container">
                <div class="comment-editor">
                    <form action="${ pageContext.request.contextPath }/board/reply" method="POST">
                        <input type="hidden" name="boardNo" value="${ board.no }">
                        <textarea name="content" id="replyContent" cols="55" rows="3"></textarea>
                        <button type="submit" id="btn-insert">등록</button>	    			
                    </form>
                </div>
            </div>
            <table id="tbl-comment">
                <c:forEach var="reply" items="${ board.replies }">
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
</body>
</html>