<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>	
	
	$(function(){
		$("#emailSendBtn").click(function(){
			location.href='${path}/email/emailSender?pId=${pId}';
		});
	})
</script> 

<style>
	tr.msgtr{
		display: none;
	}
	div.error{
		display: none;
	}
	div.success{
		display: none;
	}
</style>
<section>
	<form name="memberEnrollFrm" action="${path }/member/memberEnrollEnd.do" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="email" name="pId"/></td>
			<!-- <td><input type="button" value="인증번호" id="emailSendBtn"/></td> -->
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password" id="pw"/></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="password2" id="pw2"/></td>
			
		</tr>
		<tr class="msgtr">
			<td></td>
			<td>
				<div class="error">비밀번호 오류</div>
				<div class="success">비밀번호 일치</div>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="pName"/></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="gender" value="M"/>남
				<input type="radio" name="gender" value="F"/>여
			</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="phone" name="phone"/></td>
		</tr>		
		<tr>
			<td>최종학력</td>
			<td><input type="text" name="finalEdu"/></td>
		</tr>
		<tr>
			<td>학교</td>
			<td><input type="text" name="school"/></td>
		</tr>
		<tr>
			<td>전공</td>
			<td><input type="text" name="major"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="등록" id="formBtn"/></td>
			<td><input type="reset" value="취소"/></td>
		</tr>		
	</table>
	</form>
</section>

   
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





