<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
	<table>
		<tr>
			<td><input type="button" value="목록" onclick="location.href='${path}/notice.do'"/></td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${notice.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${notice.writer }</td>
			<th>작성일</th>
			<td>${notice.notice_date}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td >${notice.content}</td>
		</tr>		
		<tr>					
			<td>
				<input type="button" value="수정" onclick="location.href='${path}/notice/updateForm?notice_no=${notice.notice_no }'"/>					
				<input type="button" value="삭제" onclick="location.href='${path}/notice/deleteNotice?notice_no=${notice.notice_no }'"/>								          	
			</td>		
		</tr>		
	</table>

			  
</section>
<script>

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>