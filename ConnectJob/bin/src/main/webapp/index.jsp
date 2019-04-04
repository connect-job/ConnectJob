<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<<<<<<< HEAD
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
	$('#logo').hide();
	$('#searchfrm').hide();
	$('header').css("height","100px");
	$('header').css("background-color","#2c3142c7");
</script>

    <section id="index">
=======
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>커넥트잡 Connect Job</title>
    <link rel="stylesheet" href="${path }/resources/css/index-style.css">
    <script src="${path }/resources/js/jquery-3.3.1.min.js"></script>
<<<<<<< HEAD
<<<<<<< HEAD
</head>
<body>
    <header>
        <div id="header-container">
            <div id="logo">
                <a href="${path }/"><img src="${path }/resources/images/logo.jpg" width="250px"></a>
            </div>
            <div id="header-menu">
                <div class="menu-left">
                    <ul>
                        <li onclick="location.href='${path}/calendar.do'">공채달력</li>
                        <li onclick="location.href='${path}/company/companyList.do'">기업탐색</li>
                        <li>기업리뷰</li>
                        <li onclick="location.href='${path}/senierConversation.do'">선배와의대화</li>
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
    <section>
        <div id="index-container">
            <img src="${path }/resources/images/index-text.png"><Br>
            <div class="index">
                <div class="index-search">
                    <img src="${path }/resources/images/icon-search.png" width="14px"><input type="search" id="search" placeholder="기업을 검색해보세요" autocomplete="off" autofocus/>
                </div>
                <div id="index-search-result"></div>
            </div>
        </div>
        <script>
	        function fn_keywordCheck(no) {
	    		location.href="${path}/company/companyView.do?no=" + no;
	    		$('#index-search-result').css("display","none");
	    	}
        
        
        	$(function() {
        		$.ajax({
        			url: '${path}/company/companyCount.do',
        			dataType: 'html',
        			success: function(data) {
        				      $('#counter').html(data);
        			}
        		});
        		
        		
    			var result = $('#index-search-result');
        		
        		$('#search').keyup(function () {
        			var keyword = $('#search').val();
        			$.ajax({
        				url: '${path}/company/searchCompany.do?keyword='+ keyword,
        				type: 'POST',
        				dataType: 'text',
        				success: function(data) {
        					var Ca = /\+/g;
							var resultSet = decodeURIComponent(data.replace(Ca, " "));
        					console.log(resultSet);
							result.css("display","block");
        					result.empty();
        					result.html(resultSet);
        				}
        			});
        		});
        		
        		/* $('#search').blur(function() {
        			result.css("display","none");
        		}) */
=======
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
    <header>
        <div id="header-container">
            <div id="logo">
                <a href="${path }/"><img src="${path }/resources/images/logo.jpg" width="250px"></a>
            </div>
            <div id="header-menu">
                <div class="menu-left">
                    <ul>
                        <li onclick="location.href='${path}/calendar.do'">공채달력</li>
                        <li onclick="location.href='${path}/company/companyList.do'">기업탐색</li>
                        <li>기업리뷰</li>
                        <li onclick="location.href='${path}/senierConversation.do'">선배와의대화</li>
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
    <section>
>>>>>>> branch 'PSH' of https://github.com/connect-job/ConnectJob.git
        <div id="index-container">
				<img src="${path }/resources/images/index-text.png"><br>
				<div class="index">
					<div class="index-search">
						<img src="${path }/resources/images/icon-search.png" width="14px"><input type="search" id="search" placeholder="기업을 검색해보세요" autocomplete="off" autofocus/>
					</div>
					<div id="index-search-result"></div>
				</div>
			</div>
        
        <script>
	        function fn_keywordCheck(no) {
	    		location.href="${path}/company/companyView.do?no=" + no;
	    		$('#index-search-result').css("display","none");
	    	}
        
        
        	$(function() {
        		$.ajax({
        			url: '${path}/company/companyCount.do',
        			dataType: 'html',
        			success: function(data) {
        				      $('#counter').html(data);
        			}
        		});
        		
        		
    			var result = $('#index-search-result');
        		
        		$('#search').keyup(function () {
        			var keyword = $('#search').val();
        			$.ajax({
        				url: '${path}/company/searchCompany.do?keyword='+ keyword,
        				type: 'POST',
        				dataType: 'text',
        				success: function(data) {
        					var Ca = /\+/g;
							var resultSet = decodeURIComponent(data.replace(Ca, " "));
        					console.log(resultSet);
							result.css("display","block");
        					result.empty();
        					result.html(resultSet);
        				}
        			});
        		});
        		
        		/* $('#search').blur(function() {
        			result.css("display","none");
        		}) */
<<<<<<< HEAD
=======
        		$("#loginModal").modal({
                    fadeDuration: 100
                  });
>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git
=======
</head>
<body>
    <header>
        <div id="header-container">
            <div id="logo">
                <a href="${path }/"><img src="${path }/resources/images/logo.jpg" width="250px"></a>
            </div>
            <div id="header-menu">
                <div class="menu-left">
                    <ul>
                        <li onclick="location.href='${path}/calendar.do'">공채달력</li>
                        <li onclick="location.href='${path}/company/companyList.do'">기업탐색</li>
                        <li>기업리뷰</li>
                        <li onclick="location.href='${path}/senierConversation.do'">선배와의대화</li>
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
    <section>
        <div id="index-container">
            <img src="${path }/resources/images/index-text.png"><Br>
            <div class="index">
                <div class="index-search">
                    <img src="${path }/resources/images/icon-search.png" width="14px"><input type="search" id="search" placeholder="기업을 검색해보세요" autocomplete="off" autofocus/>
                </div>
                <div id="index-search-result"></div>
            </div>
        </div>
        <script>
	        function fn_keywordCheck(no) {
	    		location.href="${path}/company/companyView.do?no=" + no;
	    		$('#index-search-result').css("display","none");
	    	}
        
        
        	$(function() {
        		$.ajax({
        			url: '${path}/company/companyCount.do',
        			dataType: 'html',
        			success: function(data) {
        				      $('#counter').html(data);
        			}
        		});
        		
        		
    			var result = $('#index-search-result');
        		
        		$('#search').keyup(function () {
        			var keyword = $('#search').val();
        			$.ajax({
        				url: '${path}/company/searchCompany.do?keyword='+ keyword,
        				type: 'POST',
        				dataType: 'text',
        				success: function(data) {
        					var Ca = /\+/g;
							var resultSet = decodeURIComponent(data.replace(Ca, " "));
        					console.log(resultSet);
							result.css("display","block");
        					result.empty();
        					result.html(resultSet);
        				}
        			});
        		});
        		
        		/* $('#search').blur(function() {
        			result.css("display","none");
        		}) */
>>>>>>> branch 'jian' of https://github.com/connect-job/ConnectJob.git
>>>>>>> branch 'PSH' of https://github.com/connect-job/ConnectJob.git
        		
        	});
        	
        </script>
    </section>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>


