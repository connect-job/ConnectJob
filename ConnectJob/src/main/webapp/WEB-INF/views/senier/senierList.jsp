<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
    <div id="senier-container">

        <div class="senier-top">
            선배와의 대화
        </div>

        <div class="senier-subTitle">
            <div id="left">우리 직종의 취업고민과 선배의 답변이에요</div>
            <div id="right"><button id="btn-senier" onclick="location.href='${path}/senierWrite.do'">선배에게 질문하기</button></div>
        </div>

        <div class="senier-middle">
            <c:choose>
					<c:when test="${list!=null }">
									
            
             	<c:forEach var="sen" items="${list}" varStatus="vs">
             <div class="senier-item" onclick="location.href='${path}/senierAnswer.do?no=${sen.sNo}'">
					<div class="item-cate">
					<c:forEach items="${sen.qType}" var="type" varStatus="vs">
						${type}
					</c:forEach>
					</div>
					<div class="item-title">
						
						${sen.sTitle}
						
					</div>
					<div class="item-content">${sen.sContent}</div>
            </div>
				</c:forEach>
            
            	</c:when>
			</c:choose>
            
        </div>
    </div>
         <div id="pageBar">
        	${pageBar}
        </div>
        <script>
        	
        function fn_paging(cPage) {
       		window.location.href="${path}/senierConversation.do?cPage=" + cPage;
       	}
        
        </script>
        
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





