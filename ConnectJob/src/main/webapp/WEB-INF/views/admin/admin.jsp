<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<section id="biz">
	<div id="biz-container">
        
        

		<div class="biz-left">
            <div class="menu-top">
              관리자페이지
            </div>
            <ul>
            	<c:if test="${loginCMember!=null}">
                 <li class="menu">
              고객센터 관리<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path }/helpPageInquiry.do?id=${loginCMember.cMemberEmail}">1:1문의 관리</a></li>
                        <li><a href="#">공지사항 관리</a></li>
                        <li><a href="#">자주묻는질문 관리</a></li>
                    </ul>
                </li>
            	</c:if>
            	
            	<c:if test="${loginMember!=null}">
               
                <li class="menu">
              고객센터 관리<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path }/helpPageInquiry.do?id=${loginMember.p_id}">1:1문의 관리</a></li>
                        <li><a href="#">공지사항 관리</a></li>
                        <li><a href="#">자주묻는질문 관리</a></li>
                    </ul>
                </li>
            	</c:if>
            	
            	
            	
                <li class="menu">
                            공지사항<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        
                        
                    </ul>
                </li>
                
                <li class="menu">
                            자주묻는질문<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="#">자주묻는질문</a></li>
                        
                    </ul>
                </li>

            </ul>
		</div>
        
        
        
        <div class="biz-right">
			<div class="biz-title">1:1문의</div>

	
        <div class="biz-right">

          <div class="help-subtitle">
			나의 1:1 문의내역 목록
		</div>

		<div class="help-middle">

			<c:forEach var="inq" items="${list}" varStatus="vs">
				<c:if test="${loginMember != null && loginMember.p_id eq inq.iWriter}">
					<div class="help-item" onclick="location.href='${path}/helpPageInquiryView.do?no=${inq.iNo}'">
						<div class="item-left">
							질문유형 #${inq.iType}
						</div>

						<div class="item-center">
							<div class="center-title">
								제목 ${inq.iTitle}
							</div>
						</div>

						<div class="item-right">
							<span>답변상태 ${inq.status==false?"답변대기중":"답변완료"}</span>
						</div>
					</div>
				</c:if>


				<c:if test="${loginCMember != null && loginCMember.cMemberEmail eq inq.iWriter}">
					<div class="help-item" onclick="location.href='${path}/helpPageInquiryView.do?no=${inq.iNo}'">
						<div class="item-left">
							#${inq.iType}
						</div>

						<div class="item-center">
							<div class="center-title">
								${inq.iTitle}
							</div>
						</div>

						<div class="item-right">
							<span>${inq.status==false?"답변대기중":"답변완료"}</span>
						</div>
					</div>

            	</c:if>
				</c:forEach>
           
            
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

	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>