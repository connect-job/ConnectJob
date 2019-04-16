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
		
		<!-- ---------------------------------------------------------------------- 우측 메뉴 -->

			<div class="admin-right">
					<div class="admin-title">기업리뷰 관리</div>
		
					<div class="admin-item-top">리뷰내용</div>

					<div class="admin-content">
							<div class="left">리뷰번호</div>
							<div class="right">${review.reviewNo}</div>
							<div class="left">현/전직장 여부</div>
							<div class="right">${review.reviewIsCurrent}</div>
							<div class="left">직종</div>
							<div class="right">${review.reviewJob}</div>
							<div class="left">근무형태</div>
							<div class="right">${review.reviewEmployCate}</div>
							<div class="left">경력</div>
							<div class="right">${review.reviewCareer}</div>
							<br><Br>
							<div class="left">총점</div>
							<div class="right">${review.reviewTotalScore}</div>
							<div class="left">리뷰제목</div>
							<div class="right">${review.reviewShort}</div>
							<div class="left">기업의 장점</div>
							<div class="right">${review.reviewMerit}</div>
							<div class="left">기업의 단점</div>
							<div class="right">${review.reviewDisMerit}</div>
							<div class="left">바라는 점</div>
							<div class="right">${review.reviewRequest}</div>
							<br><Br>
							<div class="left">승진 및 기회 가능성</div>
							<div class="right">${review.reviewGrade01}</div>
							<div class="left">복지 및 급여</div>
							<div class="right">${review.reviewGrade02}</div>
							<div class="left">업무와 삶의 균형</div>
							<div class="right">${review.reviewGrade03}</div>
							<div class="left">사내문화</div>
							<div class="right">${review.reviewGrade04}</div>
							<div class="left">경영진</div>
							<div class="right">${review.reviewGrade05}</div>
							<Br><Br>
							<div class="left">작성일</div>
							<div class="right"><fmt:formatDate value="${list.reviewDate}" pattern="yyyy년 MM월 dd일" var="regDate"/>${regDate }</div>
					</div>
					
					<p align="center"><button onclick="history.back();">목록으로</button></p>

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