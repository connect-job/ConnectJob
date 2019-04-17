<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.connect.job.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
//정규식
$(document).ready(function(){
	$("#pw1").blur(function(){
		var pw=$('#pw1').val();
		
		var checkSpe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?-]/gi);
		var checkNumber = pw.search(/[0-9]/g);
		var checkEnglish = pw.search(/[a-z]/ig);
		
		console.log(checkSpe);
		
		if(checkEnglish<0 || checkNumber<0 || checkSpe<0) {
			$('#pw_validate').html("영문+숫자+특수문자").css('color', 'red');
			$('#pw1').focus();
		}else if(pw.trim().length<8 || pw.trim().length>20){
			$('#pw_validate').html("8자리 이상 20자리 이하로 입력해주세요.").css('color', 'red');
			$('#pw1').focus();
		}else if(pw.indexOf(" ")>=0){
			$('#pw_validate').html("공백 입력 불가").css('color', 'red');
			$('#pw1').focus();
		}else{
			$('#pw_validate').html("사용 가능한 비밀번호입니다.").css('color', 'green');
		}	
	
	});
});

$(document).ready(function(){
	
	$("#pw2").blur(function(){
		
		var password=$('#pw1').val();
		var password2=$('#pw2').val();	
		
		if(password.trim()!=password2.trim()){
			$('#password_result').html("비밀번호가 일치하지 않습니다.").css('color', 'red');
			$('#pw2').focus();
		}else{
			$('#password_result').html("비밀번호가 일치합니다.").css('color', 'green');	
		}		
	});
});

</script>


<section>
	<div id="mypage-container">
		<div class="mypage-title">마이페이지</div>

		<div class="mypage-content">
			<div class="content-left">
				<ul class="tabs">
					<li class="selected">비밀번호 변경</li>
				</ul>
			</div>
			
			<div class="content-right">
				<p align="right">　　<button onclick="history.back();">돌아가기</button></p>
					<form action="${path}/member/changePwEnd" method="post">
	
						<input type="hidden" value="${param.p_id }" name="p_id"/>
						<div class="enroll-item">
							<div class="left">비밀번호</div>
							<div class="right">
								<input type="password" name="password" id="pw1" required/>
								<span id="pw_validate"></span>						
							</div>
						</div>
						
						<div class="enroll-item">
							<div class="left">비밀번호 확인</div>
							<div class="right">
								<input type="password" name="password2" id="pw2" required />
								<span id="password_result"></span>						
							</div>
						</div>
						<Br><Br>
						<button type="submit" id="changePwBtn">비밀번호 변경</button>
					</form>	
			</div>
		</div>

	</div>
</section>


    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





