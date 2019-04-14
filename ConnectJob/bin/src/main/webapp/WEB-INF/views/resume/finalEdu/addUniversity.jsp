<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>대학교 정보 입력</h3>

<div class="item">
   <div class="left">대학</div>
   <div class="right">
      <select name="schoolFlag" required>
         <option value="" disabled selected>대학</option>
         <option value="대학교(2,3년)">대학교(2,3년)</option>
         <option value="대학교(4년)">대학교(4년)</option>
         <option value="석사">대학원(석사)</option>
         <option value="박사">대학원(박사)</option>
      </select>
   </div>
</div>

<div class="item">
   <div class="left">학교명</div>
   <div class="right">
      <input type="text" id="schoolName" name="schoolName" placeholder="학교명을 입력하세요" required>
   </div>
</div>

<div class="item">
   <div class="left">전공</div>
   <div class="right">
      <h4 style="display:inline-block">주전공 &nbsp;</h4>
      <input type="text" id="major" name="major" placeholder="전공을 입력하세요" required>
      <button onclick="addMajor()" id="addMajorBtn">전공추가</button>
   </div>
</div>

<div class="item" id="addMajorContainer">
   <div class="left">전공</div>
   <div class="right">
      <select name="secondMajorCategory">
         <option value="" disabled selected>전공구분선택</option>
         <option value="부전공">부전공</option>
         <option value="복수전공">복수전공</option>
         <option value="이중전공">이중전공</option>
      </select>
      <input type="text" id="major2" name="secondMajor" placeholder="전공을 입력하세요">
      <button onclick="deleteMajor2()">삭제</button>
   </div>
</div>


<div class="item">
   <div class="left">재학기간</div>
   <div class="right">
      <!-- <input type="number" name="admissionDate" id="admissionDate"> - <input type="date" name="graduateDate" id="graduateDate"> -->
      <input type='month' name='admissionYM' id="admissionYM" placeholder="입학년월 입력">
	  <input type='month' name='graduationYM' id="graduationYM" placeholder="졸업년월 입력">
		<select name="graduateState" required>
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
      <select name="scoreStandard" required>
         <option value="" disabled selected>학점기준</option>
         <option value="4.0">4.0</option>
         <option value="4.3">4.3</option>
         <option value="4.5">4.5</option>
         <option value="100">100</option>
      </select>
      <button onclick="addUniversity()">대학 학력 추가</button>
   </div>
</div>
<div id="addUniv"></div>


<script>

   $('#addMajorContainer').css("display","none");

   function addMajor() {
      $("#addMajorContainer").css("display","block");
      $("#addMajorBtn").css("display", "none");

   };
   function deleteMajor2() {
      $("#addMajorContainer").css("display", "none");
      $("#addMajorBtn").css("display", "inline-block");
      $("[name=univCategory]").val("");
      $("#major2").val("");
   }
   
   function addUniversity(){
		$.ajax({
			url:"${path}/addUniversity.do",
		    success:function(data){
		    $('#addUniv').html(data);
		   }
		})   
	};
		/* 
	$("#deleteBtn").click(function(){
		$(this).closest("table").css("display","none");
		$(this).closest("table").prev().css("display","none");
	}); */
</script>