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
        
            <div class="company-top">기업탐색</div>
            
            <div class="company-title">지역선택</div>

            <div class="company-middle">
                <div class="search_location">
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
                        <div id="location">
                            <ul>
                                <li>부산전체</li>
                                <li>강서구</li>
                                <li>금정구</li>
                                <li>기장군</li>
                                <li>남구</li>
                                <li>동구</li>
                                <li>동래구</li>
                                <li>부산진구</li>
                                <li>북구</li>
                                <li>사상구</li>
                                <li>사하구</li>
                                <li>서구</li>
                                <li>수영구</li>
                                <li>연제구</li>
                                <li>영도구</li>
                                <li>중구</li>
                                <li>해운대구</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>대구전체</li>
                                <li>남구</li>
                                <li>달서구</li>
                                <li>달성군</li>
                                <li>동구</li>
                                <li>북구</li>
                                <li>서구</li>
                                <li>수성구</li>
                                <li>중구</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>광주전체</li>
                                <li>광산구</li>
                                <li>남구</li>
                                <li>동구</li>
                                <li>북구</li>
                                <li>서구</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>대전전체</li>
                                <li>대덕구</li>
                                <li>동구</li>
                                <li>서구</li>
                                <li>유성구</li>
                                <li>중구</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>울산전체</li>
                                <li>남구</li>
                                <li>동구</li>
                                <li>북구</li>
                                <li>울주군</li>
                                <li>중구</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>세종특별자치시</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>강원전체</li>
                                <li>강릉시</li>
                                <li>고성군</li>
                                <li>동해시</li>
                                <li>삼척시</li>
                                <li>속초시</li>
                                <li>양구군</li>
                                <li>양양군</li>
                                <li>영월군</li>
                                <li>원주시</li>
                                <li>인제군</li>
                                <li>정선군</li>
                                <li>철원군</li>
                                <li>춘천시</li>
                                <li>태백시</li>
                                <li>평창군</li>
                                <li>홍천군</li>
                                <li>화천군</li>
                                <li>횡성군</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>경남전체</li>
                                <li>거제시</li>
                                <li>거창군</li>
                                <li>고성군</li>
                                <li>김해시</li>
                                <li>남해군</li>
                                <li>밀양시</li>
                                <li>사천시</li>
                                <li>산청군</li>
                                <li>양산시</li>
                                <li>의령군</li>
                                <li>진주시</li>
                                <li>창녕군</li>
                                <li>창원시</li>
                                <li>창원시 마산합포구</li>
                                <li>창원시 마산회원구</li>
                                <li>창원시 성산구</li>
                                <li>창원시 의창구</li>
                                <li>창원시 진해구</li>
                                <li>통영시</li>
                                <li>하동군</li>
                                <li>함안군</li>
                                <li>함양군</li>
                                <li>합천군</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>경북전체</li>
                                <li>경산시</li>
                                <li>경주시</li>
                                <li>고령군</li>
                                <li>구미시</li>
                                <li>군위군</li>
                                <li>김천시</li>
                                <li>문경시</li>
                                <li>봉화군</li>
                                <li>상주시</li>
                                <li>성주군</li>
                                <li>안동시</li>
                                <li>영덕군</li>
                                <li>영양군</li>
                                <li>영주시</li>
                                <li>영천시</li>
                                <li>예천군</li>
                                <li>울릉군</li>
                                <li>울진군</li>
                                <li>의성군</li>
                                <li>청도군</li>
                                <li>청송군</li>
                                <li>칠곡군</li>
                                <li>포항시</li>
                                <li>포항시 남구</li>
                                <li>포항시 복구</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>전남전체</li>
                                <li>강진군</li>
                                <li>고흥군</li>
                                <li>곡성군</li>
                                <li>광양시</li>
                                <li>구례군</li>
                                <li>나주시</li>
                                <li>담양군</li>
                                <li>목포시</li>
                                <li>무안군</li>
                                <li>보성군</li>
                                <li>순천시</li>
                                <li>신안군</li>
                                <li>여수시</li>
                                <li>영광군</li>
                                <li>영암군</li>
                                <li>완도군</li>
                                <li>장성군</li>
                                <li>장흥군</li>
                                <li>진도군</li>
                                <li>함평군</li>
                                <li>해남군</li>
                                <li>화순군</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>전북전체</li>
                                <li>고창군</li>
                                <li>군산시</li>
                                <li>김제시</li>
                                <li>남원시</li>
                                <li>무주군</li>
                                <li>부안군</li>
                                <li>순창군</li>
                                <li>완주군</li>
                                <li>익산시</li>
                                <li>임실군</li>
                                <li>장수군</li>
                                <li>전주시</li>
                                <li>전주시 덕진구</li>
                                <li>전주시 완산구</li>
                                <li>정읍시</li>
                                <li>진안군</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>충남전체</li>
                                <li>계룡시</li>
                                <li>공주시</li>
                                <li>금산군</li>
                                <li>논산시</li>
                                <li>당진시</li>
                                <li>보령시</li>
                                <li>부여군</li>
                                <li>서산시</li>
                                <li>서천군</li>
                                <li>아산시</li>
                                <li>연기군</li>
                                <li>예산군</li>
                                <li>천안시</li>
                                <li>천안시 동남구</li>
                                <li>천안시 서북구</li>
                                <li>청양군</li>
                                <li>태안군</li>
                                <li>홍성군</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>충북전체</li>
                                <li>괴산군</li>
                                <li>단양군</li>
                                <li>보은군</li>
                                <li>영동군</li>
                                <li>옥천군</li>
                                <li>음성군</li>
                                <li>제천시</li>
                                <li>증평군</li>
                                <li>진천군</li>
                                <li>청원군</li>
                                <li>청주시</li>
                                <li>청주시 상당구</li>
                                <li>청주시 서원구</li>
                                <li>청주시 청원구</li>
                                <li>청주시 흥덕구</li>
                                <li>충주시</li>
                            </ul>
                        </div>
                        <div id="location">
                            <ul>
                                <li>제주전체</li>
                                <li>서귀포시</li>
                                <li>제주시</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="search_selected">
                    <div id="select_left"></div>
                    <div id="select_right"><button onclick="fn_search()">검색</button></div>
                </div>
            </div>
            
            <div id="company-content">
                <div id="company-list">
            
                    <div class="list-item-top">
                        <div class="cate">기업구분</div>
                        <div class="name">기업명</div>
                        <div class="address">기업주소</div>
                        <div class="count">등록된 리뷰수</div>
                    </div>

                    <c:choose>
                        <c:when test="${company!=null }">
                            <c:forEach items="${company }" var="list">
                                <div class="list-item">
                                    <div class="cate">${list.companyStatus==1?"법인":"개인" }</div>
                                    <div class="name">
                                        <a href="${path }/company/companyView.do?no=${list.companyNo}">${list.companyName }</a>
                                    </div>
                                    <div class="address">${list.companyAddressNew }</div>
                                    <div class="count">${list.reviewCount }</div>
                                </div>
                            </c:forEach>
                        </c:when>
            
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>
            
                    <div id="pageBar">${pageBar }</div>
            
                </div>
            </div>
        </div>
    </section>

    <script>
            var locations = $('#search_right > div');
            $.each(locations, function(index) {
                locations.eq(index).hide();
            });
            locations.eq(0).show();

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
                searchOption.append("<button onclick='fn_selectCancle(this)'>" + $(this).text() + "　<i class='fas fa-backspace'></i></button>");
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
            var li = $('#location ul li');
            
            for(var i=0;i<li.length;i++) {
                if(text==li[i].innerText) {
                    li[i].removeAttribute("class");
                }
            }
            e.remove();
        }

       	function fn_paging(cPage) {
       		window.location.href="${path}/company/companyList.do?cPage=" + cPage;
       	}
       	
       	function fn_ajaxPaging(cPage) {
       		var comList = $('#company-list');
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
            var comList = $('#company-list');
            var location_temp = $('#select_left button');
            var location = "";

            for(var i=0; i<location_temp.length;i++) {
            	if(location_temp[i].innerText.indexOf("전체")) {
            		location += location_temp[i].innerText.replace("전체","") + ",";
            	} else {
            		location += location_temp[i].innerText + ",";
            	}
                
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