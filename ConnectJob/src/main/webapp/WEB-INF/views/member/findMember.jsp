<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
	<form action="${path }/member/findId" method="post">
		<table>
			<caption>ID찾기</caption>
			<tr>
				<td>이름</td>
				<td><input type="text" name="p_name"/></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="phone" name="phone"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="ID찾기"/></td>				
			</tr>
		</table>
	</form>
	
	<form action="${path }/member/findPw" method="post">
		<table>
			<caption>PW찾기</caption>
			<tr>
				<td>아이디</td>
				<td><input type="email" name="p_id"/></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="phone" name="phone"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="PW찾기"/></td>				
			</tr>
		</table>
	</form>
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





