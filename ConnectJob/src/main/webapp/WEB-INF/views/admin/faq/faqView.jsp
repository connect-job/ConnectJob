<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section>
	<div id="senier-container">

		<div class="senier-top">
			자주묻는질문
		</div>

		<div class="senier-subTitle" style="padding-top: 20px;">
				자주묻는질문 목록
		</div>


		<div class="senier-middle">
			<form action="${path}/admin/faq/FaqUpdate.do?fNo=${faq.fNo}" method="post" onsubmit="return validate();">
				<div id="senier-write-container">
					
					<div class="write-title">
						<div class="left">제목</div>
						<div class="right"><input type="text" name="fTitle" value="${faq.fTitle}"></div>
					</div>
					<div class="write-content">
						<div class="left">내용</div>
						<div class="right"><input type="text" name="fContent" value="${faq.fContent}"></div>
					</div>
					

					<!-- <button type="submit">수정</button> -->
					<%-- <button type="submit" onclick="${path}/admin/faq/FaqDelete.do?fNo=${faq.fNo}">삭제</button> --%>
					<%-- <input type="button" value="삭제" onclick="${path}/admin/faq/FaqDelete.do?fNo=${faq.fNo}"> --%>
					   <c:choose>
                        	<c:when test="${loginMember!=null}">
                        		<input type="hidden" name="iWriter"  value="${loginMember.p_id}">
                        		
                        	</c:when>
                        
                        	<c:when test="${loginCMember != null}">
                        		<input type="hidden" name="iWriter"  value="${loginCMember.cMemberEmail}">
                        		
                        	</c:when>
                        
                        </c:choose>
					
		
					<div class="write-btn">
						<button onclick="history.back();">목록으로</button>
					</div>
				</div>
				<button type="submit">수정</button>
			</form>
			<form action="${path}/admin/faq/FaqDelete.do?fNo=${faq.fNo}" method="post" onsubmit="return validate();">
				<input type="submit" value="삭제">
			</form>
			
		</div>
	</div>
</section>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>