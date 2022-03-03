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
    <title>내 글 관리</title>
</head>
<body>
    <section id="content">
        <h2>내 글 관리</h2>
        <div>

        </div>
        <table border="1" id="mywrite-board">
            <tr>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>스크랩</th>
            </tr>
        </table>
        <c:forEach var="row" items="${board.list}">
            <tr>
                <td><a href="">
                    ${ board.title }
                </a></td>
                <td>${ board.createDate }</td>
                <td>${ board.readCount }</td>
                <td>${ board.scrapBoard }</td>
            </tr>
        </c:forEach>
    </section>
</body>
</html>