<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
        <div id="company-container">
            <div class="company-top">
                기업탐색
            </div>
            <div class="company-middle">
                <button onclick="fn_searchOpen()">지역선택</button>
                <div id="search_location">
                    <div id="search_left">
                        <ul>
                            <li>서울</li>
                            <li>경기</li>
                            <li>인천</li>
                            <li>부산</li>
                            <li>대구</li>
                            <li>광주</li>
                            <li>대전</li>
                            <li>울산</li>
                            <li>세종</li>
                            <li>강원</li>
                            <li>경남</li>
                            <li>경북</li>
                            <li>전남</li>
                            <li>전북</li>
                            <li>충남</li>
                            <li>충북</li>
                            <li>제주</li>
                            <li>전국</li>
                        </ul>
                    </div>
                    <div id="search_right">
                        <div id="location">
                            <ul>
                                <li>서울전체</li>
                                <li>강남구</li>
                                <li>강동구</li>
                                <li>강북구</li>
                                <li>강서구</li>
                                <li>관악구</li>
                                <li>광진구</li>
                                <li>구로구</li>
                                <li>금천구</li>
                                <li>노원구</li>
                                <li>도봉구</li>
                                <li>동대문구</li>
                                <li>동작구</li>
                                <li>마포구</li>
                                <li>서대문구</li>
                                <li>서초구</li>
                                <li>성동구</li>
                                <li>성북구</li>
                                <li>송파구</li>
                                <li>양천구</li>
                                <li>영등포구</li>
                                <li>용산구</li>
                                <li>은평구</li>
                                <li>종로구</li>
                                <li>중구</li>
                                <li>중랑구</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>경기전체</li>
                                <li>가평군</li>
                                <li>고양시</li>
                                <li>고양시 덕양구</li>
                                <li>고양시 일산동구</li>
                                <li>고양시 일산서구</li>
                                <li>과천시</li>
                                <li>광명시</li>
                                <li>광주시</li>
                                <li>구리시</li>
                                <li>군포시</li>
                                <li>김포시</li>
                                <li>남양주시</li>
                                <li>동두천시</li>
                                <li>부천시</li>
                                <li>부천시 소사구</li>
                                <li>부천시 오정구</li>
                                <li>부천시 원미구</li>
                                <li>성남시</li>
                                <li>성남시 분당구</li>
                                <li>성남시 수정구</li>
                                <li>성남시 중원구</li>
                                <li>수원시</li>
                                <li>수원시 권선구</li>
                                <li>수원시 영통구</li>
                                <li>수원시 장안구</li>
                                <li>수원시 팔달구</li>
                                <li>시흥시</li>
                                <li>안산시</li>
                                <li>안산시 단원구</li>
                                <li>안산시 상록구</li>
                                <li>안성시</li>
                                <li>안양시</li>
                                <li>안양시 동안구</li>
                                <li>안양시 만안구</li>
                                <li>의왕시</li>
                                <li>의정부시</li>
                                <li>이천시</li>
                                <li>파주시</li>
                                <li>평택시</li>
                                <li>포천시</li>
                                <li>하남시</li>
                                <li>화성시</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>인천전체</li>
                                <li>강화군</li>
                                <li>계양구</li>
                                <li>남동구</li>
                                <li>동구</li>
                                <li>미추홀구</li>
                                <li>부평구</li>
                                <li>서구</li>
                                <li>연수구</li>
                                <li>옹진군</li>
                                <li>중구</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="search_selected">
                    <div id="select_left">
                    </div>
                    <div id="select_right">
                        <button onclick="fn_search()">검색</button>
                    </div>
                </div>
            </div>
            <div id="company-content">
                    <div id="company-list">
							<table id="ajax_table">
								<tr>
                                    <th style="width:150px">기업구분</th>
                                    <th style="width:390px">기업명</th>
                                    <th style="width:300px">기업주소</th>
                                    <th style="width:150px">리뷰 수</th>
								</tr>
								<c:choose>
									<c:when test="${company!=null }">
										<c:forEach items="${company }" var="list">
											<tr>
												<td style="text-align: center;">${list.companyStatus==1?"법인":"개인" }</td>
												<td><a href="${path }/company/companyView.do?no=${list.companyNo}">${list.companyName }</a></td>
												<td>${list.companyAddressNew }</td>
												<td style="text-align: center;">28</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4"><p align="center">검색 조건을 설정해 주세요</p></td>
										</tr>
									</c:otherwise>
                                </c:choose>
                                        <tr>
                                            <td colspan="4" style="text-align: center;"><div id="pageBar">${pageBar }</div></td>
                                        </tr>
								</table>
								
                    </div>
                </div>
        </div>
    </section>

    <script>
            var locations = $('#search_right > div');
            locations.eq(1).hide();
            locations.eq(2).hide();

            $('#search_left ul li').click(function() {
                switch($(this).text()) {
                    case "서울" : 
                        locations.eq(0).show(); 
                        locations.eq(1).hide();
                        locations.eq(2).hide();
                        break;
                    case "경기" : 
                        locations.eq(0).hide();
                        locations.eq(1).show();
                        locations.eq(2).hide();
                        break;
                    case "인천" : 
                        locations.eq(0).hide();
                        locations.eq(1).hide();
                        locations.eq(2).show();
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
            	url: '${path}/company/companyListEnd.do',
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
                location += location_temp[i].innerText + ",";
            }
            
            $.ajax({
            	url: '${path}/company/companyListEnd.do',
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
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>