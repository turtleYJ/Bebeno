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

    <link rel="stylesheet" href="%{ path }/resources/css_wagle/wagle_view.css">
    
    <script src="${ path }/resources/js/jquery-3.6.0.js"></script>

    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
</head>
<body>
    <header>

    </header>
    <section class="wagle_nav">
        <div class="wagle_buttons">
            <ul class="wagle_btn">
                <li id="menu_btn">전체보기</li>
                <li id="menu_btn">와인</li>
                <li id="menu_btn">바틀샵</li>
                <li id="menu_btn">와인바</li>
            </ul>
        </div>
        <div class="wagle_my_write_box">
            <ul class="wagle_write">
                <li><a href="${ path }/wagle_write.jsp">글쓰기</a></li>
                <li><a href="${ path }/wagle_write_manage.jsp">내 글 관리</a></li>
            </ul>
        </div>
    </section>
    <section class="wagle_view_box">
        <div id="wagle_img_box">
            <div id="test-slide" class="swiper mySwiper">
                <!-- 업로드한 파일들을 forEach문을 이용해 <img> 태그에 표시 -->
                <c:forEach var="imageFileName" items="${ map.fileList}"  >
                    <img src="${pageContext.request.contextPath }/download?imageFileName=${imageFileName }">
                    <br><br><br>
                </c:forEach>
                <!-- db연결 후 삭제 / 사진 슬라이드 -->
                <div class="slick">
                    <div><img src="./img/3.jpg" alt=""></div>
                    <div><img src="./img/2.jpg" alt=""></div>
                    <div><img src="./img/4.jpeg" alt=""></div>
                </div>
            </div>
        </div>
        <div class="writer_info">
            
            <div class="member_profile_img" th:src="${ member.profile_pic }">
                <!-- 작성목록 -->
                <a href="">
                <!-- db연결 후 삭제 -->
                <img src="./img/3.jpg" alt="" class="member_profile_img">
            </div>
            <div class="member_nickname" th:text="${ member.nickname }">
                <!-- db연결 후 삭제 -->
                <div class="member_nickname">닉네임자리</div>
            </a>
            </div>
        </div>
        <table class="wagle-info-area">
            <h1 th:text="${ wagle_board.title }">제목제목</h1>
            <tr>
                <th>장소</th>
                <td th:text="${ bottleshop.name }"></td>
            </tr>
            <tr>
                <th>와인명</th>
                <td th:text="${ wine.name }"></td>
            </tr>
            <!-- <div>와인 필터</div> -->
            <tr>
                <th>내용</th>
                <td th:text="${ wagle_board.content }">
                    <!-- db추가 후 삭제 -->
                    예시입니다. 내용내용
                </td>
            </tr>    
        </table>
        <table>
        <th class="th_btn_box" colspan="2">
            <button class="th_btn" type="button" th:onclick="|location.href='@{/wagle_board/update(no=${wagle_board.no})}'|">수정</button>
            <button class="th_btn" type="button" id="btnDelete">삭제</button>
            <input class="th_btn" type="button" th:onclick="|location.replace('@{/wagle_board/list}')|" value="목록으로">
            <button class="th_btn" type="button" th:onclick="">스크랩</button>
        </th>
        </table>
    </section>
    <section class="wagle_view_reply_box">
        <div id="wagle_reply_area">
            <!-- 댓글 -->
            <div id="comment-container">
                <h3>댓글</h3>
                <div class="comment-editor">
                    <form action="${ pageContext.request.contextPath }/wagle_board/reply" method="POST">
                        <input type="hidden" name="boardNo" value="${ wagle_board.no }">
                        <textarea name="content" id="replyContent" cols="55" rows="3"></textarea>
                        <button type="submit" id="btn-insert">등록</button>	    			
                    </form>
                </div>
            </div>
            <table id="tbl-comment">
                <c:forEach var="reply" items="${ wagle_board.replies }">
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
    <script src="./wagle_view.js"></script>
</html>