<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/wagle_board/wagle_header.jsp" />

    <section id="my_write_manage">
        <div class="limiter">
        <h2>내 글 관리</h2>
        <div>
        </div>
        <table id="mywrite-board">
            <thead>
                <tr class="table100-head">
                    <th class="column1">Date</th>
                    <th class="column2">Title</th>
                    <th class="column3">NickName</th>
                    <th class="column4">View</th>
                    <th class="column5">Scrap</th>
                    <th class="column6">
                        <!-- 로그인 멤버 시 수정 삭제 버튼 보일 수 있게?-->
                    </th>
                </tr>
            </thead>
            <c:forEach var="row" items="${wagle_board.list}">
            <tbody>
                <tr>
                    <td class="column1" td:text="${ wagle_board.createDate }">ex.Date</td>
                    <td class="column2" td:text="${ wagle_board.title }">Title</td>
                    <td class="column3" td:text="${ wagle_board.writer_nickname }">NickName</td>
                    <td class="column4" td:text="${ wagle_board.readCount }">0</td>
                    <td class="column5" td:text="${ wagle_board.scrapBoard }">0</td>
            </tbody>
            </c:forEach>
        </table>

    </section>
</body>
</html>