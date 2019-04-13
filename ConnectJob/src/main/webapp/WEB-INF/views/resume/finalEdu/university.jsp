<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="univ">
<h3>대학교 정보 입력</h3>

<div class="item">
   <div class="left">대학</div>
   <div class="right">
      <select name="schoolFlag" >
         <option value="" disabled selected>대학</option>
         <option value="대학교(2,3년)">대학교(2,3년)</option>
         <option value="대학교(4년)">대학교(4년)</option>
         <option value="석사">대학원(석사)</option>
         <option value="박사">대학원(박사)</option>
      </select>
      <div class="checkMsg"></div>
      <button type="button" class="deleteUnivBtn">대학 학력 삭제</button>
   </div>
</div>

<div class="item">
   <div class="left">학교명</div>
   <div class="right">
      <input type="text" id="schoolName" name="schoolName" placeholder="학교명을 입력하세요" >
   </div>
</div>

<div class="item">
   <div class="left">전공</div>
   <div class="right">
      <input type="text" id="major" name="major" placeholder="전공을 입력하세요" >
      <!-- <button onclick="addMajor()" id="addMajorBtn">전공추가</button> -->
   </div>
</div>

<div class="item" id="addMajorContainer">
   <div class="left">전공2</div>
   <div class="right">
      <select name="secondMajorCategory"  >
         <option value="" disabled selected>전공구분선택</option>
         <option value="해당사항 없음">해당사항 없음</option>
         <option value="부전공">부전공</option>
         <option value="복수전공">복수전공</option>
         <option value="이중전공">이중전공</option>
      </select>
      <input type="text" id="major2" name="secondMajor" placeholder="전공을 입력하세요">
   </div>
</div>


<div class="item">
   <div class="left">재학기간</div>
   <div class="right">
      <!-- <input type="number" name="admissionDate" id="admissionDate"> - <input type="date" name="graduateDate" id="graduateDate"> -->
      <input type='month' name='admissionYM' id="admissionYM" placeholder="입학년월 입력">
	  <input type='month' name='graduationYM' id="graduationYM" placeholder="졸업년월 입력">
		<select name="graduateState" >
        	<option value="" disabled selected>졸업상태</option>
            <option value="졸업">졸업</option>
            <option value="졸업예정">졸업예정</option>
            <option value="수료">수료</option>
            <option value="휴학">휴학</option>
            <option value="중퇴">중퇴</option>
        </select>
   </div>
</div>
<div class="item">
   <div class="left">학점</div>
   <div class="right">
      <input type="text" id="score" name="score"> /
      <select name="scoreStandard" >
         <option value="" disabled selected>학점기준</option>
         <option value="4.0">4.0</option>
         <option value="4.3">4.3</option>
         <option value="4.5">4.5</option>
         <option value="100">100</option>
      </select>
   </div>
</div>
</div>
<script>
$("[name=secondMajorCategory]").change(function(){
	console.log($(this).val());
	if($(this).val()=="해당사항 없음"){
		$(this).next().val('해당사항 없음');
		$(this).next().attr("readonly",true); 
		$(this).next().css("background-color","rgb(241,241,241)");
		$(this).next().css("color","gray");
	}else{
		$(this).next().val('');
		$(this).next().attr("readonly",false); 
		$(this).next().css("background-color","white");
		$(this).next().css("color","black");
	}
	
});
</script>
