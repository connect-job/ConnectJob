<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<section>
<<<<<<< HEAD

<div id="login-container">
	<img src="${path }/resources/images/title.png" width="650px"><br><br>
	<ul id="tabs">
		<li class="tab-link selected" data-tab="member">개인회원</li>
		<li class="tab-link" data-tab="cmember">기업회원</li>
	</ul>
	<!-- 일반회원 -->
	<div id="member" class="tab-content current">
		<form name="loginFrm" action="${path }/member/loginMember.do" method="post">
			<div class="login-left">
				<div class="login-item">
					<div class="item-left">아이디</div>
					<div class="item-right"><input type="email" name="pId" autocomplete="off"/></div>
				</div>
				<div class="login-item">
					<div class="item-left">비밀번호</div>
					<div class="item-right"><input type="password" name="password" autocomplete="new-password"/></div>
				</div>
			</div>
			<div class="login-right">
					<a id="kakao-login-btn"></a><br>
					<input type="submit" value="로그인"/><br>
					<input type="button" value="ID/PW찾기" id="findbtn"/>
			</div>
		</form>	
	</div>


	<!-- 기업회원 -->		
	<div id="cmember" class="tab-content">
		<form name="cMemberloginFrm" action="${path }/cMemberLogin.do" method="post">
			<div class="login-left">
				<div class="login-item">
					<div class="item-left">아이디</div>
					<div class="item-right"><input type="text" name="CMemberId" autocomplete="off"/></div>
				</div>
				<div class="login-item">
					<div class="item-left">비밀번호</div>
					<div class="item-right"><input type="password" name="CMemberPw" autocomplete="new-password"/></div>
				</div>
			</div>
			<div class="login-right">
					<a id="kakao-login-btn"></a><br>
					<input type="submit" value="기업회원 로그인"/><br>
					<input type="button" value="ID/PW찾기" id="findbtn"/>
			</div>
		</form>	
	</div>
</div>
=======
	<form name="loginFrm" action="${path }/member/loginMember.do" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="email" name="p_id"/></td>
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
				<td colspan="2">
					<!-- 로그인 코드받기 -->
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=eea7cf213d496958f3d4df223aaacde8&redirect_uri=http://localhost:9090/job/kakaoLogin&response_type=code" id="kakao-login-btn"></a>
				</td>				
			</tr>
		</table>	
		
	</form>	
>>>>>>> branch 'jian' of https://github.com/connect-job/ConnectJob.git
</section>

<script>
	$(function(){
		$("#findbtn").click(function(){
			location.href='${path}/member/findMember';
		})
	})

	//js키 설정
    Kakao.init('60f4385612bb24ab265ce9857acca8ff');
	
	//카카오 로그인 버튼 생성
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',      
      success: function(authObj) {    
    	  
    	  Kakao.API.request({
    		  url:"/v2/user/me",
    		  success:function(res){
    			  console.log(res.id);
    		  }
    	  })
      },
      fail: function(err) {
    	  //실패
    	 /* alert(JSON.stringify(err)); */
      }
    });
<<<<<<< HEAD
    
    //기업회원 파트
	/* $(function(){
		$("#findbtn").click(function(){
			location.href='${path}/member/findMember';
		})
	}); */
	/* $(function(){
		$("#CMemberEnroll").click(function(){
			location.href="${path}/CMemberEnroll.do"
		})
	}) */
	
	//개인회원 기업회원 나누는 탭설정
		$('.tab-link').click(function() {
			$('.tab-link').eq(0).removeClass('selected');
			$('.tab-link').eq(1).removeClass('selected');
			$(this).addClass('selected');

			var id = $(this).attr('data-tab');

			if(id=='member') {
				$('#member').css("display","inline-block");
				$('#cmember').css("display","none");
			} else {
				$('#cmember').css("display","inline-block");
				$('#member').css("display","none");
			}
		});
	
=======
	
		
    
    /* Kakao.Auth.setAccessToken(accessTokenFromServer); */
>>>>>>> branch 'jian' of https://github.com/connect-job/ConnectJob.git
</script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





