<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 달력 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param value="" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<section>


<form action="${path }/insertNoti.do" name="hireFrm"  method="post" onsubmit="return validate();">
<input type="hidden" name="cMemberId" value="${loginCMember.cMemberId }"/>
        <div>
            	직종/직무
            <div>
            <label><input type="radio" name="hnSort" id="hopeJobArea1" value='웹 개발자' />웹 개발자</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea2" value='서버 개발자' />서버 개발자</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea3" value='시스템개발' />시스템개발</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea4" value='프론트엔드 개발자' />프론트엔드 개발자</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea5" value='자바 개발자' />자바 개발자</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea6" value='파이썬 개발자' />파이썬 개발자</label><br>
            <label><input type="radio" name="hnSort" id="hopeJobArea7" value='안드로이드 개발자' />안드로이드 개발자</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea8" value='IOS개발자' />IOS개발자</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea9" value='데이터 엔지니어' />데이터 엔지니어</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea10" value='시스템,네트워크 관리자' />시스템,네트워크 관리자</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea11" value='node.js 개발자' />node.js 개발자</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea12" value='php 개발자' />php 개발자</label><br>
            <label><input type="radio" name="hnSort" id="hopeJobArea13" value='DevOps / 시스템 관리자' />DevOps / 시스템 관리자</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea14" value='C,C++개발자' />C,C++개발자</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea15" value='개발 매니저' />개발 매니저</label>
            <label><input type="radio" name="hnSort" id="hopeJobArea16" value='데이터 사이언티스트' />데이터 사이언티스트</label>
				<script>
					function resetHopeArea(){
					      $('input[name=hopeArea]').prop("checked",false);
					   }
				</script>
            </div>
        </div>
        
        <div>경력여부
            <div>
                <input type="radio" name="hnCareer" value="신입"/>신입
                <input type="radio" name="hnCareer" value="경력"/>경력
            </div>
        </div>

        <div>고용형태
            <div>
                <select name="hnForm" >
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
        
        <br/>/////////////////나눔선//////////////////<br/><br/>

        <div>모집요강
            <div>모집인원
                <input type="number" name="hnRecruit" min="0"/>명
            </div>
            <div>모집분야
                <input type="text" name="hnCate"/>
            </div>
            <div>담당업무
                <input type="text" name="hnChargeTask" placeholder="예)홍보프로그램 운영 및 관리"/>
            </div>
            <div>근무부서
                <input type="text" name="hnDept" placeholder="예)SI,solution팀"/>
            </div>
            <div>직급/직책
                <input type="text" name="hnRankPosition" />
            </div>
        </div>

        <br/>/////////////////나눔선//////////////////<br/><br/>
            
        <div>자격요건 및 우대조건
            <div>학력
                <select name="hnFinalEdu" onchange="selectFinalEdu()" >
               		<option value="" disabled selected>최종학력을 선택하세요</option>
               		<option value="학력무관">학력무관</option>
               		<option value="초등학교 졸업">초등학교 졸업</option>
              		<option value="중학교 졸업">중학교 졸업</option>
               		<option value="고등학교 졸업">고등학교 졸업</option>
               		<option value="대학교(2·3년제)이상 졸업">대학교(2·3년제)이상 졸업</option>
               		<option value="대학교(4년제)졸업">대학교(4년제)졸업</option>
               		<option value="대학원(석·박사)졸업">대학원(석·박사)졸업</option>
            	</select>
            </div>
            <div>전공/학과
                <input type="text" name="hnMajor"/>
            </div>
            <div>우대조건
                <input type="text" name="hnPreference"/>
            </div>
            <div>성별
                <input type="radio" name="hnGender" value="성별무관"/>성별무관
                <input type="radio" name="hnGender" value="M"/>남
                <input type="radio" name="hnGender" value="F"/>여
            </div>
            <div>나이
                <input type="radio" name="hnBirth" id="r1" value="1"/>연령무관
                <input type="radio" name="hnBirth" id="r2" value="0"/>제한
            </div>
            <div style="width:200px;">
  				<input type="text" name="hnBirth">
			</div>            
                <script>
                $(document).ready(function(){
                	 
                    // 라디오버튼 클릭시 이벤트 발생
                    $("input:radio[name=hnBirth]").click(function(){
                 
                        if($("input[name=hnBirth]:checked").val() == "1"){
                            $("input:text[name=hnBirth]").attr("disabled",false);
                            // radio 버튼의 value 값이 1이라면 활성화
                 
                        }else if($("input[name=radio]:checked").val() == "0"){
                              $("input:text[name=hnBirth]").attr("disabled",true);
                            // radio 버튼의 value 값이 0이라면 비활성화
                        }
                    });
                });

                </script>
            

            <br/>/////////////////나눔선//////////////////<br/><br/>
            
		<div>근무조건
            <div>급여
                <select  id="money" name="hnSal">
	               <option value="회사내규에 따름">회사내규에 따름</option>
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
            <div>
				근무지역
				<input type="text" id="sample5_address" name="hnWorkPlace" placeholder="주소">
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
			</div>
            <div>근무요일
                <input type="text" name="hnDay"/>요일
            </div>
            <div>근무시간
                <select name="hnStime" id="">
                    <option value="" disabled selected>출근시간</option>
                    <option value="AM1">오전01시(01:00)</option>
                    <option value="AM2">오전02시(02:00)</option>
                    <option value="AM3">오전03시(03:00)</option>
                    <option value="AM4">오전04시(04:00)</option>
                    <option value="AM5">오전05시(05:00)</option>
                    <option value="AM6">오전06시(06:00)</option>
                    <option value="AM7">오전07시(07:00)</option>
                    <option value="AM8">오전08시(08:00)</option>
                    <option value="AM9">오전09시(09:00)</option>
                    <option value="AM10">오전10시(10:00)</option>
                    <option value="AM11">오전11시(11:00)</option>
                    <option value="AM12">오전12시(12:00)</option>
                    <option value="PM1">오후01시(13:00)</option>
                    <option value="PM2">오후02시(14:00)</option>
                    <option value="PM3">오후03시(15:00)</option>
                    <option value="PM4">오후04시(16:00)</option>
                    <option value="PM5">오후05시(17:00)</option>
                    <option value="PM6">오후06시(18:00)</option>
                    <option value="PM7">오후07시(19:00)</option>
                    <option value="PM8">오후08시(20:00)</option>
                    <option value="PM9">오후09시(21:00)</option>
                    <option value="PM10">오후10시(22:00)</option>
                    <option value="PM11">오후11시(23:00)</option>
                    <option value="PM12">오후12시(24:00)</option>
                </select>
                ~
                <select name="hnDtime" id="">
                    <option value="" disabled selected>퇴근시간</option>
                    <option value="AM1">오전01시(01:00)</option>
                    <option value="AM2">오전02시(02:00)</option>
                    <option value="AM3">오전03시(03:00)</option>
                    <option value="AM4">오전04시(04:00)</option>
                    <option value="AM5">오전05시(05:00)</option>
                    <option value="AM6">오전06시(06:00)</option>
                    <option value="AM7">오전07시(07:00)</option>
                    <option value="AM8">오전08시(08:00)</option>
                    <option value="AM9">오전09시(09:00)</option>
                    <option value="AM10">오전10시(10:00)</option>
                    <option value="AM11">오전11시(11:00)</option>
                    <option value="AM12">오전12시(12:00)</option>
                    <option value="PM1">오후01시(13:00)</option>
                    <option value="PM2">오후02시(14:00)</option>
                    <option value="PM3">오후03시(15:00)</option>
                    <option value="PM4">오후04시(16:00)</option>
                    <option value="PM5">오후05시(17:00)</option>
                    <option value="PM6">오후06시(18:00)</option>
                    <option value="PM7">오후07시(19:00)</option>
                    <option value="PM8">오후08시(20:00)</option>
                    <option value="PM9">오후09시(21:00)</option>
                    <option value="PM10">오후10시(22:00)</option>
                    <option value="PM11">오후11시(23:00)</option>
                    <option value="PM12">오후12시(24:00)</option>
                </select>
            </div>
        </div>
        
        <br/>/////////////////나눔선//////////////////<br/><br/>

            <div>접수기간 및 방법
                <div>접수기간
					<input type="text" name="startDate" id="testDatepickers"/>시작일
						~
					<input type="text" name="endDate" id="testDatepickere"/>마감일
					<input type="checkbox" name="hnEve" value="" default="N"/>상시 접수
					<script>
						
					</script>
                </div>
                <div>접수방법
                    <input type="radio" name="hnReMethod" value="Connect-job"/>Connect-job 온라인 접수<br/>
                    <input type="radio" name="hnReMethod" value="홈페이지 접수"/>홈페이지 접수
                    <input type="radio" name="hnReMethod" value=""/><br/>
                    <input type="radio" name="hnReMethod" value="우편"/>우편
                    <input type="radio" name="hnReMethod" value="방문접수"/>방문
                    <input type="radio" name="hnReMethod" value="전화 접수"/>전화
                    <input type="radio" name="hnReMethod" value="팩스 접수"/>FAX
                </div>
            </div>
        </div>
                
        <br/>/////////////////나눔선//////////////////<br/><br/>

        <div>전형절차 및 제출 서류
            <div>전형절차
                <textarea name="hnProcess" placeholder="전형절차를 입력해주세요"></textarea>
            </div>
            <div>제출서류
                <textarea name="hnDoc" placeholder="제출서류를 입력해주세요"></textarea>
            </div>
            <div>사전인터뷰
                <textarea name="hnInterview" placeholder="입사지원 전에 구직자가 꼭 답변해야 할 사전인터뷰 질문을 입력해주세요."></textarea>
            </div>
        </div>

        <br/>/////////////////나눔선//////////////////<br/><br/>

        <div>채용제목
            <div>제목
                <input type="text" name="hnTitle"/>
            </div>
        </div>
      
	<div class="enroll-text">
		<button type="button" onclick="fn_submit()">채용공고 작성완료</button>
	</div>
		
    </form>
    
    <!--kakao지도 api-->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91e0db2af26d873dbe0c8f327f08c6ff&libraries=services"></script>
	<script>
	function fn_submit(){
		var cate=$('#cate li');
		var cateList='';
		$.each(cate,function(index){
			if(cate.eq(index).hasClass('selected')){
				cateList+=cate.eq(index).text()+',';
			}
		});
		$('#hnSort').val(cateList);
		/* hireFrm.serialize(); */
		hireFrm.submit();
	}
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    } 
    
  
    //datepicker
		$(function() {
    $("#testDatepickers").datepicker({
    	showOn:"both",
    	changeMonth:true,
    	changeYear:true,
    	nextText:"다음달",
    	prevText:"이전달",
    	dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
    	monthNamesShort:['1','2','3','4','5','6','7','8','9','10','11','12'],
    	monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	currentText:'오늘날짜',
		closeText:'닫기',
		dateFormat:"yy.mm.dd",
    	minDate:0
    });
});
	
		$(function() {
		    $( "#testDatepickere" ).datepicker({
		    	showOn:"both",
		    	changeMonth:true,
		    	changeYear:true,
		    	nextText:"다음달",
		    	prevText:"이전달",
		    	dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		    	monthNamesShort:['1','2','3','4','5','6','7','8','9','10','11','12'],
		    	monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    	currentText:'오늘날짜',
				closeText:'닫기',
				dateFormat:"yy.mm.dd",
		    	minDate:0
		    });
		});
	</script>
 

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>