<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
	<form name="resumeFrm" action="${pageContext.request.contextPath}/resume/resumeUpdateEnd.do?resumeNo=${resultR.resumeNo}" method="post" onsubmit="return validate();"  enctype="multipart/form-data">
	<div id="resume-container">
		<div class="resume-top">
			<i class="far fa-address-card"></i>　내 이력서 작성
		</div>

		<!-- ----------------------------- 기본 -->
		<div class="sub-title">기본설정</div>
		<div class="item">
			<div class="left">이력서 제목</div>
			<div class="right">
				<input type="text" name="title" id="title" value="${resultR.title }">
				<select name="isPublic">
					<option value="" disabled selected>공개여부</option>
					<option value="true" ${resultR.isPublic eq "true"?'selected':'' }>공개</option>
					<option value="false" ${resultR.isPublic eq 'false'?'selected':'' }>비공개</option>
				</select>
			</div>
		</div>
		<div class="sub-title">
			기본정보
		</div>
		<div class="profileUpload">
			<c:choose>
				<c:when test="${not empty img }">
					<div id="images" style="border:1px solid lightgray;width:120px;height:160px">
						<img src="${path }/resources/upload/profile/${img.renamedFileName }" style="width:120px; heigth:160px;" />
					</div>
						<input id='profileImg' type="file" name="profileImg" multiple />
					
					</c:when>
					<c:otherwise>
						<div id="images" style="border:1px solid lightgray;width:120px;height:160px">
						<i class="far fa-plus-square"></i>사진을 추가해주세요
						</div>
			 			<input id='profileImg' type="file" name="profileImg" multiple />
					</c:otherwise>
				</c:choose> 
				
			</div>
		
		<div class="item">
			<input type="hidden" name="p_id" value="${loginMember.p_id}">
			<div class="left">이름</div>
			<div class="right"><input type="text" name="name" id="name" value="${resultR.name }"></div>
		</div>
		<div class="item">
			<div class="left">생년월일</div>
			<div class="right">
				<input type="text" id="birth" name="birth" placeholder="YYYYMMDD" value="${resultR.birth }">
				<select name="gender">
					<option value="" disabled selected>성별</option>
					<option value="M"  ${resultR.gender eq 'M'?'selected':'' }>남</option>
					<option value="F"  ${resultR.gender eq 'F'?'selected':'' }>여</option>
				</select>
			</div>
		</div>
		<div class="item">
			<div class="left">이메일</div>
			<div class="right"><input type="email" name="email" id="email" placeholder="example@connectjob.com" value="${resultR.email }"></div>
		</div>
		<div class="item">
			<div class="left">핸드폰</div>
			<div class="right"><input type="text" name="phone" id="phone" placeholder="-을 제외하고 작성" value="${resultR.phone }"></div>
		</div>

		<!-- ----------------------------- 학력 -->

		<div class="sub-title">
			학력정보
		</div>

		<div class="item">
			<div class="left">최종 학력정보</div>
			<div class="right">
				<select name="finalEdu" onchange="selectFinalEdu()" >
					<option value="" disabled selected>최종학력을 선택하세요</option>
					<option value="초등학교 졸업" ${resultR.finalEdu eq '초등학교 졸업'?'selected':'' }>초등학교 졸업</option>
					<option value="중학교 졸업" ${resultR.finalEdu eq '중학교 졸업'?'selected':'' }>중학교 졸업</option>
					<option value="고등학교 졸업" ${resultR.finalEdu eq '고등학교 졸업'?'selected':'' }>고등학교 졸업</option>
					<option value="대학/대학원 이상 졸업" ${resultR.finalEdu eq '대학/대학원 이상 졸업'?'selected':'' }>대학/대학원 이상 졸업</option>
				</select>
				<button type="button" id="addUnivBtn" onclick="addUniversity()">대학 학력 추가</button>
			</div>
		</div>


		<div class="finalEduAjaxContainer">
			<c:if test="${countUniv==1 }">
			
				<div class="univ">
				<h3>대학교 정보 입력</h3>
				<script>console.log("${univList[0]}")</script>
				<div class="item">
				   <div class="left">대학</div>
				   <div class="right">
				      <select name="schoolFlag" >
				         <option value="" disabled selected>대학</option>
				         <option value="대학교(2,3년)" ${univList[0].schoolFlag eq '대학교(2,3년)'?'selected':'' }>대학교(2,3년)</option>
				         <option value="대학교(4년)" ${univList[0].schoolFlag eq '대학교(4년)'?'selected':'' }>대학교(4년)</option>
				         <option value="석사" ${univList[0].schoolFlag eq '대학원(석사)'?'selected':'' }>대학원(석사)</option>
				         <option value="박사" ${univList[0].schoolFlag eq '대학원(박사)'?'selected':'' }>대학원(박사)</option>
				      </select>
				      <div class="checkMsg"></div>
				      <button type="button" class="deleteUnivBtn">대학 학력 삭제</button>
				   </div>
				</div>
				
				<div class="item">
				   <div class="left">학교명</div>
				   <div class="right">
				      <input type="text" id="schoolName" name="schoolName" placeholder="학교명을 입력하세요" value="${univList[0].schoolName }">
				   </div>
				</div>
				
				<div class="item">
				   <div class="left">전공</div>
				   <div class="right">
				      <input type="text" id="major" name="major" placeholder="전공을 입력하세요" value="${univList[0].major }" >
				      <!-- <button onclick="addMajor()" id="addMajorBtn">전공추가</button> -->
				   </div>
				</div>
				
				<div class="item" id="addMajorContainer">
				   <div class="left">전공2</div>
				   <div class="right">
				      <select name="secondMajorCategory"  >
				         <option value="" disabled selected>전공구분선택</option>
				         
				         <option value="해당사항 없음" ${univList[0].secondMajorCategory eq '해당사항 없음'?'selected':""}>해당사항 없음</option>
				         <option value="부전공" ${univList[0].secondMajorCategory eq '부전공'?'selected':'' }>부전공</option>
				         <option value="복수전공" ${univList[0].secondMajorCategory eq '복수전공'?'selected':'' }>복수전공</option>
				         <option value="이중전공" ${univList[0].secondMajorCategory eq '이중전공'?'selected':'' }>이중전공</option>
				      </select>
				      <input type="text" id="major2" name="secondMajor" placeholder="전공을 입력하세요" value="${univList[0].secondMajor}" ${univList[0].secondMajor eq'해당사항 없음'? 'readonly  style="background-color:rgb(241,241,241); color:gray;" ': ''}>
				   </div>
				</div>
				
				
				<div class="item">
				   <div class="left">재학기간</div>
				   <div class="right">
				      <!-- <input type="number" name="admissionDate" id="admissionDate"> - <input type="date" name="graduateDate" id="graduateDate"> -->
				      <input type='month' name='admissionYM' id="admissionYM" placeholder="입학년월 입력" <%-- value='${univList[0].admissionYM }' --%>>
					  <input type='month' name='graduationYM' id="graduationYM" placeholder="졸업년월 입력" <%-- value='${univList[0].graudationYM }' --%>>
						<select name="graduateState" >
				        	<option value="" disabled selected>졸업상태</option>
				            <option value="졸업" ${univList[0].graduateState eq '졸업'?'selected':'' }>졸업</option>
				            <option value="졸업예정" ${univList[0].graduateState eq '졸업예정'?'selected':'' }>졸업예정</option>
				            <option value="수료" ${univList[0].graduateState eq '수료'?'selected':'' }>수료</option>
				            <option value="휴학" ${univList[0].graduateState eq '휴학'?'selected':'' }>휴학</option>
				            <option value="중퇴" ${univList[0].graduateState eq '중퇴'?'selected':'' }>중퇴</option>
				        </select>
				   </div>
				</div>
				<div class="item">
				   <div class="left">학점</div>
				   <div class="right">
				      <input type="text" id="score" name="score" value="${univList[0].score }"> /
				      <select name="scoreStandard" >
				         <option value="" disabled selected>학점기준</option>
				         <option value="4.0" ${univList[0].scoreStandard eq '4.0'?'selected':'' }>4.0</option>
				         <option value="4.3" ${univList[0].scoreStandard eq '4.3'?'selected':'' }>4.3</option>
				         <option value="4.5" ${univList[0].scoreStandard eq '4.5'?'selected':'' }>4.5</option>
				         <option value="100" ${univList[0].scoreStandard eq '100'?'selected':'' }>100</option>
				      </select>
				   </div>
				</div>
				</div>
			</c:if>
		</div>
		
		<!-- =================2번째대학교================== -->
		<div class="addUnivContainer">
			<c:if test="${countUniv }==2">
				<div class="univ">
				<h3>대학교 정보 입력</h3>
				<script>console.log("${univList[0]}")</script>
				<div class="item">
				   <div class="left">대학</div>
				   <div class="right">
				      <select name="schoolFlag" >
				         <option value="" disabled selected>대학</option>
				         <option value="대학교(2,3년)" ${univList[1].schoolFlag eq '대학교(2,3년)'?'selected':'' }>대학교(2,3년)</option>
				         <option value="대학교(4년)" ${univList[1].schoolFlag eq '대학교(4년)'?'selected':'' }>대학교(4년)</option>
				         <option value="석사" ${univList[1].schoolFlag eq '대학원(석사)'?'selected':'' }>대학원(석사)</option>
				         <option value="박사" ${univList[1].schoolFlag eq '대학원(박사)'?'selected':'' }>대학원(박사)</option>
				      </select>
				      <div class="checkMsg"></div>
				      <button type="button" class="deleteUnivBtn">대학 학력 삭제</button>
				   </div>
				</div>
				
				<div class="item">
				   <div class="left">학교명</div>
				   <div class="right">
				      <input type="text" id="schoolName" name="schoolName" placeholder="학교명을 입력하세요" value="${univList[1].schoolName }">
				   </div>
				</div>
				
				<div class="item">
				   <div class="left">전공</div>
				   <div class="right">
				      <input type="text" id="major" name="major" placeholder="전공을 입력하세요" value="${univList[1].major }" >
				      <!-- <button onclick="addMajor()" id="addMajorBtn">전공추가</button> -->
				   </div>
				</div>
				
				<div class="item" id="addMajorContainer">
				   <div class="left">전공2</div>
				   <div class="right">
				      <select name="secondMajorCategory"  >
				         <option value="" disabled selected>전공구분선택</option>
				         
				         <option value="해당사항 없음" ${univList[1].secondMajorCategory eq '해당사항 없음'?'selected':'' }>해당사항 없음</option>
				         <option value="부전공" ${univList[1].secondMajorCategory eq '부전공'?'selected':'' }>부전공</option>
				         <option value="복수전공" ${univList[1].secondMajorCategory eq '복수전공'?'selected':'' }>복수전공</option>
				         <option value="이중전공" ${univList[1].secondMajorCategory eq '이중전공'?'selected':'' }>이중전공</option>
				      </select>
				      <input type="text" id="major2" name="secondMajor" placeholder="전공을 입력하세요" value="${univList[1].secondMajor}"  ${univList[0].secondMajor eq'해당사항 없음'? 'readonly  style="background-color:rgb(241,241,241); color:gray;" ': ''}>
				   </div>
				</div>
				
				
				<div class="item">
				   <div class="left">재학기간</div>
				   <div class="right">
				      <!-- <input type="number" name="admissionDate" id="admissionDate"> - <input type="date" name="graduateDate" id="graduateDate"> -->
				      <input type='month' name='admissionYM' id="admissionYM" placeholder="입학년월 입력" <%-- value='${univList[0].admissionYM }' --%>>
					  <input type='month' name='graduationYM' id="graduationYM" placeholder="졸업년월 입력" <%-- value='${univList[0].graudationYM }' --%>>
						<select name="graduateState" >
				        	<option value="" disabled selected>졸업상태</option>
				            <option value="졸업" ${univList[1].graduateState eq '졸업'?'selected':'' }>졸업</option>
				            <option value="졸업예정" ${univList[1].graduateState eq '졸업예정'?'selected':'' }>졸업예정</option>
				            <option value="수료" ${univList[1].graduateState eq '수료'?'selected':'' }>수료</option>
				            <option value="휴학" ${univList[1].graduateState eq '휴학'?'selected':'' }>휴학</option>
				            <option value="중퇴" ${univList[1].graduateState eq '중퇴'?'selected':'' }>중퇴</option>
				        </select>
				   </div>
				</div>
				<div class="item">
				   <div class="left">학점</div>
				   <div class="right">
				      <input type="text" id="score" name="score" value="${univList[0].score }"> /
				      <select name="scoreStandard" >
				         <option value="" disabled selected>학점기준</option>
				         <option value="4.0" ${univList[1].scoreStandard eq '4.0'?'selected':'' }>4.0</option>
				         <option value="4.3" ${univList[1].scoreStandard eq '4.3'?'selected':'' }>4.3</option>
				         <option value="4.5" ${univList[1].scoreStandard eq '4.5'?'selected':'' }>4.5</option>
				         <option value="100" ${univList[1].scoreStandard eq '100'?'selected':'' }>100</option>
				      </select>
				   </div>
				</div>
				</div>		
		</c:if>
		</div>
		<div class="addUnivContainer2">
		<c:if test="${countUniv }==3">
				<div class="univ">
				<h3>대학교 정보 입력</h3>
				<div class="item">
				   <div class="left">대학</div>
				   <div class="right">
				      <select name="schoolFlag" >
				         <option value="" disabled selected>대학</option>
				         <option value="대학교(2,3년)" ${univList[2].schoolFlag eq '대학교(2,3년)'?'selected':'' }>대학교(2,3년)</option>
				         <option value="대학교(4년)" ${univList[2].schoolFlag eq '대학교(4년)'?'selected':'' }>대학교(4년)</option>
				         <option value="석사" ${univList[2].schoolFlag eq '대학원(석사)'?'selected':'' }>대학원(석사)</option>
				         <option value="박사" ${univList[2].schoolFlag eq '대학원(박사)'?'selected':'' }>대학원(박사)</option>
				      </select>
				      <div class="checkMsg"></div>
				      <button type="button" class="deleteUnivBtn">대학 학력 삭제</button>
				   </div>
				</div>
				
				<div class="item">
				   <div class="left">학교명</div>
				   <div class="right">
				      <input type="text" id="schoolName" name="schoolName" placeholder="학교명을 입력하세요" value="${univList[2].schoolName }">
				   </div>
				</div>
				
				<div class="item">
				   <div class="left">전공</div>
				   <div class="right">
				      <input type="text" id="major" name="major" placeholder="전공을 입력하세요" value="${univList[2].major }" >
				      <!-- <button onclick="addMajor()" id="addMajorBtn">전공추가</button> -->
				   </div>
				</div>
				
				<div class="item" id="addMajorContainer">
				   <div class="left">전공2</div>
				   <div class="right">
				      <select name="secondMajorCategory"  >
				         <option value="" disabled selected>전공구분선택</option>
				         
				         <option value="해당사항 없음" ${univList[2].secondMajorCategory eq '해당사항 없음'?'selected':'' }>해당사항 없음</option>
				         <option value="부전공" ${univList[2].secondMajorCategory eq '부전공'?'selected':'' }>부전공</option>
				         <option value="복수전공" ${univList[2].secondMajorCategory eq '복수전공'?'selected':'' }>복수전공</option>
				         <option value="이중전공" ${univList[2].secondMajorCategory eq '이중전공'?'selected':'' }>이중전공</option>
				      </select>
				      <input type="text" id="major2" name="secondMajor" placeholder="전공을 입력하세요" value="${univList[1].secondMajor}"  ${univList[0].secondMajor eq'해당사항 없음'? 'readonly  style="background-color:rgb(241,241,241); color:gray;" ': ''}>
				   </div>
				</div>
				
				
				<div class="item">
				   <div class="left">재학기간</div>
				   <div class="right">
				      <!-- <input type="number" name="admissionDate" id="admissionDate"> - <input type="date" name="graduateDate" id="graduateDate"> -->
				      <input type='month' name='admissionYM' id="admissionYM" placeholder="입학년월 입력" <%-- value='${univList[0].admissionYM }' --%>>
					  <input type='month' name='graduationYM' id="graduationYM" placeholder="졸업년월 입력" <%-- value='${univList[0].graudationYM }' --%>>
						<select name="graduateState" >
				        	<option value="" disabled selected>졸업상태</option>
				            <option value="졸업" ${univList[2].graduateState eq '졸업'?'selected':'' }>졸업</option>
				            <option value="졸업예정" ${univList[2].graduateState eq '졸업예정'?'selected':'' }>졸업예정</option>
				            <option value="수료" ${univList[2].graduateState eq '수료'?'selected':'' }>수료</option>
				            <option value="휴학" ${univList[2].graduateState eq '휴학'?'selected':'' }>휴학</option>
				            <option value="중퇴" ${univList[2].graduateState eq '중퇴'?'selected':'' }>중퇴</option>
				        </select>
				   </div>
				</div>
				<div class="item">
				   <div class="left">학점</div>
				   <div class="right">
				      <input type="text" id="score" name="score" value="${univList[0].score }"> /
				      <select name="scoreStandard" >
				         <option value="" disabled selected>학점기준</option>
				         <option value="4.0" ${univList[2].scoreStandard eq '4.0'?'selected':'' }>4.0</option>
				         <option value="4.3" ${univList[2].scoreStandard eq '4.3'?'selected':'' }>4.3</option>
				         <option value="4.5" ${univList[2].scoreStandard eq '4.5'?'selected':'' }>4.5</option>
				         <option value="100" ${univList[2].scoreStandard eq '100'?'selected':'' }>100</option>
				      </select>
				   </div>
				</div>
				</div>		
			</c:if>
		</div>

		<!-- ----------------------------- 경력 -->

		<div class="sub-title">
			경력정보
		</div>

		<div class="item">
			<div class="left">경력정보</div>
			<div class="right">
				<select name="career" onchange="selectCareer()" >
					<option value="" disabled selected>경력을 선택하세요</option>
					<option value="신입"   ${resultR.career eq '신입'?'selected':'' }>신입</option>
					<option value="경력"   ${resultR.career eq '경력'?'selected':'' }>경력</option>
				</select>
			</div>
		</div>

		<div class="carrerAjaxContainer"></div>

		<!-- ----------------------------- 희망 근무조건 -->

		<div class="sub-title">
			희망 근무조건
		</div>

		<div class="item">
			<div class="left">근무형태</div>
			<div class="right">
				<select name="hopePosition" >
					<option value="" disabled selected>근무형태을 선택하세요</option>
					<option value="정규직" ${resultR.hopePosition eq '정규직'?'selected':'' }>정규직</option>
					<option value="교육생" ${resultR.hopePosition eq '교육생'?'selected':'' }>교육생</option>
					<option value="별정직" ${resultR.hopePosition eq '별정직'?'selected':'' }>별정직</option>
					<option value="파트" ${resultR.hopePosition eq '파트'?'selected':'' }>파트</option>
					<option value="전임" ${resultR.hopePosition eq '전임'?'selected':'' }>전임</option>
					<option value="계약직" ${resultR.hopePosition eq '계약직'?'selected':'' }>계약직</option>
					<option value="병역특례" ${resultR.hopePosition eq '병역특례'?'selected':'' }>병역특례</option>
					<option value="인턴직" ${resultR.hopePosition eq '인턴직'?'selected':'' }>인턴직</option>
					<option value="아르바이트" ${resultR.hopePosition eq '아르바이트'?'selected':'' }>아르바이트</option>
					<option value="파견직" ${resultR.hopePosition eq '파견직'?'selected':'' }>파견직</option>
					<option value="해외취업" ${resultR.hopePosition eq '해외취업'?'selected':'' }>해외취업</option>
					<option value="위촉직" ${resultR.hopePosition eq '위촉직'?'selected':'' }>위촉직</option>
					<option value="프리랜서" ${resultR.hopePosition eq '프리랜서'?'selected':'' }>프리랜서</option>
				</select>
			</div>
		</div>

		<div class="item">
			<div class="left">희망연봉</div>
			<div class="right">
				<select name="hopeSalary" >
					<option value="" disabled selected>희망연봉을 선택하세요</option>
					<option value="회사내규에 따름" ${resultR.hopeSalary eq '회사내규에 따름'?'selected':'' }>회사내규에 따름</option>
					<option value="상의후 결정" ${resultR.hopeSalary eq '회사내규에 따름'?'selected':'' }>상의후 결정</option>
					<option value="2,000만원 이하" ${resultR.hopeSalary eq '2,000만원 이하'?'selected':'' }>2,000만원 이하</option>
					<option value="2,000~2,200만원" ${resultR.hopeSalary eq '2,000~2,200만원'?'selected':'' }>2,000~2,200만원</option>
					<option value="2,200~2,400만원" ${resultR.hopeSalary eq '2,200~2,400만원'?'selected':'' }>2,200~2,400만원</option>
					<option value="2,400~2,600만원" ${resultR.hopeSalary eq '2,400~2,600만원'?'selected':'' }>2,400~2,600만원</option>
					<option value="2,600~3,800만원" ${resultR.hopeSalary eq '2,600~3,800만원'?'selected':'' }>2,600~3,800만원</option>
					<option value="2,800~3,000만원" ${resultR.hopeSalary eq '2,800~3,000만원'?'selected':'' }>2,800~3,000만원</option>
					<option value="3,000~3,200만원" ${resultR.hopeSalary eq '3,000~3,200만원'?'selected':'' }>3,000~3,200만원</option>
					<option value="3,200~3,400만원" ${resultR.hopeSalary eq '3,200~3,400만원'?'selected':'' }>3,200~3,400만원</option>
					<option value="3,400~3,600만원" ${resultR.hopeSalary eq '3,400~3,600만원'?'selected':'' }>3,400~3,600만원</option>
					<option value="3,600~3,800만원" ${resultR.hopeSalary eq '3,600~3,800만원'?'selected':'' }>3,600~3,800만원</option>
					<option value="3,800~4,000만원" ${resultR.hopeSalary eq '3,800~4,000만원'?'selected':'' }>3,800~4,000만원</option>
					<option value="4000만원 이상" ${resultR.hopeSalary eq '4000만원 이상'?'selected':'' }>4000만원 이상</option>
				</select>
			</div>
		</div>

		<div class="item">
			<div class="left">희망지역</div>
			<div class="right">
				<select name="hopeArea" >
                  <option value="" disabled selected>지역을 선택하세요</option>
                  <option value="서울" ${resultR.hopeArea eq '서울'?'selected':'' }>서울</option>
                  <option value="경기" ${resultR.hopeArea eq '경기'?'selected':'' }>경기</option>
                  <option value="광주" ${resultR.hopeArea eq '광주'?'selected':'' }>광주</option>
                  <option value="대구" ${resultR.hopeArea eq '대구'?'selected':'' }>대구</option>
                  <option value="대전" ${resultR.hopeArea eq '대전'?'selected':'' }>대전</option>
                  <option value="부산" ${resultR.hopeArea eq '부산'?'selected':'' }>부산</option>
                  <option value="울산" ${resultR.hopeArea eq '울산'?'selected':'' }>울산</option>
                  <option value="인천" ${resultR.hopeArea eq '인천'?'selected':'' }>인천</option>
                  <option value="강원" ${resultR.hopeArea eq '강원'?'selected':'' }>강원</option>
                  <option value="경남" ${resultR.hopeArea eq '경남'?'selected':'' }>경남</option>
                  <option value="경북" ${resultR.hopeArea eq '경북'?'selected':'' }>경북</option>
                  <option value="전남" ${resultR.hopeArea eq '전남'?'selected':'' }>전남</option>
                  <option value="전북" ${resultR.hopeArea eq '전북'?'selected':'' }>전북</option>
                  <option value="충북" ${resultR.hopeArea eq '충북'?'selected':'' }>충북</option>
                  <option value="충남" ${resultR.hopeArea eq '충남'?'selected':'' }>충남</option>
                  <option value="제주" ${resultR.hopeArea eq '제주'?'selected':'' }>제주</option>
                  <option value="전국" ${resultR.hopeArea eq '전국'?'selected':'' }>전국</option>
                  <option value="세종" ${resultR.hopeArea eq '세종'?'selected':'' }>세종</option>
                  <option value="해외" ${resultR.hopeArea eq '해외'?'selected':'' }>해외</option>
            </select>
			</div>
		</div>

		<div class="item">
			<div class="left">희망직종</div>
			<div class="right">
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea1" value='웹 개발자' />웹 개발자</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea2" value='서버 개발자' />서버 개발자</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea3" value='시스템개발' />시스템개발</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea4" value='프론트엔드 개발자' />프론트엔드 개발자</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea5" value='자바 개발자' />자바 개발자</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea6" value='파이썬 개발자' />파이썬 개발자</label><br>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea7" value='안드로이드 개발자' />안드로이드 개발자</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea8" value='IOS개발자' />IOS개발자</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea9" value='데이터 엔지니어' />데이터 엔지니어</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea10" value='시스템,네트워크 관리자' />시스템,네트워크 관리자</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea11" value='node.js 개발자' />node.js 개발자</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea12" value='php 개발자' />php 개발자</label><br>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea13" value='DevOps / 시스템 관리자' />DevOps / 시스템 관리자</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea14" value='C,C++개발자' />C,C++개발자</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea15" value='개발 매니저' />개발 매니저</label>
	            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea16" value='데이터 사이언티스트' />데이터 사이언티스트</label>
	            <button onclick="resetHopeArea()">reset</button>
			</div>
		</div>

		<div class="item">
			<div class="left">희망업종</div>
			<div class="right">
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory1" value='솔루션·SI·ERP·CRM' />솔루션·SI·ERP·CRM</label>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory2" value='웹에이전시 개발' />웹에이전시</label>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory3" value='쇼핑몰·오픈마켓' />쇼핑몰·오픈마켓</label>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory4" value='포털·인터넷·컨텐츠' />포털·인터넷·컨텐츠</label>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory5" value='네트워크·통신·모바일' />네트워크·통신·모바일</label><br>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory6" value='하드웨어·장비' />하드웨어·장비</label>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory7" value='정보보안·백신' />정보보안·백신</label>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory8" value='IT컨설팅' />IT컨설팅</label>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory9" value='게임' />게임</label>
				<button onclick="resetHopeJobArea()">reset</button>
			</div>
		</div>

		<div class="carrerAjaxContainer22"></div>
		<div class="item">
			<div class=right>
				<input type="submit" value="수정완료">
				<button onclick="history.back(-1);">취소</button>	
			</div>
		</div>
