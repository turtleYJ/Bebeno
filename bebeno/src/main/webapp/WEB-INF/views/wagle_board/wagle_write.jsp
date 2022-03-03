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
    <title>글쓰기</title>
</head>
<body>
    <table>
        <th>작성자</th>
        <td><input type="text" name="writer" th:value="${ board.writer }" readonly></td>
        <tr>
            <th>타입</th>
            <td>
                <div>
                    <label type="radio">와인</label>
                </div>
                <div>
                    <label type="radio">바틀샵</label>
                </div>
                <div>
                    <label type="radio">와인바</label>
                </div>
            </td>
        </tr>
        <tr>
            <th>와인명</th>
            <td>
                <tr></tr>
            </td>
        </tr>
        <tr>
            <th>위치추가</th>
            <td>
                <tr></tr>
            </td>
        </tr>
        <tr>
            <th>제목</th>
            <td>
                <input type="text" name="title" id="title" th:value="${ board.title }">
            </td>
        </tr>
        <tr>
            <th>사진추가</th>
            <td>
                <input type="file" name="upfile" id="" />
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" cols="50" rows="15" th:text="${ board.content }"></textarea></td>
        </tr>
    </table>
    <div id="btns">
        <input type="button" value="뒤로가기">
        <input type="submit" value="등록하기">
    </div>
</body>
</html>