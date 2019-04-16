<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jQuery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

<style>
	div#id-result-div{display: none;}
</style>


<section>
   <div id="enroll-container">
      <div class="title">
         <div class="title-left">기업회원가입</div>
         <div class="title-right">무료 채용공고 등록　|　원하는 인재 찜하기 서비스<br>커넥트잡 기업회원에게 <b>모든 서비스를 무료</b>로 이용 가능합니다</div>
      </div><br>
      <div id="memberEnroll">
         <form action="${path }/cMemberEnrollEnd.do" method="post" class="signup-frm" autocomplete="off"/>
            <div class="enroll-title">
               	기업정보 인증
            </div>
            <div class="enroll-item">
               <div class="left">
                 	 사업자번호
               </div>
               <div class="right">
                  <input type="text" class="CMember" id="CMemberBNum" name="CMemberBNum"  required maxlength="12"/>
                  <select type="select" class="CMember" id="CMemberDiv" name="CMemberDiv" required><i class="fas fa-arrow-down"></i></br>
                     <option value="divide" selected disabled>기업구분</option>
                     <option value="normal">일반</option>
                     <option value="staffing">인재파견</option>
                     <option value="headhunting">헤드헌팅</option>
                  </select>
               </div>
            </div>
            
            <div class="enroll-item">
               <div class="left">
                  	기업선택
               </div>
               <div class="right">
                  <input type="text" class="CMember" id="cId" name="cId"  required/>
               </div>
            </div>
            
            <div class="enroll-item">
               <div class="left">
                 	 기업 연락처
               </div>
               <div class="right">
                  <input type="text" class="CMember" id="CMemberCPhone" name="CMemberCPhone" required/>
               </div>
            </div>

            <div class="enroll-title">
            	  담당자 정보 입력
            </div>

            <div class="enroll-item">
               <div class="left">담당자 인증</div>
               <div class="right">
			                  이메일 인증<input type="checkbox" value="emailCk()" />
			                  이메일<input type="hidden" id="emailCksub" />
                  <button>인증<i class="fas fa-check"></i></button>
               </div>
            </div>

            <div class="enroll-item">
               <div class="left">아이디</div>
               <div class="right"><input type="text" class="CMember" id="CMemberId" name="CMemberId"/></div>
            </div>
            
            <div class="enroll-item" id="id-result-div">
				<div class="left"></div>
				<div class="right">						
					<span id="id_result"></span>						
				</div>					
			</div>

            <div class="enroll-item">
               <div class="left">비밀번호</div>
               <div class="right"><input type="password" class="CMember" id="CMemberPw" placeholder="영문+숫자+특수문자 8글자 이상 입력" required/>
               		<span id="pw_validate"></span>
               </div>
            </div>

            <div class="enroll-item">
               <div class="left">비밀번호 확인</div>
               <div class="right">
               		<input type="password" class="CMember" id="CMemberPwCk" name="CMemberPw" required/>
               		<span id="password_result"></span>
               </div>
            </div>
            <div class="enroll-item">
               <div class="left">담당자 이름</div>
               <div class="right">
               		<input type="text" class="CMember" id="CMemberName" name="CMemberName"/>
               
               </div>
            </div>
            <div class="enroll-item">
               <div class="left">담당자 연락처</div>
               <div class="right"><input type="text" class="CMember" id="CMemberPhone" name="CMemberPhone" /></div>
            </div>

            <div class="enroll-item">
               <div class="left">담당자 이메일</div>
               <div class="right"><input type="email" class="CMember" id="CMemberEmail" name="CMemberEmail" /></div>
            </div>

            <div class="enroll-title">
               	약관동의
            </div>

            <div class="enroll-text">
               	전체동의 <input type="checkbox" id="ACCEPT_TERMS" value="ACCEPT_TERMS_ALL"  class="chk" />
            </div>

            <div class="enroll-text">
               	기업회원 약관에 동의(필수)<input type="checkbox" id="CMemberAccept" class="chk" name="chk" required />
            </div>

            <div class="enroll-text">
               	개인정보 수집 및 이용에 동의(필수)<input type="checkbox" id="CMemberAccept" class="chk" name="chk" required />
            </div>

            <div class="enroll-text">
               	마케팅 정보 수신 동의 - 이메일 (선택)<input type="checkbox" id="CMemberAccept" class="chk" name="chk" />
            </div>

            <div class="enroll-text">
              	 마케팅 정보 수신 동의 - SMS/MMS (선택)<input type="checkbox" id="CMemberAccept" class="chk" name="chk" />
            </div>

            <div class="enroll-text">
              	개인정보 제 3자 제공 및 위탁사항 이용약관
            </div>

            <div class="enroll-text">
               <button>회원가입완료</button>
            </div>
      
         </form>
      </div>
   </div>
