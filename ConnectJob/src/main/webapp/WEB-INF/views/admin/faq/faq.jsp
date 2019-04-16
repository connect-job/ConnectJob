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

		<!-- ---------------------------------------------------------------------- 우측페이지  -->
		<div class="admin-right">
				<div class="admin-title">자주묻는질문 관리</div>
				<br>
				<div class="admin-item-top">
					<div class="item1" style="width:100%;">질문명</div>
				</div>

				<c:forEach var="faq" items="${list}" varStatus="vs">
						<div class="admin-item" onclick="location.href='${path}/admin/faq/faqView.do?no=${faq.fNo}'">
								<div class="item1" style="width:100%;">제목 ${faq.fTitle}</div>
							</div>
				</c:forEach>
				
				<div class="admin-one">
						<div id="pageBar">
								${pageBar}
								</div>
				</div>
		</div>
		
		
	</div>
</section>

<script>
        function fn_paging(cPage) {
                window.location.href="${path}/admin/faq/faq.do?cPage=" + cPage;
          }
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>