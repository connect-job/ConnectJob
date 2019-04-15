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
	<div><input type="button">스크랩</div>
	<div><input type="button">즉시지원</div>

	 	<div>
		        회사이름${company.companyName }
		        채용공고제목${hireNoti.hnTitle }<br/>
        <div>
            	지원자격
            <div>경력${hireNoti.hnCareer }</div>
            <div>학력${hireNoti.hnFinalEdu }</div>
		
        </div>
        <div>
            근무조건
            <div>고용형태${hireNoti.hnForm }</div>
            <div>급여${hireNoti.hnSal }</div>
            <div>지역${hireNoti.hnWorkPlace }</div>
            <div>근무시간<span>${hireNoti.hnStime }</span>~<span>${hireNoti.hnDtime }</span></div>
        </div>
    </div>
    <div>
        <div>직종/직무${hireNoti.hnSort }</div>
        <div>모집인원${hireNoti.hnRecruit }</div>
        <div>모집분야${hireNoti.hnCate }</div>
        <div>담당업무${hireNoti.hnChargeTask }</div>
        <div>근무부서${hireNoti.hnDept }</div>
        <div>직급/직책${hireNoti.hnRankPosition }</div>
        <div>전공/학과${hireNoti.hnMajor }</div>
        <div>우대조건${hireNoti.hnPreference }</div>
        <div>성별${hireNoti.hnGender }</div>
        <div>나이${hireNoti.hnBirth }</div>
        <div>급여${hireNoti.hnSal }</div>
        <div>근무요일${hireNoti.hnDay }</div>
        <div>전형절차${hireNoti.hnProcess }</div>
        <div>제출서류${hireNoti.hnDoc }</div>
        <div>사전인터뷰${hireNoti.hnInterview }</div>
    </div>
    <div>
        <div>
            	접수기간/방법
            <div>
                	접수기간
                <div>시작일${hireNoti.startDate }</div>
                <div>마감일${hireNoti.endDate }</div>
            </div>
            <div>
                	접수방법
                <div>지원방법${hireNoti.hnReMethod }</div>
                <div>모집인원${hireNoti.hnRecruit }</div>
                <div><button>즉시지원</button></div>
            </div>
            <div>
                	인사담당자
                <div>이름:${CMember.cMemberName }</div>
            </div>
        </div>
    </div>
   		<div>
        	기업정보
	        <div>기업이름${company.companyName }</div>
	        <div>사원수${company.companyAllPeople }</div>
	        <div>설립일${company.companyRegDate }</div>
	        <div>기업구분${company.companyStatus }</div>
	        <div>산업${company.companyCate }</div>
	        <div>기업주소 도로명주소${company.companyAddressNew } 지번주소${company.companyAddressOld }</div>
   		</div>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>