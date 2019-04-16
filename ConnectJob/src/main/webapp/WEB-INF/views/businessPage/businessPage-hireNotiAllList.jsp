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

<section>

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
                        <li><a href="${path }/hireNotiAllList.do">전체공고</a></li>
                        <li><a href="${path }/hireNotiDoList.do">진행 중 공고</a></li>
                        <li><a href="${path }/hireNotiWaitList.do">대기 중 공고</a></li>
                        <li><a href="${path }/hireNotiEndList.do">마감 된 공고</a></li>
                    </ul>
                </li>

                <li class="menu">
                    인재관리<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path }/AllResume.do">전체 인재정보</a></li>
                        <li><a href="${path }/comResume.do">자사 지원 인재정보</a></li>
                        <li><a href="${path }/openResume.do">공개 인재정보</a></li>
                        <li><a href="${path }/matchResume.do">매칭 인재정보</a></li>
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
                        <li><a href="${path }/review.do">기업 리뷰 조회</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        
        <!-- ----------------------- -->
        
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
        
        
	<div id="hire-list">
            <c:forEach items="${hireNoti }" var="list">
                <div class="hire-item">

                    <div class="cname">${list.cName }</div>
                    <div class="subject">
                        <div class="h-title"><a>${list.hnTitle }</a></div>
                        <div class="h-subtitle">모집부문 : 
                            <c:forEach var="sort" items="${list.hnSort }">
                            	${sort }
                            </c:forEach>
                        </div>
                        
                    </div>
                    <div class="career">
                        <div class="c-career">${list.hnCareer }</div>
                        <div class="c-finaledu">
                        	<c:forEach var="edu" items="${list.hnFinalEdu }">
                            	${edu }
                            </c:forEach>
                        </div>
                    </div>
                    <div class="form">
                        <div class="f-form">${list.hnForm }</div>
                        <div class="f-location">${list.hnWorkPlace }</div>
                    </div>
                    <div class="date">
                        <div class="d-submit"><button class="submit" value="${path }/hireNoti/apply.do">즉시지원</button></div>
                        <div class="d-date">
                            <fmt:formatDate value="${list.addDate}" pattern="yyyy년 MM월 dd일" var="regDate"/>${regDate }</div>
                    </div>
                </div>
            </c:forEach>
        </div>
                <div id="pageBar">${pageBar }</div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>