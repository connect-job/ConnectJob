<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp" %>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<section id="biz">
    <div id="biz-container">
        <!-- ------------------ -->
        <div class="biz-left">
            <div class="menu-top">
                기업페이지
            </div>
            <ul>
                <li class="menu">
                    채용공고<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path }/hireNotiAdd.do">채용공고등록</a></li>
                        <li><a href="${path }/hireNotiAllList.do?id=${loginCMember.cMemberId}">전체공고</a></li>
                    </ul>
                </li>

                <li class="menu">
                    인재관리<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path }/AllResume.do">전체 인재정보</a></li>
                        <li><a href="${path }/comResume.do">자사 지원 인재정보</a></li>
                        <li><a href="${path }/openResume.do">공개 인재정보</a></li>
                    </ul>
                </li>

                <li class="menu">
                    기업정보수정<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path }/updateI.do">기업정보수정</a></li>
                        <li><a href="${path }/cMemberUpdate.do">담당자 정보 수정</a></li>
                    </ul>
                </li>

                <li class="menu">
                    기업리뷰<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path }/reviewList.do?cId=${loginCMember.cId}">기업 리뷰 조회</a></li>
                    </ul>
                </li>
            </ul>
        </div>>

        <!-- ----------------------- -->

        <div class="biz-right">
            <div class="biz-title">전체공고 조회</div>

            <div id="biz-list">
                <c:forEach items="${hireNoti }" var="list">
                    <div class="biz-item">
                        <div class="item1">${list.cName }</div>
                        <div class="item2"><a>${list.hnTitle }</a></div>
                        <div class="item3">
                            <div class="d-date">
                                <fmt:formatDate value="${list.addDate}" pattern="yyyy년 MM월 dd일" var="regDate" />
                                ${regDate }
                            </div>
                        </div>
                        <div class="item4">
                            <button class="submit" value="${path }/hireNoti/apply.do">삭제</button>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="biz-item-one">
                <div id="pageBar">${pageBar }</div>
            </div>

        </div>
    </div>
</section>

<script>
    $(document).ready(function () {
        $(".menu").click(function () {
            var submenu = $(this).children('ul');
            if (submenu.is(":visible")) {
                submenu.slideUp();
                $(this).children('.icon').html("<i class='fas fa-sort-down'></i>");
            } else {
                submenu.slideDown();
                $(this).children('.icon').html("<i class='fas fa-sort-up'></i>");
            }
        });
    });
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>