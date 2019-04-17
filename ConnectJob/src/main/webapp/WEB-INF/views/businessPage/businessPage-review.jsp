<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param value="" name="pageTitle"/>
</jsp:include>
<section>
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
        </div>
        
        <div id="company-content">
        	<div id="company-list">
        		<div class="list-item-top">
        			<div class="reviewShort">제목</div>
        			<div class="reviewMember">작성자</div>
        			<div class="reviewTotalScore">평점</div>
        			<div class="reviewLike">좋아요</div>
        			<div class="reviewDate">작성일</div>
        		</div>
        		
        		<c:choose>
        			<c:when test="${review!=null }">
        				<c:forEach items="${review }" var="list">
	        				<div clas="list-item">
	        					<div class="reviewShort"><a href="${path }/selectOneReview.do?no=${list.reviewNo">${list.reviewShort }</a></div>
			        			<div class="reviewMember">${list.reviewMember }</div>
			        			<div class="reviewTotalScore">${list.reviewTotalScore }</div>
			        			<div class="reviewLike">${list.reviewLike }</div>
			        			<div class="reviewDate">${list.reviewDate }</div>
			        		</div>
			        	</c:forEach>
        			</c:when>
        		</c:choose>
        	</div>
        </div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>