<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
	function checkSearch() {
		if ($('#select').val() == null) {
			alert("옵션을 선택하세요");
			return false;
		}
		if ($('#searchKey').val().length == 0) {
			alert("검색할 키워드를 입력하세요");
			return false;
		}
	}

	function fn_paging(cPage) {
		window.location.href = "${path}/notice.do?cPage=" + cPage;
	}
</script>

<section>

	<div id="admin-container">


		<!-- ---------------------------------------------------------------------- 좌측메뉴 -->
		<%@ include file="/WEB-INF/views/admin/admin-menu.jsp"%>

		<!-- ---------------------------------------------------------------------- 우측 메뉴 -->

		<div class="admin-right">
			<div class="admin-title">회원리스트</div>
			<br>
			<div class="member-search">
				<form method="post" action="${path }/admin/member/searchMember" onsubmit="return checkSearch();">
					<select name="searchType" id="select">
						<option value="none" disabled selected>검색타입</option>
						<option value="p_id" <c:if test="${map.searchType eq 'p_id'}">selected</c:if>>아이디</option>
						<option value="p_name" <c:if test="${map.searchType eq 'p_name'}">selected</c:if>>이름</option>
					</select>
					<input type="text" id="searchKey" name="searchKey"
						value="${map.searchKey!=null?map.searchKey:''}" />
					<input type="submit" value="검색">
				</form>
			</div>

			<div class="admin-item-top">
				<div class="item1" style="width:25%;">아이디</div>
				<div class="item2" style="width:20%;">이름</div>
				<div class="item3" style="width:20%;">가입일</div>
				<div class="item4" style="width:10%;">삭제</div>
			</div>







			<c:forEach var="member" items="${list }">
				<div class="admin-item">
					<div class="item1" style="width:25%;">${member.p_id}</div>
					<div class="item2" style="width:20%;">${member.p_name}</div>
					<div class="item3" style="width:20%;">${member.enroll_date }</div>
					<div class="item4" style="width:10%;"><input type="button" value="삭제"
							onclick="location.href='${path}/admin/deleteMember?p_id=${member.p_id}'" /></div>
				</div>
			</c:forEach>

			<div class="admin-one">
			<div id="pageBar">
				${pageBar }
			</div></div>

		</div>
	</div>

</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>