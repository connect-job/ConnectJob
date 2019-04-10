<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<h3>고등학교 정보 입력</h3>

<div class="item">
	<div class="left">학교명</div>
	<div class="right">
		<input type="text" id="schoolName" required>
		<input type="checkbox" id="noEle">대입 검정고시
	</div>
</div>

<div class="item">
	<div class="left">계열</div>
	<div class="right">
		<select name="affiliation" required>
			<option value="" disabled selected>계열을 선택하세요</option>
			<option value="문과">문과계열</option>
			<option value="이과">이과계열</option>
			<option value="전문계">전문(실업)계</option>
			<option value="예체능">예체능계</option>
			<option value="특성화">특성화/마이스터고</option>
			<option value="특목고">특수목적고</option>
		</select>
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

<h3>대학교 정보 입력</h3>

<div class="item">
	<div class="left">대학</div>
	<div class="right">
		<select name="univCategory" required>
			<option value="" disabled selected>대학</option>
			<option value="전문대">대학교(2,3년)</option>
			<option value="4년">대학교(4년)</option>
			<option value="석사">대학원(석사)</option>
			<option value="박사">대학원(박사)</option>
		</select>
	</div>
</div>

<div class="item">
	<div class="left">학교명</div>
	<div class="right">
		<input type="text" id="schoolName" required>
	</div>
</div>

<div class="item">
	<div class="left">전공</div>
	<div class="right">
		<input type="text" id="major" value="주전공" readOnly />

		<input type="text" id="major" placeholder="전공을 입력하세요" required>
		<button onclick="addMajor()" id="addMajorBtn">전공추가</button>
	</div>
</div>

<div class="item" id="addMajorContainer">
	<div class="left">전공</div>
	<div class="right">
		<input type="text" id="major" value="주전공" readOnly />
		<select name="univCategory" required>
			<option value="" disabled selected>전공구분선택</option>
			<option value="전문대">부전공</option>
			<option value="4년">복수전공</option>
			<option value="석사">이중전공</option>
		</select>
		<input type="text" id="major2" placeholder="전공을 입력하세요" required>
		<button onclick="deleteMajor2()">삭제</button>
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


<script>
	$('#addMajorContainer').css("display","none");

	function addMajor() {
		$("#addMajorContainer").css("display","block");
		$("#addMajorBtn").css("display", "none");

	};
	function deleteMajor2() {
		$("#addMajorContainer").css("display", "none");
		$("#addMajorBtn").css("display", "inline-block");
	}
</script>