<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	HashMap<String, Object> userInfo=(HashMap<String, Object>)request.getAttribute("userInfo");
%>
<section>
<script>
function verifynotify(field1, field2, result_id, match_html, nomatch_html) {
	  this.field1 = field1;
	  this.field2 = field2;
	  this.result_id = result_id;
	  this.match_html = match_html;
	  this.nomatch_html = nomatch_html;

	  this.check = function() {
	    if (!this.result_id) { return false; }
	    if (!document.getElementById){ return false; }
	    r = document.getElementById(this.result_id);
	    if (!r){ return false; }

	    if (this.field1.value != "" && this.field1.value == this.field2.value) {
	      r.innerHTML = this.match_html;
	    } else {
	      r.innerHTML = this.nomatch_html;
	    }
	  }
	}

	function verifyInput() {
	  verify = new verifynotify();
	  verify.field1 = document.memberEnrollFrm.password;
	  verify.field2 = document.memberEnrollFrm.password2;
	  verify.result_id = "password_result";
	  verify.match_html = "<span style=\"color:green\">비밀번호가 일치합니다.<\/span>";
	  verify.nomatch_html = "<span style=\"color:red\">비밀번호가 일치하지않습니다.<\/span>";

	  // Update the result message
	  verify.check();
	}

	function addLoadEvent(func) {
	  var oldonload = window.onload;
	  if (typeof window.onload != 'function') {
	    window.onload = func;
	  } else {
	    window.onload = function() {
	      if (oldonload) {
	        oldonload();
	      }
	      func();
	    }
	  }
	}

	addLoadEvent(function() {
	  verifyInput();
	});

</script>
	<form name="memberEnrollFrm" action="${path}/member/memberEnrollEnd.do" method="post">
	<table>
		<tr>
			<td>이메일 아이디</td>
			<td><input type="email" name="p_id" required/></td>
			<td><input type="button" value="중복확인" onclick="location.href='${path}/member/checkId'"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password" id="pw1" onkeyup="verify.check()" required/></td>
			<td><span>영문자, 숫자, 특수문자를 포함해 8글자 이상 작성</span></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="password2" id="pw2" onkeyup="verify.check()" required/></td>
			<td><div id="password_result"></div></td>			
		</tr>		
		<c:if test="${userInfo==null }">
			<tr>
				<td>이름</td>		
				<td><input type="text" name="p_name"/></td>
			</tr>
		</c:if>
		<c:if test="${userInfo!=null }">	
			<tr>
				<td>이름</td>		
				<td><input type="text" name="pName" value="${userInfo.nickname }"/></td>
			</tr>
			<tr>			
				<td><input type="hidden" name="isSns" value="${userInfo.id }"/></td>
			</tr>		
		</c:if>
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
			<td><input type="text" name="final_edu"/></td>
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




