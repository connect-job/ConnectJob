<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script src="http://code.jquery.com/jquery-3.3.1.min.js">	
	
	$(function(){
		var pw=$('#pw').val();
		var pw2=$('#pw2').val();
		
		$('#pw2').click(function(){			
			console.log(pw);
			console.log(pw2);
			if(pw!=pw2){
				$('.msgtr').css("display", "show");
				$('.error').css("display", "show");
				pw2.focus();
			};
		})
		
	})
	
	$(function(){
		var pw=str;
		var num=pw.search(/[0-9]/g);
		var eng=pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
		if(pw.length<8 || pw.length>20){
			alert("영문, 숫자, 특수문자 혼합해 8자리~20자리 이내로 입력하세요");
			return false;
		}		
		if(pw.search(/₩s/) != -1){
			  alert("비밀번호는 공백업이 입력해주세요.");
			  return false;
		} 
		if(num < 0 || eng < 0 || spe < 0 ){
			alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			return false;
		}
		return true;			
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
	<div id="enroll-container">
	<form name="memberEnrollFrm" action="${path}/member/memberEnrollEnd.do" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="email" name="pId"/></td>
			<td><input type="button" value="인증번호 전송" name="id_ck"/></td>
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
			<td><input type="submit" value="등록"/></td>
			<td><input type="reset" value="취소"/></td>
		</tr>		
	</table>
	</form>
	</div>
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





