<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
	<div id="notice-container">

		<div class="notice-title">공지사항　|　NOTICE</div>

		<div class="notice-subtitle">${notice.title }</div>

		<div class="notice-write"><input type="button" value="목록" onclick="location.href='${path}/notice.do'" /></div>

		<div class="notice-content">
			<div class="notice-item">
				<div class="left">제목</div>
				<div class="right">${notice.title }</div>
			</div>
			<div class="notice-item">
				<div class="left">작성자</div>
				<div class="right">${notice.writer }</div>
			</div>
			<div class="notice-item">
				<div class="left">작성일</div>
				<div class="right">${notice.notice_date }</div>
			</div>
			<div class="notice-item-content">
				<div class="left">내용</div>
				<div class="right">${notice.content }</div>
			</div>
		</div>

		<div class="notice-write">
			<c:if test="${loginMember!=null && loginMember.p_id eq 'admin@admin.com' }">

				<input type="button" value="수정"
					onclick="location.href='${path}/notice/updateForm?notice_no=${notice.notice_no }'" />
				<input type="button" value="삭제"
					onclick="location.href='${path}/notice/deleteNotice?notice_no=${notice.notice_no }'" />

			</c:if>
		</div>

	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>