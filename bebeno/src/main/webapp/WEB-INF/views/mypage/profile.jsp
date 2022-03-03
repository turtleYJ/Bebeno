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
<title>마이페이지_프로파일 수정</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/profile.css">

</head>
<body>

<section class="mypage">

    <h2 class="title-mypage">MyPage</h2>

    <div class="my-tab">
        <ul class="list-nav">
            <li>
                <a href="${ path }/mypage/profile">정보수정</a>
            </li>
            <li>
                <a href="${ path }/mypage/scrap">스크랩</a>
            </li>
            <li>
                <a href="${ path }/mypage/cart">장바구니</a>
            </li>
        </ul>
    </div>

    <form id="update-profile">

        <div class="inner-list">
            <div class="wrab-board-wide">
                <ul class="inner-list-nav">
                    <li>
                        <a href="">프로필</a>
                    </li>
                    <li>
                        <a href="">비밀번호 재설정</a>
                    </li>
                    <li>
                        <a href="">탈퇴</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="mypage-input-box">

            <div class="update-profile">
                <img src="../resources/image/profile.png" id="profileimg" alt="프로필">
                <a href="" class="profile-button">프로필 변경</a>
                <input type="file" id="inputProfileImg" style="display: none;">
            </div>

            <div class="update-etc">
                <table>
                    <tbody>
                        <tr>
                            <th>
                                <span>계정</span>
                            </th>
                            <td class="input-item">
                                <div>회원 아이디</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>이메일</span>
                            </th>
                            <td class="input-item">
                                <div>회원 이메일</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>닉네임</span>
                            </th>
                            <td class="input-item">
                                <div class="input-nickname">
                                    <p>
                                        <label class="hidden" style="display: none;">닉네임</label>
                                        <input type="text" class="" id="nickname" name="nickname" 
                                        placeholder="닉네임" value="회원 닉네임">
                                        <button type="button" class="button">중복확인</button>
                                    </p>
                                    <input type="hidden" id="nickname_origin" name="nickname_origin" value="회원 닉네임">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>주소</span>
                            </th>
                            <td class="input-item">
                                <div>회원 주소</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>연락처</span>
                            </th>
                            <td class="input-item">
                                <div>회원 전화번호</div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="save-update-button">
                    <button type="button" class="button">정보 수정</button>
                </div>

            </div>
        </div>

    </form>
</section>

</body>
</html>