<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>중학교 정보 입력</h3>

<div class="item">
	<div class="left">학교명</div>
	<div class="right">
		<input type="text" id="schoolName" required>
		<input type="checkbox" id="noEle">고입 검정고시
	</div>
</div>

<div class="item">
	<div class="left">지역</div>
	<div class="right">
		<select name="area" required>
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
	</div>
</div>

<div class="item">
	<div class="left">재학기간</div>
	<div class="right">
		<input type="date" id="admissionDate"> - <input type="date" id="graduateDate">
	</div>
</div>