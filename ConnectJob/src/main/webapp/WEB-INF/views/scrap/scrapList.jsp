<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<section id="resumeView">
	<div id="resume-container">
		<div class="resume-top">
			내 스크랩 관리
		</div>
		<div class="resume-content">
			· 스크랩한 기업과 채용공고를 확인할 수 있습니다.<br>
			· 목록을 클릭하시면 해당페이지로 이동합니다.
		</div>
		
		<div class="resume-sub">
			<div class="sub-item">
				<div class="item-title">전체 스크랩</div>
				<div class="item-content"><a href="#">${allScrapCnt}</a></div>
			</div>
			<div class="sub-item">
				<div class="item-title">기업 스크랩</div>
				<div class="item-content"><a href="#">${CPScrapCnt }</a></div>
			</div>
			<div class="sub-item">
				<div class="item-title">채용공고 스크랩</div>
				<div class="item-content"><a href="#">${HNScrapCnt }</a></div>
			</div>
		</div>
		
		<div class="resume-top">
			내 스크랩 목록
		</div>
		<div id="resume-list">

				<div class="list-item-top">
						<div class="item1"  style="width: 20%">구분</div>
						<div class="item2" style="width: 38%">회사명</div>
						<div class="item3">진행중 공고</div>
						<div class="item4">삭제</div>
					</div>
			<c:choose>
				<c:when test="${not empty allList}">
						<c:forEach items="${allList }" var="aList">
								<div class="list-item">
										<div class="item1" style="width: 20%">${aList.sCategory eq '기업'?'기업 스크랩':'채용공고 스크랩'}</div>
										<div class="item2" style="width: 40%"><a href="${path }/company/companyView.do?no=${aList.companyNo}">${aList.companyName }</a></div>
										<div class="item3">2개</div>
										<div class="item4"><button type="button" onclick="location.href='${path}/scrap/delete.do?scrapNo=${aList.scrapNo }&companyNo=0'">삭제</button></div>
									</div>
						</c:forEach>
				</c:when>
				<c:otherwise>
						<div class="list-item-top">
								스크랩 내역이 없습니다.	</div>
					
				</c:otherwise>
			</c:choose> 
			
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>