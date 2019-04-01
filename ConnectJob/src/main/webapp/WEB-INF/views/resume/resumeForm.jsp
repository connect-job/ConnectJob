<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
   section{
      width:100%;
      text-align:center;
   }
   section>div{
      width:990px;
      display:inline-block;
   }
</style>
<section>
<form name="resumeRegistForm" action="${path}/resume/resumeRegistEnd.do" method="post"">
<div>
<table>
<tr>
	<th>이력서 제목</th>
	<td>
	<input type="text" id="title" name="title" placeholder="이력서 제목을 입력하세요" required/>
	<select name="isPublic" id="isPublic" required>
            <option value="" disabled selected>공개여부를 선택하세요</option>
            <option value="true">공개</option>
            <option value="false">비공개</option>
      </select>
	</td>
</tr>
</table>
<h2>기본정보(필수)</h2>
<table>
   <tr>
      <th>이름</th>
      <td><input type="text" id="name" name="name" placeholder="이름을 입력하세요" required ></td>
   </tr>
   <tr>
      <th>생년월일</th>
      <td><input type="text" id="birth" name="birth" placeholder="YYYYMMDD" required ></td>
      <td>
      <select name="gender" id="gender" required>
            <option value="" disabled selected>성별</option>
            <option value="M">남</option>
            <option value="F">여</option>
      </select>
      </td>
   </tr>
   <tr>
      <th>이메일</th>
      <td><input type="email" id="email" name="email" placeholder="example@connectjob.com" ></td>
   </tr>
   <tr>
      <th>핸드폰</th>
      <td><input type="text" id="phone" name="phone" maxlength="11" placeholder="-을 제외하고 작성"></td>
   </tr>
</table>
</div>
<br>
<div>
   <h2>학력정보(필수)</h2>
   <table>
      <tr>
         <th>최종 학력정보</th>
         <td>
         <select name="finalEdu" id="finalEdu" onchange="selectFinalEdu()"required>
               <option value="" disabled selected>최종학력을 선택하세요</option>
               <option value="학교">학교</option>
               <option value="초졸">초등학교 졸업</option>
               <option value="중졸">중학교 졸업</option>
               <option value="고졸">고등학교 졸업</option>
               <option value="대졸">대학/대학원 이상 졸업</option>
         </select>
         </td>
      </tr>
   </table>
   <div class="finalEduAjaxContainer"></div>
</div>
<br>
<div>
   <h2>경력정보(필수)</h2>
   <table>
      <tr>
         <th>경력정보</th>
         <td>
         <select name="career" id="career" onchange="selectCareer()" required>
               <option value="" disabled selected>경력을 선택하세요</option>
               <option value="신입">신입</option>
               <option value="경력">경력</option>
         </select>
         </td>
      </tr>
   </table>
   <div class="carrerAjaxContainer"></div>
