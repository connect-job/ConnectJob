<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>

	$('#notice').show();
</script>

<section style="padding-top: 200px;">
	<div id="index-container">
		<div id="index-top-left">
			<ul>
				<li><img src="${path}/resources/images/main-1.jpg"></li>
				<li><img src="${path}/resources/images/main-2.jpg"></li>
				<li><img src="${path}/resources/images/main-3.jpg"></li>
			</ul>
		</div>
		<div class="index-top-right">
			<div class="notice">최근 기업리뷰</div>
			<div class="item">
				<ul>
					<li>리뷰제목 - 2019-04-07</li>
					<li>리뷰제목 - 2019-04-07</li>
					<li>리뷰제목 - 2019-04-07</li>
					<li>리뷰제목 - 2019-04-07</li>
					<li>리뷰제목 - 2019-04-07</li>
				</ul>
			</div>
		</div>

		<div class="index-middle">
			<div class="index-middle-left">
				<div class="top">
					<div class="left">연봉순위 TOP 5</div>
					<div class="right">국민연금 기준</div>
				</div>
				<div class="title">
					국민연금 기준 예상평균연봉 순위
				</div>
				<div class="content">
					<ul>
						<li>111</li>
						<li>111</li>
						<li>111</li>
						<li>111</li>
						<li>111</li>
						<li>111</li>
					</ul>
				</div>
			</div>

			<div class="index-middle-center">
				<div class="top">
					<div class="left">기업리뷰 TOP 5</div>
					<div class="right"></div>
				</div>
				<div class="title">
					기업 별 리뷰 많은 순위
				</div>
				<div class="content">
					<ul>
						<li>111</li>
						<li>111</li>
						<li>111</li>
						<li>111</li>
						<li>111</li>
						<li>111</li>
					</ul>
				</div>
			</div>
			<div class="index-middle-right">
				<div class="top">
					<div class="left">기업평점 TOP 5</div>
					<div class="right">기업 총 평점 기준</div>
				</div>
				<div class="title">
					기업리뷰의 총 평점 순위
				</div>
				<div class="content">
					<ul>
						<li>111</li>
						<li>111</li>
						<li>111</li>
						<li>111</li>
						<li>111</li>
						<li>111</li>
					</ul>
				</div>
			</div>
		</div>

	</div>
</section>

<script>
	$(document).ready(function () {
		//사용할 배너
		var banner = $("#index-top-left").find("ul");

		var bannerWidth = banner.children().outerWidth();//배너 이미지의 폭
		var bannerHeight = banner.children().outerHeight(); // 높이
		var bannerLength = banner.children().length;//배너 이미지의 갯수
		var rollingId;

		//정해진 초마다 함수 실행
		rollingId = setInterval(function () { rollingStart(); }, 6000);//다음 이미지로 롤링 애니메이션 할 시간차

		//마우스 오버시 롤링을 멈춘다.
		banner.mouseover(function () {
			//중지
			clearInterval(rollingId);
			$(this).css("cursor", "pointer");
		});
		//마우스 아웃되면 다시 시작
		banner.mouseout(function () {
			rollingId = setInterval(function () { rollingStart(); }, 6000);
			$(this).css("cursor", "default");
		});

		function rollingStart() {
			banner.css("width", bannerWidth * bannerLength + "px");
			banner.css("height", bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			banner.animate({ left: - bannerWidth + "px" }, 1000, function () { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}

		banner.mouseover(function () {
			//중지
			clearInterval(rollingId);
			$(this).css("cursor", "pointer");
		});
		//마우스 아웃되면 다시 시작
		banner.mouseout(function () {
			rollingId = setInterval(function () { rollingStart(); }, 6000);
			$(this).css("cursor", "default");
		});

	});



</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
