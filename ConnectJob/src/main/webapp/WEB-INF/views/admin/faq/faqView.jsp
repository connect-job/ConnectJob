<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section>
	<div id="admin-container">

		<!-- ---------------------------------------------------------------------- 좌측메뉴 -->
		<%@ include file="/WEB-INF/views/admin/admin-menu.jsp"%>

		<!-- ---------------------------------------------------------------------- 우측페이지  -->
		<div class="admin-right">
			<div class="admin-title">자주묻는질문 관리</div>

			<div class="admin-item-top">자주묻는질문</div>

			<form action="${path}/admin/faq/FaqUpdate.do?fNo=${faq.fNo}" method="post" onsubmit="return validate();">
				<div class="admin-content">
					<div class="left">제목</div>
					<div class="right" style="text-align: left; padding-left: 15px;">
						<input type="text" style="width:520px" name="fTitle" value="${faq.fTitle}">
					</div>

					<div class="left">내용</div>
					<div class="right" style="text-align: left; padding-left: 15px;">
						<textarea id="fContent" name="fContent">${faq.fContent}</textarea>
					</div>
				</div>

				<div class="admin-one">
				<c:choose>
					<c:when test="${loginMember!=null}">
						<input type="hidden" name="iWriter" value="${loginMember.p_id}">
					</c:when>
					<c:when test="${loginCMember != null}">
						<input type="hidden" name="iWriter" value="${loginCMember.cMemberEmail}">
					</c:when>
				</c:choose>

				
					<button type="button" onclick="history.back();">목록으로</button>
					<button type="submit">수정</button>
				
			</form><br><Br>
			<form action="${path}/admin/faq/FaqDelete.do?fNo=${faq.fNo}" method="post" onsubmit="return validate();">
				<input type="submit" style="width: 180px" value="삭제하기">
			</form>
		</div>
		</div>
	</div>
</section>

<script>
		ClassicEditor
			.create(document.querySelector('#fContent'))
			.catch(error => {
				console.error(error);
			});
	</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>