<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
	div.tabcontent2 {
		display: none;
	}
</style>

<section>
<<<<<<< HEAD
<ul class="tabs">
	<li><a href="#tab1">내 정보보기</a></li>
	<li><a href="#tab2">내 리뷰보기</a></li>
</ul>
	
<div class="tab_container"> 
<<<<<<< HEAD
	
	<div id="tab1" class="tab_content">	
		<form action="${path }/member/updateMember" method="post">
			<div class="enroll-item">
				<div class="left">아이디</div>
				<div class="right">
					<input type="email" name="p_id" id="p_id" readonly value="${m.p_id }"/>																								
				</div>
			</div>
=======
	<div id="tab1" class="tab_content">
	
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
				
			</td>
		</tr>		
		<tr>
			<td><input type="submit" value="수정"/></td>
			<td><input type="button" value="탈퇴" onclick="location.href='${path}/member/deleteMember?p_id=${loginMember.p_id }'"/></td>
>>>>>>> branch 'PSH' of https://github.com/connect-job/ConnectJob.git
				
<<<<<<< HEAD
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
=======
		</tr>		
	</table>
	</form>		
=======
	<div id="mypage-container">
		<div class="mypage-title">마이페이지</div>
>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git

<<<<<<< HEAD
>>>>>>> branch 'PSH' of https://github.com/connect-job/ConnectJob.git
	</div>
</div>
=======
		<div class="mypage-content">
			<div class="content-left">
				<ul class="tabs">
					<li class="selected">내 정보보기</li>
					<li>내가 작성한 리뷰보기</li>
				</ul>
			</div>
			<div class="content-right">
				<div id="tab-scroll">
>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git

<<<<<<< HEAD
<div id="tab2" class="tab_content">
	<c:if test="${reviewList != null }">
		<c:forEach var="list" items="${reviewList }">
			<div>
<<<<<<< HEAD
				<div>					
					<a href="${path }/company/companyView.do?no=${list.reviewCompany}">${list.reviewShort }</a>
=======
				<div>
					<%-- <input type="hidden" value="${list.reviewNo }"/> --%>
					${list.reviewCompany }
					<a href="location.href='${path }review/reviewOne.do?reviewNo='+${list.reviewNo}">${list.reviewShort }</a>
>>>>>>> branch 'PSH' of https://github.com/connect-job/ConnectJob.git
					${list.reviewDate}
					
=======
					<div id="tab1" class="tab-container">

						<div class="tab-title">회원정보 / 수정</div>

						<form action="${path }/member/updateMember" method="post">
							<div class="tab-item">
								<div class="item-left">아이디</div>
								<div class="item-right"><input type="email" name="p_id" readonly value="${m.p_id }" />
								</div>
							</div>
							<div class="tab-item">
								<div class="item-left">비밀번호</div>
								<div class="item-right">
									<input type="button" value="비밀번호 변경"
										onclick="location.href='${path}/member/changePw?p_id=${m.p_id}'" />
								</div>
							</div>
							<div class="tab-item">
								<div class="item-left">이름</div>
								<div class="item-right"><input type="text" name="p_name" value="${m.p_name }" /></div>
							</div>
							<div class="tab-item">
								<div class="item-left">성별</div>
								<div class="item-right"><input type="text" name="gender"
										value="${m.gender eq 'M'?'남':'여'}" readonly />
								</div>
							</div>
							<div class="tab-item">
								<div class="item-left">연락처</div>
								<div class="item-right"><input type="phone" name="phone" value="${m.phone }" /></div>
							</div>
							<div class="tab-item-one">
								<input type="submit" value="수정" />
								<input type="button" value="탈퇴"
									onclick="fn_delete()" />
							</div>
						</form>
					</div>

					<div id="tab2" class="tab-container">
						<div class="tab-title">내가 작성한 기업리뷰 보기</div>

						<c:if test="${reviewList != null }">
							<c:forEach var="list" items="${reviewList }">
									<div class="review-item">
										<div class="item-title">
											<i class="far fa-comment-dots"></i>　<a href="${path }/company/companyView.do?no=${list.reviewCompany}">${list.reviewShort}</a>
										</div>
										<div class="item-date">
											${list.reviewDate}
										</div>
									</div>
							</c:forEach>
						</c:if>
						<c:if test="${reviewList == null }">
							<div class="review-item">
								작성된 리뷰가 없습니다.
							</div>
						</c:if>
					</div>
>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git
				</div>
			</div>
		</div>

	</div>
</section>
<script>
<<<<<<< HEAD
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
=======
	function fn_delete() {
		if(confirm('커넥트잡을 탈퇴하시겠습니까?')) {
			location.href='${path}/member/deleteMember?p_id=${loginMember.p_id }';
		} else {
			return;
		}
	}

	//탭
	$(document).ready(function () {
		var tab = $('#tab-scroll');
		var tab1 = $('#tab1');
		var tab2 = $('#tab2');

		tab2.css("opacity","0");

		var li = $('.content-left ul li');

		li.eq(0).click(function () {
			li.eq(0).addClass('selected');
			li.eq(1).removeClass('selected');
			tab.css("transform", "translateX(0)");
			tab1.css("opacity", "1");
			tab2.css("opacity","0");
		});

		li.eq(1).click(function () {
			li.eq(1).addClass('selected');
			li.eq(0).removeClass('selected');
			tab.css("transform", "translateX(-735px)");
			tab2.css("opacity","1");
		});


>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git
	});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>