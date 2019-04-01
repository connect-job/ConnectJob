<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>

<h2>내 이력서 관리</h2>
<p>- 이력서는 <b>최대 3개</b>까지 등록 가능 합니다.</p>
<p>- 작성한 이력서로 회사에 지원 할 수 있습니다.
<p>- 이력서를 공개로 설정하시면 기업으로부터 <b>면접제의</b>를 받을 수 있습니다.</p>
<br>
<h3>이력서 리스트</h3>
<button onclick="location.href='${path}/resume/insertResume.do'">작성하기</button>
<table>
	<tr>
		<th>이력서 제목</th>
		<th>지원현황</th>
		<th>공개</th>
		<th>열람기업</th>
	</tr>
	<tr>
		<td>기본이력서</td>
		<td>1</td>
		<td>공개</td>
		<td>1</td>
	</tr>
	
</table>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>