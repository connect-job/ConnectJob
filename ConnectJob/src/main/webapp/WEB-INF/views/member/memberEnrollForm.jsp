<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
	<div id="enroll-container">
	<!-- 개인회원가입 -->
	<div class="title">
		<div class="title-left">일반회원가입</div>
		<div class="title-right">심사를 통해 게재된 믿을 수 있는 기업리뷰　|　이력서를 통한 기업 매칭 시스템<br>커넥트잡 회원이 되어 <b>모든 서비스를 무료</b>로 이용하세요</div>
	</div>
		<div id="memberEnroll" class="tab-content current">
			<form name="memberEnrollFrm" action="${path}/member/memberEnrollEnd.do" method="post">
					<div class="enroll-item">
						<div class="left">아이디</div>
						<div class="right">
							<input type="email" name="pId" autocomplete="off"/>
							<input type="button" value="인증번호 전송" name="id_ck"/>
						</div>
					</div>
					<div class="enroll-item">
						<div class="left">비밀번호</div>
						<div class="right"><input type="password" name="password" id="pw" autocomplete="new-password"/></div>
					</div>
					<div class="enroll-item">
						<div class="left">비밀번호 확인</div>
						<div class="right"><input type="password" name="password2" id="pw2" autocomplete="new-password"/></div>
						
					</div>
					<div class="enroll-item msgdiv">
						<div class="left"></div>
						<div class="right">
							<div class="error">비밀번호 오류</div>
							<div class="success">비밀번호 일치</div>
						</div>
					</div>
					<div class="enroll-item">
						<div class="left">이름</div>
						<div class="right"><input type="text" name="pName" autocomplete="off"/></div>
					</div>
					<div class="enroll-item">
						<div class="left">성별</div>
						<div class="right">
							<input type="radio" name="gender" value="M"/>남
							<input type="radio" name="gender" value="F"/>여
						</div>
					</div>
					<div class="enroll-item">
						<div class="left">연락처</div>
						<div class="right"><input type="phone" name="phone" autocomplete="off"/></div>
					</div>		
					<div class="enroll-item">
						<div class="left">최종학력</div>
						<div class="right"><input type="text" name="finalEdu" autocomplete="off"/></div>
					</div>
					<div class="enroll-item">
						<div class="left">학교</div>
						<div class="right"><input type="text" name="school" autocomplete="off"/></div>
					</div>
					<div class="enroll-item">
						<div class="left">전공</div>
						<div class="right"><input type="text" name="major" autocomplete="off"/></div>
					</div>
					<div class="enroll-text">
						<b>약관동의</b></br>
					</div>	
					<div class="enroll-text">
						<div>전체동의<input type="checkbox" class="chk" id="chk_all"/></div>
					</div>
					<div class="enroll-text">
						<div>기업회원 약관에 동의<input type="checkbox" class="chk" name="chk" id="ch2"/></div>
					</div>
					<div class="enroll-text">		
						<div>개인정보 수집 및 이용에 동의<input type="checkbox" class="chk" name="chk" id="ch3"/></div>
					</div>
					<div class="enroll-text">		
						<div>마케팅 정보 수신 동의 - 이메일 (선택)<input type="checkbox" class="chk" name="chk" id="ch4"/></div>
					</div>
					<div class="enroll-text">		
						<div>마케팅 정보 수신 동의 - SMS/MMS (선택)<input type="checkbox" class="chk" name="chk" id="ch5"/></div>
					</div>
					<div class="enroll-text">		
						<div>개인정보 제 3자 제공 및 위탁사항 이용약관</div>
					</div>
					<div class="enroll-text-end">
						<input type="reset" value="취소"/><input type="submit" value="등록"/>
					</div>		
				</div>
			</form>
		</div>
</section>

<script>
	$(function(){
		var pw=$('#pw').val();
		var pw2=$('#pw2').val();
		
		$('#pw2').click(function(){			
			console.log(pw);
			console.log(pw2);
			if(pw!=pw2){
				$('.msgdiv').css("display", "show");
				$('.error').css("display", "show");
				pw2.focus();
			};
		})
		
	})
	
	$(function(){
		var pw=sdiv;
		var num=pw.search(/[0-9]/g);
		var eng=pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
		if(pw.length<8 || pw.length>20){
			alert("영문, 숫자, 특수문자 혼합해 8자리~20자리 이내로 입력하세요");
			return false;
		}		
		if(pw.search(/₩s/) != -1){
			  alert("비밀번호는 공백없이 입력해주세요.");
			  return false;
		} 
		if(num < 0 || eng < 0 || spe < 0 ){
			alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			return false;
		}
		return divue;			
	})
	
	//탭화면 나눔
 	$(document).ready(function(){
        
            $('div.enroll-container ul.tabs li').click(function(){
            var tab_id = $(this).atdiv('data-tab');
        
            $('div.enroll-container ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');
        
            $(this).addClass('current');
            $("#"+tab_id).addClass('current');

            })
        }) 

         //체크박스 전체선택 및 전체해제
        $("#chk_all").click(function(){
            if($("#chk_all").is(":checked")){
                $(".chk").prop("checked",divue);
            }
            else{
                $(".chk").prop("checked",false);
            }
        });

        //한개의 체크박스 선택 해제시 전체선택 체크박스도 해제
        $(".chk").click(function(){
            if($("input[name='chk']:checked").length == 4){
                $("#chk_all").prop("checked",divue);
            }else{
                $("#chk_all").prop("checked",false);
            }
        });
</script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





