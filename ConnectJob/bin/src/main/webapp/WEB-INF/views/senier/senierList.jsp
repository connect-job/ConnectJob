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
            선배와의 대화
        </div>

        <div class="senier-subTitle">
            <div id="left">우리 직종의 취업고민과 선배의 답변이에요</div>
            <div id="right"><button id="btn-senier" onclick="location.href='${path}/senierWrite.do'">선배에게 질문하기</button></div>
        </div>

        <div class="senier-middle">
       <h2>직종분류</h2>
        <div id="search_right">
                    <div id="location">
        <ul>
					<li>웹 개발자</li>
					<li>서버 개발자</li>
					<li>시스템개발</li>
					<li>프론트엔드 개발자</li>
					<li>자바 개발자</li>
					<li>파이썬 개발자</li>
					<li>안드로이드 개발자</li>
					<li>IOS개발자</li>
					<li>데이터 엔지니어</li>
					<li>시스템,네트워크 관리자</li>
					<li>node.js 개발자</li>
					<li>php 개발자</li>
					<li>DevOps / 시스템 관리자</li>
					<li>C,C++개발자</li>
					<li>개발 매니저</li>
					<li>데이터 사이언티스트</li>
			
        	</ul>  
        </div>
        </div>
                  <div id="search_selected">
                    <div id="select_left">
                    </div>
                    <div id="select_right">
                        <button onclick="fn_search()">검색</button>
                    </div>
                </div>
        
            <c:choose>
					<c:when test="${list!=null }">
									
            
             	<c:forEach var="sen" items="${list}" varStatus="vs">
             <div class="senier-item" onclick="location.href='${path}/senierAnswer.do?no=${sen.sNo}'">
             		<div>
             			${sen.sCate}
             		</div>
             
					<div class="item-cate">
					<c:forEach items="${sen.qType}" var="type" varStatus="vs">
						${type}
					</c:forEach>
					</div>
					<div class="item-title">
						
						${sen.sTitle}
						
					</div>
					<div class="item-content">
                            <c:set var="content" value ="${fn:substring(sen.sContent, 0, 40)}" />
                        ${content}.... (더 보기)</div>
            </div>
				</c:forEach>
            
            	</c:when>
			</c:choose>
            
        </div>
    </div>
         <div id="pageBar">
        	${pageBar}
        </div>
        <script>
        	
        function fn_paging(cPage) {
       		window.location.href="${path}/senierConversation.do?cPage=" + cPage;
       	}
        
        </script>
        
        
        
    <script>
            var locations = $('#search_right > div');
            $.each(locations, function(index) {
                locations.eq(index).hide();
            });
            locations.eq(0).show();

            $(this).class

            $('#search_left ul li').click(function() {
                switch($(this).text()) {
                    case "서울" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(0).show(); 
                        break;
                    case "경기" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(1).show(); 
                        break;
                    case "인천" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(2).show(); 
                        break;
                    case "부산" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(3).show(); 
                        break;
                    case "대구" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(4).show(); 
                        break;
                    case "광주" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(5).show(); 
                        break;
                    case "대전" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(6).show(); 
                        break;
                    case "대전" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(7).show(); 
                        break;
                    case "울산" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(8).show(); 
                        break;
                    case "세종" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(9).show(); 
                        break;
                    case "강원" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(10).show(); 
                        break;
                    case "경남" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(11).show(); 
                        break;
                    case "경북" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(12).show(); 
                        break;
                    case "전남" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(13).show(); 
                        break;
                    case "전북" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(14).show(); 
                        break;
                    case "충남" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(15).show(); 
                        break;
                    case "충북" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(16).show(); 
                        break;
                    case "제주" : 
                        $.each(locations, function(index) {
                            locations.eq(index).hide();
                        });
                        locations.eq(17).show(); 
                        break;
                }
            });
    </script>

    <script>
        // function fn_searchOpen() {
        //     $('#search_location').toggle(function(){
        //     });
        // }

        var searchOption = $('#select_left');

        $('#location ul li').click(function() {
            if(!$(this).hasClass('selected')) {
                console.log($(this).text().indexOf("전체"));
                if($(this).text().indexOf("전체")>0) {
                    var li = $('#location ul li');
                    for(var i=0;i<li.length;i++) {
                        li[i].removeAttribute("class");
                    }

                    var btn = $('#select_left button');
                    for(var i=0;i<btn.length;i++) {
                        if(btn[i].innerText.indexOf("전체")>0) {

                        } else {
                            btn[i].remove();
                        }
                    }
                    
                } else {
                    var li = $('#location ul li');
                    for(var i=0;i<li.length;i++) {
                        if(li[i].innerText.indexOf("전체")>0) {
                            li[i].removeAttribute("class");
                        }
                    }
                    var btn = $('#select_left button');
                    for(var i=0;i<btn.length;i++) {
                        if(btn[i].innerText.indexOf("전체")>0) {
                            btn[i].remove();
                        }
                    }
                }
                $(this).addClass('selected');
                searchOption.append("<button onclick='fn_selectCancle(this)'>" + $(this).text() + "</button>");
            } else {
                $(this).removeClass('selected');
                var btn = $('#select_left button');
                for(var i=0;i<btn.length;i++) {
                    if($(this).text()==btn[i].innerText) {
                        btn[i].remove();
                    }
                }
            }
        });

        function fn_selectCancle(e) {
            var text = e.innerText;
            console.log("text : " + text);
            var li = $('#location ul li');
            console.log(li);
            for(var i=0;i<li.length;i++) {
                if(text==li[i].innerText) {
                    console.log(li[i]);
                    li[i].removeAttribute("class");
                }
            }
            e.remove();
        }

       	function fn_paging(cPage) {
       		window.location.href="${path}/company/companyList.do?cPage=" + cPage;
       	}
       	
       	function fn_ajaxPaging(cPage) {
       		var comList = $('#ajax_table');
       		var location_temp = $('#select_left button');
            var location = "";

            for(var i=0; i<location_temp.length;i++) {
                location += location_temp[i].innerText + ",";
            }
            
            
            $.ajax({
            	url: '${path}/senier/senierListEnd.do',
            	data: {"location":location, "cPage":cPage},
            	dataType: "html",
            	success: function(data) {
					var Ca = /\+/g;
					var resultSet = decodeURIComponent(data.replace(Ca, " "));
            		comList.empty();
            		comList.html(resultSet);
            	}
            });
            
       	}
        
        function fn_search() {
            var comList = $('#ajax_table');
            var location_temp = $('#select_left button');
            var location = "";

            for(var i=0; i<location_temp.length;i++) {
            	console.log(location_temp[i].innerText.indexOf("전체"));
            	if(location_temp[i].innerText.indexOf("전체")) {
            		location += location_temp[i].innerText.replace("전체","") + ",";
            		console.log(location);
            	} else {
            		location += location_temp[i].innerText + ",";
            	}
                
            }
            
            $.ajax({
            	url: '${path}/senier/senierListEnd.do',
            	data: {"location":location},
            	dataType: "html",
            	success: function(data) {
					var Ca = /\+/g;
					var resultSet = decodeURIComponent(data.replace(Ca, " "));
            		comList.empty();
            		comList.html(resultSet);
            	}
            });
        }
    </script>
        
        
        
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





