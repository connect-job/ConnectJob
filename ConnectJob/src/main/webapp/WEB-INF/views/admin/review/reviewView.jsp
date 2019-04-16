<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section>
		<div id="admin-container">
			<!-- ---------------------------------------------------------------------- 좌측메뉴 -->
		<%@ include file="/WEB-INF/views/admin/admin-menu.jsp"%>
		
		<!-- ---------------------------------------------------------------------- 우측 메뉴 -->

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