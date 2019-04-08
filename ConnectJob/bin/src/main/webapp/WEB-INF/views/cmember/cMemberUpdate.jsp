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

	<form action="${path }/cMemberUpdate.do">
		<input type="text" id="updateId" readonly/>아이디
	    <input type="password" id="updatePwd"/>비밀번호 수정
	    <input type="text" id="updateName"/>이름수정
	    <input type="text" id="updatePhone"/>연락처
	    <input type="text" id="updateCPhone"/>기업연락처
	    <input type="text" id="updateBNum" readonly/>사업자번호
	    <input type="text" id="updateDiv"/>기업회원구분
	    <input type="text" id="updateEmail"/>기업회원담당자 이메일
	    <input type="button" id="updateComplete" />수정완료
	    
	</form>
	<form action="${path }/cMemberdelete.do">
		<input type="button" id="deleteCMember"/>회원탈퇴
	</form>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>