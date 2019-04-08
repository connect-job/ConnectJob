<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.connect.job.common.TempKey"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	TempKey tempkey=new TempKey();
	String key=tempkey.getKey(6, false);
%>
<style>
	div#id-result-div{display: none;}
	div#pw-result-div{display: none;}
</style>
<section>
	<div id="enroll-container">
		<!-- 개인회원가입 -->
		<div class="title">
			<div class="title-left">일반회원가입</div>
			<div class="title-right">심사를 통해 게재된 믿을 수 있는 기업리뷰　|　이력서를 통한 기업 매칭 시스템<br>커넥트잡 회원이 되어 <b>모든 서비스를 무료</b>로 이용하세요
			</div>
		</div>
		
		<div id="memberEnroll" class="tab-content current">
			<form id="memberEnrollFrm" action="${path}/member/memberEnrollEnd.do" method="post">
				<div class="enroll-item">
					<div class="left">아이디</div>
					<div class="right">
						<input type="email" name="p_id" id="p_id" autocomplete="off" />						
						<input type="hidden" name="key" id="keyck" value="<%=key %>" autocomplete="off"/>						
						<input type="button" value="인증번호 전송" id="emailSender"/>																
					</div>					
				</div>
				
				<div class="enroll-item" id="id-result-div">
					<div class="left"></div>
					<div class="right">						
						<span id="id_result"></span>						
					</div>					
				</div>
				
				<div class="enroll-item">
					<div class="left">비밀번호</div>
					<div class="right">
						<input type="password" name="password" id="pw1" required/>
						<span>영.숫자 포함 8글자 이상 작성</span>
					</div>
				</div>
				
				<div class="enroll-item">
					<div class="left">비밀번호 확인</div>
					<div class="right">
						<input type="password" name="password2" id="pw2" required />						
					</div>
				</div>
				
				<div class="enroll-item" id="pw-result-div">
					<div class="left"></div>
					<div class="right">						
						<span id="password_result"></span>						
					</div>					
				</div>	
							
				<div class="enroll-item msgdiv">
					<div class="left">이름</div>
					<div class="right">
						<input type="text" name="p_name" value="${Member != null ? Member.p_name : '' }"/>
						<input type="text" name="is_sns" value="${Member != null ? Member.is_sns : '' }"/>
						<input type="hidden" name="kakao_id" value="${Member != null ? Member.kakao_id : '' }"/>
					</div>
				</div>
				
				<div class="enroll-item">
					<div class="left">성별</div>
					<div class="right">
						<input type="radio" name="gender" value="M" />남
						<input type="radio" name="gender" value="F" />여
					</div>
				</div>
				
				<div class="enroll-item">
					<div class="left">연락처</div>
					<div class="right"><input type="phone" name="phone" autocomplete="off" /></div>
				</div>
				
				<div class="enroll-item">
					<div class="left">최종학력</div>
					<div class="right"><input type="text" name="final_edu" autocomplete="off" /></div>
				</div>
				
				<div class="enroll-item">
					<div class="left">학교</div>
					<div class="right"><input type="text" name="school" autocomplete="off" /></div>
				</div>
				
				<div class="enroll-item">
					<div class="left">전공</div>
					<div class="right"><input type="text" name="major" autocomplete="off" /></div>
				</div>
				
				<div class="enroll-text">
					<b>약관동의</b></br>
				</div>
				<div class="enroll-text">
					<div>전체동의<input type="checkbox" class="chk" id="chk_all" /></div>
				</div>
				<div class="enroll-text">
					<div>기업회원 약관에 동의<input type="checkbox" class="chk" name="chk" id="ch2" /></div>
				</div>
				<div class="enroll-text">
					<div>개인정보 수집 및 이용에 동의<input type="checkbox" class="chk" name="chk" id="ch3" /></div>
				</div>
				<div class="enroll-text">
					<div>마케팅 정보 수신 동의 - 이메일 (선택)<input type="checkbox" class="chk" name="chk" id="ch4" /></div>
				</div>
				<div class="enroll-text">
					<div>마케팅 정보 수신 동의 - SMS/MMS (선택)<input type="checkbox" class="chk" name="chk" id="ch5" /></div>
				</div>
				<div class="enroll-text">
					<div>개인정보 제 3자 제공 및 위탁사항 이용약관</div>
				</div>
				<div class="enroll-text-end">
					<input type="reset" value="취소" /><input type="submit" value="등록" id="enrollBtn" />
				</div>
		</div>
		</form>
	</div>
</section>

<script>
//인증번호 전송
$(document).ready(function(){
	$('#emailSender').on('click', function(){
		
		alert("가입하신 이메일로 인증메일이 발송되었습니다.");
		
		var p_id=$('#p_id').val();
		var keyck=$('#keyck').val();
		/* var key=$('#key').val(); */
		
		$.ajax({
			type:'POST',
			url:'${path}/emailSender?p_id='+p_id, //이메일 보내기 
			success:function(data){
				
				/* window.open('${path}/member/emailForm?keyck='+keyck, '', 'width=300, height=300'); */
				
				$('#key').blur(function(){
					if(key!=keyck){					
						console.log("인증번호 불일치");						
					}else{
						
						console.log("인증번호 일치");
					} 
				});
				
				console.log(keyck);
			},
			error:function(error){
				alert(error);
			}
		});			
			
	});
});

//아이디 중복체크
$(document).ready(function(){	
	$('#p_id').blur(function(){		
		var p_id=$('#p_id').val();							
		$.ajax({
			type:"POST",
			url: "${path}/member/checkId?p_id="+p_id,
			success:function(result){
				$("#id-result-div").show();
				if(result!=0){							
					$("#id_result").html("사용 불가능한 아이디입니다.").css('color', 'red');					
				}else{							
					$("#id_result").html("사용 가능한 아이디입니다.").css('color', 'green');					
				}
			},error:function(error){
				$("#id_result").html("error");
			}
		});
	});
});

//비밀번호 일치
 $(function(){
	$("input[type=password]").blur(function(){
		var pw1=$('#pw1').val();
		var pw2=$('#pw2').val();		
		var result=document.getElementById("password_result");
		
		if(pw1.trim()!=pw2.trim()){
			$('#password_result').html("비밀번호가 일치하지 않습니다.");
			result.style.color="red";
			
		}else{
			$('#password_result').html("비밀번호가 일치합니다.");
			result.style.color="green";				
		}
		$("#pw-result-div").show();
	});
});


</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>