<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="admin-left">
			<div class="menu-top">관리자페이지</div>

			<ul>
				<li class="menu">고객센터 관리<span class="icon"><i
						class="fas fa-sort-down"></i></span>
					<ul class="hide">
						<li><a
							href="${path}/admin/inquiry/inquiry.do">1:1문의
								</a></li>
						<li><a href="${path}/admin/faq/faq.do">자주묻는질문</a></li>
					</ul>
				</li>

				<li class="menu">회원관리<span class="icon"><i
						class="fas fa-sort-down"></i></span>
					<ul class="hide">
						<li><a href="${path }/admin/member/memberList">회원관리</a></li>
					</ul>
				</li>

				<li class="menu">공지사항 관리<span class="icon"><i
						class="fas fa-sort-down"></i></span>
					<ul class="hide">
						<li><a href="${path }/admin/notice">공지사항</a></li>
					</ul>
				</li>

				<li class="menu">기업리뷰 관리<span class="icon"><i
						class="fas fa-sort-down"></i></span>
					<ul class="hide">
						<li><a href="${path }/review/adminReview.do">기업리뷰</a></li>
					</ul>
				</li>
			</ul>
		</div>
		
		
		
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
		</script>