<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/wagle_board/wagle_header.jsp" />
	
    <h2 class="write_h2">글 작성하기</h2>
<%--     <input type="hidden" name="no" th:value="${ wagle.no }"> --%>
    <table class="tbl_wagle_board">
        <th class="th_box">닉네임</th>
            <td><input type="text" name="writer" value="${ loginMember.nickname }" style="border:none;" readonly></td>
        <tr>
            <form action="${ path }/wagle_board/wagle_write" method="post" enctype="multipart/form-data">
            <input type="hidden" name="writerNo" value="${ loginMember.no }">
            <th class="th_box">카테고리</th>
            <td>
                <strong>
                <div class="wagle_cate_box">
                    <input name="category" type="checkbox" class="check_cate" value="wine" onclick='checkOnlyOne(this)'><span>와인</span></input>
                    <input name="category" type="checkbox" class="check_cate" value="shop" onclick='checkOnlyOne(this)'><span>바틀샵</span></label>
                    <input name="category" type="checkbox" class="check_cate" onclick='checkOnlyOne(this)'><span>와인바</span></label>
                </div>
            </strong>
            </td>
        </tr>
        <tr>
            <th class="th_box">제목</th>
            <td>
                <input type="text" name="title" id="title" th:value="${ wagle.title }">
            </td>
        </tr>
        <tr>
            <th class="th_box">사진</th>
            <td>
            	<label>썸네일 등록</label><p><input type="file" name="upfile" class=""/><p>
                <label>사진 업로드</label><p><input type="file" name="upfiles" class="" multiple="multiple" />
            </td>
        </tr>
        <tr>
            <th class="th_box">내용</th>
            <td><textarea name="content" cols="50" rows="15" th:text="${ wagle.content }"></textarea></td>
        </tr>
    </table>
    <div class="wagle_update_button">
        <input class="wagle_udt_btn" type="button" value="목록으로" onclick="${ path }/wagle_board/wagle_list">
        <input class="wagle_udt_btn" type="submit" value="등록하기" >
    </div>
    </form>
    
    <script src="${path}/resources/js/jquery-3.6.0.js"></script>
    
    <script type="text/javascript">
	    function checkOnlyOne(element) {
	    	  
	  	  const checkboxes 
	  	      = document.getElementsByName("category");
	  	  
	  	  checkboxes.forEach((cb) => {
	  	    cb.checked = false;
	  	  })
	  	  
	  	  element.checked = true;
	  	}
	</script>
    
    
</body>
</html>