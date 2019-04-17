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
                기업페이지
            </div>
            <ul>
                <li class="menu">
                    채용공고<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path }/hireNotiAdd.do">채용공고등록</a></li>
                        <li><a href="${path }/hireNotiAllList.do?id=${loginCMember.cMemberId}">전체공고</a></li>
                    </ul>
                </li>

                <li class="menu">
                    인재관리<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path }/AllResume.do">전체 인재정보</a></li>
                        <li><a href="${path }/comResume.do">자사 지원 인재정보</a></li>
                        <li><a href="${path }/openResume.do">공개 인재정보</a></li>
                    </ul>
                </li>

                <li class="menu">
                    기업정보수정<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path }/updateI.do">기업정보수정</a></li>
                        <li><a href="${path }/cMemberUpdate.do">담당자 정보 수정</a></li>
                    </ul>
                </li>

                <li class="menu">
                    기업리뷰<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path }/reviewList.do?cId=${loginCMember.cId}">기업 리뷰 조회</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        
        

		<div class="biz-right">

            <div class="biz-title">
                기업정보
            </div>

            <div class="biz-item">
                <div class="item-left">회사이름</div>
                <div class="item-right"></div>
            </div>
            <div class="biz-item">
                <div class="item-left">설립일</div>
                <div class="item-right"></div>
            </div>
            <div class="biz-item">
                <div class="item-left">주소</div>
                <div class="item-right"></div>
            </div>
            <div class="biz-item">
                <div class="item-left">담당자</div>
                <div class="item-right"></div>
            </div>

            <div class="biz-title">
                자사지원현황
            </div>

            <div class="biz-one">
                <div class="one-item">
                    <div class="one-top">전체</div>
                    <div class="one-bottom">524</div>
                </div>
                <div class="one-item">
                    <div class="one-top">열람</div>
                    <div class="one-bottom">35</div>
                </div>
                <div class="one-item">
                    <div class="one-top">미열람</div>
                    <div class="one-bottom">206</div>
                </div>
                <div class="one-item">
                    <div class="one-top">지원취소</div>
                    <div class="one-bottom">14</div>
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

	//조회기간 날짜
		$(function() {
		    $( "#resume-search-sdate" ).datepicker({
		    	showOn:"both",
		    	changeMonth:true,
		    	changeYear:true,
		    	nextText:"다음달",
		    	prevText:"이전달",
		    	dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		    	monthNamesShort:['1','2','3','4','5','6','7','8','9','10','11','12'],
		    	monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    	currentText:'오늘날짜',
				closeText:'닫기',
				dateFormat:"yy.mm.dd",
		    	minDate:0
		    });
		});
	
		$(function() {
		    $( "#resume-search-edate" ).datepicker({
		    	showOn:"both",
		    	changeMonth:true,
		    	changeYear:true,
		    	nextText:"다음달",
		    	prevText:"이전달",
		    	dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		    	monthNamesShort:['1','2','3','4','5','6','7','8','9','10','11','12'],
		    	monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    	currentText:'오늘날짜',
				closeText:'닫기',
				dateFormat:"yy.mm.dd",
		    	minDate:0
		    });
		});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>