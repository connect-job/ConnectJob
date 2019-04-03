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
  verify.field1 = document.password_form.password1;
  verify.field2 = document.password_form.password2;
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

<form name="password_form">
비밀번호  <input type="password" name="password" onkeyup="verify.check()"><br>
비밀번호 확인  <input type="password" name="password2" onkeyup="verify.check()"></br>
<div id="password_result"> </div>
<input type="submit" value="변경"/>
</form>
       
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





