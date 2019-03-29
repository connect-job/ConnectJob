<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE>
<html>
<head>
<meta>
<title>email send</title>
</head>
<body>
<script type="text/javascript">
	
	var pId='${pId}';
	
	console.log(pId);
	
  alert('회원가입을 축하합니다. 이제 로그인이 가능 합니다.');

  window.open('', '_self', ''); // 브라우저창 닫기
 
  self.location = '${path}/member/login.do';
</script>	
</body>
</html>