<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<section>
	<div id="admin-container">

		<!-- ---------------------------------------------------------------------- 좌측메뉴 -->
		<%@ include file="/WEB-INF/views/admin/admin-menu.jsp"%>
		
		<!-- ---------------------------------------------------------------------- 우측페이지  -->

		<div class="admin-right">
			<div class="admin-title">1:1 문의내역 관리</div>

			<div class="admin-item-top">
				<div class="item1">질문유형</div>
				<div class="item2">제목</div>
				<div class="item3">답변상태</div>
			</div>

						<c:forEach var="inq" items="${list}" varStatus="vs">
							<div class="admin-item"
								onclick="location.href='${path}/admin/inquiry/InquiryView.do?no=${inq.iNo}'">
								<div class="item1">${inq.iType}</div>
								<div class="item2">${inq.iTitle}</div>
								<div class="item3">
									<c:choose>
										<c:when test="${inq.status=='답변중'}">${inq.status}</c:when>
										<c:when test="${inq.status=='답변대기중'}">${inq.status}</c:when>
										<c:when test="${inq.status=='답변완료'}">${inq.status}</c:when>
									</c:choose>
								</div>
							</div>
						</c:forEach>


						<div id="pageBar" class="admin-item">${pageBar}</div>
			</div>
		</div>
</section>

<script>
	function fn_paging(cPage) {
			window.location.href = "${path}/admin/inquiry/inquiry.do?cPage=" + cPage;
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>