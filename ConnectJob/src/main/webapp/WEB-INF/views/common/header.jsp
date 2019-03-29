<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>커넥트잡 Connect Job</title>
    <link rel="stylesheet" href="${path }/resources/css/style.css">
    <link rel="stylesheet" href="${path }/resources/css/animate.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	
    <script src="${path }/resources/js/wow.min.js"></script>
    <script src="${path }/resources/js/jquery-3.3.1.min.js"></script>
    
    <!-- 제이쿼리 모달 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    
    
    <script>
        new WOW().init();
    </script>
</head>
<body>
    <header>
        <div id="header-container">
            <div id="logo">
                <a href="${path }/"><img src="${path }/resources/images/logo.jpg"></a>
                <img src="${path }/resources/images/icon-search.png" width="14px"><input type="search" id="search" placeholder="기업을 검색해보세요" autocomplete="off" autofocus/>
            </div>
            <div id="header-menu">
                <div class="menu-left">
                    <ul>
                        <li onclick="location.href='${path}/calendar.do'">공채달력</li>
                        <li onclick="location.href='${path}/company/companyList.do'">기업탐색</li>
                        <li onclick="location.href='${path}/review/review.do'">기업리뷰</li>
                        <li onclick="location.href='${path}/senierConversation.do'">선배와의대화</li>
                        <c:if test="${loginMember!=null}">
                           <li onclick="location.href='${path}/resume.do'">내 이력서</li>
                        </c:if>
                    </ul>
                </div>
                <div class="menu-right">
                    <ul>
                        <c:if test="${loginMember==null}">
                        	<li onclick="location.href='${path}/member/login.do'">로그인</li>
                        	<li onclick="location.href='${path}/member/memberEnroll.do'">회원가입</li>
                        </c:if>
                        <c:if test="${loginMember!=null}">
                        	<li onclick="location.href='${path}/member/mypage.do'">마이페이지</li>
                        	<li onclick="location.href='${path}/member/logout.do'">로그아웃</li>                        	
                        </c:if>
                        <li>고객센터</li>
                    </ul>
                </div>
            </div>
        </div>
    </header>




