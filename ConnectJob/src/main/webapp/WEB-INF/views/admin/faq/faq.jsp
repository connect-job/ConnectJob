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
	<div id="biz-container">

		<!-- ---------------------------------------------------------------------- 좌측메뉴 -->

		<div class="biz-left">
            <div class="menu-top">
              관리자페이지
            </div>
            <ul>
            	<c:if test="${loginCMember!=null}">
                 <li class="menu">
              고객센터 관리<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path}/admin/inquiry/inquiry.do">1:1문의 관리</a></li>
                        <li><a href="${path}/admin/faq/faq.do">자주묻는질문 관리</a></li>
                    </ul>
                </li>
            	</c:if>
            	
            	<c:if test="${loginMember!=null}">
               
                <li class="menu">
              고객센터 관리<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path}/admin/inquiry/inquiry.do<%-- ?id=${loginMember.p_id } --%>">1:1문의 관리</a></li>
                        <li><a href="${path}/admin/faq/faq.do">자주묻는질문 관리</a></li>
                    </ul>
                </li>
            	</c:if>

				<li class="menu">공지사항 관리<span class="icon"><i
						class="fas fa-sort-down"></i></span>
					<ul class="hide">
						<li><a href="#">공지사항</a></li>

					</ul>
				</li>


			</ul>
		</div>



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
        $(document).ready(function(){
            $(".menu").click(function(){
                var submenu = $(this).children('ul');
                if( submenu.is(":visible") ){
                    submenu.slideUp();
                    $(this).children('.icon').html("<i class='fas fa-sort-down'></i>");
                }else{
                    submenu.slideDown();
                    $(this).children('.icon').html("<i class='fas fa-sort-up'></i>");
                }
            });
        });
		
        
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