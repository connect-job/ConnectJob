<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h3>고등학교 정보 입력</h3>
	<table>
		<tr>
			<th>학교명</th>
			<td>
				<input type="text" name="schoolName" id="schoolName"required>
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