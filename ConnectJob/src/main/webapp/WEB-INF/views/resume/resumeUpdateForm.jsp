<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.connect.job.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
   Resume resultR=(Resume)request.getAttribute("resultR");
   String[] jobArea=resultR.getHopeJobArea();
   String[] category=resultR.getHopeCategory();
   List<String> jobAreaList=new ArrayList();
List<String> categoryList=new ArrayList();
   if(jobArea!=null){
      jobAreaList=Arrays.asList(jobArea);
   }
   if(category!=null){
      categoryList=Arrays.asList(category);
   }
   
%>
<section>
   <form name="resumeFrm" action="${pageContext.request.contextPath}/resume/resumeUpdateEnd.do?resumeNo=${resultR.resumeNo}" method="post" onsubmit="return validate();"  enctype="multipart/form-data">
   
   <div id="resume-container">
      
      <div class="resume-top">
         내 이력서 수정
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
      
			
			<div class="item">
					<input type="hidden" name="p_id" value="${loginMember.p_id}">
					<div class="left"><div class="profileUpload" style="text-align: left; display:inline-block;">
							<c:choose>
								<c:when test="${not empty img }">
									<input type="hidden" name="profileImgNo" value="${img.profileImgNo }">
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
								
							</div></div>
					<div class="right"><div class="item">
							<input type="hidden" name="p_id" value="${loginMember.p_id}">
							<div class="left" style="width:10%">이름</div>
							<div class="right"><input type="text" name="name" id="name" value="${resultR.name }"></div>
						</div>
						<div class="item">
							<div class="left" style="width:10%">생년월일</div>
							<div class="right">
								<input type="text" id="birth" name="birth" placeholder="YYYYMMDD" value="${resultR.birth }">
								<select name="gender" style="width:120px">
									<option value="" disabled selected>성별</option>
									<option value="M"  ${resultR.gender eq 'M'?'selected':'' }>남</option>
									<option value="F"  ${resultR.gender eq 'F'?'selected':'' }>여</option>
								</select>
							</div>
						</div>
						<div class="item">
							<div class="left" style="width:10%">이메일</div>
							<div class="right"><input type="email" name="email" id="email" placeholder="example@connectjob.com" value="${resultR.email }"></div>
						</div>
						<div class="item">
							<div class="left" style="width:10%">핸드폰</div>
							<div class="right"><input type="text" name="phone" id="phone" placeholder="-을 제외하고 작성" value="${resultR.phone }"></div>
						</div></div>
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
            <button type="button" id="addUnivBtn" onclick="addUniversity()" ${resultR.finalEdu ne '대학/대학원 이상 졸업'?"style='display:none'":""}>대학 학력 추가</button>
         </div>
      </div>


		<div class="finalEduAjaxContainer" >
			<!-----------------------------초등학교 졸업 -->
			<c:if test="${resultR.finalEdu eq '초등학교 졸업'?true:false }">
				<input type="hidden" name="finalEduNo" value="${finalEdu.finalEduNo }">
				<h3>초등학교 정보 입력</h3>
				<div class="item">
					<div class="left">학교명</div>
					<div class="right">
						<input type="hidden" name="schoolFlag" value="${finalEdu.schoolFlag }">
						<input type="text" id="schoolName" name="schoolName" placeholder="학교명을 입력하세요" value="${finalEdu.schoolName }">
						<input type="checkbox" name="schoolName" value="중입 검정고시" id="noEle">중입 검정고시
					</div>
				</div>
				<div class="item">
					<div class="left">졸업년도</div>
					<div class="right">
						<input type="number" name="graduateYear" id="graduateYear" placeholder="YYYY" value="${finalEdu.graduateYear }">
						<select name="graduateState" >
				                  <option value="" disabled selected>졸업상태</option>
				                  <option value="졸업" ${finalEdu.graduateState eq '졸업'?'selected':'' }>졸업</option>
				                  <option value="졸업예정" ${finalEdu.graduateState eq '졸업예정'?'selected':'' }>졸업예정</option>
				            </select>
					</div>
				</div>
			</c:if>
			
			<!-----------------------------중학교 졸업 -->
			<c:if test="${resultR.finalEdu eq '중학교 졸업'?true:false }">
				<input type="hidden" name="finalEduNo" value="${finalEdu.finalEduNo }">
				<h3>중학교 정보 입력</h3>
				<div class="item">
					<div class="left">학교명</div>
					<div class="right">
						<input type="hidden" name="schoolFlag" value="${finalEdu.schoolFlag }">
						<input type="text" id="schoolName" name="schoolName" value="${finalEdu.schoolName }">
						<input type="checkbox" name="schoolName" value="고입 검정고시" id="noMid">고입 검정고시
					</div>
				</div>
				<div class="item">
					<div class="left">졸업년도</div>
					<div class="right">
						<input type="number" name="graduateYear" id="graduateYear" placeholder="YYYY" value="${finalEdu.graduateYear }">
						<select name="graduateState" >
				                  <option value="" disabled selected>졸업상태</option>
				                  <option value="졸업" ${finalEdu.graduateState eq '졸업'?'selected':'' }>졸업</option>
				                  <option value="졸업예정" ${finalEdu.graduateState eq '졸업예정'?'selected':'' }>졸업예정</option>
				            </select>
					</div>
				</div>
			</c:if>
			
			<!-----------------------------고등학교 졸업 -->
			<c:if test="${resultR.finalEdu eq '고등학교 졸업'?true:false }">
				<input type="hidden" name="finalEduNo" value="${finalEdu.finalEduNo }">
				
				<h3>고등학교 정보 입력</h3>
				
				<div class="item">
					<div class="left">학교명</div>
					<div class="right">
						<input type="hidden" name="schoolFlag" value="${finalEdu.schoolFlag }">
						<input type="text" id="schoolName" name="schoolName" placeholder="학교명을 입력하세요" value="${finalEdu.schoolName }" >
						<input type="checkbox" name="schoolName" value="대입 검정고시" id="noEle">대입 검정고시
					</div>
				</div>
				
				<div class="item">
					<div class="left">졸업년도</div>
					<div class="right">
						<input type="number" name="graduateYear" id="graduateYear" placeholder="YYYY" value="${finalEdu.graduateYear }">
						<select name="graduateState" >
				                  <option value="" disabled selected>졸업상태</option>
				                  <option value="졸업" ${finalEdu.graduateState eq '졸업'?'selected':'' }>졸업</option>
				                  <option value="졸업예정" ${finalEdu.graduateState eq '졸업예정'?'selected':'' }>졸업예정</option>
				        </select>
					</div>
				</div>
			</c:if>
			<script>
				console.log("countUniv : ${countUniv}");
				console.log("0번쨰 : ${univList[i]}");
				console.log("1번째 : ${univList[1]}");
				console.log("2번째 : ${univList[2]}");
				console.log("${resultR}");
			</script>
			
			<!-- 대학교졸업 -->
			<c:forEach var="u" items="${univList }" begin='0' end='${countUniv}' step='1' varStatus="status">
				<div class="univ">
					<input type="hidden" name="finalEduUnivNo" value="${u.finalEduUnivNo }">
					<h3>대학교 정보 입력</h3>
					<script>console.log("${u}")</script>
					<div class="item">
					   <div class="left">대학</div>
					   <div class="right">
					      <select name="schoolFlag" >
					         <option value="" disabled selected>대학</option>
					         <option value="대학교(2,3년)" ${u.schoolFlag eq '대학교(2,3년)'?'selected':'' }>대학교(2,3년)</option>
					         <option value="대학교(4년)" ${u.schoolFlag eq '대학교(4년)'?'selected':'' }>대학교(4년)</option>
					         <option value="석사" ${u.schoolFlag eq '대학원(석사)'?'selected':'' }>대학원(석사)</option>
					         <option value="박사" ${u.schoolFlag eq '대학원(박사)'?'selected':'' }>대학원(박사)</option>
					      </select>
					      <div class="checkMsg" style="display:inline-block;"></div>
					      <button type="button" class="deleteUnivBtn2">대학 학력 삭제</button>
					   </div>
					</div>
					
					<div class="item">
					   <div class="left">학교명</div>
					   <div class="right">
					      <input type="text" id="schoolName" name="schoolName" placeholder="학교명을 입력하세요" value="${u.schoolName }">
					   </div>
					</div>
					
					<div class="item">
					   <div class="left">전공</div>
					   <div class="right">
					      <input type="text" id="major" name="major" placeholder="전공을 입력하세요" value="${u.major }" >
					      <!-- <button onclick="addMajor()" id="addMajorBtn">전공추가</button> -->
					   </div>
					</div>
					
					<div class="item" id="addMajorContainer">
					   <div class="left">전공2</div>
					   <div class="right">
					      <select name="secondMajorCategory"  >
					         <option value="" disabled selected>전공구분선택</option>
					         
					         <option value="해당사항 없음" ${u.secondMajorCategory eq '해당사항 없음'?'selected':""}>해당사항 없음</option>
					         <option value="부전공" ${u.secondMajorCategory eq '부전공'?'selected':'' }>부전공</option>
					         <option value="복수전공" ${u.secondMajorCategory eq '복수전공'?'selected':'' }>복수전공</option>
					         <option value="이중전공" ${u.secondMajorCategory eq '이중전공'?'selected':'' }>이중전공</option>
					      </select>
					      <input type="text" id="major2" name="secondMajor" placeholder="전공을 입력하세요" value="${u.secondMajor}" ${u.secondMajor eq'해당사항 없음'? 'readonly  style="background-color:rgb(241,241,241); color:gray;" ': ''}>
					   </div>
					</div>
					
					
					<div class="item">
					   <div class="left">재학기간</div>
					   <div class="right">
					 
					      <input type='month' name='admissionYM' id="admissionYM" placeholder="입학년월 입력" value="${u.admissionYM }">
						  <input type='month' name='graduationYM' id="graduationYM" placeholder="졸업년월 입력" value="${u.graduationYM }">
							<select name="graduateState" >
					        	<option value="" disabled selected>졸업상태</option>
					            <option value="졸업" ${u.graduateState eq '졸업'?'selected':'' }>졸업</option>
					            <option value="졸업예정" ${u.graduateState eq '졸업예정'?'selected':'' }>졸업예정</option>
					            <option value="수료" ${u.graduateState eq '수료'?'selected':'' }>수료</option>
					            <option value="휴학" ${u.graduateState eq '휴학'?'selected':'' }>휴학</option>
					            <option value="중퇴" ${u.graduateState eq '중퇴'?'selected':'' }>중퇴</option>
					        </select>
					   </div>
					</div>
					<div class="item">
					   <div class="left">학점</div>
					   <div class="right">
					      <input type="text" style="width:120px;" id="score" name="score" value="${u.score }"> /
					      <select name="scoreStandard"  style="width:140px;">
					         <option value="" disabled selected>학점기준</option>
					         <option value="4.0" ${u.scoreStandard eq '4.0'?'selected':'' }>4.0</option>
					         <option value="4.3" ${u.scoreStandard eq '4.3'?'selected':'' }>4.3</option>
					         <option value="4.5" ${u.scoreStandard eq '4.5'?'selected':'' }>4.5</option>
					         <option value="100" ${u.scoreStandard eq '100'?'selected':'' }>100</option>
					      </select>
					   </div>
					</div>
				</div>
				</c:forEach>
		</div>
		<div class="addUnivContainer"> </div>
		<div class="addUnivContainer2"> </div>

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

		<div class="carrerAjaxContainer">
			<c:if test="${resultR.career=='경력' }">
				<input type="hidden" name="careerNo" value="${career.careerNo }">
				<div class="item">
					<div class="left">회사명</div>
					<div class="right">
						<input type="text" placeholder="회사명 입력" name="careerCName" value="${career.careerCName }">
					</div>
				</div>
				
				<div class="item">
				   <div class="left">재직기간</div>
				   <div class="right">
				      <input type="date" id="joinDate" name="joinDate" value="${career.joinDate }" > - <input type="date" name="resignDate" id="resignDate" value="${career.resignDate }">
				      <select name="companyFlag" required>
				         <option value="퇴사" ${career.companyFlag eq '퇴사'?'selected':'' }>퇴사</option>
				         <option value="재직" ${career.companyFlag eq '퇴사'?'selected':'' }>재직중</option>
				      </select>
				   </div>
				</div>
				
				<div class="item">
				   <div class="left">직급/직책</div>
				   <div class="right">
				      <b>직급</b>
				      <select name="position" required>
				         <option value="" disabled selected>직급을 선택하세요(필수)</option>
				         <option value="임시직/프리랜서" ${career.position eq '임시직/프리랜서'?'selected':'' }>임시직/프리랜서</option>
				         <option value="인턴/사원" ${career.position eq '인턴/사원'?'selected':'' }>인턴/사원</option>
				         <option value="사원" ${career.position eq '사원'?'selected':'' }>사원</option>
				         <option value="주임" ${career.position eq '주임'?'selected':'' }>주임</option>
				         <option value="계장" ${career.position eq '계장'?'selected':'' }>계장</option>
				         <option value="대리" ${career.position eq '대리'?'selected':'' }>대리</option>
				         <option value="과장" ${career.position eq '과장'?'selected':'' }>과장</option>
				         <option value="차장" ${career.position eq '차장'?'selected':'' }>차장</option>
				         <option value="부장" ${career.position eq '부장'?'selected':'' }>부장</option>
				         <option value="감사" ${career.position eq '감사'?'selected':'' }>감사</option>
				         <option value="이사" ${career.position eq '이사'?'selected':'' }>이사</option>
				         <option value="상무" ${career.position eq '상무'?'selected':'' }>상무</option>
				         <option value="전무" ${career.position eq '전무'?'selected':'' }>전무</option>
				         <option value="부사장" ${career.position eq '부사장'?'selected':'' }>부사장</option>
				         <option value="사장" ${career.position eq '사장'?'selected':'' }>사장</option>
				         <option value="임원" ${career.position eq '임원'?'selected':'' }>임원</option>
				         <option value="연구원" ${career.position eq '연구원'?'selected':'' }>연구원</option>
				         <option value="주임연구원" ${career.position eq '주임연구원'?'selected':'' }>주임연구원</option>
				         <option value="선임연구원" ${career.position eq '선임연구원'?'selected':'' }>선임연구원</option>
				         <option value="책임연구원" ${career.position eq '책임연구원'?'selected':'' }>책임연구원</option>
				         <option value="수석연구원" ${career.position eq '수석연구원'?'selected':'' }>수석연구원</option>
				         <option value="연구소장" ${career.position eq '연구소장'?'selected':'' }>연구소장</option>
				      </select>
				      &nbsp;
				      <b>직책</b>
				      <select name="job">
				         <option value="" disabled selected>직급을 선택하세요(선택)</option>
				         <option value="팀원" ${career.job eq '팀원'?'selected':'' }>팀원</option>
				         <option value="팀장" ${career.job eq '팀장'?'selected':'' }>팀장</option>
				         <option value="실장" ${career.job eq '실장'?'selected':'' }>실장</option>
				         <option value="총무" ${career.job eq '총무'?'selected':'' }>총무</option>
				         <option value="지점장" ${career.job eq '지점장'?'selected':'' }>지점장</option>
				         <option value="지사장" ${career.job eq '지사장'?'selected':'' }>지사장</option>
				         <option value="파트장" ${career.job eq '파트장'?'selected':'' }>파트장</option>
				         <option value="그룹장" ${career.job eq '그룹장'?'selected':'' }>그룹장</option>
				         <option value="센터장" ${career.job eq '센터장'?'selected':'' }>센터장</option>
				         <option value="매니저" ${career.job eq '매니저'?'selected':'' }>매니저</option>
				         <option value="본부장" ${career.job eq '본부장'?'selected':'' }>본부장</option>
				         <option value="사업부장" ${career.job eq '사업부장'?'selected':'' }>사업부장</option>
				         <option value="원장" ${career.job eq '원장'?'selected':'' }>원장</option>
				         <option value="국장" ${career.job eq '국장'?'selected':'' }>국장</option>
				      </select>
				   </div>
				</div>
				
				<div class="item">
				   <div class="left">직종(선택)</div>
				   <div class="right">
				      <input type="text" name="occupation" placeholder="직종 입력" value="${career.occupation }">
				   </div>
				</div>
				</c:if>
						</div>
				
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
								<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea1" value='웹 개발자' <%=jobAreaList!=null&&jobAreaList.contains("웹 개발자")?"checked":"" %>/>웹 개발자</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea2" value='서버 개발자'<%=jobAreaList!=null&&jobAreaList.contains("서버 개발자")?"checked":"" %>/>서버 개발자</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea3" value='시스템개발' <%=jobAreaList!=null&&jobAreaList.contains("시스템개발")?"checked":"" %>/>시스템개발</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea4" value='프론트엔드 개발자' <%=jobAreaList!=null&&jobAreaList.contains("프론트엔드 개발자")?"checked":"" %> />프론트엔드 개발자</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea5" value='자바 개발자' <%=jobAreaList!=null&&jobAreaList.contains("자바 개발자")?"checked":"" %>/>자바 개발자</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea6" value='파이썬 개발자' <%=jobAreaList!=null&&jobAreaList.contains("파이썬 개발자")?"checked":"" %>/>파이썬 개발자</label><br>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea7" value='안드로이드 개발자' <%=jobAreaList!=null&&jobAreaList.contains("안드로이드 개발자")?"checked":"" %>/>안드로이드 개발자</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea8" value='IOS개발자' <%=jobAreaList!=null&&jobAreaList.contains("IOS개발자")?"checked":"" %>/>IOS개발자</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea9" value='데이터 엔지니어' <%=jobAreaList!=null&&jobAreaList.contains("시스템,네트워크 관리자")?"checked":"" %>/>데이터 엔지니어</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea10" value='시스템,네트워크 관리자' <%=jobAreaList!=null&&jobAreaList.contains("데이터 사이언티스트")?"checked":"" %>/>시스템,네트워크 관리자</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea11" value='node.js 개발자' <%=jobAreaList!=null&&jobAreaList.contains("node.js 개발자")?"checked":"" %>/>node.js 개발자</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea12" value='php 개발자' <%=jobAreaList!=null&&jobAreaList.contains("php 개발자")?"checked":"" %>/>php 개발자</label><br>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea13" value='DevOps / 시스템 관리자' <%=jobAreaList!=null&&jobAreaList.contains("DevOps / 시스템 관리자")?"checked":"" %>/>DevOps / 시스템 관리자</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea14" value='C,C++개발자' <%=jobAreaList!=null&&jobAreaList.contains("C,C++개발자")?"checked":"" %>/>C,C++개발자</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea15" value='개발 매니저' <%=jobAreaList!=null&&jobAreaList.contains("개발 매니저")?"checked":"" %>/>개발 매니저</label>
					            <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea16" value='데이터 사이언티스트' <%=jobAreaList!=null&&jobAreaList.contains("데이터 사이언티스트")?"checked":"" %>/>데이터 사이언티스트</label>

								
							</div>
						</div>
						
						<div class="item">
							<div class="left">희망업종</div>
							<div class="right">
								<label><input type="checkbox" name="hopeCategory" id="hopeCategory1" value='솔루션·SI·ERP·CRM' <%=categoryList!=null&&categoryList.contains("솔루션·SI·ERP·CRM")?"checked":"" %>/>솔루션·SI·ERP·CRM</label>
								<label><input type="checkbox" name="hopeCategory" id="hopeCategory2" value='웹에이전시 개발' <%=categoryList!=null&&categoryList.contains("웹에이전시 개발")?"checked":"" %>/>웹에이전시 </label>
								<label><input type="checkbox" name="hopeCategory" id="hopeCategory3" value='쇼핑몰·오픈마켓' <%=categoryList!=null&&categoryList.contains("쇼핑몰·오픈마켓")?"checked":"" %>/>쇼핑몰·오픈마켓</label>
								<label><input type="checkbox" name="hopeCategory" id="hopeCategory4" value='포털·인터넷·컨텐츠' <%=categoryList!=null&&categoryList.contains("포털·인터넷·컨텐츠")?"checked":"" %>/>포털·인터넷·컨텐츠</label>
								<label><input type="checkbox" name="hopeCategory" id="hopeCategory5" value='네트워크·통신·모바일' <%=categoryList!=null&&categoryList.contains("네트워크·통신·모바일")?"checked":"" %>/>네트워크·통신·모바일</label><br>
								<label><input type="checkbox" name="hopeCategory" id="hopeCategory6" value='하드웨어·장비' <%=categoryList!=null&&categoryList.contains("하드웨어·장비")?"checked":"" %>/>하드웨어·장비</label>
								<label><input type="checkbox" name="hopeCategory" id="hopeCategory7" value='정보보안·백신' <%=categoryList!=null&&categoryList.contains("정보보안·백신")?"checked":"" %>/>정보보안·백신</label>
								<label><input type="checkbox" name="hopeCategory" id="hopeCategory8" value='IT컨설팅' <%=categoryList!=null&&categoryList.contains("IT컨설팅")?"checked":"" %>/>IT컨설팅</label>
								<label><input type="checkbox" name="hopeCategory" id="hopeCategory9" value='게임' <%=categoryList!=null&&categoryList.contains("게임")?"checked":"" %>/>게임</label>
							</div>
						</div>
				
						<div class="carrerAjaxContainer22"></div>
						<div class="item">
							<p align="center">
								<button type="submit">수정완료</button>
								<button onclick="history.back(-1);">취소</button>
							</p>
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
	
	// function resetHopeArea(){
	// 	$('input[name=hopeArea]').prop("checked",false);
	// }
	// function resetHopeJobArea(){
	// 	$('input[name=hopeJobArea]').prop("checked",false);
	// }
	function selectFinalEdu() {
		var finalEdu = $('[name=finalEdu]').val();
		if(finalEdu!="대학/대학원 이상 졸업"){
			$(".addUnivContainer").empty();
			$(".addUnivContainer").empty();
			$("#addUnivBtn").css("display","none");
		}else{
			$("#addUnivBtn").css("display","inline-block");
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
						$(this).prev().empty();
						$(this).prev().html("대학은 한개 이상 입력하셔야 합니다.");
			    	}
				 })
		    }
		})
	}
	
	 $(".deleteUnivBtn2").click(function(){
		var univ=$(".univ");
		console.log(univ.length);
		if(univ.length>1){
			$(this).parent().parent().parent().empty();
		}else{
			 console.log($(this).prev());
			 $(this).prev().empty();
			 $(this).prev().html("대학은 한개 이상 입력하셔야 합니다.");
		}
		});
   
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
      }else{
         $("#addUnivBtn").css("display","inline-block");
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
                  $(this).prev().empty();
                  $(this).prev().html("대학은 한개 이상 입력하셔야 합니다.");
                }
             })
          }
      })
   }
   
    $(".deleteUnivBtn2").click(function(){
      var univ=$(".univ");
      console.log(univ.length);
      if(univ.length>1){
         $(this).parent().parent().parent().empty();
      }else{
          console.log($(this).prev());
          $(this).prev().empty();
          $(this).prev().html("대학은 한개 이상 입력하셔야 합니다.");
      }
      });
   
   function validate(){
      var finalEdu = $('[name=finalEdu]').val();
      if(finalEdu=="대학/대학원 이상 졸업"&&major){
         var Category=("");
      }
   }

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>