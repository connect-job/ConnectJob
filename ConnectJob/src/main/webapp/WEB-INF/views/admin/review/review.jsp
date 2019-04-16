<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp" %>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<section>
	<div id="admin-container">

				<!-- ---------------------------------------------------------------------- 좌측메뉴 -->
		<%@ include file="/WEB-INF/views/admin/admin-menu.jsp"%>
		
		<!-- ---------------------------------------------------------------------- 우측 메뉴 -->

		<div class="admin-right">
			<div class="admin-title">기업리뷰 관리</div>

			<div class="admin-item-top">
				<div class="item1" style="width:5%">번호</div>
				<div class="item2" style="width:25%">기업명</div>
				<div class="item3" style="width:35%">제목</div>
				<div class="item4"style="width:16%" >등록일</div>
				<div class="item4"style="width:10%" >삭제</div>
			</div>

			<c:forEach var="list" items="${review}" varStatus="vs">
				<div class="admin-item" onclick="location.href='${path}/review/adminReviewOne.do?no=${list.reviewNo}'">
					<div class="item1" style="width:5%">${list.reviewNo}</div>
					<div class="item2" style="width:25%">${list.cName }</div>
					<div class="item3" style="width:35%; text-align:left">
						<c:choose>
							<c:when test="${fn:length(list.reviewShort)>20 }">
								${fn:substring(list.reviewShort, 0, 20)}...
							</c:when>
							<c:otherwise>
								${list.reviewShort }
							</c:otherwise>
						</c:choose>
					</div>
					<div class="item4" style="width:16%">
						<fmt:formatDate value="${list.reviewDate}" pattern="yyyy년 MM월 dd일" var="regDate"/>${regDate }<br>
					</div>
					<div class="item4"style="width:10%" ><button onclick="fn_delete()">삭제</button></div>
				</div>
			</c:forEach>

			<div id="pageBar" class="admin-item">
					${pageBar}
			</div>
		</div>
	</div>
</section>

<script>
	$(document).ready(function () {
		$(".menu").click(function () {
			var submenu = $(this).children('ul');
			if (submenu.is(":visible")) {
				submenu.slideUp();
				$(this).children('.icon').html("<i class='fas fa-sort-down'></i>");
			} else {
				submenu.slideDown();
				$(this).children('.icon').html("<i class='fas fa-sort-up'></i>");
			}
		});
	});


	function fn_paging(cPage) {
			window.location.href = "${path}/review/adminReview.do?cPage=" + cPage;
	}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>