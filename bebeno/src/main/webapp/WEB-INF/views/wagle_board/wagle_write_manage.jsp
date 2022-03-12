<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 글 관리</title>

    <link rel="stylesheet" href="%{ path }/resources/css_wagle/wagle_write_manage.css">
</head>
<body>
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
    <section class="wine-filter-box">
        <div class="wine-components">
            <ul>
                <li>
                    <p class="wine-c-txt">당도</p>
                    <div id="" class="filter-grade">
                    <a class='on'></a><a class='on'></a><a class='on'></a><a class='on'></a><a class='on'></a>								</div>
                </li>
                <li>
                    <p class="wine-c-txt">산도</p>
                    <div id="" class="filter-grade">
                    <a class='on'></a><a class='on'></a><a ></a><a ></a><a ></a></div>
                </li>
                <li>
                    <p class="wine-c-txt">바디</p>
                    <div id="" class="filter-grade">
                    <a class='on'></a><a class='on'></a><a class='on'></a><a class='on'></a><a class='on'></a>								</div>
                </li>
                <li>
                    <p class="wine-c-txt">타닌</p>
                    <div id="" class="filter-grade">
                    <a class='on'></a><a class='on'></a><a ></a><a ></a><a ></a>								</div>
                </li>
            </ul>
        </div>
    </section>
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