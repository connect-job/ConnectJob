<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
	<form name="resumeFrm" action="${pageContext.request.contextPath}/resume/resumeRegistEnd.do" method="post"
		onsubmit="return validate();" enctype="multipart/form-data">
		<div id="resume-container">
			<div class="resume-top">
				<i class="far fa-address-card"></i>　내 이력서 작성
			</div>

			<!-- ----------------------------- 기본 -->
			<div class="sub-title">
				기본설정
			</div>
			<div class="item">
				<div class="left">이력서 제목</div>
				<div class="right">
					<input type="text" name="title" id="title">
					<select name="isPublic">
						<option value="" disabled selected>공개여부</option>
						<option value="true">공개</option>
						<option value="false">비공개</option>
					</select>
				</div>
			</div>

			<div class="sub-title">
				기본정보
			</div>

			<div class="item">
				<input type="hidden" name="p_id" value="${loginMember.p_id}">
				<div class="left">사진</div>
				<div class="right">
					<div class="profileUpload">
						<div id="images" style="border:1px solid lightgray;width:140px;height:160px">
							<i class="far fa-plus-square"></i>사진을 추가해주세요
						</div>
						<input id='profileImg' type="file" name="profileImg" multiple />
					</div>
				</div>
			</div>

			<div class="item">
				<input type="hidden" name="p_id" value="${loginMember.p_id}">
				<div class="left">이름</div>
				<div class="right"><input type="text" name="name" id="name"></div>
			</div>

			<div class="item">
				<div class="left">생년월일</div>
				<div class="right">
					<input type="text" id="birth" name="birth" placeholder="YYYYMMDD">
					<select name="gender">
						<option value="" disabled selected>성별</option>
						<option value="M">남</option>
						<option value="F">여</option>
					</select>
				</div>
			</div>
			<div class="item">
				<div class="left">이메일</div>
				<div class="right"><input type="email" name="email" id="email" placeholder="example@connectjob.com">
				</div>
			</div>
			<div class="item">
				<div class="left">핸드폰</div>
				<div class="right"><input type="text" name="phone" id="phone" placeholder="-을 제외하고 작성"></div>
			</div>

			<!-- ----------------------------- 학력 -->

			<div class="sub-title">
				학력정보
			</div>

			<div class="item">
				<div class="left">최종 학력정보</div>
				<div class="right">
					<select name="finalEdu" onchange="selectFinalEdu()">
						<option value="" disabled selected>최종학력을 선택하세요</option>
						<option value="초등학교 졸업">초등학교 졸업</option>
						<option value="중학교 졸업">중학교 졸업</option>
						<option value="고등학교 졸업">고등학교 졸업</option>
						<option value="대학/대학원 이상 졸업">대학/대학원 이상 졸업</option>
					</select>
					<button type="button" id="addUnivBtn" onclick="addUniversity()">대학 학력 추가</button>
				</div>
			</div>


			<div class="finalEduAjaxContainer"></div>
			<div class="addUnivContainer"></div>
			<div class="addUnivContainer2"></div>

			<!-- ----------------------------- 경력 -->

			<div class="sub-title">
				경력정보
			</div>

			<div class="item">
				<div class="left">경력정보</div>
				<div class="right">
					<select name="career" onchange="selectCareer()">
						<option value="" disabled selected>경력을 선택하세요</option>
						<option value="신입">신입</option>
						<option value="경력">경력</option>
					</select>
				</div>
			</div>

			<div class="carrerAjaxContainer"></div>

			<!-- ----------------------------- 희망 근무조건 -->

			<div class="sub-title">
				희망 근무조건
			</div>

			<div class="item">
				<div class="left">근무형태</div>
				<div class="right">
					<select name="hopePosition">
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
				</div>
			</div>

			<div class="item">
				<div class="left">희망연봉</div>
				<div class="right">
					<select name="hopeSalary">
						<option value="" disabled selected>희망연봉을 선택하세요</option>
						<option value="회사내규">회사내규에 따름</option>
						<option value="상의후 결정">상의후결저</option>
						<option value="2,000만원 이하">2,000만원 이하</option>
						<option value="2,000~2,200만원">2,000~2,200만원</option>
						<option value="2,200~2,400만원">2,200~2,400만원</option>
						<option value="2,400~2,600만원">2,400~2,600만원</option>
						<option value="2,600~3,800만원">2,600~3,800만원</option>
						<option value="2,800~3,000만원">2,800~3,000만원</option>
						<option value="3,000~3,200만원">3,000~3,200만원</option>
						<option value="3,200~3,400만원">3,200~3,400만원</option>
						<option value="3,400~3,600만원">3,400~3,600만원</option>
						<option value="3,600~3,800만원">3,600~3,800만원</option>
						<option value="3,800~4,000만원">3,800~4,000만원</option>
						<option value="4000만원 이상">4000만원 이상</option>
					</select>
				</div>
			</div>

			<div class="item">
				<div class="left">희망지역</div>
				<div class="right">
					<select name="hopeArea">
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
				<div class="left">희망직종</div>
				<div class="right">
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea1" value='웹 개발자' />웹 개발자</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea2" value='서버 개발자' />서버 개발자</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea3" value='시스템개발' />시스템개발</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea4" value='프론트엔드 개발자' />프론트엔드
						개발자</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea5" value='자바 개발자' />자바 개발자</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea6" value='파이썬 개발자' />파이썬
						개발자</label><br>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea7" value='안드로이드 개발자' />안드로이드
						개발자</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea8" value='IOS개발자' />IOS개발자</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea9" value='데이터 엔지니어' />데이터
						엔지니어</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea10" value='시스템,네트워크 관리자' />시스템,네트워크
						관리자</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea11" value='node.js 개발자' />node.js
						개발자</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea12" value='php 개발자' />php
						개발자</label><br>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea13"
							value='DevOps / 시스템 관리자' />DevOps / 시스템 관리자</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea14"
							value='C,C++개발자' />C,C++개발자</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea15" value='개발 매니저' />개발 매니저</label>
					<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea16" value='데이터 사이언티스트' />데이터
						사이언티스트</label>
					<button onclick="resetHopeArea()">reset</button>
				</div>
			</div>

			<div class="item">
				<div class="left">희망업종</div>
				<div class="right">
					<label><input type="checkbox" name="hopeCategory" id="hopeCategory1"
							value='솔루션·SI·ERP·CRM' />솔루션·SI·ERP·CRM</label>
					<label><input type="checkbox" name="hopeCategory" id="hopeCategory2"
							value='웹에이전시 개발' />웹에이전시</label>
					<label><input type="checkbox" name="hopeCategory" id="hopeCategory3"
							value='쇼핑몰·오픈마켓' />쇼핑몰·오픈마켓</label>
					<label><input type="checkbox" name="hopeCategory" id="hopeCategory4"
							value='포털·인터넷·컨텐츠' />포털·인터넷·컨텐츠</label>
					<label><input type="checkbox" name="hopeCategory" id="hopeCategory5"
							value='네트워크·통신·모바일' />네트워크·통신·모바일</label><br>
					<label><input type="checkbox" name="hopeCategory" id="hopeCategory6"
							value='하드웨어·장비' />하드웨어·장비</label>
					<label><input type="checkbox" name="hopeCategory" id="hopeCategory7"
							value='정보보안·백신' />정보보안·백신</label>
					<label><input type="checkbox" name="hopeCategory" id="hopeCategory8" value='IT컨설팅' />IT컨설팅</label>
					<label><input type="checkbox" name="hopeCategory" id="hopeCategory9" value='게임' />게임</label>
					<button onclick="resetHopeJobArea()">reset</button>
				</div>
			</div>

			<div class="carrerAjaxContainer22"></div>
			<div class="item">
				<div class=right>
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</div>
			</div>
		</div>

	</form>
