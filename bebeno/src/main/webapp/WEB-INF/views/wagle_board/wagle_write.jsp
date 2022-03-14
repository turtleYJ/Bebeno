<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/wagle_board/wagle_header.jsp" />
	
    <h2>글 작성하기</h2>
    <input type="hidden" name="no" th:value="${ wagle_board.no }">
    <table class="tbl_wagle_board">
        <th class="th_box">작성자</th>
            <td><input type="text" name="writer" th:value="${ wagle_board.writer }" readonly></td>
        <tr>
            <th class="th_box">타입</th>
            <td>
                <strong>
                <div class="wagle_cate_box">
                    <input type="checkbox" class="check_cate"><span>와인</span></input>
                    <input type="checkbox" class="check_cate"><span>바틀샵</span></label>
                    <input type="checkbox" class="check_cate"><span>와인바</span></label>
                </div>
            </strong>
            </td>
        </tr>
        <tr>
            <th class="th_box">와인명</th>
            <td>
                <input class="search_wine"> <input type="button" value="search">
            </td>
        </tr>
        <tr>
            <th class="th_box">장소</th>
            <td>
                <input class="search_place"> <input type="button" value="search">
            </td>
        </tr>
        <tr>
            <th class="th_box">제목</th>
            <td>
                <input type="text" name="title" id="title" th:value="${ wagle_board.title }">
            </td>
        </tr>
        <tr>
            <th class="th_box">사진변경</th>
            <td>
                <input type="file" name="upfile" id="" />
            </td>
        </tr>
        <tr>
            <th class="th_box">내용</th>
            <td><textarea name="content" cols="40" rows="15" th:text="${ board.content }"></textarea></td>
        </tr>
    </table>
    <div class="wagle_update_button">
        <input class="wagle_udt_btn" type="button" value="뒤로가기">
        <input class="wagle_udt_btn" type="submit" value="등록하기">
    </div>    
</body>
</html>