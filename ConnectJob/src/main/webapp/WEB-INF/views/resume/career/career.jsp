<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
<table>
	<tr>
		<th>회사명</th>
		<td><input type="text" name="careerCName" placeholder="회사명 입력" required></td>
	</tr>
	<tr>
		<th>재직기간</th>
		<td><input type="date" name="joinDate" id="joinDate"> - <input type="date" name="resignDate" id="resignDate">
		<select name="companyFlag" required>
						<option value="퇴사">퇴사</option>
						<option value="재직">재직중</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>
			직급/직책
		</th>
		<td>
			&nbsp;
			<b>직급</b>
			<select name="position" required>
						<option value="" disabled selected>직급을 선택하세요(필수)</option>
						<option value="임시직/프리랜서">임시직/프리랜서</option>
						<option value="인턴/사원">인턴/사원</option>
						<option value="사원">사원</option>
						<option value="주임">주임</option>
						<option value="계장">계장</option>
						<option value="대리">대리</option>
						<option value="과장">과장</option>
						<option value="차장">차장</option>
						<option value="부장">부장</option>
						<option value="감사">감사</option>
						<option value="이사">이사</option>
						<option value="상무">상무</option>
						<option value="전무">전무</option>
						<option value="부사장">부사장</option>
						<option value="사장">사장</option>
						<option value="임원">임원</option>
						<option value="연구원">연구원</option>
						<option value="주임연구원">주임연구원</option>
						<option value="선임연구원">선임연구원</option>
						<option value="책임연구원">책임연구원</option>
						<option value="수석연구원">수석연구원</option>
						<option value="연구소장">연구소장</option>
				</select>
				&nbsp;
				<b>직책</b>
				<select name="job">
						<option value="" disabled selected>직급을 선택하세요(선택)</option>
						<option value="팀원">인턴/사원</option>
						<option value="팀장">사원</option>
						<option value="실장">주임</option>
						<option value="총무">계장</option>
						<option value="지점장">대리</option>
						<option value="지사장">과장</option>
						<option value="파트장">차장</option>
						<option value="그룹장">부장</option>
						<option value="센터장">감사</option>
						<option value="매니저">이사</option>
						<option value="본부장">상무</option>
						<option value="사업부장">전무</option>
						<option value="원장">부사장</option>
						<option value="국장">사장</option>
				</select>
		</td>
	</tr>
	<tr>
		<th>직종</th>
		<td><input type="text" name="occupation" placeholder="직종 입력" required></td>
	</tr>
</table>
</div>


<script>

</script>