</div>
	
</form>
</section>
<script>
	$(function(){
	    $("#profileImg").change(function(){
	       var iputFiles=document.getElementById('profileImg');
	       console.log(iputFiles.files);
	       $.each(iputFiles.files, function(index, item){
	          console.log(item);
	       var reader = new FileReader();
	       reader.onload=function(e){
	    	  $('#images').children().remove();
	          var img = $("<img></img>").attr("src",e.target.result).css({'width':'120px','height':'160px'});
	          $('#images').append(img);
	       }
	       reader.readAsDataURL(item);
	    });
	    });
	});
	/* $(function(){
		
	}); */
	function resetHopeArea(){
		$('input[name=hopeArea]').prop("checked",false);
	}
	function resetHopeJobArea(){
		$('input[name=hopeJobArea]').prop("checked",false);
	}
	function selectFinalEdu() {
		var finalEdu = $('[name=finalEdu]').val();
		if(finalEdu!="대학/대학원 이상 졸업"){
			$(".addUnivContainer").empty();
			$(".addUnivContainer").empty();
			$("#addUnivBtn").css("display","none");
		}
		$.ajax({
			url: "${path}/selectFinalEdu.do",
			data: { "finalEdu": finalEdu },
			success: function (data) {
				$('.finalEduAjaxContainer').html(data);
				
			}
		})
	}	

	function selectCareer() {
		var career = $('[name=career]').val();
		if(career=="신입"){
			$(".carrerAjaxContainer").empty();
		}else{
			$.ajax({
				url: "${path}/selectCareer.do",
				data: { "career": career },
				success: function (data) {
					$('.carrerAjaxContainer').html(data);
				}
			})
		}
	}
	function addUniversity(){
		console.log("대학추가");
		$.ajax({
			url:"${path}/addUniversity.do",
		    success:function(data){
		   	    var univ=$(".univ");
			    if(univ.length==1){
			    	$('.addUnivContainer').append(data);
			    }else if(univ.length==2){
			    	$('.addUnivContainer2').append(data);
			    }else if(univ.length==3){
			    	alert("학교는 최대 3개까지만 입력 가능합니다.");
			    }
		   		
			    
			   
			    $(".deleteUnivBtn").click(function(){
			    	var univ=$(".univ");
			    	console.log(univ.length);
			    	if(univ.length>1){
			    		$(this).parent().parent().parent().parent().empty();
			    	}else{
			    		console.log($(this).prev());
			    		$(this).prev().empty();
			    		$(this).prev().html("대학은 한개 이상 입력하셔야 합니다.");
			    		/* $(".checkMsg").eq(0).empty();
			    		$(".checkMsg").eq(0).html("대학은 한개 이상 입력하셔야 합니다.");
			    		 */
			    	}
			    });	
			}
		})   
	};
	function validate(){
		var finalEdu = $('[name=finalEdu]').val();
		if(finalEdu=="대학/대학원 이상 졸업"&&major){
			var Category=("");
		}
	}

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>