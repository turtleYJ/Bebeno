<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지_프로파일 수정</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/profile.css">

<script src="${ path }/js/jquery-3.6.0.js"></script>

<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
 src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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

        <div class="mypage-input-box">

            <div class="update-profile">
            
            	<a href="${ path }/mypage/updatePwd" class="imgTest">
            		<img alt="" src="../resources/image/profile.png">
            	</a>
            
            <!-- 
             -->
                <img src="../resources/image/profile.png" id="profileimg" alt="프로필">
                <a href="${ path }/mypage/updatePwd" class="profile-button" >프로필 변경</a>
                <input type="file" id="inputProfileImg" style="display: none;">
            </div>

            <div class="update-etc">
                <table>
                    <tbody>
                        <tr>
                            <th>
                                <span>회원 아이디</span>
                            </th>
                            <td class="input-item">
                                <div>${ loginMember.id }</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>이메일</span>
                            </th>
                            <td class="input-item">
                                <div>${ loginMember.email }</div>
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
                                        placeholder="닉네임" value="${ loginMember.nickname }">
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
                                <div>${ loginMember.address }</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span>연락처</span>
                            </th>
                            <td class="input-item">
                                <div>${ loginMember.phone }</div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="save-update-button">
                    <button type="submit" class="button">정보 수정</button>
                </div>
            </div>
        </div>
        <div class="container">
		
				<div class="form-group">
					<div class="row" style="text-align: center;">
						<h1 class="page-header" style="margin-bottom: 50px;">나의 주문 내역</h1>
						<table class="table table-hover"
							style="margin: auto; border-bottom: 1px solid #D5D5D5;">
							<thead>
								<tr>
									<th colspan="2" style="text-align: center;">상품명</th>
									<th>가격</th>
									<th>수량</th>
									<th>옵션</th>
									<th>결제금액</th>
									<th>결제일</th>
									<th>주문현황</th>
								</tr>
							</thead>
							<tbody style="text-align: left;">
<%-- 								<c:choose>
									<c:when test="${orderList == null}"> --%>
										<tr style="text-align: center;"><td colspan="8"><h3>주문 내역이 없습니다.</h3></td></tr>
<%-- 									</c:when>
									<c:otherwise>
										<c:forEach items="${orderList}" var="dto "> --%>
											<tr>
												<td style="text-align: center;"><img alt="thumbnail"
													src="/resources/upload${dto.fullname}" width="40%"> <input
													type="hidden" value="${dto.productId}" name="productId"
													id="productId"></td>
												<td>${dto.productName}<br>${dto.productInfo}</td>
												<td><fmt:formatNumber type="number"
														value="${dto.price}" />&nbsp;원</td>
												<td>${dto.order_Qty}</td>
												<td>${dto.selected_Opt}</td>
												<td><fmt:formatNumber type="number"
														value="${dto.totalAmount}" />&nbsp;원</td>
												<td><fmt:formatDate value="${dto.billingDate}"
														type="date" pattern="yyyy-MM-dd" /></td>
												<%-- <td>${dto.deliver_situ == 0 ? "배송준비중" : 
															dto.deliver_situ == 1 ? "배송중" : "배송완료"}</td> --%>
												<%-- <c:choose>
													<c:when test="${dto.deliver_situ != 0}"> --%>
														<td>
															<button class="btn btn-default disable"
																disabled="disabled">주문취소</button>
															<br>
															<button class="btn btn-default disable"
																disabled="disabled">주문변경</button>
															<br>
														</td>
												<%-- 	</c:when> --%>
													<%-- <c:otherwise>
														<td>
															<button class="btn btn-default order_cancel"
																onclick="location.href='/order/cancel/'+ ${dto.orderId}">주문취소</button>
															<br>
															<button class="btn btn-default">주문변경</button>
														</td>
													</c:otherwise> --%>
								<%-- 				</c:choose>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose> --%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
        

    </form>
</section>

</body>
</html>