<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>커넥트잡 Connect Job</title>
    <link rel="stylesheet" href="${path }/resources/css/style.css">
    <link rel="stylesheet" href="${path }/resources/css/animate.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <script src="${path }/resources/js/wow.min.js"></script>
    <script src="${path }/resources/js/jquery-3.3.1.min.js"></script>

    <script>
        new WOW().init();
    </script>
</head>

<body>
    <header>   	
   		
        <div id="notice">        	
            이곳은 가장 최신 공지사항이 들어감 커넥트잡 사이트 개편 안내 (19.04.07)　　　　<button>X</button>
        </div>
        
	
        <div id="header-top">
            <div class="top-container">
                <div class="header-top-left">
                    <a href="${path }/"><img src="${path}/resources/images/new-logo.jpg"></a>
                </div>
                <div class="header-top-center">
                    <div class="header-search">
                        <img src="${path }/resources/images/icon-search.png" width="14px"><input type="search"
                            id="search" placeholder="기업을 검색해보세요" autocomplete="off" autofocus />
                    </div>
                    <div id="header-search-result"></div>
                </div>
                <div class="header-top-right">
                    <h4>실시간 검색기업 순위</h4>
                    <div id="popular-keyword">
                        <div id="popular-container"></div>
                    </div>
                </div>
            </div>
        </div>



        <div id="header-menu">
            <div class="menu-container">
                <div class="menu-left">
                    <ul>
                        <li onclick="location.href='${path}/calendar.do'">공채달력<div class="menu-line"></div>
                        </li>
                        <li onclick="location.href='${path}/company/companyList.do'">기업탐색<div class="menu-line"></div>
                        </li>
                        <li onclick="location.href='${path}/review/review.do'">기업리뷰<div class="menu-line"></div>
                        </li>
                        <li onclick="location.href='${path}/senierConversation.do'">선배와의대화<div class="menu-line"></div>
                        </li>
                        <c:if test="${loginMember!=null}">
                            <li onclick="location.href='${path}/resume.do'">내 이력서<div class="menu-line"></div>
                            </li>
                        </c:if>
                    </ul>
                </div>
                <div class="menu-right">
                    <ul>
                        <c:if test="${loginMember==null && loginCMember==null}">
                            <li onclick="location.href='${path}/member/login.do'">로그인</li>
                            <li onclick="location.href='${path}/member/memberEnroll.do'">회원가입</li>
                        </c:if>
                        <c:if test="${loginMember!=null}">
                            <li onclick="location.href='${path}/member/mypage.do?p_id=${loginMember.p_id }'">마이페이지</li>
                            <li onclick="location.href='${path}/member/logout.do'">로그아웃</li>
                        </c:if>
                        <c:if test="${loginCMember!=null}">
                            <li onclick="location.href='${path}/member/mypage.do?p_id=${loginMember.p_id }'">기업페이지</li>
                            <li onclick="location.href='${path}/member/logout.do'">로그아웃</li>
                        </c:if>
                        <li id="sub">고객센터<div id="sub-menu">
                                <ul>
                                    <li onclick="location.href='${path}/customerService.do'">1:1 문의</li>
                                    <li onclick="location.href='${path}/customerService.do'">자주묻는질문</li>
                                </ul>
                        </div></li>
                        
                    </ul>
                    
                </div>
            </div>
        </div>
    </header>

    <script>

        $('#sub').mouseover(function() {
            $('#sub-menu').css("display","block");
        });

        $('#sub-menu').mouseleave(function() {
            $('#sub-menu').css("display","none");
        });

        var pop = $('#popular-container');
        $.ajax({
            url: '${path}/company/selectKeyword.do',
            success: function (data) {
                var Ca = /\+/g;
                var resultSet = decodeURIComponent(data.replace(Ca, " "));
                pop.empty();
                pop.html(resultSet);
            }
        });

        $(document).ready(function () {
            var height = $("#popular-container").height();
            var num = $(".rolling li").length;
            var max = height * num;
            var move = 0;
            function noticeRolling() {
                move += height;
                $(".rolling").delay(2000).animate({ "top": -move }, 300, function () {
                    if (move >= max) {
                        $(this).css("top", 0);
                        move = 0;
                    };
                });
            };

            noticeRollingOff = setInterval(noticeRolling, 2000);
            $(".rolling").append($(".rolling li").first().clone());

            $(".rolling").mouseover(function () {
                clearInterval(noticeRollingOff);
            });

            $(".rolling").mouseleave(function () {
                noticeRollingOff = setInterval(noticeRolling, 2000);
            });
        });

        function fn_keywordCheck(no) {
            $.ajax({
                url: '${path}/company/searchKeyword.do?keyword=' + no,
                success: function (data) {
                    console.log(data);
                }
            });
            location.href = "${path}/company/companyView.do?no=" + no;
            $('#header-search-result').css("display", "none");
        }

        var result = $('#header-search-result');

        $('#search').keyup(function () {
            var keyword = $('#search').val();
            $.ajax({
                url: '${path}/company/searchCompany.do?keyword=' + keyword,
                type: 'POST',
                dataType: 'text',
                success: function (data) {
                    var Ca = /\+/g;
                    var resultSet = decodeURIComponent(data.replace(Ca, " "));
                    console.log(resultSet);
                    result.css("display", "block");
                    result.empty();
                    result.html(resultSet);
                }
            });
        });

    </script>