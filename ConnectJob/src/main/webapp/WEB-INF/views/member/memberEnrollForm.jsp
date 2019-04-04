<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
	<div id="enroll-container">
		<!-- 개인회원가입 -->
		<div class="title">
			<div class="title-left">일반회원가입</div>
			<div class="title-right">심사를 통해 게재된 믿을 수 있는 기업리뷰　|　이력서를 통한 기업 매칭 시스템<br>커넥트잡 회원이 되어 <b>모든 서비스를 무료</b>로 이용하세요
			</div>
		</div>
		<div id="memberEnroll" class="tab-content current">
			<form name="memberEnrollFrm" action="${path}/member/memberEnrollEnd.do" method="post">
				<div class="enroll-item">
					<div class="left">아이디</div>
					<div class="right">
						<input type="email" name="pId" autocomplete="off" />
						<input type="button" value="중복확인" id="idck" />
					</div>
				</div>
				<div class="enroll-item">
					<div class="left">비밀번호</div>
					<div class="right"><input type="password" name="password" id="pw1" onkeyup="verify.check()"
							required /><span>영.숫자 포함 8글자 이상 작성</span></div>
				</div>
				<div class="enroll-item">
					<div class="left">비밀번호 확인</div>
					<div class="right"><input type="password" name="password2" id="pw2" onkeyup="verify.check()"
							required />
						<div id="password_result"></div>
					</div>
				</div>
				<c:if test="${userInfo==null }">
					<div class="enroll-item msgdiv">
						<div class="left">이름</div>
						<div class="right">
							<input type="text" name="p_name" />
							<input type="hidden" name="is_sns" />
						</div>
					</div>
				</c:if>
				<c:if test="${userInfo!=null }">
					<div class="enroll-item msgdiv">
						<div class="left">이름</div>
						<div class="right">
							<input type="text" name="pName" value="${userInfo.nickname }" />
							<input type="hidden" name="isSns" value="${userInfo.id }" />
						</div>
					</div>
				</c:if>

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
					<div class="right"><input type="text" name="finalEdu" autocomplete="off" /></div>
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
					<input type="reset" value="취소" /><input type="submit" value="등록" onclick="fn_enroll()" />
				</div>
		</div>
		</form>
	</div>
</section>

<script>
	function verifynotify(field1, field2, result_id, match_html, nomatch_html) {
		this.field1 = field1;
		this.field2 = field2;
		this.result_id = result_id;
		this.match_html = match_html;
		this.nomatch_html = nomatch_html;

		this.check = function () {
			if (!this.result_id) { return false; }
			if (!document.getElementById) { return false; }
			r = document.getElementById(this.result_id);
			if (!r) { return false; }

			if (this.field1.value != "" && this.field1.value == this.field2.value) {
				r.innerHTML = this.match_html;
			} else {
				r.innerHTML = this.nomatch_html;
			}
		}
	}

	function verifyInput() {
		verify = new verifynotify();
		verify.field1 = document.memberEnrollFrm.password;
		verify.field2 = document.memberEnrollFrm.password2;
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
			window.onload = function () {
				if (oldonload) {
					oldonload();
				}
				func();
			}
		}
	}

	addLoadEvent(function () {
		verifyInput();
	});


	// 최소길이 & 최대길이 제한
	var minimum = 8;
	var maximun = 12;

	function chkPw(obj, viewObj) {
		var paramVal = obj.value;
		var msg = chkPwLength(obj);
		if (msg == "") msg = "안전한 비밀번호 입니다.";

		document.getElementById(viewObj).innerHTML = msg;
	}

	// 글자 갯수 제한
	function chkPwLength(paramObj) {
		var msg = "";
		var paramCnt = paramObj.value.length;

		if (paramCnt < minimum) {
			msg = "최소 암호 글자수는 <b>" + minimum + "</b> 입니다.";
		} else if (paramCnt > maximun) {
			msg = "최대 암호 글자수는 <b>" + maximun + "</b> 입니다.";
		} else {
			msg = chkPwNumber(paramObj);
		}

		return msg;
	}

	//비밀번호 유효성 검사
	function chkPwNumber(paramObj) {
		var msg = "";
		// if(!paramObj.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/))
		if (!paramObj.value.match(/([a-zA-Z0-9])|([a-zA-Z0-9])/)) {
			// msg = "비밀번호는 영어, 숫자, 특수문자의 조합으로 6~16자리로 입력해주세요.";
			msg = "비밀번호는 영어, 숫자의 조합으로 6~16자리로 입력해주세요.";
		} else {
			msg = chkPwContinuity(paramObj);
		}

		return msg;
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>