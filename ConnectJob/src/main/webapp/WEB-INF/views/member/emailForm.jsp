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
</body>
</html>