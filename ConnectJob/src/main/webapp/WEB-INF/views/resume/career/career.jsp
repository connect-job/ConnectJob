<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<div class="item">
   <div class="left">회사명</div>
   <div class="right">
      <input type="text" name="careerCName" placeholder="회사명 입력" required>
   </div>
</div>

<div class="item">
   <div class="left">재직기간</div>
   <div class="right">
      <input type="date" id="joinDate" name="joinDate" required> - <input type="date" name="resignDate" id="resignDate" required>
      <select name="companyFlag" required>
         <option value="퇴사">퇴사</option>
         <option value="재직">재직중</option>
      </select>
   </div>
</div>

<div class="item">
   <div class="left">직급/직책</div>
   <div class="right">
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
         <option value="팀원">팀원</option>
         <option value="팀장">팀장</option>
         <option value="실장">실장</option>
         <option value="총무">총무</option>
         <option value="지점장">지점장</option>
         <option value="지사장">지사장</option>
         <option value="파트장">파트장</option>
         <option value="그룹장">그룹장</option>
         <option value="센터장">센터장</option>
         <option value="매니저">매니저</option>
         <option value="본부장">본부장</option>
         <option value="사업부장">사업부장</option>
         <option value="원장">원장</option>
         <option value="국장">국장</option>
      </select>
   </div>
</div>

<div class="item">
   <div class="left">직종(선택)</div>
   <div class="right">
      <input type="text" name="occupation" placeholder="직종 입력">
   </div>
</div>