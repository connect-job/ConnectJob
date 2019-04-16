<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>

	function fn_paging(cPage) {
   		window.location.href="${path}/notice.do?cPage=" + cPage;
   	}
	
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
	<div id="notice-container">

		<div class="notice-title">공지사항　|　NOTICE</div>

		<div class="notice-write">
		<c:if test="${loginMember!=null and loginMember.p_id=='admin@admin.com'}">
                            <input type="button" value="글쓰기" onclick="location.href='${path}/notice/noticeForm'"/>
                        </c:if></div>

		<div class="notice-top-list">
			<c:forEach var="noticeTop" items="${topList }">
				<div class="item-top">
					<div class="head">NOTICE</div>
					<dlv class="title"><a href="${path }/notice/noticeView?notice_no=${noticeTop.notice_no}">${noticeTop.title}</a></dlv>
					<div class="date">${noticeTop.notice_date}</div>
				</div>
			</c:forEach>
		</div>

		<div class="notice-search">
			<form method="post" action="${path }/notice/noticeSearch" onsubmit="return checkSearch();">			
				<select name="searchType" id="select">
					<option value="none" disabled selected>검색타입</option>
					<option value="title" <c:if test="${map.searchType eq 'title'}">selected</c:if>>제목</option>
					<option value="content"<c:if test="${map.searchType eq 'content'}">selected</c:if>>내용</option>
				</select>
			
				<input type="text" id="searchKey" name="searchKey" value="${map.searchKey!=null?map.searchKey:''}"/>
				<input type="submit" value="검색">			
			</form>
		</div>

		<div class="notice-list">
			<c:forEach var="notice" items="${list }">
				<div class="list-item">
					<div class="no">${notice.notice_no}</div>
					<div class="title"><a href="${path }/notice/noticeView?notice_no=${notice.notice_no}">${notice.title }</a></div>
					<div class="date">${notice.notice_date }</div>
				</div>
         	</c:forEach> 
		</div>

		<div id="pageBar" class="notice-bottom">
				${pageBar }
		</div>

	</div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>