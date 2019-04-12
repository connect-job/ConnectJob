<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
function checkSearch(){
	if($('#select').val()==null){
		alert("옵션을 선택하세요");
		return false;
	}
	if($('#searchKey').val().length==0){
		alert("검색할 키워드를 입력하세요");
		return false;
	}	
}
</script>
	
<section>
	
	<div>회원 리스트</div>
	
	<div class="notice-search">
		<form method="post" action="${path }/member/memberSearch" onsubmit="return checkSearch();">			
			<select name="searchType" id="select">
				<option value="none" disabled selected>검색타입</option>
				<option value="p_id" <c:if test="${map.searchType eq 'p_id'}">selected</c:if>>제목</option>
				<option value="p_name"<c:if test="${map.searchType eq 'p_name'}">selected</c:if>>내용</option>
			</select>			
			<input type="text" id="searchKey" name="searchKey" value="${map.searchKey!=null?map.searchKey:''}"/>
			<input type="submit" value="검색">			
		</form>
	</div>
	
	<div>
		<div>
			<div>아이디</div>
			<div>이름</div>			
			<div>SNS</div>
			<div>인증여부</div>
		</div>
		<c:forEach var="member" items="${list }" varStatus="vs">
			<div>				
				<div>${member.p_id }</div>
				<div>${member.name }</div>				
				<div>${member.is_sns }</div>
				<div>${member.email_confrim}</div>
				<div>					
					<input type="button" value="삭제" onclick="${path}/member/deleteMember?p_id=${member.p_id}"/>
				</div>
			</div>
		</c:forEach>
	</div>
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





