<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section id="hire-view">
	<div id="hire-view-container">
		
		<p align="left" style="padding-left:15px;"><button onclick="history.back()" style="background-color:#4e536b; width: 110px; height: 30px; border: none; color:#fff;"><i class="fas fa-arrow-left"></i>　뒤로가기</button></p><Br>
		<div class="view-top">
			<div class="left">${hireNoti.cName }　|　${hireNoti.hnTitle}</div>
			<div class="right">
				<button type="button" onclick="location.href='${path}/scrap/insertHNScrap.do?cMemberId=${hireNoti.cMemberId}&hnTitle=${hireNoti.hnTitle }&hnSeq=${hireNoti.hnSeq }'">스크랩</button>　
				<button type="button"  onclick="fn_apply()">즉시지원</button>
			</div>
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
				<div class="right">${hireNoti.hnRecruit }명</div>
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
				<div class="right">
					${hireNoti.hnGender}
				</div>
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
				<div class="right">${hireNoti.hnReMethod }　<button type="button" onclick="fn_apply()" >즉시지원</button></div>
			</div>
		</div>
	
		<div class="view-title">인사담당자</div>
		
		<div class="view-content">
			<div class="content-item">
				<div class="left">담당자 이름</div>
				<div class="right">${hireNoti.cMemberName }</div>
			</div>
			<div class="content-item">
				<div class="left">담당자 전화번호</div>
				<div class="right">${hireNoti.cMemberPhone }</div>
			</div>
			<div class="content-item">
				<div class="left">담당자 이메일</div>
				<div class="right">${hireNoti.cMemberEmail }</div>
			</div>
		</div>
		
		<div class="view-title">기업정보</div>
		
		<div class="view-content">
			<div class="content-item">
				<div class="left">기업이름</div>
				<div class="right">${hireNoti.cName }</div>
			</div>
			<div class="content-item">
				<div class="left">사원수</div>
				<div class="right">${hireNoti.companyAllPeople } 명</div>
			</div>
			<div class="content-item">
				<div class="left">설립일</div>
				<div class="right">
					<fmt:parseDate value="${hireNoti.companyRegDate}" var="date" pattern="yyyyMMdd" />
                    <fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일" var="regDate" />
                    ${regDate }
				</div>
			</div>
			<div class="content-item">
				<div class="left">산업분류</div>
				<div class="right">${hireNoti.companyCate }</div>
			</div>
			<div class="content-item">
				<div class="left">기업주소</div>
				<div class="right">${hireNoti.companyAddressNew }</div>
			</div>
		</div>
	   <!-- 모달 -->
	   <div class="background-blur"></div>
        <div id="applyModal">
        	<form action="${path }/application/insertApplication.do" method="POST">
	            <div class="top">지원하기</div>
	            <div class="applyTitle">해당 공고에 지원하시려면 이력서를 선택하세요</div>
	            <div class="applySelect">
	            	<input type="hidden" name="hnSeq" value="${hireNoti.hnSeq }"/>
	            	<input type="hidden" name="cMemberId" value="${hireNoti.cMemberId }"/>
	                내 이력서　
	                <select name="resumeNo">
	                		<option value='' disabled selected>이력서 선택</option>
	                	<c:forEach var="r" items="${rList }">
	                		<option value="${r.resumeNo }">${r.title }</option>
	                	</c:forEach>
	                </select>
	            </div>
	            <div class="applyBottom">
	                <input type="submit" value="지원하기"/>　<button onclick="fn_applyCancle()">취소</button>
	            </div>
            </form>
        </div>
	</div>
	
</section>
<script>
function fn_applyComplete(){
	var resumeSelectNo=$('[name=resumeSelect]').val();
	console.log(resumeSelectNo);
	console.log("${hnSeq}");
	location.href="${path}/application/insertApplication.do?hnSeq=${hireNoti.hnSeq }&resumeNo=0";
	
}
function fn_apply() {
    if (${ loginMember != null }) {
        $('body').scrollTop(0);
        $(".background-blur").eq(0).css("display", "inline-block");
        $('#applyModal').css("display", "inline-block");
    } else {
        if (confirm('로그인 후 지원하실 수 있습니다\n로그인 페이지로 이동하시겠습니까?')) {
            window.location.href = "${path}/member/login.do";
        } else {
            return;
        }
    }
}

function fn_applyCancle() {
    $(".background-blur").eq(0).css("display", "none");
    $('#applyModal').css("display", "none");
}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>