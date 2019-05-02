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
				<div class="admin-title">공지사항 관리</div>
	
				<div class="admin-item-top">공지사항 내용</div>

				<form name="updateFrm" method="post" action="${path }/notice/updateNotice">
				<div class="admin-content">
						<div class="left">작성자</div>
						<div class="right" style="text-align: left; padding-left: 15px;">
							<input type="text" style="width:450px;" name="writer" value="${notice.writer }" readonly/>
							<input type="hidden" name="notice_no" value="${notice.notice_no }"/>
						</div>

						<div class="left">제목</div>
						<div class="right" style="text-align: left; padding-left: 15px;">
							<input type="text" style="width:450px;" name="title" value="${notice.title }"/>
						</div>

						<div class="left">내용</div>
						<div class="right" style="text-align: left; padding-left: 15px;">
							<textarea id="aContent" name="content">${notice.content}</textarea>
						</div>

						<div class="left">상단 고정</div>
						<div class="right" style="text-align: left; padding-left: 15px;">
								<label><input type="radio" name="status" value="Y"/> Y</label>
								<label><input type="radio" name="status" value="N"/> N</label>
						</div>
				</div>

				<div class="admin-one">
						<input type="submit" value="수정" />
						<input type="button" value="삭제" onclick="location.href='${path}/admin/deleteNotice?notice_no=${notice.notice_no }'"/>
				</div>
				</form>
		</div>

</section>


<script>
	ClassicEditor.
		create(document.querySelector('#aContent')).
			catch(error => {
				console.error(error);
	});
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>