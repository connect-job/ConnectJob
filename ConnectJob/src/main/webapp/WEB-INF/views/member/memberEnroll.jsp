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

<style>
	div.msgdiv{
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
				<div>
					<div>
						<div>아이디</div>
						<div><input type="email" name="pId"/></div>
						<div><input type="button" value="인증번호 전송" name="id_ck"/></div>
					</div>
					<div>
						<div>비밀번호</div>
						<div><input type="password" name="password" id="pw"/></div>
					</div>
					<div>
						<div>비밀번호 확인</div>
						<div><input type="password" name="password2" id="pw2"/></div>
						
					</div>
					<div class="msgdiv">
						<div></div>
						<div>
							<div class="error">비밀번호 오류</div>
							<div class="success">비밀번호 일치</div>
						</div>
					</div>
					<div>
						<div>이름</div>
						<div><input type="text" name="pName"/></div>
					</div>
					<div>
						<div>성별</div>
						<div>
							<input type="radio" name="gender" value="M"/>남
							<input type="radio" name="gender" value="F"/>여
						</div>
					</div>
					<div>
						<div>연락처</div>
						<div><input type="phone" name="phone"/></div>
					</div>		
					<div>
						<div>최종학력</div>
						<div><input type="text" name="finalEdu"/></div>
					</div>
					<div>
						<div>학교</div>
						<div><input type="text" name="school"/></div>
					</div>
					<div>
						<div>전공</div>
						<div><input type="text" name="major"/></div>
					</div>
					<div>
						<b>약관동의</b></br>
					</div>	
					<div>
						<div>전체동의</div><div><input type="checkbox" class="chk" id="chk_all"/></div>
					</div>
					<div>
						<div>기업회원 약관에 동의</div><div><input type="checkbox" class="chk" name="chk" id="ch2"/></div>
					</div>
					<div>		
						<div>개인정보 수집 및 이용에 동의</div><div><input type="checkbox" class="chk" name="chk" id="ch3"/></div>
					</div>
					<div>		
						<div>마케팅 정보 수신 동의 - 이메일 (선택)</div><div><input type="checkbox" class="chk" name="chk" id="ch4"/></div>
					</div>
					<div>		
						<div>마케팅 정보 수신 동의 - SMS/MMS (선택)</div><div><input type="checkbox" class="chk" name="chk" id="ch5"/></div>
					</div>
					<div>		
						<div>개인정보 제 3자 제공 및 위탁사항 이용약관</div><div><a></a></div>
					</div>
					<div>
						<div><input type="submit" value="등록"/></div>
						<div><input type="reset" value="취소"/></div>
					</div>		
				</div>
			</form>
		</div>
		
	<!-- 기업회원가입 -->
		<div id="cmemberEnroll" class="tab-content">
				<form action="${path }/cMemberEnrollEnd.do" method="post" class="signup-frm" autocomplete="off">
					<div><b>기업인증</b><br /></div> 
					<div>사업자번호<input type="text" class="CMember" id="CMemberBNum" /><div>
					<div><select type="select" class="CMember" id="CMemberDiv"><i class="fas fa-arrow-down"></i></br>
						<option value="divide" selected disabled>기업구분</option>
						<option value="normal">일반</option>
						<option value="staffing">인재파견</option>
						<option value="headhunting">헤드헌팅</option>
					</select></div>
					 <br /> <br /> <br /> 
					 <div><b>담당자 인증</b><br />
						휴대폰인증<input type="checkbox" value="" />api?<br /> 
						이메일 인증<input type="checkbox" value="emailCk()" /><br />
						이메일<input type="hidden" id="emailCksub" />
					<button>인증<i class="fas fa-check"></i></button></div>
					<br /> <br /> <br /> 
					<div><b>ID/PW</b><br /></div> 
					<div>회원 아이디<input type="text"class="CMember" id="CMemberId" /></div>
					<div>회원 비밀번호<input type="password" class="CMember" id="CMemberPw" /></div> 
					<div>회원 비밀번호 확인<input type="password"class="CMember" id="CMemberPwCk" /></div> 
					<div>회원 담당자 이름<input type="text" class="CMember" id="CMemberName" /></div> 
					<div>회원 담당자 연락처<input type="text" class="CMember" id="CMemberPhone" /></div> 
					<div>기업 연락처<input type="text" class="CMember" id="CMemberCPhone" /></div> 
					<div>회원 담당자이메일<input type="email" class="CMember" id="CMemberId" /></div>
					<div><b>약관동의</b></div>
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





