<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp" %>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<section>
	<div id="admin-container">

		<!-- ---------------------------------------------------------------------- 좌측메뉴 -->
		<%@ include file="/WEB-INF/views/admin/admin-menu.jsp"%>

		<!-- ---------------------------------------------------------------------- 우측페이지  -->

		<div class="biz-right">
			<div class="biz-title">자주묻는질문 목록</div>

	
        <div class="biz-right">

          <div class="help-subtitle">
		
		</div>

		<div class="help-middle">

			<c:forEach var="faq" items="${list}" varStatus="vs">
					<div class="help-item" onclick="location.href='${path}/admin/faq/faqView.do?no=${faq.fNo}'">

						<div class="item-center">
							<div class="center-title">
								제목 ${faq.fTitle}
							</div>
							<div class="item-right">
								내용 ${faq.fContent}
							</div>
							
						</div>

					</div>
				
				</c:forEach>
           <div id="pageBar">
           ${pageBar}
           </div>
            
        </div>
    </div>
			

		</div>
		
		
	</div>
</section>

<script>
        function fn_paging(cPage) {
        
           if(${loginMember!=null and loginCMember==null})
           {
              window.location.href="${path}/admin/inquiry/inquiry.do?cPage=" + cPage;
           }
           else if(${loginMember==null and loginCMember!=null})
           {
                window.location.href="${path}/admin/inquiry/inquiry.do?cPage=" + cPage;
           }

          }
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>