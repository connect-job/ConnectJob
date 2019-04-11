<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
	
	<div>회원 리스트</div>
	<div>검색</div>
	<div>
		<div>
			<div>아이디</div>
			<div>이름</div>
			<div>성별</div>
			<div>연락처</div>
			<div>SNS</div>
			<div>인증여부</div>
		</div>
		<c:forEach var="member" items="${list }">
			<div>
				<div>${member.p_id }</div>
				<div>${member.name }</div>
				<div>${member.gender }</div>
				<div>${member.phone }</div>
				<div>${member.is_sns }</div>
				<div>${member.is_confirm }</div>
			</div>
		</c:forEach>
	</div>
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





