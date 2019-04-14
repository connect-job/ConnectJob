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
                기업리뷰
            </div>
            <div id="company-content">
                    <div id="company-list">
							<table id="ajax_table">
								<tr>
                                    <th style="width:200px">기업명</th>
                                    <th style="width:390px">한줄평</th>
                                    <th style="width:200px">등록일</th>
                                    <th style="width:150px">좋아요</th>
								</tr>
								<c:choose>
									<c:when test="${review!=null }">
										<c:forEach items="${review }" var="list">
											<tr>
												<td style="text-align: center;">${list.cName}</td>
												<td><a href="${path }/company/companyView.do?no=${list.reviewCompany}">${fn:substring(list.reviewShort,0, 30) }</a></td>
												<td style="text-align: center">
			                                    <fmt:formatDate value="${list.reviewDate}" pattern="yyyy년 MM월 dd일" var="regDate"/>
			                                    ${regDate }
												</td>
												<td style="text-align: center;">${list.reviewLike }</td>
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
       		window.location.href="${path}/review/review.do?cPage=" + cPage;
       	}
       	
       	function fn_ajaxPaging(cPage) {
       		var comList = $('#ajax_table');
       		var location_temp = $('#select_left button');
            var location = "";

            for(var i=0; i<location_temp.length;i++) {
                location += location_temp[i].innerText + ",";
            }
            
            $.ajax({
            	url: '${path}/review/reviewList.do',
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