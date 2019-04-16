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
					<div class="admin-title">1:1 문의내역 관리</div>
		
					<div class="admin-item-top">문의내역</div>

					<form action="${path}/admin/inquiry/InquiryUpdate.do?iNo=${inq.iNo}" method="post" onsubmit="return validate();">
					<div class="admin-content">
							<div class="left">문의종류</div>
							<div class="right">${inq.iType}</div>
							<div class="left">제목</div>
							<div class="right">${inq.iTitle}</div>
							<div class="left">내용</div>
							<div class="right">${inq.iContent}</div>
							<div class="left">답변상태</div>
							<div class="right">
								<select id="answer" name="status">
									<option value="">답변상태</option>
									<option value="답변완료" ${inq.status=="답변완료"?"selected":""}>답변완료</option>
									<option value="답변중" ${inq.status=="답변중"?"selected":""}>답변중</option>
									<option value="답변대기중" ${inq.status=="답변대기중"?"selected":""}>답변대기중</option>
								</select>
							</div>

							<div class="left">답변내용</div>
							<div class="right">
								<textarea id="aContent" name="aContent" placeholder="내용을 입력해주세요">${inq.aContent}</textarea>
								
							</div>
					</div>

					<div class="admin-item">
					<button type="submit">답변등록</button>　<button type="button" onclick="history.back();">목록으로</button>
					</div>
			</form>
		</div>
	</div>
</section>

<script>
	ClassicEditor
        .create(document.querySelector('#aContent'))
        .catch(error => {
            console.error(error);
        });
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>