<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
        <div id="review-container">
            <div class="review-top">
                기업리뷰
            </div>
            <div id="review-content">
            
                <div class="review-middle">
                    <div id="review-cate">
                        <ul>
                            <li>전체</li>
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
                    <div id="search_selected">
                        <div id="select_left">
            
                        </div>
                        <div id="select_right">
                            <button onclick="fn_search()">검색</button>
                        </div>
                    </div>
                </div>

                    <div id="review-list">

                        <c:choose>
                        <c:when test="${review!=null }">
                            <c:forEach items="${review }" var="list">
                                <div class="review-item">
                                    <div class="cate">${list.cName}</div>
                                    <div class="content">
                                        <div class="content-title">
                                            <a href="${path }/company/companyView.do?no=${list.reviewCompany}">${fn:substring(list.reviewShort,0, 30) }</a>
                                        </div>
                                        <div class="content-content">
                                            <c:choose>
                                                <c:when test="${fn:length(list.reviewMerit)>100 }">
                                                    ${fn:substring(list.reviewMerit, 0, 100)}　... ( 더 보기 )
                                                </c:when>
                                                <c:otherwise>
                                                    ${list.reviewMerit}
                                                </c:otherwise>
                                            </c:choose>
                                            
                                        </div>
                                    </div>
                                    <div class="item-right">
                                        <span id="stars">${list.reviewTotalScore==1 ? "<i class='fa fa-star fa-fw'></i>" : list.reviewTotalScore==2 ? "<i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i>" : list.reviewTotalScore==3 ? "<i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i>" : list.reviewTotalScore==4 ? "<i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i>" : "<i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i>" } </span><Br>
                                        <fmt:formatDate value="${list.reviewDate}" pattern="yyyy년 MM월 dd일" var="regDate"/>${regDate }<br>
                                    리뷰좋아요 : ${list.reviewLike }
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
            
                        <c:otherwise>
                            <div class="review-item">
                                작성리뷰가 없습니다.
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            
            <div id="pageBar">${pageBar }</div>

        </div>
    </section>
    <script>
            var searchOption = $('#select_left');
        
            $('#review-cate ul li').click(function () {
                if (!$(this).hasClass('selected')) {
                    console.log($(this).text().trim().indexOf("전체"));
                    if ($(this).text().trim().indexOf("전체") == 0) {
                        var li = $('#review-cate ul li');
                        for (var i = 0; i < li.length; i++) {
                            li[i].removeAttribute("class");
                        }
        
                        var btn = $('#select_left button');
                        for (var i = 0; i < btn.length; i++) {
                            if (btn[i].innerText.trim().indexOf("전체") == 0) {
        
                            } else {
                                btn[i].remove();
                            }
                        }
        
                    } else {
                        var li = $('#review-cate ul li');
                        for (var i = 0; i < li.length; i++) {
                            if (li[i].innerText.trim().indexOf("전체") == 0) {
                                li[i].removeAttribute("class");
                            }
                        }
                        var btn = $('#select_left button');
                        for (var i = 0; i < btn.length; i++) {
                            if (btn[i].innerText.trim().indexOf("전체") == 0) {
                                btn[i].remove();
                            }
                        }
                    }
                    $(this).addClass('selected');
                    searchOption.append("<button onclick='fn_selectCancle(this)'>" + $(this).text() + "　<i class='fas fa-backspace'></i></button>");
                } else {
                    $(this).removeClass('selected');
                    var btn = $('#select_left button');
                    for (var i = 0; i < btn.length; i++) {
                        if ($(this).text() == btn[i].innerText.trim()) {
                            btn[i].remove();
                        }
                    }
                }
            });
        
            function fn_selectCancle(e) {
                var text = e.innerText.trim();
                console.log("text : " + text);
                var li = $('#review-cate ul li');
                console.log(li);
                for (var i = 0; i < li.length; i++) {
                    if (text == li[i].innerText) {
                        console.log(li[i]);
                        li[i].removeAttribute("class");
                    }
                }
                e.remove();
            }
        
            function fn_paging(cPage) {
                window.location.href = "${path}/review/review.do?cPage=" + cPage;
            }
        
            function fn_ajaxPaging(cPage) {
                var sResult = $('#senier-result');
                var job_temp = $('#select_left button');
        
                var job = "";
        
                for (var i = 0; i < job_temp.length; i++) {
                    job += job_temp[i].innerText.trim() + ",";
                }
        
        
                $.ajax({
                    url: '${path}/senier/senierListEnd.do',
                    data: { "job": job, "cPage": cPage },
                    dataType: "html",
                    success: function (data) {
                        var Ca = /\+/g;
                        var resultSet = decodeURIComponent(data.replace(Ca, " "));
                        sResult.html(resultSet);
                    }
                });
        
            }
        
            function fn_search() {
                var sResult = $('#senier-result');
                var job_temp = $('#select_left button');
                
                var job = "";
        
        
                if(job_temp.length!=0) {
                    for (var i = 0; i < job_temp.length; i++) {
                        if (job_temp[i].innerText.trim().indexOf("전체")==0) {
                            job += "";
                        } else {
                            job += job_temp[i].innerText.trim() + ",";
                        }
                    }
        
                    $.ajax({
                        url: '${path}/senier/senierListEnd.do',
                        data: {"job": job},
                        dataType: "html",
                        success: function (data) {
                            var Ca = /\+/g;
                            var resultSet = decodeURIComponent(data.replace(Ca, " "));
                            sResult.html(resultSet);
                        }
                    });
                } else {
                    alert('검색 조건을 설정해 주세요');
                }
                
        
                
            }
        </script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>