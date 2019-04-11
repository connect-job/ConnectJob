<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<section>
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
					<div class="item-right"><input type="email" name="p_id" autocomplete="off"/></div>
				</div>
				<div class="login-item">
					<div class="item-left">비밀번호</div>
					<div class="item-right"><input type="password" name="password" autocomplete="new-password"/></div>
				</div>
			</div>
			<div class="login-right">
				<!-- <div id="naver_id_login"></div> -->				
				<a id="custom-login-btn" href="javascript:loginWithKakao()">
					<img src="${path }/resources/images/kakao_account_login_btn.png" width="250"/>
				</a>
				<!-- <a id="kakao-login-btn"></a> -->									
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
					<input type="submit" value="기업회원 로그인"/><br>
					<input type="button" value="ID/PW찾기" id="findbtn"/>
			</div>
		</form>	
	</div>
</div>
</section>

<script type='text/javascript'>
 	//카카오 로그인 custom버전
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('60f4385612bb24ab265ce9857acca8ff');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
        	Kakao.API.request({
	    		url: '/v1/user/me',
	    	    success: function(res) {	    	    	
	    	        var id = res.id;
	    	        console.log("아이디 저장:" + id); 	    	             
	    	        $.ajax({
	    	        	url: '${path}/member/isKakao.do?is_sns=kakao&kakao_id=' + id,
	    	            success: function(data) {
	    	            	
	    	            	if(data=='1') {	    	            		
	    	            		location.href="${path}/member/memberLoginKakao.do?kakao_id=" + id;
	    	            	} else {	    	            		
	    	            		 location.href="${path}/member/memberEnrollKakao.do?is_sns=kakao&kakao_id=" + id + "&p_name=" + res.properties['nickname'];
	    	            	}
	    	            }
	    	        });	    	       
				}
			});
          	
        },
        fail: function(err) {
          	alert(JSON.stringify(err));
        }
      });
    };
  
</script>
<script>
	$(function(){
		$("#findbtn").click(function(){
			location.href='${path}/member/findMember';
		});
	});

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
	
	//카카오 기본
	/* Kakao.init('60f4385612bb24ab265ce9857acca8ff'); */
	
	//카카오 로그인 버튼 생성
	/* Kakao.Auth.createLoginButton({		
		container: '#kakao-login-btn',
	    success: function(authObj) {    
	    	Kakao.API.request({
	    		url: '/v1/user/me',
	    	    success: function(res) {
	    	    	alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
	    	        alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
	    	        console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
	    	             
	    	        var id = res.id;
	    	        console.log("아이디 저장:" + id) 
	    	             
	    	        $.ajax({
	    	        	url: '${path}/member/isKakao.do?is_sns=kakao&kakao_id=' + id,
	    	            success: function(data) {
	    	            	console.log("돌려받은값 : " + data);
	    	            	if(data=='1') {
	    	            		alert('로그인페이지로 이동');
	    	            		location.href="${path}/member/memberLoginKakao.do?kakao_id=" + id;
	    	            	} else {
	    	            		 alert('회원가입페이지로 이동');
	    	            		 location.href="${path}/member/memberEnrollKakao.do?is_sns=kakao&kakao_id=" + id + "&p_name=" + res.properties['nickname'];
	    	            	}
	    	            }
	    	        });
	    	       console.log(res.kaccount_email); //<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
	    	        console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근  
	    	       //res.properties.nickname으로도 접근 가능 )
	    	        console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
				}
			});
		},fail: function(err) {
	    	  	//실패
	    	 alert(JSON.stringify(err));
	    }
	
	}); */
	
</script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





