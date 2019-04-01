<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
   .continer {
      display:inline-block;
      width:990px;
   }
   th{
      width:200px;
   }
</style>
<div class="container">
   <h3>고등학교 정보 입력</h3>
   <table>
      <tr>
         <th>학교명</th>
         <td>
            <input type="text" id="schoolName" name="schoolName" placeholder="학교명을 입력하세요" required>
            <input type="checkbox" id="noHigh">대입 검정고시
         </td>
         
      </tr>
      <tr>
         <th>계열</th>
         <td>
         <select name="highAffiliation" required>
                  <option value="" disabled selected>계열을 선택하세요</option>
                  <option value="문과">문과계열</option>
                  <option value="이과">이과계열</option>
                  <option value="전문계">전문(실업)계</option>
                  <option value="예체능">예체능계</option>
                  <option value="특성화">특성화/마이스터고</option>
                  <option value="특목고">특수목적고</option>
            </select>
         </td>
         
      </tr>
      <tr>
         <th>지역</th>
         <td>
         <select name="schoolArea" required>
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
         <th>재학기간</th>
         <td><input type="date" name="admissionDate" id="admissionDate"> - <input type="date" name="graduateDate" id="graduateDate"></td>
      </tr>
   </table>
</div>
<div class="univ-container">
   <h3>대학교 정보 입력</h3>
   <table>
      <tr>
         <th>대학</th>
         <td>
            <select name="univCategory" required>
                  <option value="" disabled selected>대학</option>
                  <option value="전문대">대학교(2,3년)</option>
                  <option value="4년">대학교(4년)</option>
                  <option value="석사">대학원(석사)</option>
                  <option value="박사">대학원(박사)</option>
            </select>
         </td>
      </tr>
      <tr>
         <th>학교명</th>
         <td><input type="text" name="schoolName" id="schoolName" placeholder="학교명을 입력하세요" required></td>
      </tr>
      <tr>
         <th>전공</th>
         <td><h4 style="display:inline-block">주전공</h4>
            <input type="text" id="major" name="major" placeholder="전공을 입력하세요"required>
            <button onclick="addMajor()" id="addMajorBtn" >전공추가</button>
         </td>
      </tr>
      <tr id="addMajorContainer" style="display:none" >
         <th>전공 2</th>
         <td >
         <select name="major2Category" id="major2Category">
            <option value="" disabled selected>전공구분선택</option>
            <option value="부전공">부전공</option>
            <option value="복수전공">복수전공</option>
            <option value="이중전공">이중전공</option>
         </select>
         <input type="text" id="major2" name="major2" placeholder="전공을 입력하세요">
         <button onclick="deleteMajor2()">삭제</button>
         </td>
      </tr>
      <tr>
         <th>지역</th>
         <td>
         <select name="schoolArea" required>
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
         <th>재학기간</th>
         <td><input type="date" name="admissionDate" id="admissionDate"> - <input type="date" name="graduateDate" id="graduateDate"></td>
      </tr>
      <tr>
         <th>학점</th>
         <td>
            <input type="number" name="score" id="score">
            <select name="scoreStandard" required>
               <option value="" disabled selected>기준학점을 선택하세요</option>
               <option value="4.0">4.0</option>
               <option value="4.3">4.3</option>
               <option value="4.5">4.5</option>
               <option value="5.0">5.0</option>
               <option value="7.0">7.0</option>
               <option value="100">100</option>
            </select>
         </td>
      </tr>
      <tr>
      	<th>.</th>
      	<td><button onclick="addUniversity()">대학 학력 추가</button></td>
      </tr>
   </table>
   <div id="addUnivContainer"></div>
</div>
<script>
function addUniversity(){
	$.ajax({
		url:"${path}/addUniversity.do",
	    success:function(data){
	    $('#addUnivContainer').html(data);
	   }
	})   
};
function addMajor(){
   $("#addMajorContainer").removeAttr("style");
   $("#addMajorBtn").css("display","none");
   
};
function deleteMajor2(){
	$("#major2Category").val("");
	$("#major2").val("");
	console.log("지워졌는지 테스트 : " $("#major2Category").val()+" : "+$("#major2"));
   $("#addMajorContainer").css("display","none");
   $("#addMajorBtn").css("display","inline-block");
}
</script>