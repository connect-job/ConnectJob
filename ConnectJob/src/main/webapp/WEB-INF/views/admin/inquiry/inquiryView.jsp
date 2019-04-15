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
			나의 문의내역
		</div>

		<div class="senier-subTitle" style="padding-top: 20px;">
				나의 1:1 문의내역 목록
		</div>


		<div class="senier-middle">
			<form action="${path}/helpInquiryUpdate.do?iNo=${inq.iNo}" method="post" onsubmit="return validate();">
				<div id="senier-write-container">
					<div class="write-cate">
						<div class="left">문의종류</div>
						<div class="right">${inq.iType}</div>
					</div>
					<div class="write-title">
						<div class="left">제목</div>
						<div class="right">${inq.iTitle}</div>
					</div>
					<div class="write-content">
						<div class="left">내용</div>
						<div class="right">${inq.iContent}</div>
					</div>
					<div class="write-content">
						<div class="left">답변상태</div>
						<div class="right">
							<select id="answer" name="status">
								<option value="">답변상태</option>
								<option value="답변완료" ${inq.status=="답변완료"?"selected":""}>답변완료</option>
								<option value="답변중" ${inq.status=="답변중"?"selected":""}>답변중</option>
								<option value="답변대기중" ${inq.status=="답변대기중"?"selected":""}>답변대기중</option>
							</select>
						</div>
					</div>
					<div class="write-content">
						<div class="left">답변내용</div>
						<div class="right">
							<textarea id="aContent" name="aContent" placeholder="내용을 입력해주세요">${inq.aContent}</textarea>
							
						</div>
					</div>

					<button type="submit">답변등록</button>
					
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
			</form>
		</div>
	</div>
</section>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>