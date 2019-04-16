<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<<<<<<< HEAD
<c:set var="path" value="${pageContext.request.contextPath}"/>
=======
<c:set var="path" value="${pageContext.request.contextPath}" />
>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<<<<<<< HEAD

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
				<!-- <a id="kakao-login-btn"></a> -->
				<a id="custom-login-btn" href="javascript:loginWithKakao()">
					<img src="${path }/resources/images/kakao_account_login_btn.png" width="250"/>
				</a>									
				<input type="submit" value="로그인"/><br>
				<input type="button" value="ID/PW찾기" id="findbtn"/>
			</div>
		</form>	
	</div>
=======

>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git


<<<<<<< HEAD
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
	    	        $.ajax({
	    	        	url: '${path}/member/isKakao.do?is_sns=kakao&kakao_id=' + id,
	    	            success: function(data) {
	    	            	console.log("돌려받은값 : " + data);
	    	            	if(data=='1') {	    	            		
	    	            		location.href="${path}/member/memberLoginKakao.do?kakao_id=" + id;
	    	            	} else {	    	            		 
	    	            		 location.href="${path}/member/memberEnrollKakao.do?is_sns=kakao&kakao_id=" + id + "&nickname=" + res.properties['nickname'];
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
=======
>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git

<script>
	var googleUser = {};
	var startApp = function () {
		gapi.load('auth2', function () {
			// Retrieve the singleton for the GoogleAuth library and set up the client.
			auth2 = gapi.auth2.init({
				client_id: '638430037698-srn3c01h0flqs3dg2jfmbe0hogr25qgd.apps.googleusercontent.com',
				cookiepolicy: 'single_host_origin',
				// Request scopes in addition to 'profile' and 'email'
				//scope: 'additional_scope'
			});
			attachSignin(document.getElementById('customBtn'));
		});
<<<<<<< HEAD
	});

	//개인회원 기업회원 나누는 탭설정
	$('.tab-link').click(function() {
		$('.tab-link').eq(0).removeClass('selected');
		$('.tab-link').eq(1).removeClass('selected');
		$(this).addClass('selected');
=======
	};
>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git

<<<<<<< HEAD
		var id = $(this).attr('data-tab');
=======
	function attachSignin(element) {
		console.log(element.id);
		auth2.attachClickHandler(element, {},
			function (googleUser) {
				var profile;
				var email;
				var id_temp;
				var id;
				var name;
>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git

<<<<<<< HEAD
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
	    	       
				}
			});
		},fail: function(err) {
	    	  	//실패
	    	 alert(JSON.stringify(err));
	    }
	
	}); */
	
=======
				profile = googleUser.getBasicProfile();
				email = profile.getEmail();
				id_temp = profile.getId();
				id = Number(id_temp);
				name = profile.getName();

				$.ajax({
					url: '${path}/member/isSns.do?p_id=test&is_sns=google&google_id=' + id,
					success: function (data) {
						if (data == '1') {
							location.href = "${path}/member/memberLoginSns.do?is_sns=google&google_id=" + id;
						} else {
							location.href = "${path}/member/memberEnrollSns.do?p_id=" + email + "&is_sns=google&google_id=" + id + "&p_name=" + name;
						}
					}
				});
			}, function (error) {
				alert(JSON.stringify(error, undefined, 2));
			});
	}
</script>

<style type="text/css">
	#customBtn {
		display: inline-block;
		width: 187px;
		white-space: nowrap;
	}

	#customBtn:hover {
		cursor: pointer;
	}
</style>

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
						<div class="item-right"><input type="email" name="p_id" autocomplete="off" /></div>
					</div>
					<div class="login-item">
						<div class="item-left">비밀번호</div>
						<div class="item-right"><input type="password" name="password" autocomplete="new-password" /></div>
					</div>
				</div>
				<div class="login-right">
					<input type="submit" value="커넥트잡 일반로그인" /><br>
					<input type="button" value="ID/PW찾기" id="findbtn" />
				</div>
				<div class="login-item-sns">
					<!-- 네이버아이디로로그인 -->
					<div id="naver_id_login"></div>
					<script type="text/javascript">
						var naver_id_login = new naver_id_login("HcAcv4cf7ZTp1x4Kkbdb", "http://localhost:9090/job/member/naverCallback.do");
						var state = naver_id_login.getUniqState();
						naver_id_login.setButton("green", 3, 40);
						naver_id_login.setDomain("http://localhost:9090");
						naver_id_login.setState(state);
						naver_id_login.init_naver_id_login();
					</script>

					<!-- 구글 로그인 -->
					<div id="gSignInWrapper">
						<div id="customBtn" class="customGPlusSignIn">
							<img src="${path }/resources/images/login-google.png" width="187px">
						</div>
					</div>
					<script>startApp();</script>

					<!-- 카카오 로그인 -->
					<a id="custom-login-btn" href="javascript:loginWithKakao()">
						<img src="${path }/resources/images/kakao_account_login_btn.png" width="187px" />
					</a>
				</div>
			</form>
		</div>


		<!-- 기업회원 -->
		<div id="cmember" class="tab-content">
			<form name="cMemberloginFrm" action="${path }/cMemberLogin.do" method="post">
				<div class="login-left">
					<div class="login-item">
						<div class="item-left">아이디</div>
						<div class="item-right"><input type="text" name="cMemberId" autocomplete="off" /></div>
					</div>
					<div class="login-item">
						<div class="item-left">비밀번호</div>
						<div class="item-right"><input type="password" name="cMemberPw" autocomplete="new-password" /></div>
					</div>
				</div>
				<div class="login-right">
					<button type="submit">기업회원 로그인</button><br>
					<button type="button" onclick="location.href='${path}/member/findMember'"> ID/PW찾기</button>
				</div>
			</form>
		</div>

	</div>
</section>
<script type='text/javascript'>
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('60f4385612bb24ab265ce9857acca8ff');
	function loginWithKakao() {
		// 로그인 창을 띄웁니다.
		Kakao.Auth.login({
			success: function (authObj) {
				Kakao.API.request({
					url: '/v1/user/me',
					success: function (res) {

						var id = res.id;
						$.ajax({
							url: '${path}/member/isSns.do?is_sns=kakao&kakao_id=' + id,
							success: function (data) {
								if (data == '1') {
									location.href = "${path}/member/memberLoginSns.do?is_sns=kakao&kakao_id=" + id;
								} else {
									location.href = "${path}/member/memberEnrollSns.do?is_sns=kakao&kakao_id=" + id + "&p_name=" + res.properties['nickname'];
								}
							}
						});

					}
				});

			},
			fail: function (err) {
			}
		});
	};

>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git
</script>

<script>
	$(function () {
		$("#findbtn").click(function () {
			location.href = '${path}/member/findMember';
		});
	});


	//개인회원 기업회원 나누는 탭설정
	$('.tab-link').click(function () {
		$('.tab-link').eq(0).removeClass('selected');
		$('.tab-link').eq(1).removeClass('selected');
		$(this).addClass('selected');

		var id = $(this).attr('data-tab');

		if (id == 'member') {
			$('#member').css("display", "inline-block");
			$('#cmember').css("display", "none");
		} else {
			$('#cmember').css("display", "inline-block");
			$('#member').css("display", "none");
		}
	});

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>