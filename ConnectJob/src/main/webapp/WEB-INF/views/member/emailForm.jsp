<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
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
		<input type="text" name="key" id="key" autocomplete="off"/>		
		<input type="text" name="key2" id="keyck" value="${keyck }" autocomplete="off"/>						
		<input type="submit" value="확인" id="key_confirm"/>
	</div>
	</form>					
</div>
<script type="text/javascript">

$(function(){
	var key=$("#key").val();
	var keyck=$('#keyck').val();
	
	console.log(key);
	
	$('#key_confirm').on("click", function(){
		if(key===keyck){
			console.log("일치");			
		}else{
			console.log("불일치");			
			console.log("key: " + key);
			console.log("keyck: " + keyck);
			console.log(key.typeOf);
			console.log(keyck.typeOf);
		}
	});
});
</script>

<%-- <div>
	<div class="row">
		<div class="col-md-12">
    		<h5>이메일 인증</h5>
    	</div>
    	</div>
		<input type="text" name="inputRandomNo" id="inputRandomNo" maxlength="6" placeholder="인증번호를 입력하세요."/>
		<input type="hidden" name="randomNo" id="randomNo" value="${randomNo }">
		<input type="button" onclick="checkEmail();" class="btn btn-outline-info slidetopleft" value="확인">
</div> --%>
<script>
  		setTimeout(function(){self.close();},300000);
  		
  		var count = 300;
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
  		}
</script>
<div id='timer-container' class='timer-container'>
	<p><span id='timer'></span> 초 이내에 인증을 완료해주세요. 이후에 자동으로 창이 닫힙니다.</p>
</div>	


</body>
</html>