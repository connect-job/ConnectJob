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
	<div id="mypage-container">
		<div class="mypage-title">마이페이지</div>

		<div class="mypage-content">
			<div class="content-left">
				<ul class="tabs">
					<li class="selected">내 정보보기</li>
					<li>내가 작성한 리뷰보기</li>
				</ul>
			</div>
			<div class="content-right">
				<div id="tab-scroll">

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
											<i class="far fa-comment-dots"></i>　<a href="${path }/company/companyView.do?no=${list.reviewCompany}">
												<c:choose>
													<c:when test="${fn:length(list.reviewShort)>30}">
														${fn:substring(list.reviewShort,0,30) }
													</c:when>
													<c:otherwise>
														${list.reviewShort }
													</c:otherwise>
													</c:choose>
											</a>
										</div>
										<div class="item-date">
											<fmt:formatDate value="${list.reviewDate}" pattern="yyyy년 MM월 dd일" var="regDate"/>작성일 : ${regDate }<br>
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
				</div>
			</div>
		</div>

	</div>
</section>
<script>
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


	});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>