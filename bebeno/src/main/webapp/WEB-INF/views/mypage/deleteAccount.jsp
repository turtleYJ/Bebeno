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
<title>회원 탈퇴</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/deleteAccount.css">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

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

    <form id="deleteAccount" action="${ path }/mypage/deleteAccount" method="post"
    		onsubmit="return confirm('정말로 회원탈퇴를 하시겠습니까?');">

        <div class="inner-list">
            <div class="wrab-board-wide">
                <ul class="inner-list-nav">
                    <li>
                        <a href="${ path }/mypage/profile">프로필</a>
                    </li>
                    <li>
                        <a href="${ path }/mypage/updatePwd">비밀번호 재설정</a>
                    </li>
                    <li>
                        <a href="${ path }/mypage/deleteAccount">탈퇴</a>
                    </li>
                </ul>
            </div>
        </div>

<!-- ================================================================================================ -->

        <div class="mypage-input-box">
            <h3 class="tc">회원탈퇴를 신청하기 전에 아래 사항을 꼭 확인하시기 바랍니다.</h3>
            <div class="deleteAccount-box">
                <div>
                    
                    <em>1</em>
                    <h3>탈퇴 후 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h3>
                    <p>
                        회원정보 및 나의 와인셀러 등 개인형 서비스 이용기록은 모두 삭제되며, 
                        삭제된 데이터는 복구되지 않습니다.
                    </p>
                    <!-- <dl>
                        <dt>탈퇴 후 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</dt>
                        <dd>회원정보 및 나의 와인셀러 등 개인형 서비스 이용기록은 모두 삭제되며, 
                            삭제된 데이터는 복구되지 않습니다.</dd>
                    </dl> -->
                </div>

                <div>
                    <em>2</em>
                    <h3>탈퇴 후에도 공개형 서비스에 등록된 게시물은 그대로 남아 있습니다.</h3>
                    <p>
                        공개형 서비스라 함은 시음 노트, 등록한 뉴스 또는 이벤트, 
                        참여한 이벤트 내역, 구인안내 등을 말합니다.
                    </p>
                    <!-- <dl>
                        <dt>탈퇴 후에도 공개형 서비스에 등록된 게시물은 그대로 남아 있습니다.</dt>
                        <dd>공개형 서비스라 함은 시음 노트, 등록한 뉴스 또는 이벤트, 
                            참여한 이벤트 내역, 구인안내 등을 말합니다.</dd>
                    </dl> -->
                </div>

                <div>
                    <em>3</em>
                    <h3>삭제를 원하시는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.</h3>
                    <p>
                        탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인 할 수 있는 방법이 없어, 
                        <br>
                        게시글을 임의로 삭제해 드릴 수 없습니다.
                        <br>
                        또한 탈퇴 후 재 가입 하여도 과거에 작성한 공개형 서비스에 등록된 게시물도 
                            회원정보가 삭제되어 본인 여부를 확인 할 수 있는 방법이 없으므로 본인에게 귀속되지 않습니다.
                    </p>
                    <!-- <dl>
                        <dt>삭제를 원하시는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.</dt>
                        <dd>
                            "탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인 할 수 있는 방법이 없어, "
                            <br>
                            "게시글을 임의로 삭제해 드릴 수 없습니다."
                            <br>
                            "또한 탈퇴 후 재 가입 하여도 과거에 작성한 공개형 서비스에 등록된 게시물도 
                            회원정보가 삭제되어 본인 여부를 확인 할 수 있는 방법이 없으므로 본인에게 귀속되지 않습니다."
                        </dd>
                    </dl> -->
                </div>

            </div>
        </div>

        <div class="deleteAccount-button">
            <button type="submit" class="button" style='cursor:pointer;'>상기 내용 숙지 & 동의하고 탈퇴합니다.</button>
        </div>

    </form>
</section>

</body>
</html>