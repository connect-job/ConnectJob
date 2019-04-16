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
<div class="biz-container">
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
                        <li><a href="${path }/updateI.do">기업정보수정</a></li>
                        <li><a href="${path }/cMemberUpdate.do">담당자 정보 수정</a></li>
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


	<form action="${path }/cmember/updateEnd.do" method="post">
	<input type="hidden" value="${param.cMemberId }" name="cMemberId"/>
		<div class="enroll-item">
               <div class="left">담당자 이름</div>
               <div class="right"><input type="text" class="CMember" id="CMemberName" name="CMemberName"/></div>
            </div>

            <div class="enroll-item">
               <div class="left">담당자 연락처</div>
               <div class="right"><input type="text" class="CMember" id="CMemberPhone" name="CMemberPhone"/></div>
            </div>

            <div class="enroll-item">
               <div class="left">담당자 이메일</div>
               <div class="right"><input type="email" class="CMember" id="CMemberEmail" name="CMemberEmail" /></div>
            </div>
            
			<div class="enroll-item">변경할 비밀번호
               <div class="left">비밀번호</div>
               <div class="right"><input type="password" class="CMember" id="CMemberPwF"/></div>
            </div>

            <div class="enroll-item">변경할 비밀번호 확인
               <div class="left">비밀번호 확인</div>
               <div class="right"><input type="password" class="CMember" id="CMemberPwCkF" name="CMemberPw"/></div>
            </div>
            <button>변경완료</button>
	</form>
	<form action="${path }/cMemberdelete.do">
		<input type="button" id="deleteCMember"/>회원탈퇴
	</form>
	</div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>