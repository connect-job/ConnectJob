<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	div.tabcontent2{display:none;}
</style>

<section>
<ul class="tabs">
	<li><a href="#tab1">내 정보보기</a></li>
	<li><a href="#tab2">내 리뷰보기</a></li>
</ul>
	
<div class="tab_container"> 
	<div id="tab1" class="tab_content">
	<c:if test="${loginMember!=null }">
	<form action="${path }/member/updateMember" method="post">		
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="email" name="p_id" readonly value="${m.p_id }"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="button" value="비밀번호 변경" onclick="location.href='${path}/member/changePw?p_id=${m.p_id}'"/>
				<input type="hidden" name="password" value="${m.password }"/>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="p_name" value="${m.p_name }"/></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="text" name="gender" value="${m.gender eq 'M'?'남':'여'}" readonly/></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="phone" name="phone" value="${m.phone }"/></td>
		</tr>
		<tr>
			<td>최종학력</td>
			<td><input type="text" name="final_edu" value="${m.final_edu }"/></td>
		</tr>
		<tr>
			<td>학교</td>
			<td><input type="text" name="school" value="${m.school }"/></td>
		</tr>
		<tr>
			<td>전공</td>
			<td>
				<input type="text" name="major" value="${m.major }"/>
				<input type="hidden" name="is_confirm" value="${m.is_confirm }"/>
				<input type="hidden" name="enroll_date" value="${m.enroll_date }"/>
			</td>
		</tr>		
		<tr>
			<td><input type="submit" value="수정"/></td>
			<td><input type="button" value="탈퇴" onclick="location.href='${path}/member/deleteMember?p_id=${loginMember.p_id }'"/></td>
				
		</tr>		
	</table>
	</form>		
	</c:if>
	</div>
</div>

<div id="tab2" class="tab_content">
	<span>리뷰보기</span>
</div>
</section>
<script>

//탭
$(document).ready(function() {	
	$(".tab_content").hide();
	$("ul.tabs li:first").addClass("active").show();
	$(".tab_content:first").show();
	
	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); 
		$(this).addClass("active");
		$(".tab_content").hide();
		var activeTab = $(this).find("a").attr("href");
		$(activeTab).fadeIn();
		return false;
	});

});
</script>
 
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





