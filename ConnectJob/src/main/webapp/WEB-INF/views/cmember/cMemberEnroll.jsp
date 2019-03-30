<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
<section>
	<form action="${path }/cMemberEnrollEnd.do" method="post" class="signup-frm" autocomplete="off">
			<b>기업인증</b><br /> 
			사업자번호<input type="text" class="CMember" id="CMemberBNum" /></br> 
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
</section>
 	<script>
 	
 	//회원가입 유효성 검사
 	const signupFrm = $('.signup-frm');
 	const signupPw = $('.signup-frm #CMemberPw');
 	const signupPwCk = $('.signup-frm #CMemberPwCk');
 	const signupId = $('.signup-frm #CMemberId');
 	const signupEmail = $('.signup-frm #emailCksub');
 	const signupPhone = $('.signup-frm #CMemberPhone');

 	const validationMsg = $('.validation-msg');
 	const signupInputs = $('.validation-msg').prev();
 	const idAvail = $('#idAvail');
 	
 	//회원가입 submit시 체크
	$(() => {
		signupFrm.on('submit', e => {
			let invalidCount = 0;
       
            checkBlank();
            if(!idRegExpValid(e)) invalidCount++;
            if(idAvail.val() == 'false') invalidCount++;
            if(!pwRegExpValid(e)) invalidCount++;
            if(!emailRegExpValid(e)) invalidCount++;
            if(!pwCkValid(e)) invalidCount++;
            if(!phoneRegExpValid(e)) invalidCount++;
            
            if(invalidCount == 0)
            {
            	console.log('됩니까?');
				return true;
            }
            else
            {
				alert('회원가입 양식에 수정이 필요합니다.');
            	return false;
            }
		});
	});
 	
	//아이디 중복체크
    const idAvailAjax = (e) => {
        $.ajax({
        	url: '${path}/checkId?memberId='+signupId.val(),
        	type: 'get',
        	dataType: 'text',
        	success: data => {
        		if(data == 'true')
        		{
            		idAvail.val('false');
            		$(e.target).next().css('color', 'crimson');
            		$(e.target).next().text('해당 아이디가 이미 존재합니다.');
            		
					
        		}
        		else
        		{
        			idAvail.val('true');
        			$(e.target).next().css('color', 'green');
        			$(e.target).next().text('사용가능한 아이디입니다.');

        			$(e.target).parent().next().children().show();
        			
        		}
        	}
        });
    }

    //회원가입란 공백체크
    const checkBlank = () => {
        for(let i = 0 ; i < signupInputs.length ; i++)
        {
            if(signupInputs[i].value.trim().length == 0)
            {
                signupInputs[i].focus();
                return;
            }
        }
    }

    //아이디 정규식
    const idRegExpValid = (e)=> {
        if(signupId.val().length == 0) return;
        
        const regex = new RegExp('^[a-zA-Z][a-zA-Z0-9]{3,11}$');
        const result = regex.test(signupId.val());
       	if(!result) $(e.target).next().css('color','crimson').text('잘못된 아이디 문자 조합입니다.');
        return result;
    }

    
    
 	
    </script>
    <style>
        b{
            font-size: 20px;
        }
        
    </style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>