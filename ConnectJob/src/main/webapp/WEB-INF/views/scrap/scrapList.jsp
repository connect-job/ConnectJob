<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script >
	console.log(".")
</script>
<section>
	<div id="resume-container">
		<div class="resume-top">
				<i class="far fa-address-card"></i>　내 스크랩 관리
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
		
		<div class="list-header">
				<i class="fas fa-list-ul"></i>　스크랩 리스트　
		</div>
		<div id="resume-list">
			<c:choose>
				<c:when test="${not empty allList}">
				<table>
						<tr>
							<th>구분</th>
							<th>회사명</th>
							<th>진행중 공고</th>
							<th>삭제</th>
						</tr>
						<c:forEach items="${allList }" var="aList">
							<tr>
								<td>${aList.sCategory eq '기업'?'기업 스크랩':'채용공고 스크랩'}</td>
								<td><a href="${path }/company/companyView.do?no=${aList.companyNo}">${aList.companyName }</a></td>
								<td>2개</td>
								<td><button type="button" onclick="location.href='${path}/scrap/delete.do?scrapNo=${aList.scrapNo }&companyNo=0'">삭제</button></td>
							</tr>
							<script>console.log("${aList}")</script>
						</c:forEach>
				</table>
					
				</c:when>
				<c:otherwise>
					스크랩 내역이 없습니다.
				</c:otherwise>
			</c:choose> 
			
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>