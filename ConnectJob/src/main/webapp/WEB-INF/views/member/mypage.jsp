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
		<form action="${path }/member/updateMember" method="post">
			<div class="enroll-item">
				<div class="left">아이디</div>
				<div class="right">
					<input type="email" name="p_id" id="p_id" readonly value="${m.p_id }"/>																								
				</div>
			</div>
				
			<div class="enroll-item">
				<div class="left">비밀번호</div>
				<div class="right">
					<input type="button" value="비밀번호 변경" onclick="location.href='${path}/member/changePw?p_id=${m.p_id}'"/>				
				</div>
			</div>						
		
			<div class="enroll-item msgdiv">
				<div class="left">이름</div>
				<div class="right">
					<input type="text" name="p_name" value="${m.p_name }"/>	
				</div>
			</div>
				
			<div class="enroll-item msgdiv">
				<div class="left">닉네임</div>
				<div class="right">
					<input type="text" name="nickname" value="${m.nickname }"/>
					<span id="nickname_result"></span>
				</div>
			</div>		

			<div class="enroll-item">
				<div class="left">성별</div>
				<div class="right">
					<input type="text" name="gender" value="${m.gender eq 'M'?'남':'여'}" readonly/>
				</div>
			</div>
				
			<div class="enroll-item">
				<div class="left">연락처</div>
				<div class="right">
					<input type="phone" name="phone" value="${m.phone }"/>
				</div>
			</div>
			<div class="enroll-text-end">
				<input type="submit" value="수정"/><input type="button" value="탈퇴" onclick="location.href='${path}/member/deleteMember?p_id=${loginMember.p_id }'"/>
			</div>	
		</form>
	</div>
</div>

<div id="tab2" class="tab_content">
	<c:if test="${reviewList != null }">
		<c:forEach var="list" items="${reviewList }">
			<div>
				<div>					
					<a href="${path }/company/companyView.do?no=${list.reviewCompany}">${list.reviewShort }</a>
					${list.reviewDate}
					
				</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${reviewList == null }">
		<div>
			작성된 리뷰가 없습니다.
		</div>
	</c:if>
</div>
</section>
<script>
$('[name=nickname]').blur(function(){
	var nickname=$('[name=nickname]').val();
	if(nickname.trim()==""){
		$('#nickname_result').html('닉네임을 입력해주세요').css('color', 'red');
		$('[name=nickname]').focus();
	}else{
		$.ajax({
			type:"POST",
			url: "${path}/member/checkNick?nickname="+nickname,
			success:function(result){
				if(result!=0){							
					$("#nickname_result").html("사용 불가능한 닉네임입니다.").css('color', 'red');					
				}else{							
					$("#nickname_result").html("사용 가능한 닉네임입니다.").css('color', 'green');					
				}
			},error:function(error){
				$("#nickname_result").html("error");
			}
		
		});	
	}
});
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





