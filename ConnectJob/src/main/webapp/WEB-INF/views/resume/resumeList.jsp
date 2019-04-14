<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
 
<section>
	<div id="resume-container">
		<div class="resume-top">
				<i class="far fa-address-card"></i>　내 이력서 관리
		</div>
		<div class="resume-content">
			· 작성한 이력서로 회사에 지원 할 수 있습니다.<br>
			· 이력서를 등록하시면 적절한 <b>채용공고와 매칭</b>이 가능합니다.<br>
			· 이력서를 공개로 설정하시면 기업으로부터 <b>면접제의</b>를 받을 수 있습니다.
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
				<div class="item-content">26</div>
			</div>
		</div>
		
		<div class="list-header">
				<i class="fas fa-list-ul"></i>　이력서 리스트　　<button onclick="location.href='${path}/resume/insertResume.do'">작성하기</button>
		</div>
		<div id="resume-list">
			<c:choose>
				<c:when test="${not empty list}">
				<table>
						<tr>
							<th>이력서 제목</th>
							<th>공개 여부</th>
							<th>작성 날짜</th>
							<th>지원 현황</th>
							<th>열람 기업</th>
						</tr>
						<c:forEach items="${list }" var="r">
							<tr>
								<td><a href="${path}/resume/resumeView.do?resumeNo=${r.resumeNo}">${r.title }</a></td>
								<td>${r.isPublic eq 'true'? "공개":"비공개" }</td>
								<td><fmt:formatDate value="${r.creationDate}" pattern="yyyy-MM-dd"/></td>
								<td>-</td>
								<td>-</td>
							</tr>
						</c:forEach>
				</table>
					
				</c:when>
				<c:otherwise>
					작성된 이력서가 없습니다. 첫 번째 이력서를 작성해보세요.
				</c:otherwise>
			</c:choose> 
			
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>