<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
$(function(){
    $("[name=up_file]").change(function(){
       var iputFiles=document.getElementById('up_file');
       console.log(iputFiles.files);
       $.each(iputFiles.files, function(index, item){
          console.log(item);
       var reader = new FileReader();
       reader.onload=function(e){
          var img = $("<img></img>").attr("src",e.target.result).css({'width':'90px','height':'80px'});
          $('#images').append(img);
                
       }
       reader.readAsDataURL(item);
    });
    });

/* function fileUploadPreview(thisObj, preViewer) {
    alert(!/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(thisObj.value));
if(!/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(thisObj.value)) {
    alert("이미지 형식의 파일을 선택하십시오");
    return;
}

preViewer = (typeof(preViewer) == "object") ? preViewer : document.getElementById(preViewer);
var ua = window.navigator.userAgent;

if (ua.indexOf("MSIE") > -1) {
    var img_path = "";
    if (thisObj.value.indexOf("\\fakepath\\") < 0) {
        img_path = thisObj.value;
    } else {
        thisObj.select();
        var selectionRange = document.selection.createRange();
        img_path = selectionRange.text.toString();
        thisObj.blur();
    }
    preViewer.style.filter =

           "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='fi" +

           "le://" + img_path + "', sizingMethod='scale')";
  } else {
    preViewer.innerHTML = "";
    var W = preViewer.offsetWidth;
    var H = preViewer.offsetHeight;
    var tmpImage = document.createElement("img");
    preViewer.appendChild(tmpImage);

    tmpImage.onerror = function () {
        return preViewer.innerHTML = "";
    }

    tmpImage.onload = function () {
        if (this.width > W) {
            this.height = this.height / (this.width / W);
            this.width = W;
        }
        if (this.height > H) {
            this.width = this.width / (this.height / H);
            this.height = H;
        }
    }
    if (ua.indexOf("Firefox/3") > -1) {
        var picData = thisObj.files.item(0).getAsDataURL();
        tmpImage.src = picData;
    } else {
        tmpImage.src = "file://" + thisObj.value;
    }
}
} */
</script>
<section>
	<form name="resumeFrm" action="${pageContext.request.contextPath}/resume/resumeRegistEnd.do" method="post">
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
				<input type="text" name="title" id="title" required>
				<select name="isPublic" required>
					<option value="" disabled selected>공개여부</option>
					<option value="true">공개</option>
					<option value="false">비공개</option>
				</select>
			</div>
		</div>
		<div class="sub-title">
			기본정보
		</div>
		<div class="profileUpload">
			<div id="images" style="border:1px solid lightgray;"></div>
			 <input id='up_file' type="file" name="up_file" multiple />
		</div>
		<div class="item">
			<input type="hidden" name="p_id" value="${loginMember.p_id}">
			<div class="left">이름</div>
			<div class="right"><input type="text" name="name" id="name" required></div>
		</div>
		<div class="item">
			<div class="left">생년월일</div>
			<div class="right">
				<input type="text" id="birth" name="birth" placeholder="YYYYMMDD" required>
				<select name="gender" required>
					<option value="" disabled selected>성별</option>
					<option value="M">남</option>
					<option value="F">여</option>
				</select>
			</div>
		</div>
		<div class="item">
			<div class="left">이메일</div>
			<div class="right"><input type="email" name="email" id="email" placeholder="example@connectjob.com"></div>
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
				<select name="finalEdu" onchange="selectFinalEdu()" required>
					<option value="" disabled selected>최종학력을 선택하세요</option>
					<option value="초등학교 졸업">초등학교 졸업</option>
					<option value="중학교 졸업">중학교 졸업</option>
					<option value="고등학교 졸업">고등학교 졸업</option>
					<option value="대학/대학원 이상 졸업">대학/대학원 이상 졸업</option>
				</select>
			</div>
		</div>


		<div class="finalEduAjaxContainer"></div>

		<!-- ----------------------------- 경력 -->

		<div class="sub-title">
			경력정보
		</div>

		<div class="item">
			<div class="left">경력정보</div>
			<div class="right">
				<select name="career" onchange="selectCareer()" required>
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
			</div>
		</div>

		<div class="item">
			<div class="left">희망연봉</div>
			<div class="right">
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
			</div>
		</div>

		<div class="item">
			<div class="left">희망지역</div>
			<div class="right">
				<select name="hopeArea" required>
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
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea1" value='웹개발' />웹개발</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea2" value='응용프로그램 개발' />응용프로그램 개발</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea3" value='시스템개발' />시스템개발</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea4" value='서버·네트워크·보안' />서버·네트워크·보안</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea5" value='ERP·시스템분석·설계' />ERP·시스템분석·설계</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea6" value='데이터베이스·DBA' />데이터베이스·DBA</label><br>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea7" value='퍼블리싱·UI개발' />퍼블리싱·UI개발</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea8" value='웹디자인' />웹디자인</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea9" value='하드웨어·소프트웨어' />하드웨어·소프트웨어</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea10" value='통신·모바일' />통신·모바일</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea11" value='웹기획·PM' />웹기획·PM</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea12" value='웹마스터·QA·테스터' />웹마스터·QA·테스터</label><br>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea13" value='컨텐츠·사이트운영' />컨텐츠·사이트운영</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea14" value='게임' />게임</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea15" value='IT/디자인·컴퓨터교육' />IT/디자인·컴퓨터교육</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea16" value='동영상·편집·코덱' />동영상·편집·코덱</label>
				<label><input type="checkbox" name="hopeJobArea" id="hopeJobArea17" value='인공지능(AI)·빅데이터' />인공지능(AI)·빅데이터</label>
				<button onclick="resetHopeArea()">reset</button>
			</div>
		</div>

		<div class="item">
			<div class="left">희망업종</div>
			<div class="right">
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory1" value='솔루션·SI·ERP·CRM' />솔루션·SI·ERP·CRM</label>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory2" value='웹에이전시 개발' />웹에이전시</label>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory3" value='쇼핑몰·오픈마켓' />쇼핑몰·오픈마켓</label>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory4" value='포털·인터넷·컨텐츠' />포털·인터넷·컨텐츠</label>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory5" value='네트워크·통신·모바일' />네트워크·통신·모바일</label><br>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory6" value='하드웨어·장비' />하드웨어·장비</label>
				<label><input type="checkbox" name="hopeCategory" id="hopeCategory7" value='정보보안·백신' />정보보안·백신</label>
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
	function resetHopeArea(){
		$('input[name=hopeArea]').prop("checked",false);
	}
	function resetHopeJobArea(){
		$('input[name=hopeJobArea]').prop("checked",false);
	}
	function selectFinalEdu() {
		var finalEdu = $('[name=finalEdu]').val();
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
		if(career=="신입"){
			$(".carrerAjaxContainer").empty();
		}else{
			$.ajax({
				url: "${path}/selectCareer.do",
				data: { "career": career },
				success: function (data) {
					$('.carrerAjaxContainer').html(data);
				}
			})
		}
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>