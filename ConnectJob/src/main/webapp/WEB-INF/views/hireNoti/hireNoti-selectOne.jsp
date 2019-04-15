<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section id="hire-view">
	<div id="hire-view-container">
	
		<div class="view-top">
			<div class="left">${hireNoti.cName }　|　${hireNoti.hnTitle}</div>
			<div class="right"><button>스크랩</button>　<button>즉시지원</button></div>
		</div>
		
		
		<div class="view-title">지원자격</div>
		
		<div class="view-content">
			<div class="content-item">
				<div class="left">경력</div>
				<div class="right">${hireNoti.hnCareer }</div>
			</div>
			<div class="content-item">
				<div class="left">학력</div>
				<div class="right">
					<c:forEach var="edu" items="${hireNoti.hnFinalEdu }">
						${edu }
					</c:forEach>
				
				</div>
			</div>
		</div>
		
		
		<div class="view-title">근무조건</div>
		
		<div class="view-content">
			<div class="content-item">
				<div class="left">고용형태</div>
				<div class="right">${hireNoti.hnForm }</div>
			</div>
			<div class="content-item">
				<div class="left">급여</div>
				<div class="right">${hireNoti.hnSal }</div>
			</div>
			<div class="content-item">
				<div class="left">지역</div>
				<div class="right">${hireNoti.hnWorkPlace }</div>
			</div>
			<div class="content-item">
				<div class="left">근무시간</div>
				<div class="right"><span>${hireNoti.hnStime }</span>~<span>${hireNoti.hnDtime }</span></div>
			</div>
		</div>
		
		<div class="view-title">채용정보</div>
		
		<div class="view-content">
			<div class="content-item">
				<div class="left">직종/직무</div>
				<div class="right">
					<c:forEach var="sort" items="${hireNoti.hnSort }">
						${sort }
					</c:forEach>
				</div>
			</div>
			<div class="content-item">
				<div class="left">모집인원</div>
				<div class="right">${hireNoti.hnRecruit }</div>
			</div>
			<div class="content-item">
				<div class="left">모집분야</div>
				<div class="right">${hireNoti.hnCate }</div>
			</div>
			<div class="content-item">
				<div class="left">담당업무</div>
				<div class="right">${hireNoti.hnChargeTask}</div>
			</div>
			<div class="content-item">
				<div class="left">근무부서</div>
				<div class="right">${hireNoti.hnDept}</div>
			</div>
			<div class="content-item">
				<div class="left">직급/직책</div>
				<div class="right">${hireNoti.hnRankPosition}</div>
			</div>
			<div class="content-item">
				<div class="left">전공/학과</div>
				<div class="right">${hireNoti.hnMajor}</div>
			</div>
			<div class="content-item">
				<div class="left">우대조건</div>
				<div class="right">${hireNoti.hnPreference}</div>
			</div>
			<div class="content-item">
				<div class="left">성별</div>
				<div class="right">${hireNoti.hnGender}</div>
			</div>
			<div class="content-item">
				<div class="left">나이</div>
				<div class="right">
					<c:forEach var="birth" items="${hireNoti.hnBirth }">
						${birth }
					</c:forEach>
				</div>
			</div>
			<div class="content-item">
				<div class="left">급여</div>
				<div class="right">${hireNoti.hnSal}</div>
			</div>
			<div class="content-item">
				<div class="left">근무요일</div>
				<div class="right">${hireNoti.hnDay}</div>
			</div>
			<div class="content-item">
				<div class="left">전형절차</div>
				<div class="right">${hireNoti.hnProcess}</div>
			</div>
			<div class="content-item">
				<div class="left">제출서류</div>
				<div class="right">${hireNoti.hnDoc}</div>
			</div>
			<div class="content-item">
				<div class="left">사전인터뷰</div>
				<div class="right">${hireNoti.hnInterview}</div>
			</div>
		</div>
	
	
	
		<div class="view-title">접수기간/방법</div>
		
		<div class="view-content">
			<div class="content-item">
				<div class="left">접수기간</div>
				<div class="right">${hireNoti.startDate } ~ ${hireNoti.endDate }</div>
			</div>
			<div class="content-item">
				<div class="left">접수방법</div>
				<div class="right">${hireNoti.hnReMethod }　<button>즉시지원</button></div>
			</div>
		</div>
	
		<div class="view-title">인사담당자</div>
		
		<div class="view-content">
			<div class="content-item">
				<div class="left">이름</div>
				<div class="right"></div>
			</div>
		</div>
		
		<div class="view-title">기업정보</div>
		
		<div class="view-content">
			<div class="content-item">
				<div class="left">기업이름</div>
				<div class="right">${company.companyName }</div>
			</div>
			<div class="content-item">
				<div class="left">사원수</div>
				<div class="right">${company.companyAllPeople }</div>
			</div>
			<div class="content-item">
				<div class="left">설립일</div>
				<div class="right">${company.companyRegDate }</div>
			</div>
			<div class="content-item">
				<div class="left">기업구분</div>
				<div class="right">${company.companyStatus }</div>
			</div>
			<div class="content-item">
				<div class="left">산업</div>
				<div class="right">${company.companyCate }</div>
			</div>
			<div class="content-item">
				<div class="left">기업주소</div>
				<div class="right">${company.companyAddressNew }</div>
			</div>
		</div>

	</div>
</section>

<%@ include file="/WEB-INF/views/common/header.jsp" %>