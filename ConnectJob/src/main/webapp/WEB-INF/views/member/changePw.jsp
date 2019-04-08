<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.connect.job.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Member loginMember=(Member)request.getAttribute("loginMember");
%>
<style>
	div#dnuse{
		display: none;
		color: red;
	}
	div#warn{
		display: none;
		color: red;
	}
	div#mat{
		display: none;
	}
</style>
<section>

<script>

</script>

<form name="password_form">
비밀번호  <input type="password" name="password"><br>
비밀번호 확인  <input type="password" name="password2"></br>
<div id="password_result"> </div>
<input type="submit" value="변경"/>
</form>
       
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





