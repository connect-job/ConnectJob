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
	var pId="${p_Id}"
	var key="${key}"
	
	console.log(pId);
	console.log(key.typeOf);	
</script>

인증번호: <input type="text" name="key" />
<input type="button" value="확인"/>
<input type="text" value="${key }"/>
</body>
</html>