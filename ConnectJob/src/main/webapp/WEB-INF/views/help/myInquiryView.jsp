<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section>
	<div id="senier-container">

		<div class="senier-top">
			나의 문의내역
		</div>

		<div class="senier-subTitle" style="padding-top: 20px;">
				나의 1:1 문의내역 목록
		</div>


		<div class="senier-middle">
				<div id="senier-write-container">
					<div class="write-cate">
						<div class="left">문의종류</div>
						<div class="right"># ${inq.iType}</div>
					</div>
					<div class="write-title">
						<div class="left">제목</div>
						<div class="right">${inq.iTitle}</div>
					</div>
					<div class="write-content">
						<div class="left">내용</div>
						<div class="right">${inq.iContent}</div>
					</div>
					<div class="write-content">
						<div class="left">답변상태</div>
						<div class="right">${inq.status}</div>
					</div>
					<div class="write-content">
						<div class="left">답변내용</div>
						<div class="right">${inq.aContent}</div>
					</div>
					<div class="write-btn"><button onclick="history.back();">목록으로</button></div>
		</div>
	</div>
	</div>
</section>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>