</div>
<br>
<div>
   <h2>희망 근무조건(필수)</h2>
      <table>
         <tr>
            <th>근무형태</th>
            <td>
               <select name="hopePosition" id="hopePosition" required>
                     <option value="" disabled selected>근무형태을 선택하세요</option>
                     <option value="정규직">정규직</option>
                     <option value="교육생">교육생</option>
                     <option value="별정직">별정직</option>
                     <option value="파트">파트</option>
                     <option value="전임">전임</option>
                     <option value="계약직">계약직</option>
                     <option value="병역특례">병역특례</option>
                     <option value="인턴직">인턴직</option>
                     <option value="아르바이트">아르바이트</option>
                     <option value="파견직">파견직</option>
                     <option value="해외취업">해외취업</option>
                     <option value="위촉직">위촉직</option>
                     <option value="프리랜서">프리랜서</option>
               </select>
            </td>
         </tr>
         <tr>
            <th>희망연봉</th>
            <td>
            <select name="hopeSalary" id="hopeSalary" required>
                  <option value="" disabled selected>희망연봉을 선택하세요</option>
                  <option value="회사내규에 따름">회사내규에 따름</option>
                  <option value="상의 후 결정">상의 후 결정</option>
                  <option value="2000만원 이하">2,000만원 이하</option>
                  <option value="2,000~2,200만원">2,000~2,200만원</option>
                  <option value="2,200~2,400만원">2,200~2,400만원</option>
                  <option value="2,400~2,600만원">2,400~2,600만원</option>
                  <option value="2,600~2,800만원">2,600~2,800만원</option>
                  <option value="2,800~3,000만원">2,800~3,000만원</option>
                  <option value="3,000~3,200만원">3,000~3,200만원</option>
                  <option value="3,200~3,400만원">3,200~3,400만원</option>
                  <option value="3,400~3,600만원">3,400~3,600만원</option>
                  <option value="3,600~3,800만원">3,600~3,800만원</option>
                  <option value="3,800~4,000만원">3,800~4,000만원</option>
                  <option value="4000만원 이상">4000만원 이상</option>
            </select>
            </td>
         </tr>
         <tr>
            <th>희망지역</th>
            <td>
            <select name="hopeArea" required>
                  <option value="" disabled selected>지역을 선택하세요</option>
                  <option value="서울">서울</option>
                  <option value="경기">경기</option>
                  <option value="광주">광주</option>
                  <option value="대구">대구</option>
                  <option value="대전">대전</option>
                  <option value="부산">부산</option>
                  <option value="울산">울산</option>
                  <option value="인천">인천</option>
                  <option value="강원">강원</option>
                  <option value="경남">경남</option>
                  <option value="경북">경북</option>
                  <option value="전남">전남</option>
                  <option value="전북">전북</option>
                  <option value="충북">충북</option>
                  <option value="충남">충남</option>
                  <option value="제주">제주</option>
                  <option value="전국">전국</option>
                  <option value="세종">세종</option>
                  <option value="해외">해외</option>
            </select>
            </td>
         </tr>
         <tr>
            <th>희망직종</th>
            <td>
               <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea1" value='웹개발'/>웹개발</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea2" value='응용프로그램 개발' />응용프로그램 개발</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea3" value='시스템개발'/>시스템개발</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea4" value='서버·네트워크·보안' />서버·네트워크·보안</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea5" value='ERP·시스템분석·설계'/>ERP·시스템분석·설계</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea6" value='데이터베이스·DBA' />데이터베이스·DBA</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea7" value='퍼블리싱·UI개발'/>퍼블리싱·UI개발</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea8" value='웹디자인' />웹디자인</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea9" value='하드웨어·소프트웨어'/>하드웨어·소프트웨어</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea10" value='통신·모바일' />통신·모바일</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea11" value='웹기획·PM'/>웹기획·PM</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea12" value='웹마스터·QA·테스터' />웹마스터·QA·테스터</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea13" value='컨텐츠·사이트운영'/>컨텐츠·사이트운영</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea14" value='게임' />게임</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea15" value='IT/디자인·컴퓨터교육'/>IT/디자인·컴퓨터교육</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea16" value='동영상·편집·코덱' />동영상·편집·코덱</label>
                 <label><input type="checkbox" name="hopeJobArea" id="hopeJobArea17" value='인공지능(AI)·빅데이터' />인공지능(AI)·빅데이터</label>
                 <button id="resetBtn">초기화</button>
            </td>
         </tr>
         <tr>
            <th>희망업종</th>
            <td>
               <label><input type="checkbox" name="hopeCategory" id="hopeCategory1" value='웹개발'/>솔루션·SI·ERP·CRM</label>
                 <label><input type="checkbox" name="hopeCategory" id="hopeCategory2" value='응용프로그램 개발' />웹에이전시</label>
                 <label><input type="checkbox" name="hopeCategory" id="hopeCategory3" value='시스템개발'/>쇼핑몰·오픈마켓</label>
                 <label><input type="checkbox" name="hopeCategory" id="hopeCategory4" value='서버·네트워크·보안' />포털·인터넷·컨텐츠</label>
                 <label><input type="checkbox" name="hopeCategory" id="hopeCategory5" value='ERP·시스템분석·설계'/>네트워크·통신·모바일</label>
                 <label><input type="checkbox" name="hopeCategory" id="hopeCategory6" value='데이터베이스·DBA' />하드웨어·장비</label>
                 <label><input type="checkbox" name="hopeCategory" id="hopeCategory7" value='퍼블리싱·UI개발'/>정보보안·백신</label>
                 <label><input type="checkbox" name="hopeCategory" id="hopeCategory8" value='웹디자인' />IT컨설팅</label>
                 <label><input type="checkbox" name="hopeCategory" id="hopeCategory9" value='하드웨어·소프트웨어'/>게임</label>
                 <button id="resetBtn2">초기화</button>
            </td>
         </tr>
      </table>
      <div class="carrerAjaxContainer22"></div>   
</div>
 <input type="submit" value="등록"/>
</form>
</section>
<script>
   $("#resetBtn").click(function(){
      $('input[name=hopeArea]').prop("checked",false);
   });
   $("#resetBtn2").click(function(){
      $('input[name=hopeCategory]').prop("checked",false);
   });
   function selectFinalEdu(){
      var finalEdu=$('[name=finalEdu]').val();
      $.ajax({
         url:"${path}/selectFinalEdu.do",
         data:{"finalEdu":finalEdu},
         success:function(data){
            $('.finalEduAjaxContainer').html(data);
         }
      })
      
   };
   function selectCareer(){
      var career=$('[name=career]').val();
      $.ajax({
         url:"${path}/selectCareer.do",
         data:{"career":career},
         success:function(data){
            $('.carrerAjaxContainer').html(data);
         }
      })
   }
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>