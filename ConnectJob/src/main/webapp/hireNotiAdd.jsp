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
<script>
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
	
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {
	
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>

<form action="${path }/insertNoti.do">
        <div>
            	직종/직무
            <div>
                <ul>
                    <li>웹 개발자</li>
                    <li>서버 개발자</li>
                    <li>프론트엔드 개발자</li>
                    <li>자바 개발자</li>
                    <li>파이썬 개발자</li>
                    <li>안드로이드 개발자</li>
                    <li>IOS 개발자</li>
                    <li>데이터 엔지니어</li>
                    <li>시스템,네트워크관리자</li>
                    <li>node.js 개발자</li>
                    <li>php 개발자</li>
                    <li>DevOps/시스템 관리자</li>
                    <li>C,C++ 개발자</li>
                    <li>개발 매니저</li>
                    <li>데이터 사이언티스트</li>
                </ul>
            </div>
            <input type="button"/>
        </div>
        
        <div>경력여부
            <div>
                <input type="checkbox" id="new"/>신입
                <input type="checkbox" id="exp"/>경력
                <input type="checkbox" id="noexp"/>경력무관
            </div>
        </div>

        <div>고용형태
            <div>
                <input type="checkbox" id="regular"/>정규직
                <input type="checkbox" id="contract"/>계약직
                <input type="checkbox" id="parttime"/>아르바이트
                <input type="checkbox" id="intern"/>인턴직
                <input type="checkbox" id="free"/>프리랜서<br/>
                <input type="checkbox" id="part"/>파트
                <input type="checkbox" id="wichok"/>위촉직
                <input type="checkbox" id="dispatch"/>파견직
                <input type="checkbox" id="fulltime"/>전임
                <input type="checkbox" id="mil-serv"/>병역특례<br/>
                <input type="checkbox" id="edu"/>교육생
                <input type="checkbox" id="oversea"/>해외취업
            </div>
        </div>
        
        <br/>/////////////////나눔선//////////////////<br/><br/>

        <div>모집요강
            <div>모집인원
                <input type="number" />명
            </div>
            <div>모집분야
                <input type="text"/>
            </div>
            <div>담당업무
                <input type="text" placeholder="예)홍보프로그램 운영 및 관리"/>
            </div>
            <div>근무부서
                <input type="text" placeholder="예)SI,solution"/>
            </div>
            <div>직급/직책
                <input type="text"/>
            </div>
        </div>

        <br/>/////////////////나눔선//////////////////<br/><br/>
            
        <div>자격요건 및 우대조건
            <div>학력
                <input type="checkbox"/>학력무관 <input type="checkbox"/>제한
                <select>
                	<option value="" disabled selected>제한학력을 선택하세요</option>
                    <option>초등학교졸업이상</option>
                    <option>중학교졸업이상</option>
                    <option>고등학교졸업이상</option>
                    <option>대학교(2·3년제)졸업이상</option>
                    <option>대학교(4년제)졸업이상</option>
                    <option>대학원(석사)졸업이상</option>
                    <option>대학원(박사)졸업이상</option>
                </select>
                <input type="checkbox"/>졸업예정자 가능
            </div>
            <div>전공/학과
                <input type="text"/>
            </div>
            <div>우대조건
                <input type="text"/>
            </div>
            <div>외국어
                <input type="text"/>
            </div>
            <div>성별
                <input type="checkbox"/>성별무관<input type="checkbox"/>남<input type="checkbox"/>여
            </div>
            <div>생년월일
                <input type="checkbox"/>연령무관<input type="checkbox"/>제한
                <select name="" id="">
                    <option value=""></option>
                </select> 
            </div>

            <br/>/////////////////나눔선//////////////////<br/><br/>
		<div>근무조건
            <div>급여
                <select name="" id="money">
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
            <div>
				근무지역
				<input type="text" id="sample5_address" placeholder="주소">
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
			</div>
            <div>근무요일
                <input type="checkbox"/>월
                <input type="checkbox"/>화
                <input type="checkbox"/>수
                <input type="checkbox"/>목
                <input type="checkbox"/>금
                <input type="checkbox"/>토
                <input type="checkbox"/>일
            </div>
            <div>근무시간
                <select name="" id="">
                    <option value="">오전01시(01:00)</option>
                    <option value="">오전02시(02:00)</option>
                    <option value="">오전03시(03:00)</option>
                    <option value="">오전04시(04:00)</option>
                    <option value="">오전05시(05:00)</option>
                    <option value="">오전06시(06:00)</option>
                    <option value="">오전07시(07:00)</option>
                    <option value="">오전08시(08:00)</option>
                    <option value="">오전09시(09:00)</option>
                    <option value="">오전10시(10:00)</option>
                    <option value="">오전11시(11:00)</option>
                    <option value="">오전12시(12:00)</option>
                    <option value="">오후01시(13:00)</option>
                    <option value="">오후02시(14:00)</option>
                    <option value="">오후03시(15:00)</option>
                    <option value="">오후04시(16:00)</option>
                    <option value="">오후05시(17:00)</option>
                    <option value="">오후06시(18:00)</option>
                    <option value="">오후07시(19:00)</option>
                    <option value="">오후08시(20:00)</option>
                    <option value="">오후09시(21:00)</option>
                    <option value="">오후10시(22:00)</option>
                    <option value="">오후11시(23:00)</option>
                    <option value="">오후12시(24:00)</option>
                </select>
                ~
                <select name="" id="">
                    <option value="">오전1시(01:00)</option>
                    <option value="">오전2시(02:00)</option>
                    <option value="">오전3시(03:00)</option>
                    <option value="">오전4시(04:00)</option>
                    <option value="">오전5시(05:00)</option>
                    <option value="">오전6시(06:00)</option>
                    <option value="">오전7시(07:00)</option>
                    <option value="">오전8시(08:00)</option>
                    <option value="">오전9시(09:00)</option>
                    <option value="">오전10시(10:00)</option>
                    <option value="">오전11시(11:00)</option>
                    <option value="">오전12시(12:00)</option>
                    <option value="">오전1시(01:00)</option>
                    <option value="">오전2시(02:00)</option>
                    <option value="">오전3시(03:00)</option>
                    <option value="">오전4시(04:00)</option>
                    <option value="">오전5시(05:00)</option>
                    <option value="">오전6시(06:00)</option>
                    <option value="">오전7시(07:00)</option>
                    <option value="">오전8시(08:00)</option>
                    <option value="">오전9시(09:00)</option>
                    <option value="">오전10시(10:00)</option>
                    <option value="">오전11시(11:00)</option>
                    <option value="">오전12시(12:00)</option>
                    <option value="">오후1시(13:00)</option>
                    <option value="">오후2시(14:00)</option>
                    <option value="">오후3시(15:00)</option>
                    <option value="">오후4시(16:00)</option>
                    <option value="">오후5시(17:00)</option>
                    <option value="">오후6시(18:00)</option>
                    <option value="">오후7시(19:00)</option>
                    <option value="">오후8시(20:00)</option>
                    <option value="">오후9시(21:00)</option>
                    <option value="">오후10시(22:00)</option>
                    <option value="">오후11시(23:00)</option>
                    <option value="">오후12시(24:00)</option>
                </select>
            </div>
        </div>
        
        <br/>/////////////////나눔선//////////////////<br/><br/>

            <div>접수기간 및 방법
                <div>접수기간
					<input type="text" id="testDatepickers"/>시작일
						~
					<input type="text" id="testDatepickere"/>마감일
					<input type="checkbox"/>상시 접수
                </div>
                <div>접수방법
                    <input type="checkbox"/>Connect-job 온라인 접수<br/>
                    <input type="checkbox"/>홈페이지 접수 <input type="text"/><br/>
                    <input type="checkbox"/>우편<input type="checkbox"/>방문<input type="checkbox"/>전화<input type="checkbox"/>FAX
                </div>
                <div>지원시 참고자료
                    <input type="file" class="custom-file-input" name="upFile" id="upFile1">
                </div>
            </div>
        </div>
                
        <br/>/////////////////나눔선//////////////////<br/><br/>

        <div>전형절차 및 제출 서류
            <div>전형절차
                <input type="text" placeholder="전형절차를 입력해주세요">
            </div>
            <div>제출서류
                <input type="text" placeholder="제출서류를 입력해주세요">
            </div>
            <div>사전인터뷰
                <input type="text" placeholder="입사지원 전에 구직자가 꼭 답변해야 할 사전인터뷰 질문을 입력해주세요.">
            </div>
        </div>

        <br/>/////////////////나눔선//////////////////<br/><br/>

        <div>담당자 연락처
            <div>담당자
               	 이름<input type="text"/>
            </div>
            <div>연락처
                	전화<input type="text"/><br/>
                	휴대폰<input type="text"/><br/>
                	email<input type="email"/><br/>
               		FAX<input type="text"/>
            </div>
        </div>

        <br/>/////////////////나눔선//////////////////<br/><br/>

        <div>채용제목
            <div>제목
                <input type="text"/>
            </div>
        </div>
	<input type="button" value="submit"/>채용공고작성완료
    </form>
    <!--kakao지도 api-->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91e0db2af26d873dbe0c8f327f08c6ff&libraries=services"></script>
	<script>
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
    $( "#testDatepickers" ).datepicker({
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