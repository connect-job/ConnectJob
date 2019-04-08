<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
	<div id="enroll-container">
	<!-- 개인회원가입 -->
	<div class="title">
		<div class="title-left">회원가입</div>
		<div class="title-right">심사를 통해 게재된 믿을 수 있는 기업리뷰　|　이력서를 통한 기업 매칭 시스템<br>커넥트잡 회원이 되어 <b>모든 서비스를 무료</b>로 이용하세요</div>
	</div><br>
	<div class="enrollType">
		<div class="enroll-item" onclick="location.href='${path}/member/memberEnrollPage.do'"><i class="fas fa-user-edit"></i><br>일반회원가입</div>
		<div class="enroll-item" onclick="location.href='${path}/cmember/cmemberEnroll.do'"><i class="fas fa-building"></i><br>기업회원가입</div>
	</div>
</section>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>




