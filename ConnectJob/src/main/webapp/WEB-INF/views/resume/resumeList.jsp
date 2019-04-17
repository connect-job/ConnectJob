<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section id="resumeList">
	<div id="resume-container">
		<div class="resume-top">
			내 이력서 관리
		</div>
		<div class="resume-content">
			· 작성한 이력서로 회사에 지원 할 수 있습니다.<br>
			· 이력서를 등록하시면 적절한 <span class="highlight">채용공고와 매칭</span>이 가능합니다.<br>
			· 이력서를 공개로 설정하시면 기업으로부터 <span class="highlight">면접제의</span>를 받을 수 있습니다.
		</div>

		<div class="resume-sub">
			<div class="sub-item">
				<div class="item-title">작성된 이력서</div>
				<div class="item-content">${resumeCnt }</div>
			</div>
			<div class="sub-item">
				<div class="item-title">열람한 기업 수</div>
				<div class="item-content">15</div>
			</div>
			<div class="sub-item">
				<div class="item-title">입사지원 현황</div>
				<div class="item-content">${appCnt }</div>
			</div>
		</div>

		<div class="list-header">
			<div class="left">내 이력서 목록</div>
			<div class="right"><button onclick="location.href='${path}/resume/insertResume.do'">작성하기</button></div>
		</div>
		<div id="resume-list">

			<div class="list-item-top">
				<div class="item1">이력서 제목</div>
				<div class="item2">공개 여부</div>
				<div class="item3">작성 날짜</div>
				<div class="item4">지원 현황</div>
				<div class="item5">열람 기업</div>
			</div>

			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach items="${list }" var="r">
						<div class="list-item">
							<div class="item1"><a href="${path}/resume/resumeView.do?resumeNo=${r.resumeNo}">${r.title
									}</a></div>
							<div class="item2">${r.isPublic eq 'true'? "공개":"비공개" }</div>
							<div class="item3">
								<fmt:formatDate value="${r.creationDate}" pattern="yyyy-MM-dd" />
							</div>
							<div class="item4">-</div>
							<div class="item5">-</div>
						</div>
					</c:forEach>
					</table>

				</c:when>
				<c:otherwise>
					<div class="list-item">
						<p align="center">작성된 이력서가 없습니다. 첫 번째 이력서를 작성해보세요.</p>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>