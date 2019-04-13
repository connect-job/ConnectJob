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
             		<c:if test="${loginMember != null && loginMember.p_id eq inq.iWriter}">
             		<div class="senier-item" onclick="location.href='${path}/help/myInquiryView.do?no=${inq.iNo}'">
					<div class="item-cate">
					<c:forEach items="${inq.iType}" var="type" varStatus="vs">
						${type}
					</c:forEach>
					
					</div>
					<div class="item-title">
						${inq.iTitle}
						${inq.status==false?"답변대기중":"답변완료"}
							<!-- false면 답변대기중 -->
					</div>
					<div class="item-content">${inq.iContent}</div>
            		</div>
            	</c:if>
            	<c:if test="${loginCMember != null && loginCMember.cMemberEmail eq inq.iWriter}">
            		<div class="senier-item" onclick="location.href='${path}/help/myInquiryView.do?no=${inq.iNo}'">
					<div class="item-cate">
					<c:forEach items="${inq.iType}" var="type" varStatus="vs">
						${type}
					</c:forEach>
					
					</div>
					<div class="item-title">
						
						${inq.iTitle}
						${inq.status==false?"답변대기중":"답변완료"}
							<!-- false면 답변대기중 -->
					</div>
					<div class="item-content">${inq.iContent}</div>
            		</div>
            	</c:if>
				</c:forEach>
           
            
        </div>
    </div>
         <div id="pageBar">
        	${pageBar}
        </div>


	<script>
        
        function fn_paging(cPage) {
        
           if(${loginMember!=null and loginCMember==null})
           {
              window.location.href="${path}/help/myInquiry.do?cPage=" + cPage +"&id=${loginMember.p_id}";
           }
           else if(${loginMember==null and loginCMember!=null})
           {
                window.location.href="${path}/help/myInquiry.do?cPage=" + cPage +"&id=${loginCMember.cMemberEmail}";
           }

          }
        
        </script>

</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>