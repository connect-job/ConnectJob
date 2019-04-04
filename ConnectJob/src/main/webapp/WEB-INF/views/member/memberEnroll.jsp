<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<<<<<<< HEAD

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
	<div id="enroll-container">
	<!-- 개인회원가입 -->
	<div class="title">
		<div class="title-left">회원가입</div>
		<div class="title-right">심사를 통해 게재된 믿을 수 있는 기업리뷰　|　이력서를 통한 기업 매칭 시스템<br>커넥트잡 회원이 되어 <b>모든 서비스를 무료</b>로 이용하세요</div>
	</div><br>
	<div class="enrollType">
		<div class="enroll-item" onclick="location.href='${path}/member/memberEnrollPage.do'"><i class="fas fa-user-edit"></i><br>일반회원가입</div>
		<div class="enroll-item" onclick="location.href='${path}/cmember/cmemberEnroll.do'"><i class="fas fa-building"></i><br>기업회원가입</div>
	</div>
</section>

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
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
=======
<%
	HashMap<String, Object> userInfo=(HashMap<String, Object>)request.getAttribute("userInfo");
%>
<section>

	<form name="memberEnrollFrm" method="post">
	<table>
		<tr>
			<td>이메일 아이디</td>
			<td><input type="email" name="p_id" required/></td>
			<td><input type="button" value="중복확인" id="idck"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password" id="pw1" onkeyup="verify.check()" required/></td>
			<td><span>영.숫자  포함 8글자 이상 작성</span></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="password2" id="pw2" onkeyup="verify.check()" required/></td>
			<td><div id="password_result"></div></td>			
		</tr>		
		<c:if test="${userInfo==null }">
			<tr>
				<td>이름</td>		
				<td>
					<input type="text" name="p_name"/>
					<input type="hidden" name="is_sns"/>
				</td>
			</tr>
		</c:if>
		<c:if test="${userInfo!=null }">	
			<tr>
				<td>이름</td>		
				<td><input type="text" name="pName" value="${userInfo.nickname }"/></td>
			</tr>
			<tr>			
				<td><input type="hidden" name="isSns" value="${userInfo.id }"/></td>
			</tr>		
		</c:if>
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
>>>>>>> branch 'jian' of https://github.com/connect-job/ConnectJob.git

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




