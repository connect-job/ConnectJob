<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section>
	<div id="admin-container">
	
	<!-- ---------------------------------------------------------------------- 좌측메뉴 -->
	<%@ include file="/WEB-INF/views/admin/admin-menu.jsp"%>
	<!-- ---------------------------------------------------------------------- 우측 메뉴 -->
	<div class="admin-right">
	
		<div class="admin-title">공지사항 관리</div>
		
		<form name="updateFrm" method="post" action="${path }/admin/updateNotice">
		
			<div class="enroll-item">
				<div class="left">작성자</div>
				<div class="right">
					<input type="text" name="writer" readonly value="관리자"/>
               		<input type="hidden" name="notice_no" value="${notice.notice_no }"/>																									
				</div>
			</div>
			
			<div class="enroll-item">
				<div class="left">제목</div>
				<div class="right">
					<input type="text" name="title" value="${notice.title }"/>																									
				</div>
			</div>
			
			<div class="enroll-item">
				<div class="left">내용</div>
				<div class="right">
					<textarea name="content">${notice.content}</textarea>																									
				</div>
			</div>
			
			<div class="enroll-item">
				<div class="left">상단고정여부</div>
				<div class="right">
					<input type="radio" name="status" value="Y" ${notice.status eq 'Y'? 'checked' :'' }/> Y
            		<input type="radio" name="status" value="N" ${notice.status eq 'N'? 'checked' :'' }/> N																								
				</div>
			</div>
    	 
    		<div id="btn-container">
        		<input type="submit" value="수정" />
        		<input type="button" value="삭제" onclick="location.href='${path}/admin/deleteNotice?notice_no=${notice.notice_no }'"/>                
    		</div>
    	</form>
    </div>
    </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>