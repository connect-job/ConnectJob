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
			  alert("비밀번호는 공백없이 입력해주세요.");
			  return false;
		} 
		if(num < 0 || eng < 0 || spe < 0 ){
			alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			return false;
		}
		return true;			
	})
	
	
	$(document).ready(function(){
        
            $('ul.tabs li').click(function(){
            var tab_id = $(this).attr('data-tab');
        
            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');
        
            $(this).addClass('current');
            $("#"+tab_id).addClass('current');
            
            })
        })
        
        //체크박스 전체선택 및 전체해제
        $("#chk_all").click(function(){
            if($("#chk_all").is(":checked")){
                $(".chk").prop("checked",true);
            }
            else{
                $(".chk").prop("checked",false);
            }
        });

        //한개의 체크박스 선택 해제시 전체선택 체크박스도 해제
        $(".chk").click(function(){
            if($("input[name='chk']:checked").length == 3){
                $("#chk_all").prop("checked",true);
            }else{
                $("#chk_all").prop("checked",false);
            }
        });
	

        	


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
	/* 개인회원 기업회원 탭나눔 스타일 */
	.enroll-container{
        width: 500px;
        margin: 0 auto;
        }     
        ul.tabs{
        margin: 0px;
        padding: 0px;
        list-style: none;
        }
        ul.tabs li{
        background: none;
        color: #222;
        display: inline-block;
        padding: 10px 15px;
        cursor: pointer;
        }
        
        ul.tabs li.current{
        background: #ededed;
        color: #222;
        }
        
        .tab-content{
        display: none;
        background: #ededed;
        padding: 15px;
        }
        
        .tab-content.current{
        display: inherit;
        }
</style>

<section>
	<div class="enroll-container">
	<!-- 개인회원가입 -->
		<ul class="tabs">
			<li class="tab-link current" data-tab="memberEnroll">개인회원</li>
			<li class="tab-link" data-tab="cmemberEnroll">기업회원</li>
		</ul>	
		<div id="memberEnroll" class="tab-content current"><!-- 개인회원가입 -->
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
					<b>약관동의</b></br>
				</tr>	
				<tr>
					<td>전체동의</td><td><input type="checkbox" class="chk" id="chk_all"/></td>
				</tr>
				<tr>
					<td>기업회원 약관에 동의</td><td><input type="checkbox" class="chk" name="chk" id="ch2"/></td>
				</tr>
				<tr>		
					<td>개인정보 수집 및 이용에 동의</td><td><input type="checkbox" class="chk" name="chk" id="ch3"/></td>
				</tr>
				<tr>		
					<td>마케팅 정보 수신 동의 - 이메일 (선택)</td><td><input type="checkbox" class="chk" name="chk" id="ch4"/></td>
				</tr>
				<tr>		
					<td>마케팅 정보 수신 동의 - SMS/MMS (선택)</td><td><input type="checkbox" class="chk" name="chk" id="ch5"/></td>
				</tr>
				<tr>		
					<td>개인정보 제 3자 제공 및 위탁사항 이용약관</td><td><a></a></td>
				</tr>
				<tr>
					<td><input type="submit" value="등록"/></td>
					<td><input type="reset" value="취소"/></td>
				</tr>		
			</table>
			</form>
		</div>
		
	<!-- 기업회원가입 -->
		<div id="cmemberEnroll" class="tab-content">
				<form action="${path }/cMemberEnrollEnd.do" method="post" class="signup-frm" autocomplete="off">
					<b>기업인증</b><br /> 
					사업자번호<input type="text" class="CMember" id="CMemberBNum" />
					<select type="select" class="CMember" id="CMemberDiv"><i class="fas fa-arrow-down"></i></br>
						<option value="divide" selected disabled>기업구분</option>
						<option value="normal">일반</option>
						<option value="staffing">인재파견</option>
						<option value="headhunting">헤드헌팅</option>
					</select>
					 <br /> <br /> <br /> 
					 <b>담당자 인증</b><br />
						휴대폰인증<input type="checkbox" value="" />api?<br /> 
						이메일 인증<input type="checkbox" value="emailCk()" /><br />
						이메일<input type="hidden" id="emailCksub" />
					<button>인증<i class="fas fa-check"></i></button>
					<br /> <br /> <br /> 
					<b>ID/PW</b><br /> 
					회원 아이디<input type="text"class="CMember" id="CMemberId" /></br> 
					회원 비밀번호<input type="password" class="CMember" id="CMemberPw" /></br> 
					회원 비밀번호 확인<input type="password"class="CMember" id="CMemberPwCk" /></br> 
					회원 담당자 이름<input type="text" class="CMember" id="CMemberName" /></br> 
					회원 담당자 연락처<input type="text" class="CMember" id="CMemberPhone" /></br> 
					기업 연락처<input type="text" class="CMember" id="CMemberCPhone" /></br> 
					회원 담당자이메일<input type="email" class="CMember" id="CMemberId" /></br> </br> </br> 
					<b>약관동의</b></br>
					<div>
						전체동의 <input type="checkbox" id="ACCEPT_TERMS" value="ACCEPT_TERMS_ALL" /></br>
						-----------------------------------------------------------------------</br>
						기업회원 약관에 동의<input type="checkbox" id="CMemberAccept" /></br>
						개인정보 수집 및 이용에 동의<input type="checkbox" id="CMemberAccept" /></br>
						마케팅 정보 수신 동의 - 이메일 (선택)<input type="checkbox" id="CMemberAccept" /></br>
						마케팅 정보 수신 동의 - SMS/MMS (선택)<input type="checkbox" id="CMemberAccept" /></br>
						개인정보 제 3자 제공 및 위탁사항 이용약관</br>
					</div>
					<button>회원가입완료</button>
				</form>
			</div>
	</div>
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





