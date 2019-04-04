<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<section>
	<form action="${path}/member/memberEnrollEnd.do" name="memberEnrollFrm" method="post">
	<table>
		<tr>
			<td>이메일 아이디</td>
			<td><input type="email" name="p_id" required/></td>
			<td><input type="button" value="중복확인" id="idck"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwor2" id="pw1" onkeyup="verify.check()" required/></td>
			<td><span>영.숫자  포함 8글자 이상 작성</span></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="password" id="pw2" onkeyup="verify.check()" required/></td>
			<td><div id="password_result"></div></td>			
		</tr>		
		<tr>
			<td>이름</td>		
			<td>
				<input type="text" name="p_name" value="${Member != null ? Member.p_name : '' }"/>
				<input type="text" name="is_sns" value="${Member != null ? Member.is_sns : '' }"/>
				<input type="hidden" name="kakao_id" value="${Member != null ? Member.kakao_id : '' }"/>
			</td>
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
			<td><input type="text" name="final_edu"/></td>
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
			<td><input type="submit" value="등록" onclick="fn_enroll()"/></td>
			<td><input type="reset" value="취소"/></td>
		</tr>		
	</table>
	</form>
</section>
<script>
//패스워드
function verifynotify(field1, field2, result_id, match_html, nomatch_html) {
	  this.field1 = field1;
	  this.field2 = field2;
	  this.result_id = result_id;
	  this.match_html = match_html;
	  this.nomatch_html = nomatch_html;

	  this.check = function() {
	    if (!this.result_id) { return false; }
	    if (!document.getElementById){ return false; }
	    r = document.getElementById(this.result_id);
	    if (!r){ return false; }

	    if (this.field1.value != "" && this.field1.value == this.field2.value) {
	      r.innerHTML = this.match_html;
	    } else {
	      r.innerHTML = this.nomatch_html;
	    }
	  }
	}

	function verifyInput() {
	  verify = new verifynotify();
	  verify.field1 = document.memberEnrollFrm.password2;
	  verify.field2 = document.memberEnrollFrm.password;
	  verify.result_id = "password_result";
	  verify.match_html = "<span style=\"color:green\">비밀번호가 일치합니다.<\/span>";
	  verify.nomatch_html = "<span style=\"color:red\">비밀번호가 일치하지않습니다.<\/span>";

	  // Update the result message
	  verify.check();
	}

	function addLoadEvent(func) {
	  var oldonload = window.onload;
	  if (typeof window.onload != 'function') {
	    window.onload = func;
	  } else {
	    window.onload = function() {
	      if (oldonload) {
	        oldonload();
	      }
	      func();
	    }
	  }
	}

	addLoadEvent(function() {
	  verifyInput();
	});

	
	// 최소길이 & 최대길이 제한
	var minimum = 8;
	var maximun = 12;

	function chkPw(obj, viewObj) {
		var paramVal = obj.value;
		var msg = chkPwLength(obj);
		if(msg == "") msg = "안전한 비밀번호 입니다.";

		document.getElementById(viewObj).innerHTML=msg;
	}

	// 글자 갯수 제한
	function chkPwLength(paramObj) {
		var msg = "";
		var paramCnt = paramObj.value.length;

		if(paramCnt < minimum) {
			msg = "최소 암호 글자수는 <b>" + minimum + "</b> 입니다.";
		} else if(paramCnt > maximun) {
			msg = "최대 암호 글자수는 <b>" + maximun + "</b> 입니다.";
		} else {
			msg = chkPwNumber(paramObj);
		}

		return msg;
	}

	//비밀번호 유효성 검사
	function chkPwNumber(paramObj) {
		var  msg = "";		
		// if(!paramObj.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/))
		if(!paramObj.value.match(/([a-zA-Z0-9])|([a-zA-Z0-9])/)) {
			// msg = "비밀번호는 영어, 숫자, 특수문자의 조합으로 6~16자리로 입력해주세요.";
			msg = "비밀번호는 영어, 숫자의 조합으로 6~16자리로 입력해주세요.";
		} else {
			msg = chkPwContinuity(paramObj);
		}

		return msg;
	}

	/* // 암호 연속성 검사 및 동일 문자
	function chkPwContinuity(paramObj) {
		var msg = "";
		var SamePass_0 = 0; //동일문자 카운트
		var SamePass_1_str = 0; //연속성(+) 카운드(문자)
		var SamePass_2_str = 0; //연속성(-) 카운드(문자)
		var SamePass_1_num = 0; //연속성(+) 카운드(숫자)
		var SamePass_2_num = 0; //연속성(-) 카운드(숫자)

		var chr_pass_0;
		var chr_pass_1;
		var chr_pass_2;
		
		for(var i=0; i < paramObj.value.length; i++) {
			chr_pass_0 = paramObj.value.charAt(i);
			chr_pass_1 = paramObj.value.charAt(i+1);

			//동일문자 카운트
			if(chr_pass_0 == chr_pass_1)
			{
				SamePass_0 = SamePass_0 + 1
			}


			chr_pass_2 = paramObj.value.charAt(i+2);
			
			if(chr_pass_0.charCodeAt(0) >= 48 && chr_pass_0.charCodeAt(0) <= 57) {
				//숫자
				//연속성(+) 카운드
				if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1)
				{
					SamePass_1_num = SamePass_1_num + 1
				}
				
				//연속성(-) 카운드
				if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1)
				{
					SamePass_2_num = SamePass_2_num + 1
				}
			} else {
				//문자
				//연속성(+) 카운드
				if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1)
				{
					SamePass_1_str = SamePass_1_str + 1
				}
				
				//연속성(-) 카운드
				if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1)
				{
					SamePass_2_str = SamePass_2_str + 1
				}
			}
		}
		
		if(SamePass_0 > 1) {
			msg = "동일숫자 및 문자를 3번 이상 사용하면 비밀번호가 안전하지 못합니다.(ex : aaa, bbb, 111)";
		}

		if(SamePass_1_str > 1 || SamePass_2_str > 1 || SamePass_1_num > 1 || SamePass_2_num > 1)
		{
			msg = "연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다.";
		}

		return msg; 
	}*/
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>