</section>
<script>

$(document).ready(function(){	
	$('#CMemberId').blur(function(){
		var emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		var CMemberId=$('#CMemberId').val();
		
		if(CMemberId.trim()==""){
			$("#id-result-div").show();
			$("#id_result").html("아이디를 입력해주세요").css('color', 'red');
			$('#CMemberId').focus();
		}else if(CMemberId.indexOf(" ")>=0){
			$("#id-result-div").show();
			$("#id_result").html("아이디에는 공백이 들어갈 수 없습니다.").css('color', 'red');
			$('#CMemberId').focus();
		}/* else if(emailRegex.test(CMemberId)==false){
			$("#id-result-div").show();
			$("#id_result").html("이메일 형식이 올바르지 않습니다.").css('color', 'red');
			$('#CMemberId').focus();
		 */}else{
			$.ajax({
				type:"POST",
				url: "${path}/member/checkId?CMemberId="+CMemberId,
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
		}		
	});
});


//정규식
$(document).ready(function(){
	$("#CMemberPw").keyup(function(){
		var pw=$('#CMemberPw').val();
		
		var checkSpe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?-]/gi);
		var checkNumber = pw.search(/[0-9]/g);
		var checkEnglish = pw.search(/[a-z]/ig);
		
		console.log(checkSpe);
		
		if(checkEnglish<0 || checkNumber<0 || checkSpe<0) {
			$('#pw_validate').html("영문+숫자+특수문자").css('color', 'red');
			$('#CMemberPw').focus();
		}else if(pw.trim().length<8 || pw.trim().length>20){
			$('#pw_validate').html("8자리 이상 20자리 이하로 입력해주세요.").css('color', 'red');
			$('#CMemberPw').focus();
		}else if(pw.indexOf(" ")>=0){
			$('#pw_validate').html("공백 입력 불가").css('color', 'red');
			$('#CMemberPw').focus();
		}else{
			$('#pw_validate').html("사용 가능한 비밀번호입니다.").css('color', 'green');
		}	
	
	});
});

$(document).ready(function(){
	
	$("#CMemberPwCk").blur(function(){
		
		var password=$('#CMemberPw').val();
		var password2=$('#CMemberPwCk').val();	
		
		if(password.trim()!=password2.trim()){
			$('#password_result').html("비밀번호가 일치하지 않습니다.").css('color', 'red');
			$('#CMemberPwCk').focus();
		}else{
			$('#password_result').html("비밀번호가 일치합니다.").css('color', 'green');	
		}		
	});
});
   
   
 //체크박스 전체선택 및 전체해제
   $("#ACCEPT_TERMS").click(function(){
       if($("#ACCEPT_TERMS").is(":checked")){
           $(".chk").prop("checked",true);
       }
       else{
           $(".chk").prop("checked",false);
       }
   });

   //한개의 체크박스 선택 해제시 전체선택 체크박스도 해제
   $(".chk").click(function(){
       if($("input[name='chk']:checked").length == 4){
           $("#ACCEPT_TERMS").prop("checked",true);
       }else{
           $("#ACCEPT_TERMS").prop("checked",false);
       }
   });






</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>