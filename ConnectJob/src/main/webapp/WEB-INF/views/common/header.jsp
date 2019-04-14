<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
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

    <!-- 게시판 글쓰기 폼 에디터 -->
    <script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/12.1.0/inline/ckeditor.js"></script>

    <script>
        new WOW().init();
    </script>
    
    <!-- 구글 로그인 -->
    <meta name="google-signin-scope" content="profile email">
	<meta name="google-signin-client_id" content="638430037698-srn3c01h0flqs3dg2jfmbe0hogr25qgd.apps.googleusercontent.com">
	<script src="https://apis.google.com/js/platform.js" async defer></script>
    
    <!-- 네이버 로그인 -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    
    
    
    
    
</head>

<body>
    <header>

        <div id="notice">
            이곳은 가장 최신 공지사항이 들어감 커넥트잡 사이트 개편 안내 (19.04.07)　　　　
        </div>
        
        <script>
            var notice = $('#notice');
			$.ajax({
				url: '${path}/notice/latestNoticeOne.do',
				success: function(data) {
					var Ca = /\+/g;
	                var resultSet = decodeURIComponent(data.replace(Ca, " "));
	                notice.empty();
	                notice.html(resultSet);
                    notice.append("　　　<button id='x-btn'>X</button>");
				}
			});
        </script>
	
        <div id="header-top">
            <div class="top-container">
                <div class="header-top-left">
                    <a href="${path }/"><img src="${path}/resources/images/new-logo.jpg"></a>
                </div>
                <div class="header-top-center">
                    <div class="header-search">
                        <img src="${path }/resources/images/icon-search.png" width="14px"><input type="search"
                            id="search" placeholder="기업을 검색해보세요" autocomplete="off"/>
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
                        <li onclick="location.href='${path}/senierConversation.do'">채용공고<div class="menu-line"></div></li>
                        <li onclick="location.href='${path}/company/companyList.do'">기업탐색<div class="menu-line"></div>
                        </li>
                        <li onclick="location.href='${path}/review/review.do'">기업리뷰<div class="menu-line"></div>
                        </li>

                        <li onclick="location.href='${path}/senierConversation.do'">선배와의대화<div class="menu-line"></div></li>
                    </ul>
                </div>
                <div class="menu-right">
                    <ul>
                        <c:if test="${loginMember==null && loginCMember==null}">
                            <li id="login-li" onclick="location.href='${path}/member/login.do'">로그인</li>
                            <li id="join-li" onclick="location.href='${path}/member/memberEnroll.do'">회원가입</li>
                        </c:if>
                        <c:if test="${loginMember!=null}">
                            <li id="mypage-li">마이페이지</span>
                                <div id="sub-menu-mypage">
                                        <ul>
                                            <li  onclick="location.href='${path}/member/mypage.do?p_id=${loginMember.p_id }'">내 정보관리</li>
                                                <li onclick="location.href='${path}/resume.do'">내 이력서<div class="menu-line"></div></li>
                                                <li onclick="location.href='${path}/scrap.do'">스크랩<div class="menu-line"></div></li>
                                        </ul>
                                </div></li>
                            <li id="alarm-li" onclick="location.href='${path}/alarm/alarm.do?id=${loginMember.p_id}'">알림센터</li>
                            <li id="logout-li" onclick="location.href='${path}/member/logout.do'">로그아웃</li>
                        </c:if>
                        <c:if test="${loginCMember!=null}">
                            <li onclick="location.href='${path}/cmemberBizPage?cMemberId=${logincMember.cMemberId }'">기업페이지</li>
                            <li onclick="location.href='${path}/member/logout.do'">로그아웃</li>
                        </c:if>
                        <li id="sub">고객센터<div id="sub-menu">
                                <ul>
                                    <li onclick="location.href='${path}/help/inquiry.do'">1:1 문의</li>
                                    <li onclick="location.href='${path}/help/fag.do'">자주묻는질문</li>
                                </ul>
                        </div></li>
                        
                    </ul>
                    
                </div>
            </div>
        </div>
    </header>
    
    <div id="socket-message">
    	메세지 내용 
    </div>

    <script>
    
    // ------------------------------------------------------------ 웹소켓 시작
    var wsUri = "ws://localhost:8080/job/alarm";
    var nick = '${loginMember.p_id}';
	console.log("현재 접속중인 아이디 : ${loginMember.p_id}");
    
    	function send_message() {
	        websocket = new WebSocket(wsUri);
	        websocket.onopen = function(evt) {
	        	console.log(evt);
	            onOpen(evt);
	        };
	
	        websocket.onmessage = function(evt) {
	            onMessage(evt);
	        };
	
	        websocket.onerror = function(evt) {
	            onError(evt);
	        };
	    }
	
	    function onOpen(evt) 
	    {
	    	console.log(evt);
	        websocket.send(nick);
	    }
	
	    function onMessage(evt) {
	    	playAlarm = setTimeout(function () {
	    		$('html').scrollTop()==0;
		    	$('#socket-message').empty();
		    	$('#socket-message').css("opacity","1");
		    	$('#socket-message').css("z-index","999999999");
		    	$('#socket-message').append("<span id='messageIcon'><i class='fas fa-envelope-open-text' style='font-size:20px'></i></span>　");
		    	$('#socket-message').append(evt.data);
		    	$('#socket-message').append("<br><br><a href='${path}/alarm/alarm.do?id=${loginMember.p_id}'>알림센터 바로가기</a>　<button type='button' onclick='fn_messageClose()'>닫기</button>");
	    	}, 1000);
	    	
	    	if(evt.data!=null) {
	    		playAlarm;
	    	} else {
	    		clearInterval(playAlarm);
	    	}
	    	
	    }
	
	    function onError(evt) {
	    	console.log(evt);
	    }
	    
	     $(document).ready(function() {
             if(${loginMember!=null}) {
                send_message();
		     	setTimeout(function() {
		     		send_message();
		     	},1000);
             }
	    });
	    
	    function fn_messageClose() {
	    	$('#socket-message').css("opacity","0");
	    }
	    
	    $(document).ready(function() {

	    	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	    	var floatPosition = parseInt($("#socket-message").css('top'));
	    	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	    	$(window).scroll(function() {
	    		// 현재 스크롤 위치를 가져온다.
	    		var scrollTop = $(window).scrollTop();
	    		var newPosition = scrollTop + floatPosition + "px";

	    		/* 애니메이션 없이 바로 따라감
	    		 $("#floatMenu").css('top', newPosition);
	    		 */

	    		$("#socket-message").stop().animate({
	    			"top" : newPosition
	    		}, 100);

	    	}).scroll();

	    }); 
	    
	    // ------------------------------------------------------------ 웹소켓 끝
    
    
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
            $('#login').css("display","none");
            $('#alarm').css("display","none");
            $('#sub-menu').css("display","none");
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
        });
        
        $('#alarm-li').click(function() {
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