</section>
<script>
	$(function () {
		$("#profileImg").change(function () {
			var iputFiles = document.getElementById('profileImg');
			console.log(iputFiles.files);
			$.each(iputFiles.files, function (index, item) {
				console.log(item);
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#images').children().remove();
					$('#images').empty();
					var img = $("<img></img>").attr("src", e.target.result).css({ 'width': '140px', 'height': '160px' });
					$('#images').append(img);
				}
				reader.readAsDataURL(item);
			});
		});
	});
	function resetHopeArea() {
		$('input[name=hopeArea]').prop("checked", false);
	}
	function resetHopeJobArea() {
		$('input[name=hopeJobArea]').prop("checked", false);
	}
	function selectFinalEdu() {
		var finalEdu = $('[name=finalEdu]').val();
		if (finalEdu != "대학/대학원 이상 졸업") {
			$(".addUnivContainer").empty();
			$(".addUnivContainer").empty();
			$("#addUnivBtn").css("display", "none");
		}
		$.ajax({
			url: "${path}/selectFinalEdu.do",
			data: { "finalEdu": finalEdu },
			success: function (data) {
				$('.finalEduAjaxContainer').html(data);

			}
		})
	}

	function selectCareer() {
		var career = $('[name=career]').val();
		if (career == "신입") {
			$(".carrerAjaxContainer").empty();
		} else {
			$.ajax({
				url: "${path}/selectCareer.do",
				data: { "career": career },
				success: function (data) {
					$('.carrerAjaxContainer').html(data);
				}
			})
		}
	}
	function addUniversity() {
		console.log("대학추가");
		$.ajax({
			url: "${path}/addUniversity.do",
			success: function (data) {
				var univ = $(".univ");
				if (univ.length == 1) {
					$('.addUnivContainer').append(data);
				} else if (univ.length == 2) {
					$('.addUnivContainer2').append(data);
				} else if (univ.length == 3) {
					alert("학교는 최대 3개까지만 입력 가능합니다.");
				}



				$(".deleteUnivBtn").click(function () {
					var univ = $(".univ");
					console.log(univ.length);
					if (univ.length > 1) {
						$(this).parent().parent().parent().parent().empty();
					} else {
						console.log($(this).prev());
						$(this).prev().empty();
						$(this).prev().html("대학은 한개 이상 입력하셔야 합니다.");
			    		/* $(".checkMsg").eq(0).empty();
			    		$(".checkMsg").eq(0).html("대학은 한개 이상 입력하셔야 합니다.");
			    		 */
					}
				});
			}
		})
	};
	function validate() {
		var finalEdu = $('[name=finalEdu]').val();
		if (finalEdu == "대학/대학원 이상 졸업" && major) {
			var Category = ("");
		}
	}

</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>