<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section>
	<div id="admin-container">
	
		<!-- ---------------------------------------------------------------------- 좌측메뉴 -->
		<%@ include file="/WEB-INF/views/admin/admin-menu.jsp"%>
		
		<!-- ---------------------------------------------------------------------- 우측 메뉴 -->

	<form name="updateFrm" method="post" action="${path }/notice/updateNotice">
    	<table>    	
         	<tr>
         		
            	<th>작성자</th>
            	<td>                
               		<input type="text" name="writer" value="${notice.writer }" readonly/>
               		<input type="hidden" name="notice_no" value="${notice.notice_no }"/>
            	</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                 	<input type="text" name="title" value="${notice.title }"/>
                </td>
            </tr>             
            <tr>
                <th>내용</th>
                <td>
                 	<textarea name="content">${notice.content}</textarea>
                </td>
            </tr>
            <tr>
            	<th>상단 고정</th>
            	<td>
            		<input type="radio" name="status" value="Y"/> Y
            		<input type="radio" name="status" value="N"/> N
            	</td>
            </tr>                                 
        </table>  
    	<div id="btn-container">
        	<input type="submit" value="수정" />
        	<input type="button" value="삭제" onclick="location.href='${path}/admin/deleteNotice?notice_no=${notice.notice_no }'"/>                
    	</div>
    </form>
</section>

<script>
	
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>