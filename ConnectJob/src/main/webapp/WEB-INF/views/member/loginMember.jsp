<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<section>
<div class="login-container">
	<ul class="tabs">
		<li class="tab-link current" data-tab="member">개인회원</li>
		<li class="tab-link" data-tab="cmember">기업회원</li>
	</ul>
	<!-- 일반회원 -->
	<div id="member" class="tab-content current">
		<form name="loginFrm" action="${path }/member/loginMember.do" method="post">
			<table>
			<caption>일반회원로그인</caption>
				<tr>
					<td>아이디</td>
					<td><input type="email" name="pId"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"/></td>
				</tr>
				<tr>
					<td><input type="submit" value="로그인"/></td>
					<td><input type="button" value="ID/PW찾기" id="findbtn"/></td>			
				</tr>
				<tr>
					<td colspan="2"><a id="kakao-login-btn"></a></td>				
				</tr>
			</table>	
		</form>	
	</div>


	<!-- 기업회원 -->		
	<div id="cmember" class="tab-content">
		<form name="loginFrm" action="${path }/cMemberLogin.do" method="post">
			<table>
			<caption>기업회원로그인</caption>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="cmemberId"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"/></td>
				</tr>
				<tr>
					<td><input type="submit" value="로그인"/></td>
					<td><input type="button" value="ID/PW찾기" id="findbtn"/></td>			
				</tr>
			</table>
		</form>	
	</div>
</div>
</section>

<script>
	$(function(){
		$("#findbtn").click(function(){
			location.href='${path}/member/findMember';
		})
	})

	// 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('60f4385612bb24ab265ce9857acca8ff');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
    
    //기업회원 파트
	/* $(function(){
		$("#findbtn").click(function(){
			location.href='${path}/member/findMember';
		})
	}); */
	$(function(){
		$("#CMemberEnroll").click(function(){
			location.href="${path}/CMemberEnroll.do"
		})
	})
	
	//개인회원 기업회원 나누는 탭설정
		$(document).ready(function(){
        
            $('ul.tabs li').click(function(){
            var tab_id = $(this).attr('data-tab');
        
            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');
        
            $(this).addClass('current');
            $("#"+tab_id).addClass('current');
            
            })
        })
	
</script>
<style>
	caption{
		font-size:20px; ;
	}
	
        .login-container{
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
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





