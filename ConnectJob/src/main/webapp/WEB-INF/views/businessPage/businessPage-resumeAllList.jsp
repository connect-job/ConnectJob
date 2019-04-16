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
	
		<div id="biz-container">

        <!-- ---------------------------------------------------------------------- 좌측메뉴 -->

        <div class="biz-left">
            <div class="menu-top">
                기업페이지
            </div>
            <ul>
                <li class="menu">
                    채용공고<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="${path }/hireNotiAdd.do">채용공고등록</a></li>
                        <li><a href="${path }/hireNotiAll.do">전체공고</a></li>
                        <li><a href="${path }/hireNoti">진행 중 공고</a></li>
                        <li><a href="#">대기 중 공고</a></li>
                        <li><a href="#">마감 된 공고</a></li>
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
                        <li><a href="/updateI.do">기업정보수정</a></li>
                        <li><a href="/cMemberUpdate.do">담당자 정보 수정</a></li>
                        <li><a href="/updatePw.do">비밀번호 변경</a></li>
                    </ul>
                </li>

                <li class="menu">
                    기업리뷰<span class="icon"><i class="fas fa-sort-down"></i></span>
                    <ul class="hide">
                        <li><a href="/review.do">기업 리뷰 조회</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        
        <table>전체 인재 관리
			<tr>
				<th>이력서제목</th>
				<th>이름</th>
				<th>최종학력</th>
				<th>제출날짜</th>
			</tr>        
        </table>
        <c:when test="${Resume!=null }">
        	<c:forEach items="${Resume }" var="list">
				<tr>
					<td>${list.title }</td>
					<td>${list.name }</td>
					<td>${list.finalEdu }</td>
					<td>${list.creationDate }</td>
				</tr>    
			</c:forEach>
		</c:when>
	
	


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>