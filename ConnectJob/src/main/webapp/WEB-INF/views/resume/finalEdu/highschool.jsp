<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h3>고등학교 정보 입력</h3>

<div class="item">
	<div class="left">학교명</div>
	<div class="right">
		<input type="hidden" name="schoolFlag" value="고등학교">
		<input type="text" id="schoolName" name="schoolName" placeholder="학교명을 입력하세요"  >
		<input type="checkbox" name="schoolName" value="대입 검정고시" id="noEle">대입 검정고시
	</div>
</div>

<div class="item">
	<div class="left">졸업년도</div>
	<div class="right">
		<input type="number" name="graduateYear" id="graduateYear" placeholder="YYYY">
		<select name="graduateState" >
                  <option value="" disabled selected>졸업상태</option>
                  <option value="졸업">졸업</option>
                  <option value="졸업예정">졸업예정</option>
        </select>
	</div>
</div>