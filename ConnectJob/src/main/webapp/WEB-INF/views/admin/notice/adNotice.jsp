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
		<div class="admin-right">
			<div class="admin-title">1:1 문의내역 관리</div>

			<div class="admin-item-top">
				<div class="item1">질문유형</div>
				<div class="item2">제목</div>
				<div class="item3">답변상태</div>
			</div>
		
		
		
	<div class="notice-search">
		<form method="post" action="${path }/admin/noticeSearch" onsubmit="return checkSearch();">			
			<select name="searchType" id="select">
				<option value="none" disabled selected>검색타입</option>
				<option value="title" <c:if test="${map.searchType eq 'title'}">selected</c:if>>제목</option>
				<option value="content"<c:if test="${map.searchType eq 'content'}">selected</c:if>>내용</option>
				<option value="status"<c:if test="${map.searchType eq 'status'}">selected</c:if>>상단고정</option>
			</select>
			
			<input type="text" id="searchKey" name="searchKey" value="${map.searchKey!=null?map.searchKey:''}"/>
			<input type="submit" value="검색">			
		</form>
	</div>
	
	<div class="notice-list">
		<c:forEach var="notice" items="${noticeList }">
			<div class="list-item">
				<div class="no">${notice.notice_no}</div>
				<div class="title"><a href="${path }/admin/updateForm?notice_no=${notice.notice_no}">${notice.title }</a></div>
				<div class="date">${notice.notice_date }</div>
				<div class="status">${notice.status }</div>				
			</div>
         </c:forEach> 
	</div>
	
	<div id="pageBar">${pageBar }</div>       
</section>


    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>