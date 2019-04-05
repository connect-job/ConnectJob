<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param value="" name="pageTitle"/>
</jsp:include>
<section>
<form name="loginFrm" action="${path }/cMemberLogin" method="post">
		<table>
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
</section>

<script>
	$(function(){
		$("#findbtn").click(function(){
			location.href='${path}/member/findMember';
		})
	});
</script>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>