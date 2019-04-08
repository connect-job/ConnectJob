<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	span#close{display: none;}
</style>
<!DOCTYPE>
<html>
<head>
<meta>
<title>email send</title>
</head>
<body>
<div class="enroll-item">
	<form id="keyConfirmFrm">
	<div class="left">인증번호</div>
	<div class="right">
		<input type="text" name="key" id="key" autocomplete="off" maxlength="6"/>		
		<input type="hidden" name="key2" id="randomKey" value="${keyck }" autocomplete="off"/>						
		<input type="submit" value="확인" id="key_confirm" onclick="checkEmail()"/>
		<span id="key_result"></span>
		<span id="close" onclick="winclose()">[닫기]</span>
	</div>
	</form>					
</div>
<script type="text/javascript">

function checkEmail(){
	var frm=opener.document.memberEnrollFrm;	
	var inputKey = $('#key').val().trim();
	var randomKey = $('#randomKey').val().trim();
	if(inputKey!=randomKey)	{
		alert('인증번호가 일치하지 않습니다.');
		return;
	}else{
		alert('이메일 인증 완료!');
		self.close();
	}		
}

/* setTimeout(function(){self.close();},300000);
	
	var count = 10;
	var counter = setInterval(timer,1000);
	function timer()
	{
		count--;
		if(count<=0)
			{
			clearInterval(counter);
			
			document.getElementById('timer').innerHTML="";
			return
			}
		document.getElementById('timer').innerHTML=count;
	} */
</script>

<!-- <div id='timer-container' class='timer-container'>
	<p><span id='timer'></span> 초 이내에 인증을 완료해주세요. 이후에 자동으로 창이 닫힙니다.</p>
</div> -->	


</body>
</html>