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
<div>
<h2>기본정보(필수)</h2>
<table>
	<tr>
		<th>이름</th>
		<td><input type="text" id="name" required ></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><input type="text" id="birth" placeholder="YYYYMMDD" required ></td>
		<td>
		<select name="gender" required>
				<option value="" disabled selected>성별</option>
				<option value="M">남</option>
				<option value="F">여</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="email" id="email" placeholder="example@connectjob.com" ></td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td><input type="text" id="phone" placeholder="-을 제외하고 작성"></td>
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
			<select name="finalEdu" onchange="selectFinalEdu()"required>
					<option value="" disabled selected>최종학력을 선택하세요</option>
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
			<select name="career" onchange="selectCareer()" required>
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
					<select name="hopePosition" required>
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
				<select name="hopeSalary" required>
						<option value="" disabled selected>희망연봉을 선택하세요</option>
						<option value="회사내규">회사내규에 따름</option>
						<option value="2000">2,000만원 이하</option>
						<option value="2200">2,000~2,200만원</option>
						<option value="2400">2,200~2,400만원</option>
						<option value="2600">2,400~2,600만원</option>
						<option value="2800">2,600~3,800만원</option>
						<option value="3000">2,800~3,000만원</option>
						<option value="3200">3,000~3,200만원</option>
						<option value="3400">3,200~3,400만원</option>
						<option value="3600">3,400~3,600만원</option>
						<option value="3800">3,600~3,800만원</option>
						<option value="4000">3,800~4,000만원</option>
						<option value="5000">4000만원 이상</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>희망지역</th>
				<td>수정필요~~</td>
			</tr>
			<tr>
				<th>희망직종</th>
				<td>
					<label><input type="checkbox" name="hopeArea" id="ho1" value='웹개발'/>웹개발</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='응용프로그램 개발' />응용프로그램 개발</label>
			        <label><input type="checkbox" name="hopeArea" id="ho1" value='시스템개발'/>시스템개발</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='서버·네트워크·보안' />서버·네트워크·보안</label>
			        <label><input type="checkbox" name="hopeArea" id="ho1" value='ERP·시스템분석·설계'/>ERP·시스템분석·설계</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='데이터베이스·DBA' />데이터베이스·DBA</label>
			        <label><input type="checkbox" name="hopeArea" id="ho1" value='퍼블리싱·UI개발'/>퍼블리싱·UI개발</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='웹디자인' />웹디자인</label>
			        <label><input type="checkbox" name="hopeArea" id="ho1" value='하드웨어·소프트웨어'/>하드웨어·소프트웨어</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='통신·모바일' />통신·모바일</label>
			        <label><input type="checkbox" name="hopeArea" id="ho1" value='웹기획·PM'/>웹기획·PM</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='웹마스터·QA·테스터' />웹마스터·QA·테스터</label>
			        <label><input type="checkbox" name="hopeArea" id="ho1" value='컨텐츠·사이트운영'/>컨텐츠·사이트운영</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='게임' />게임</label>
			        <label><input type="checkbox" name="hopeArea" id="ho1" value='IT/디자인·컴퓨터교육'/>IT/디자인·컴퓨터교육</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='동영상·편집·코덱' />동영상·편집·코덱</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='인공지능(AI)·빅데이터' />인공지능(AI)·빅데이터</label>
				</td>
			</tr>
			<tr>
				<th>희망업종</th>
				<td>
					<label><input type="checkbox" name="hopeArea" id="ho1" value='웹개발'/>솔루션·SI·ERP·CRM</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='응용프로그램 개발' />웹에이전시</label>
			        <label><input type="checkbox" name="hopeArea" id="ho1" value='시스템개발'/>쇼핑몰·오픈마켓</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='서버·네트워크·보안' />포털·인터넷·컨텐츠</label>
			        <label><input type="checkbox" name="hopeArea" id="ho1" value='ERP·시스템분석·설계'/>네트워크·통신·모바일</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='데이터베이스·DBA' />하드웨어·장비</label>
			        <label><input type="checkbox" name="hopeArea" id="ho1" value='퍼블리싱·UI개발'/>정보보안·백신</label>
			        <label><input type="checkbox" name="hopeArea" id="ho2" value='웹디자인' />IT컨설팅</label>
			        <label><input type="checkbox" name="hopeArea" id="ho1" value='하드웨어·소프트웨어'/>게임</label>
				</td>
			</tr>
		</table>
		<div class="carrerAjaxContainer22"></div>
</div>

</section>
<script>
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