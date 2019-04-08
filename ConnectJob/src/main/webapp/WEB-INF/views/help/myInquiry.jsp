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
            나의문의내역
        </div>

        <div class="senier-subTitle">
            <div id="left"></div>
            <div id="right"></div>
        </div>

        <div class="senier-middle">
          
									
            
             	<c:forEach var="inq" items="${list}" varStatus="vs">
             <div class="senier-item" onclick="location.href='${path}/help/myInquiryView.do?no=${inq.iNo}'">
					<div class="item-cate">
					<c:forEach items="${inq.iType}" var="type" varStatus="vs">
						${type}
					</c:forEach>
					
					</div>
					<div class="item-title">
						
						${inq.iTitle}
						
					</div>
					<div class="item-content">${inq.iContent}</div>
            </div>
				</c:forEach>
            
           
            
        </div>
    </div>
         <div id="pageBar">
        	${pageBar}
        </div>
        <script>
        	
        function fn_paging(cPage) {
       		window.location.href="${path}/help/myInquiry.do?cPage=" + cPage;
       	}
        
        </script>
        
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>




