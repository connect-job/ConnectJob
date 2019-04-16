<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section>
		<div id="admin-container">
	
		<div class="admin-left">

				<div class="menu-top">관리자페이지</div>
	
				<ul>
						<li class="menu">고객센터 관리<span class="icon"><i class="fas fa-sort-down"></i></span>
							<ul class="hide">
								<li><a href="${path}/admin/inquiry/inquiry.do<%-- ?id=${loginMember.p_id } --%>">1:1문의
										관리</a></li>
								<li><a href="#">자주묻는질문 관리</a></li>
							</ul>
						</li>
	
					<li class="menu">공지사항 관리<span class="icon"><i class="fas fa-sort-down"></i></span>
						<ul class="hide">
							<li><a href="#">공지사항</a></li>
						</ul>
					</li>
	
<li class="menu">기업리뷰 관리<span class="icon"><i class="fas fa-sort-down"></i></span>
					<ul class="hide">
						<li><a href="${path }/review/adminReview.do">기업리뷰</a></li>
					</ul>
				</li>
	
	
				</ul>
			</div>

			<div class="admin-right">
					<div class="admin-title">기업리뷰 관리</div>
		
					<div class="admin-item-top">리뷰내용</div>

					<div class="admin-content">
							<div class="left">리뷰번호</div>
							<div class="right">${review.reviewNo}</div>
							<div class="left">현/전직장 여부</div>
							<div class="right">${review.reviewIsCurrent}</div>
							<div class="left">직종</div>
							<div class="right">${review.reviewJob}</div>
							<div class="left">직종</div>
							<div class="right">${review.reviewJob}</div>
							<div class="left">직종</div>
							<div class="right">${review.reviewJob}</div>
							<div class="left">답변내용</div>
							<div class="right">
								<textarea id="aContent" name="aContent" placeholder="내용을 입력해주세요">${inq.aContent}</textarea>
								
							</div>
					</div>

					<div class="admin-item">
					<button type="submit">답변등록</button>　<button onclick="history.back();">목록으로</button>
					</div>
			</form>
		</div>
	</div>
</section>

<script>
	$(document).ready(function () {
		$(".menu").click(function () {
			var submenu = $(this).children('ul');
			if (submenu.is(":visible")) {
				submenu.slideUp();
				$(this).children('.icon').html("<i class='fas fa-sort-down'></i>");
			} else {
				submenu.slideDown();
				$(this).children('.icon').html("<i class='fas fa-sort-up'></i>");
			}
		});
	});
	
	ClassicEditor
        .create(document.querySelector('#aContent'))
        .catch(error => {
            console.error(error);
        });
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>