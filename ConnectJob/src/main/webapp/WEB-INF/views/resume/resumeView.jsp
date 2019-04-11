<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@ include file="/WEB-INF/views/common/header.jsp" %>


<section>
<div>
	<h2>${resultR.title }</h2>
	<hr/>
</div>
<div>
	<h2>기본 정보</h2>
	<table>
		<tr>
			<th rowspan="5">
				<div style="width:120px; heigth:160px;border:1px solid lightGray">
				<script>console.log("${path }/resources/upload/profile/${img.renamedFileName }");</script>
				<c:if test="${not empty img }">
					<img src="${path }/resources/upload/profile/${img.renamedFileName }" style="width:120px; heigth:160px;" />
				</c:if>
				</div>
				
			</th>
			<td><h2 style="display:inline-block">${resultR.name }</h2></td>
			<td>|<b> ${fn:substring(resultR.birth,0,4)} 년</b> | <b>${resultR.gender eq 'M'? "남":"여" } </b></td>
		</tr>
		<tr>
			<td><i class="fas fa-phone-volume"></i>  휴대폰  </td>
			<td>| ${resultR.phone }</td>
		</tr>
		<tr> 
			<td><i class="fas fa-at"></i>  이메일 </td>
			<td>| ${resultR.email }</td>
		</tr>
		<tr>
			<td><i class="fas fa-graduation-cap"></i>  최종학력  </td>
			<td>| ${resultR.finalEdu }</td>
		</tr>
		<tr>
			<td><i class="fas fa-building"></i>  경력   </td>
			<td>| ${resultR.career }</td>
		</tr>
	</table>
</div>

<div>
	<h2>학력</h2>
	<c:choose >
		<c:when test="${resultR.finalEdu eq '대학/대학원 이상 졸업'?true:false }">
			<c:forEach var="u" items="${univList}" varStatus="status">
				<table>
					<tr>
						<td rowspan="3"> ${u.admissionYM } ~ ${u.graduationYM }</td>
						<td><b>${u.schoolName }</b> | ${u.schoolFlag } | ${u.graduateState }</td>
					</tr>
					<tr>
						<td>전공 | ${u.major}
							<c:if test="${u.secondMajor eq '해당사항 없음'?false:true }">
								${u.secondMajorCategory } | ${u.secondMajor }
							</c:if>
						</td>
					</tr>
					<tr>
						<td>학점    |  ${u.score } / ${u.scoreStandard }</td>
					</tr>
				</table>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<table>
				<tr>
					<th>학교 구분</th>
					<td><b>${finalEdu.schoolFlag }</b></td>
				</tr>
				<tr>
					<th>학교 명</th>
					<td>${finalEdu.schoolName}</td>
				</tr>
				<tr>
					<th>졸업여부</th>
					<th> ${finalEdu.graduateState }</th>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>

</div>
<c:if test="${resultR.career eq '경력'?true:false}">
	<div>
		<h2>경력</h2>
		<table>
			<tr>
				<td rowspan="4"> 
					${career.joinDate} ~ ${career.resignDate}
				</td>
				<td><b>${career.careerCName }</b> | ${career.companyFlag }</td>
			</tr>
			<tr>
				<td>직급    |  ${career.position }</td>
			</tr>
			<tr>
				<td>직책  |  ${career.job }</td>
			</tr>
			<tr>
				<td>직종    |  ${career.occupation }</td>
			</tr>
		</table>
	</div>
</c:if>

<div>
	<h2>희망근무조건</h2>
	<table>
		<tr>
			<th>희망 연봉</th>
			<td>| ${resultR.hopeSalary }</td>
			<td></td>
		</tr>
		<tr>
			<th>희망 지역</th>
			<td>
				<c:forEach items="${resultR.hopeArea}" var="area">
					| ${area }
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>근무형태</th>
			<td>
				| ${resultR.hopePosition}
			</td>
		</tr>
		<tr>
			<th>희망 직종</th>
			<td>
				<c:forEach items="${resultR.hopeJobArea}" var="ja">
					| ${ja}
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>희망 업종</th>
			<td>
				<c:forEach items="${resultR.hopeCategory}" var="c">
					| ${c}
				</c:forEach>
			</td>
		</tr>
	</table>
</div>

	<button onclick="location='${path}/resume/updateResume?resumeNo=${resultR.resumeNo}'">수정</button>
	<button onclick="location='${path}/resume/deleteResume?resumeNo=${resultR.resumeNo}'">삭제</button>
	
	<div style="padding-top:100px;">
		<h3>위의 모든 기재사항은 사실과 다름없음을 확인합니다.</h3>
		<h4>작성자 : ${resultR.name }</h4>
		<p style="color:gray;">
			이 이력서는<fmt:formatDate value="${r.creationDate}" pattern="yyyy년 MM월 dd일"/>에 최종 업데이트된 이력서 입니다.<br/>
			위조된 문서를 등록하여 취업활동에 이용 시 법적 책임을 지게 될 수있습니다.<br/>
			ConnectJob은 구직자가 등록한 문서에 대해 보증하거나 별도의 책임을 지지 않으며<br/>
			첨부된 문서를 신뢰하여 발생한 법적 분쟁에 책임을 지지 않습니다.<br/>
		</p>
	</div>
	
</section>
<script>

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>