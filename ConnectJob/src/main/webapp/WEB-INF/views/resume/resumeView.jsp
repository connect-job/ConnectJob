<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<%@ include file="/WEB-INF/views/common/header.jsp" %>


<section>
   <div id="resume-container">
      <div class="resume-top">이력서 제목 : ${resultR.title }</div>

      <div class="sub-title">기본 정보</div>

      <div class="view-content">
         <div class="view-top">
            <div class="top-left">
               <c:if test="${not empty img }">
                  <img src="${path }/resources/upload/profile/${img.renamedFileName }"
                     style="width:120px; height:160px;" />
               </c:if>
            </div>
            <div class="top-right">
               <div class="right-item">
                  <div class="item-left">성명</div>
                  <div class="item-right">${resultR.name }</div>
               </div>
               <div class="right-item">
                  <div class="item-left">생년월일</div>
                  <div class="item-right">${fn:substring(resultR.birth,0,4)} 년</div>
               </div>
               <div class="right-item">
                  <div class="item-left">성별</div>
                  <div class="item-right">${resultR.gender eq 'M'? "남":"여" }</div>
               </div>
               <div class="right-item">
                  <div class="item-left">휴대폰</div>
                  <div class="item-right">${resultR.phone }</div>
               </div>
               <div class="right-item">
                  <div class="item-left">이메일</div>
                  <div class="item-right">${resultR.email }</div>
               </div>
               <div class="right-item">
                  <div class="item-left">최종학력</div>
                  <div class="item-right">${resultR.finalEdu }</div>
               </div>
               <div class="right-item">
                  <div class="item-left">경력</div>
                  <div class="item-right">${resultR.career }</div>
               </div>
            </div>
         </div>
      </div>

      <div class="sub-title">학력</div>

      <div class="view-content">
         <div class="view-top">
            <div class="top-left">
               <c:choose>
                   <c:when test="${resultR.finalEdu eq '대학/대학원 이상 졸업'?true:false }">
                     <c:forEach var="u" items="${univList}" varStatus="status">
                        ${u.admissionYM } ~ ${u.graduationYM }
                     </c:forEach>
                  </c:when>
                  <c:otherwise>
                     ${finalEdu.schoolFlag }
                  </c:otherwise>
               </c:choose>
            </div>
            <div class="top-right">
            <c:choose>
               <c:when test="${resultR.finalEdu eq '대학/대학원 이상 졸업'?true:false }">
                   <c:forEach var="u" items="${univList}" varStatus="status">
                     <div class="right-item">
                        <div class="item-left">학교</div>
                        <div class="item-right">${u.schoolName } | ${u.schoolFlag }</div>
                     </div>
                     <div class="right-item">
                        <div class="item-left">졸업상태</div>
                        <div class="item-right">${u.graduateState }</div>
                     </div>
                     <div class="right-item">
                        <div class="item-left">전공</div>
                        <div class="item-right">${u.major}
                           <c:if test="${u.secondMajor eq '해당사항 없음'?false:true }">
                               | ${u.secondMajorCategory } | ${u.secondMajor }
                           </c:if>
                        </div>
                     </div>
                     <div class="right-item">
                        <div class="item-left">학점</div>
                        <div class="item-right">${u.score } / ${u.scoreStandard }</div>
                     </div>
                     </c:forEach>
                   </c:when>
                   <c:otherwise>
                      <div class="right-item">
                        <div class="item-left">학교명</div>
                        <div class="item-right">${finalEdu.schoolName}</div>
                     </div>
                     <div class="right-item">
                        <div class="item-left">졸업년도</div>
                        <div class="item-right">${finalEdu.graduateYear }</div>
                     </div>
                     <div class="right-item">
                        <div class="item-left">졸업상태</div>
                        <div class="item-right">${finalEdu.graduateState }</div>
                     </div>
                   </c:otherwise>
                   </c:choose>
               </div>   
            </div>
         </div>
      <c:if test="${resultR.career eq '경력'?true:false}">
         <div class="sub-title">경력</div>
         
         <div class="view-content">   
               <div class="view-top">
                  <div class="top-left">${career.joinDate} ~ ${career.resignDate}</div>
                  <div class="top-right">
                     <div class="right-item">
                        <div class="item-left">회사명</div>
                        <div class="item-right">${career.careerCName }</div>
                     </div>
                     <div class="right-item">
                        <div class="item-left">재직상태</div>
                        <div class="item-right">${career.companyFlag }</div>
                     </div>
                     <div class="right-item">
                        <div class="item-left">직급</div>
                        <div class="item-right">${career.position }</div>
                     </div>
                     <div class="right-item">
                        <div class="item-left">직책</div>
                        <div class="item-right">${career.job }</div>
                     </div>
                     <div class="right-item">
                        <div class="item-left">직종</div>
                        <div class="item-right">${career.occupation }</div>
                     </div>
                  </div>
               </div>
         </div>
      </c:if>


      

      <div class="sub-title">희망근무조건</div>

      <div class="view-content">
         <div class="view-top">
            <div class="top-left"></div>
            <div class="top-right">
               <div class="right-item">
                  <div class="item-left">희망연봉</div>
                  <div class="item-right">${resultR.hopeSalary }</div>
               </div>
               <div class="right-item">
                  <div class="item-left">희망지역</div>
                  <div class="item-right">
                     <c:forEach items="${resultR.hopeArea}" var="area">
                        ${area }
                     </c:forEach>
                  </div>
               </div>
               <div class="right-item">
                  <div class="item-left">근무형태</div>
                  <div class="item-right">${resultR.hopePosition}</div>
               </div>
               <div class="right-item">
                  <div class="item-left">희망직종</div>
                  <div class="item-right">
                     <c:forEach items="${resultR.hopeJobArea}" var="ja">
                        ${ja}
                     </c:forEach>
                  </div>
               </div>
               <div class="right-item">
                  <div class="item-left">희망업종</div>
                  <div class="item-right">
                     <c:forEach items="${resultR.hopeCategory}" var="c">
                        ${c}
                     </c:forEach>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
      <br><Br>
      <button onclick="location='${path}/resume/updateResume?resumeNo=${resultR.resumeNo}'">수정</button>
      <button onclick="location='${path}/resume/deleteResume?resumeNo=${resultR.resumeNo}'">삭제</button>
      <br><Br>
      <div>
         <h3>위의 모든 기재사항은 사실과 다름없음을 확인합니다.</h3>
         <h4>작성자 : ${resultR.name }</h4>
         <p style="color:gray;">
            이 이력서는
            <fmt:formatDate value="${resultR.creationDate}" pattern="yyyy년 MM월 dd일" />에 최종 업데이트된 이력서 입니다.<br />
            위조된 문서를 등록하여 취업활동에 이용 시 법적 책임을 지게 될 수있습니다.<br />
            ConnectJob은 구직자가 등록한 문서에 대해 보증하거나 별도의 책임을 지지 않으며<br />
            첨부된 문서를 신뢰하여 발생한 법적 분쟁에 책임을 지지 않습니다.<br />
         </p>
      </div>

</section>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>