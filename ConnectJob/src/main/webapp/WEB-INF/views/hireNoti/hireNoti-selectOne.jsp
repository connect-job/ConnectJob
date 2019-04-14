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
	
	 <div>
		        회사이름<br/>
		        채용공고제목<br/>
        <div>
            지원자격
            <div>경력</div>
            <div>학력</div>
        </div>
        <div>
            근무조건
            <div>고용형태</div>
            <div>급여</div>
            <div>지역</div>
            <div>시간</div>
        </div>
    </div>
    <div>
        <div>직종/직무</div>
        <div>경력여부</div>
        <div>고용형태</div>
        <div>모집인원</div>
        <div>모집분야</div>
        <div>담당업무</div>
        <div>근무부서</div>
        <div>직급/직책</div>
        <div>학력</div>
        <div>전공/학과</div>
        <div>우대조건</div>
        <div>성별</div>
        <div>나이</div>
        <div>급여</div>
        <div>근무지역</div>
        <div>근무요일</div>
        <div>근무시간</div>
        <div>접수기간</div>
        <div>접수방법</div>
        <div>전형절차</div>
        <div>제출서류</div>
        <div>사전인터뷰</div>
    </div>
    <div>
        <div>
            접수기간/방법
            <div>
                접수기간
                <div>시작일</div>
                <div>마감일</div>
            </div>
            <div>
                접수방법
                <div>지원양식</div>
                <div>모집인원</div>
                <div><button>즉시지원</button></div>
            </div>
            <div>
                인사담당자
                <div>이름:김지섭</div>
            </div>
        </div>
    </div>
    <div>
        기업정보
        <div>기업이름</div>
        <div>사원수</div>
        <div>설립일</div>
        <div>기업구분</div>
        <div>산업</div>
        <div>기업주소</div>
    </div>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>