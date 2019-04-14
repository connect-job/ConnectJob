<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
	<div id="faq-container">
		<div class="faq-top">
			<div id="left">FAQ</div>
			<div id="right">자주묻는질문</div>
		</div>

		<div class="faq-middle">
			<div class="faq">
				<div class="q" onclick="fn_open()">Q : 가입한 이메일 계정이 기억나지 않아요.</div>
				<div class="a">A : 커넥트잡은 회원의 개인정보 보호를 위해 이메일 등의 정보를 접근을 제한하고 있습니다.
					관리자조차 특정 회원의 이메일 주소를 확인할 방법이 없습니다. 계정을 찾기 위해선, 평소 이용하는 이메일 주소를 차례로 테스트해보는 방법 밖에 없습니다.
					계정을 완전히 분실한 경우에는 재가입해야 합니다.
				</div>

				<div class="q" onclick="fn_open()">Q : 회원정보 중에 생년월일과 성별이 잘못 기입되었습니다. 어떻게 하나요?</div>
				<div class="a">A : 등록된 생년월일과 성별을 수정하실 수 없을 경우, 고객센터로 문의 주시면 간단한 본인 확인 후 안내해 드리도록 하겠습니다. <br>
					<br><strong>[커넥트잡 고객센터] </strong>
					<br>· ☎: 02-789-4562
					<br>· E-mail: helpcs@connectjob.co.kr</div>



				<div class="q" onclick="fn_open()">Q : 이력서 제목 수정은 어떻게 하나요?</div>
				<div class="a">A : 개인회원 로그인 후 이력서 관리에서 이력서 [수정]을 클릭하세요.
					이력서 수정페이지에서 제목을 수정할 수 있습니다.

					이용에 불편하신 점이 있으시다면 잡코리아 고객지원팀으로 연락주시기 바랍니다.<br>
					[커넥트잡 고객지원팀 02-789-4562] </div>

				<div class="q" onclick="fn_open()">Q : 채용공고를 보고 지원을 하였습니다. 채용공고에 내용과 전혀 다른 기업은 어떻게 하나요?
				</div>
				<div class="a">A : 잡코리아에 등록된 모든 채용정보들은 현재 기업회원 사용자들이 직접 등록/관리하도록 되어 있습니다.
					(기업회원 가입 및 채용공고 등록,수정,마감,삭제관리를 해당 기업의 인사담당자들이 관리 처리하고 있습니다.)

					등록된 내용과 다른 기업이 확인되신 경우 당사 고객센터로 유선문의 또는 e-메일로 접수해 주시기 바랍니다.
					<br>
					<br><strong>[커넥트잡 고객센터] </strong>
					<br>· ☎: 02-789-4562
					<br>· E-mail: helpcs@connectjob.co.kr </div>

				<div class="q" onclick="fn_open()">Q : 평균연봉은 어떻게 산출하나요?</div>
				<div class="a">A : 해당 회사의 국민연금 납부액 또는 고용보험 납부액과 납부인원수를 역산하여 계산합니다. </div>
				
				<div class="q" onclick="fn_open()">Q : 회원탈퇴는 어떻게 하나요?</div>
				<div class="a">A : 커넥트잡 회원탈퇴는 아래 절차에 따라 진행하실 수 있습니다. 

회원 로그인 후 마이페이지 [내정보관리]를 클릭해 주세요.<br/>
[탈퇴]버튼을 클릭하시면 탈퇴가 완료됩니다.<br/> 
※회원 탈퇴 시  회원 정보도 삭제되므로 신중히 탈퇴해 주시기 바랍니다. 
</div>
			</div>
		</div>

	</div>
</section>

<script>
	$('.q').click(function() {
		if($(this).next().height()=="150") {
			$(this).next().css("height","0px");
		} else {
			$(this).next().css("height","150px");
		}
	});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>