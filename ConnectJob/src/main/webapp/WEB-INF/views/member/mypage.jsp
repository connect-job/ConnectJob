<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>

	<table>
		<tr>
			<td>아이디</td>
			<td><input type="email"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="email"/></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="email"/></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="email"/></td>
		</tr>
		<tr>
			<td>최종학력</td>
			<td><input type="email"/></td>
		</tr>
		<tr>
			<td>학교</td>
			<td><input type="email"/></td>
		</tr>
		<tr>
			<td>전공</td>
			<td><input type="email"/></td>
		</tr>
		<tr>
			<td><input type="button" value="수정하기"/></td>
			<td><input type="email"/></td>
		</tr>		
	</table>
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





