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
            이곳은 가장 최신 공지사항이 들어감 커넥트잡 사이트 개편 안내 (19.04.07)　　　　<button id="x-btn">X</button>
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
                    </ul>
                </div>
                <div class="menu-right">
                    <ul>
                        <c:if test="${loginMember==null && loginCMember==null}">
                            <li id="login-li" onclick="location.href='${path}/member/login.do'"><i class="fas fa-sign-in-alt"></i><span id="login">로그인</span></li>
                            <li id="join-li" onclick="location.href='${path}/member/memberEnroll.do'"><i class="fas fa-user-plus"></i><span id="join">회원가입</span></li>
                        </c:if>
                        <c:if test="${loginMember!=null}">
                            <li id="mypage-li"><i class="fas fa-user-check"></i><span id="mypage">MyPage</span>
                                <div id="sub-menu-mypage">
                                        <ul>
                                            <li  onclick="location.href='${path}/member/mypage.do?p_id=${loginMember.p_id }'">내 정보관리</li>
                                                <li onclick="location.href='${path}/resume.do'">내 이력서<div class="menu-line"></div></li>
                                                <li onclick="location.href='${path}/scrap.do'">스크랩<div class="menu-line"></div></li>
                                        </ul>
                                </div></li>
                            <li id="alarm-li"><i class="far fa-comment-dots"></i>
                            <div id="alarm">
                                최근 소식이 없습니다!
                            </div></li>
                            <li id="logout-li" onclick="location.href='${path}/member/logout.do'"><i class="fas fa-sign-out-alt"></i><span id="logout">로그아웃</span></li>
                        </c:if>
                        <c:if test="${loginCMember!=null}">
                            <li onclick="location.href='${path}/member/mypage.do?p_id=${loginMember.p_id }'">기업페이지</li>
                            <li><i class="far fa-comment-dots"></i></li>
                            <li onclick="location.href='${path}/member/logout.do'"><i class="fas fa-sign-out-alt"></i></li>
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
        $('#x-btn').click(function() {
            $(this).parent().css("display","none");
            $(this).parent().parent().parent().find('section').css("padding-top","150px");
        });

        $('#login-li').mouseover(function() {
            $('#login').css("display","block");
            $('#alarm').css("display","none");
            $('#sub-menu').css("display","none");
        });

        $('#login-li').mouseleave(function() {
            $('#alarm').css("display","none");
        });

        $('#join-li').mouseover(function() {
            $('#join').css("display","block");
        });

        $('#join-li').mouseleave(function() {
            $('#join').css("display","none");
        });

        $('#mypage-li').mouseover(function() {
            $('#alarm').css("display","none");
            $('#sub-menu').css("display","none");
            $('#sub-menu-mypage').css("display","block");
        });

        $('#sub-menu-mypage').mouseleave(function() {
            $('#sub-menu-mypage').css("display","none");
        });

        $('#alarm-li').mouseover(function() {
            $('#sub-menu-mypage').css("display","none");
            $('#sub-menu').css("display","none");
            $('#alarm').css("display","block");
        });

        $('#alarm-li').mouseleave(function() {
            $('#alarm').css("display","none");
        });

        $('#logout-li').mouseover(function() {
            $('#sub-menu-mypage').css("display","none");
            $('#sub-menu').css("display","none");
            $('#alarm').css("display","none");
            $('#logout').css("display","block");
        });

        $('#logout-li').mouseleave(function() {
            $('#logout').css("display","none");
        });

        $('#sub').mouseover(function() {
            $('#sub-menu-mypage').css("display","none");
            $('#alarm').css("display","none");
            $('#logout').css("display","none");
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
                    result.css("display", "block");
                    result.empty();
                    result.html(resultSet);
                }
            });
        });

    </script>