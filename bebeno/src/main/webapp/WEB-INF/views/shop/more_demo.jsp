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
<title>Insert title here</title>
</head>
<body>
	function getDataList(){
		// 더보기 버튼 비활성화
		$('#storeListMoreBtn').attr('disabled', true);

		$.ajax({
				type	: "POST", dataType:"json", async:"true", cache:false, contentType:"application/x-www-form-urlencoded;charset=UTF-8",
				url		: "/14_info/proc/proc_store_list_more2.php",
				data	:  sendData,
				beforeSend: function (jqXHR) { },                           // 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
				success: function (jqXHR) {

					if (jqXHR.status === 'OK'){
						$('.cate-tit-total').html('(' + jqXHR.totalCnt + ')');

						var html_div = '';
						$.each($(jqXHR.listData),function(key,value){

							html_wine_cnt = '';
							if (value.dWINE_CNT != "0") {
								html_wine_cnt = "<span class='name-en'>(" + value.dWINE_CNT + ")</span>";
							}

							if (value.dWEBSITE != '')
								html_div = "<li> \
												<div class='thumb'><a href='javascript:goStoreView(" + value.dCOMP_IDX + ");' class='btnView'><img src='https://wine21.speedgabia.com" + value.strLOGO_FILE_PATH + "' alt='" + value.strCOMP_KNAME + "'></a></div> \
												<div class='txt-area'> \
													<div class='cnt-header'> \
														<h3><a href='javascript:goStoreView(" + value.dCOMP_IDX + ");' class='btnView'>" + value.strCOMP_KNAME + " &nbsp; <span class='name-en'>" + value.strCOMP_ENAME + "</span></a>&nbsp;" + html_wine_cnt + "</h3> \
													</div> \
													<div class='txt'><a href='javascript:goStoreView(" + value.dCOMP_IDX + ");' class='btnView line02'>" + value.strSUMMARY + "</a></div> \
													<div class='write-info'> \
														<em class='board-badge badge-white'>" + value.displayBUSINESS_TYPE_NAME + "</em> \
														<span class='store-addr'>" + value.strADDR2 + "</span><span class='store-tel'>" + value.dCOMP_TEL + "</span><span class='store-link'><a href='http://" + value.dWEBSITE + "' target='_blank'>" + value.dWEBSITE + "</a></span> \
													</div> \
												</div> \
											</li>";
							else
								html_div = "<li> \
												<div class='thumb'><a href='javascript:goStoreView(" + value.dCOMP_IDX + ");' class='btnView'><img src='https://wine21.speedgabia.com" + value.strLOGO_FILE_PATH + "' alt='" + value.strCOMP_KNAME + "'></a></div> \
												<div class='txt-area'> \
													<div class='cnt-header'> \
														<h3><a href='javascript:goStoreView(" + value.dCOMP_IDX + ");' class='btnView'>" + value.strCOMP_KNAME + " &nbsp; <span class='name-en'>" + value.strCOMP_ENAME + "</span></a>&nbsp;" + html_wine_cnt + "</h3> \
													</div> \
													<div class='txt'><a href='javascript:goStoreView(" + value.dCOMP_IDX + ");' class='btnView line02'>" + value.strSUMMARY + "</a></div> \
													<div class='write-info'> \
														<em class='board-badge badge-white'>" + value.displayBUSINESS_TYPE_NAME + "</em> \
														<span class='store-addr'>" + value.strADDR2 + "</span><span class='store-tel'>" + value.dCOMP_TEL + "</span> \
													</div> \
												</div> \
											</li>";

							if (html_div !== '')
                        		$('#store_list').append(html_div);

							$('#rPage').val(sendData.rPage);	
						});

						if (parseInt(jqXHR.totalCnt) === 0)
							$('#store_list_no').show();
						else
							$('#store_list_no').hide();

						if (jqXHR.moreFlag === 'false')
							$('#storeListMoreBtn').hide();

						// 더보기 버튼 활성화
						$('#storeListMoreBtn').attr('disabled', false);
					}
				},
				error: function (jqXHR) { },                                // 요청 실패.
				complete: function (jqXHR) { }                              // 요청의 실패, 성공과 상관 없이 완료 될 경우 호출
		});
	}
</body>
</html>