<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<section>
	<div id="login-container">
	<h3>Connect Job Member's Login</h3>
	<form name="loginFrm" action="${path }/member/loginMember.do" method="post">
		<table>
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
</script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





