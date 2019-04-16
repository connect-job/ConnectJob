<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="padiv" value="${pageContext.request.contextPath}"/>
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
<form action="${path}/updateCom.do">
	<div>기업정보수정
		<div>
			<div>기업명<input type="text"/></div>
			<div>기업 우편번호<input type="text"/></div>
			<div>기업 지번주소<input type="text"/></div>
			<div>기업 도로명주소<input type="text"/></div>
			<div>기업 상태(법인/개인)</div>
			<div>기업 산업코드</div>
			<div>기업 산업분류</div>
			<div>기업 설립일자</div>
			<div>기업 전체인원</div>
			<div>기업 국민연금 납부금액(월)</div>
			<div>기업 입사자</div>
			<div>기업 퇴사자</div>
			<div>기업 사업자등록번호</div>
		</div>
	</div>
</form>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>