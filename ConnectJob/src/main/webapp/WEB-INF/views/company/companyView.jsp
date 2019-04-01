<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section id="companyView">
        <div id="company-view-container">
            <div class="company-view-top">
                	${company.companyName}
            </div>
            <div id="company-view-content">
                <div class="view-left">
                    <ul>
                        <li onclick="location.href='#'" class="selected"><i class="fas fa-info-circle"></i><br>기업정보</li>
                        <li onclick="location.href='#right-company-review'"><i class="fas fa-comment-dots"></i><br>기업리뷰</li>
                        <li onclick="location.href='#right-company-hire'"><i class="fas fa-user-friends"></i><br>채용정보</li>
                        <li onclick="location.href='#right-company-news'"><i class="far fa-newspaper"></i><br>기업뉴스</li>
                    </ul>
                </div>
                <div class="view-right">
                    <div id="right-company-info">
                    	<div class="info-left">
                            <div class="info">
                                <div class="title">기업구분</div>
                                <div class="content wow fadeInUp" data-wow-delay="0.3s">${company.companyStatus==1?"법인":"개인"}</div>
                            </div>
                            <div class="info">
                                <div class="title">설립일자</div>
                                <div class="content wow fadeInUp" data-wow-delay="0.4s">
                                    <fmt:parseDate value="${company.companyRegDate}" var="date" pattern="yyyyMMdd"/>
                                    <fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일" var="regDate"/>
                                    ${regDate }
                                </div>
                            </div>
                            <div class="info">
                                <div class="title">회사주소</div>
                                <div class="content wow fadeInUp" data-wow-delay="0.5s">(${company.companyZipcode}) ${company.companyAddressNew}</div>
                            </div>
                            <div class="info">
                                <div class="title">산업군</div>
                                <div class="content wow fadeInUp" data-wow-delay="0.6s">${company.companyCate}</div>
                            </div>
                            <div class="info">
                                <div class="title">사원수</div>
                                <div class="content wow fadeInUp" data-wow-delay="0.7s">${company.companyAllPeople} 명</div>
                            </div>
                            <div class="info">
                                <div class="title">신규사원</div>
                                <div class="content wow fadeInUp" data-wow-delay="0.8s">${company.companyNewPeople} 명</div>
                            </div>
                            <div class="info">
                                <div class="title">퇴사인원</div>
                                <div class="content wow fadeInUp" data-wow-delay="0.9s">${company.companyOutPeople} 명</div>
                            </div>
                            <div class="info">
                                <div class="title">예상평균연봉</div>
                                <div class="content wow fadeInUp"  data-wow-delay="1s">
                                    <c:set value="${((company.companyPrice*10)*12)/company.companyAllPeople}" var="price"/>
                                    <fmt:formatNumber value="${price }" var="avg"/>
                                    <fmt:parseNumber integerOnly="true" value="${avg }" var="avgPrice" />
                                    ${fn:substring(avgPrice,0,4) }&nbsp;만원　(출처 : 국민연금)
                                </div>
                            </div>
                    	</div>
                    	<div class="info-right">
                            <div class="review">
                                <div class="avgPoint"><H2>REVIEW</H2><h3>기업평점　|　3.5/5.0&nbsp;&nbsp;|&nbsp;&nbsp;★★★☆☆</h3></div>
                                <h4>베스트 리뷰 (BEST REVIEW)<br>"트래픽이 있으며 편하게 다니는 사람도 많고 고생하는 사람은 고생하는 구조입니다."</h4>
                                <div class="review-info">
                                    승진 기회 및 가능성<div class="line wow fadeInLeft" data-wow-delay="0.1s" style="width:30%;" ></div><br>
                                    복지 및 급여<div class="line1 wow fadeInLeft" style="width:60%;" data-wow-delay="0.2s"></div><br>
                                    업무와 삶의 균형(워라밸)<div class="line2 wow fadeInLeft" style="width:40%;" data-wow-delay="0.3s"></div><br>
                                    사내문화<div class="line3 wow fadeInLeft" style="width:70%;" data-wow-delay="0.4s"></div><br>
                                    경영진<div class="line4 wow fadeInLeft" style="width:20%;" data-wow-delay="0.5"></div>
                                    
                                </div>
                               
                            </div>
                    	</div>
                    </div>
                    
                    <h3>기업리뷰　　　　<button onclick="fn_review()">기업리뷰 작성하기</button></h3>
                    <div id="right-company-review">
                        <div class="review-top">
                            <div class="review-table-left">

                            </div>
                            <div class="review-table-right">
                                <div class="review-detail-top">
                                    ★★★☆☆ | 유통/무역 | 전직원 | 서울 | 2019/3/16<br>
                                </div>
                                <div class="review-datail-title">
                                    괜찮은 기업
                                </div>
                                <div class="review-detail-content">
                                    <h4>기업의 장점</h4>
                                    자유로운 분위기 다른데가 비교시 좀 수평적인 분위기<br>
                                    카페테리아가 있어서 싸게 커피 마시기 좋음

                                    <h4>기업의 단점</h4>
                                    일이 너무 많아 맨날 야근함 근데 수당은 하나도 없었고<br>
                                    일 잘하는 사람들이 다 퇴사

                                    <h4>경영진에 바라는 점</h4>
                                    일 잘하능 사람 퇴사시키지 마세요 그래서 계속 매출 떨어지고 있잖아요
                                </div>
                                <br>
                                <div class="review-detail-score">
                                승진 기회 및 가능성<div class="line" style="width:30%;" ></div><br>
                                복지 및 급여<div class="line1" style="width:60%;"></div><br>
                                업무와 삶의 균형(워라밸)<div class="line2" style="width:40%;"></div><br>
                                사내문화<div class="line3" style="width:70%;"></div><br>
                                경영진<div class="line4" style="width:20%;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="review-bottom">
                            이전　1　2　3　4　5　6　7　8　9　다음
                        </div>
                    </div>
                    
                    <script>
                    	var reviewList = $('#right-company-review');
                    	$.ajax({
                    		url: '${path}/review/reviewList.do?reviewCompany=${company.companyNo}',
                    		success: function(data) {
                    			var Ca = /\+/g;
            					var resultSet = decodeURIComponent(data.replace(Ca, " "));
            					reviewList.empty();
            					reviewList.html(resultSet);
                    		}
                    	});

                    	function fn_reviewContent(e, no) {
                            var item = $('.review-item');
                            for(var i=0; i<item.length; i++) {
                    			item.removeClass("selected");
                    		}

                            $(e).addClass("selected");

                    		var reviewContent = $('.review-table-right').eq(0);
                    		$.ajax({
                    			url: '${path}/review/reviewOne.do?reviewNo=' + no,
                    			success: function(data) {
                    				var Ca = /\+/g;
                					var resultSet = decodeURIComponent(data.replace(Ca, " "));
                					reviewContent.empty();
                					reviewContent.html(resultSet);
                    			}
                    		});
                    	}
                    </script>
                    
                    
                    <!-- ---------------- 리뷰작성 모달 ---------------- -->
                    <div class="background-blur"></div>
                    <div id="review-write">
                    	<form action="${path }/review/reviewWrite.do" method="POST">
                    		<div class="review_form">
                    			<div class="form-title">기업리뷰 작성　　|　　STEP 01</div>
                    			<div class="input">
                    				<div class="left">기업명</div>
                    				<div class="right">
                    					<input type="text" readonly value="${company.companyName}">
                    					<input type="hidden" name="reviewCompany" value="${company.companyNo }"/>
                    					<input type="hidden" name="reviewMember" value="${loginMember.pId }"/>
                    				</div>
                    			</div>
                    			<div class="input">
                    				<div class="left">현/전 직장</div>
                    				<div class="right">
                                        <select id="reviewIsCurrent" name="reviewIsCurrent">
                                            <option>현 직장/전 직장</option>
                                            <option value="현직장">현 직장</option>
                                            <option value="전 직장 - 2019년 퇴사">전 직장 - 2019년 퇴사</option>
                                            <option value="전 직장 - 2018년 퇴사">전 직장 - 2018년 퇴사</option>
                                            <option value="전 직장 - 2017년 퇴사">전 직장 - 2017년 퇴사</option>
                                            <option value="전 직장 - 2016년 퇴사">전 직장 - 2016년 퇴사</option>
                                            <option value="전 직장 - 2015년 퇴사">전 직장 - 2015년 퇴사</option>
                                            <option value="전 직장 - 2014년 퇴사">전 직장 - 2014년 퇴사</option>
                                            <option value="전 직장 - 2013년 퇴사">전 직장 - 2013년 퇴사</option>
                                            <option value="전 직장 - 2012년 퇴사">전 직장 - 2012년 퇴사</option>
                                            <option value="전 직장 - 2011년 퇴사">전 직장 - 2011년 퇴사</option>
                                            <option value="전 직장 - 2010년 퇴사">전 직장 - 2010년 퇴사</option>
                                            <option value="전 직장 - 2009년 퇴사">전 직장 - 2009년 퇴사</option>
                                        </select>
                                    </div>
                    			</div>
                    			<div class="input">
                    				<div class="left">직종</div>
                    				<div class="right">IT/인터넷</div>
                    			</div>
                    			<div class="input">
                    				<div class="left">직종상세</div>
                    				<div class="right">
                                        <select id="reviewJob" name="reviewJob">
                                            <option>직종상세</option>
                                            <option value="DBA(Database Admin)">DBA(Database Admin)</option>
                                            <option value="ERP">ERP</option>
                                            <option value="QA(Quality Assurance)">QA(Quality Assurance)</option>
                                            <option value="게임개발">게임개발</option>
                                            <option value="기획">기획</option>
                                            <option value="네트워크/보안/운영">네트워크/보안/운영</option>
                                            <option value="데이터분석">데이터분석</option>
                                            <option value="모바일앱개발">모바일앱개발</option>
                                            <option value="소프트웨어 아키텍트">소프트웨어 아키텍트</option>
                                            <option value="소프트웨어 엔지니어">소프트웨어 엔지니어</option>
                                            <option value="하드웨어 엔지니어">하드웨어 엔지니어</option>
                                            <option value="시스템 엔지니어">시스템 엔지니어</option>
                                            <option value="웹 개발">웹 개발</option>
                                            <option value="웹 퍼블리셔">웹 퍼블리셔</option>
                                            <option value="프로젝트 매니저">프로젝트 매니저</option>
                                        </select>
                                    </div>
                    			</div>
                    			<div class="input">
                    				<div class="left">고용형태</div>
                    				<div class="right">
                                        <select id="reviewEmployCate" name="reviewEmployCate">
                                            <option>고용형태</option>
                                            <option value="인턴직">인턴직</option>
                                            <option value="아르바이트">아르바이트</option>
                                            <option value="정규직">정규직</option>
                                            <option value="계약직">계약직</option>
                                            <option value="프리랜서">프리랜서</option>
                                            <option value="기타">기타</option>
                                        </select>
                                    </div>
                    			</div>
                    			<div class="input">
                    				<div class="left">총 경력</div>
                    				<div class="right">
                                        <select id="reviewCareer" name="reviewCareer">
                                            <option>총 경력 (이전 경력 포함)</option>
                                            <option value="1년차">1년차</option>
                                            <option value="2년차">2년차</option>
                                            <option value="3년차">3년차</option>
                                            <option value="4년차">4년차</option>
                                            <option value="5년차">5년차</option>
                                            <option value="6년차">6년차</option>
                                            <option value="7년차">7년차</option>
                                            <option value="8년차">8년차</option>
                                            <option value="9년차">9년차</option>
                                            <option value="10년차">10년차</option>
                                            <option value="11년차">11년차</option>
                                            <option value="12년차">12년차</option>
                                            <option value="13년차">13년차</option>
                                            <option value="14년차">14년차</option>
                                            <option value="15년차">15년차</option>
                                            <option value="16년차">16년차</option>
                                            <option value="17년차">17년차</option>
                                            <option value="18년차">18년차</option>
                                            <option value="19년차">19년차</option>
                                            <option value="20년차">20년차</option>
                                            <option value="21년차">21년차</option>
                                            <option value="22년차">22년차</option>
                                            <option value="23년차">23년차</option>
                                            <option value="24년차">24년차</option>
                                            <option value="25년차">25년차</option>
                                            <option value="26년차">26년차</option>
                                            <option value="27년차">27년차</option>
                                            <option value="28년차">28년차</option>
                                            <option value="29년차">29년차</option>
                                            <option value="30년차 이상">30년차 이상</option>
                                        </select>
                                    </div>
                    			</div>
                    			<div class="input">
                    				<div class="left">근무지역</div>
                    				<div class="right">
                                        <select id="reviewLocation" name="reviewLocation">
                                            <option>근무지역</option>
                                            <option value="서울">서울</option>
                                            <option value="경기">경기</option>
                                            <option value="인천">인천</option>
                                            <option value="부산">부산</option>
                                            <option value="대구">대구</option>
                                            <option value="대전">대전</option>
                                            <option value="광주">광주</option>
                                            <option value="울산">울산</option>
                                            <option value="세종">세종</option>
                                            <option value="강원">강원</option>
                                            <option value="경남">경남</option>
                                            <option value="경북">경북</option>
                                            <option value="전남">전남</option>
                                            <option value="전북">전북</option>
                                            <option value="충남">충남</option>
                                            <option value="충북">충북</option>
                                            <option value="제주">제주</option>
                                            <option value="해외">해외</option>
                                            <option value="기타">기타</option>
                                        </select>
                                    </div>
                    			</div>
                    			<div class="form-middle">
                    				<div class="middle-left">
                                        <button type="button" onclick="fn_cancle()">취소</button>
                                    </div>
                    				<div class="middle-right">
                                        <button type="button" onclick="fn_next()">다음</button>
                                    </div>
                    			</div>
                    			<div class="form-bottom"></div>
                            </div>
                            

                            <!-- ------------ STEP 02 ------------------- -->
                            <div class="review_form">
                    			<div class="form-title">기업리뷰 작성　　|　　STEP 02</div>
                    			<div class="input">
                    				<div class="left">기업 총 평점</div>
                    				<div class="right">
                                        <select name="reviewTotalScore">
                                            <option>평점</option>
                                            <option value="1">★</option>
                                            <option value="2">★★</option>
                                            <option value="3">★★★</option>
                                            <option value="4">★★★★</option>
                                            <option value="5">★★★★★</option>
                                        </select>
                                    </div>
                    			</div>
                    			<div class="input">
                                    <div class="left">
                                        기업한줄평<br>
                                    </div>
                    				<div class="right">
                                        <textarea id="reviewShort" name="reviewShort" maxlength="20" style="height: 80px">예) 개발자가 대우받으며 보람차게 일할 수 있는 곳. 다양한 개발 환경을 경험하고 서버와 클라이언트 양쪽에서 커리어를 쌓고 싶은 사람에게 추천</textarea>
                                    </div>
                    			</div>
                    			<div class="input">
                    				<div class="left">
                                        기업의 장점<br>
                                        최소 20자
                                    </div>
                    				<div class="right">
                                        <textarea id="reviewMerit" name="reviewMerit" minlength="20" style="height: 80px">예) 연차를 윗사람 눈치 안 보고 쓸 수 있음, 도서구입비, 학원 수강료 등 자기 계발 비용 지원, 야근 식대 1만원까지 제공, 수평적인 사무실 분위기. 업무 분담 체계가 확실해 자기 분야 전문성을 기를 수 있음. 사업기반이 안정적이고 체계적인 교육시스템이 갖춰져 신입에게 추천</textarea>
                                    </div>
                    			</div>
                    			<div class="input">
                    				<div class="left">
                                        기업의 단점<br>
                                        최소 20자
                                    </div>
                    				<div class="right">
                                            <textarea id="reviewDisMerit" name="reviewDisMerit" minlength="20" style="height: 80px">예) 단순 보고를 위한 문서 작업이 많아 비효율적. 복지 제도가 다양하지만 실제로 쓸 수 없음. 출근 시간은 8시인데 퇴근 시간은 ???. 연봉이 많다지만 시간급은 형편없음. 과장 차장이 많아 승진이 힘들다." </textarea>
                                    </div>
                    			</div>
                    			<div class="input">
                    				<div class="left">
                                        경영진에 바라는 점
                                    </div>
                    				<div class="right">
                                            <textarea id="reviewRequest" name="reviewRequest" style="height: 80px">예) 신규 사업 추진에 적극적인 투자 의지를 보여줬으면. 직원들의 불만을 듣지만 말고 해결책을 마련해줬으면. 합리적인 복지 및 보상 체계를 마련해줬으면 좋겠다. 군대 문화를 줄여줬으면 좋겠다.</textarea>
                                            
                                    </div>
                    			</div>
                    			<div class="input">
                    				<div class="left">승진기회 및 가능성</div>
                    				<div class="right">
                                        <select id="reviewGrade01" name="reviewGrade01">
                                            <option>평점</option>
                                            <option value="1">★</option>
                                            <option value="2">★★</option>
                                            <option value="3">★★★</option>
                                            <option value="4">★★★★</option>
                                            <option value="5">★★★★★</option>
                                        </select>
                                    </div>
                                </div>
                                
                    			<div class="input">
                    				<div class="left">복지 및 급여</div>
                    				<div class="right">
                                        <select id="reviewGrade02" name="reviewGrade02">
                                            <option>평점</option>
                                            <option value="1">★</option>
                                            <option value="2">★★</option>
                                            <option value="3">★★★</option>
                                            <option value="4">★★★★</option>
                                            <option value="5">★★★★★</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="input">
                    				<div class="left">업무와 삶의 균형</div>
                    				<div class="right">
                                        <select id="reviewGrade03" name="reviewGrade03">
                                            <option>평점</option>
                                            <option value="1">★</option>
                                            <option value="2">★★</option>
                                            <option value="3">★★★</option>
                                            <option value="4">★★★★</option>
                                            <option value="5">★★★★★</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="input">
                    				<div class="left">사내문화</div>
                    				<div class="right">
                                        <select id="reviewGrade04" name="reviewGrade04">
                                            <option>평점</option>
                                            <option value="1">★</option>
                                            <option value="2">★★</option>
                                            <option value="3">★★★</option>
                                            <option value="4">★★★★</option>
                                            <option value="5">★★★★★</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="input">
                    				<div class="left">경영진</div>
                    				<div class="right">
                                        <select id="reviewGrade05" name="reviewGrade05">
                                            <option>평점</option>
                                            <option value="1">★</option>
                                            <option value="2">★★</option>
                                            <option value="3">★★★</option>
                                            <option value="4">★★★★</option>
                                            <option value="5">★★★★★</option>
                                        </select>
                                    </div>
                    			</div>


                    			<div class="form-middle">
                    				<div class="middle-left">
                                        <button type="button" onclick="fn_prev()">이전</button>
                                    </div>
                    				<div class="middle-right">
                                        작성된 정보는 심사과정을 거친 후 게재됩니다.　　<button onclick="return fn_validate()">제출</button>
                                    </div>
                    			</div>
                    			<div class="form-bottom"></div>
                    		</div>


                        </form>
                        
                    </div>
                    <script>
                    	function fn_review() {
                    		
                    		if(${loginMember!=null}) {
                    			console.log("리뷰작성 권한여부 ${loginMember.isConfirm}");
                    			if(${loginMember.isConfirm eq "TRUE"}) {
                        			$(".background-blur").eq(0).css("display","inline-block");
                                    $('#review-write').css("display","block");
                                    $('.review_form').eq(1).css("display","none");
                                    $('html').scrollTop(0);
                    			} else {
                    				if(confirm('재직정보등록 후 승인된 회원만 리뷰 작성이 가능합니다.\n승인페이지로 이동하시겠습니까?')) {
                        				window.location.href="${path}/member/mypage.do";
                        			} else {
                        				return;
                        			}
                    			}
                    		} else {
                    			if(confirm('로그인 후 리뷰를 작성하실 수 있습니다\n로그인 페이지로 이동하시겠습니까?')) {
                    				window.location.href="${path}/member/login.do";
                    			} else {
                    				return;
                    			}
                    		}
                    	}

                        function fn_cancle() {
                            $(".background-blur").eq(0).css("display","none");
                            $('#review-write').css("display","none");
                        }
                    	
                        function fn_prev() {
                            $('html').scrollTop(0);
                            $('.review_form').eq(0).css("display","inline-block");
                            $('.review_form').eq(1).css("display","none");
                        }

                        function fn_next() {
                            if($('#reviewIsCurrent').val()=="현 직장/전 직장") {
                                $('#reviewIsCurrent').parent().append("<div class='message'>현/전직장을 체크해주세요</div>");
                                return;
                            } else {
                                $('#reviewIsCurrent').parent().children().eq(1).remove();
                            }
                            if($('#reviewJob').val()=="직종상세") {
                                $('#reviewJob').parent().append("<div class='message'>상세 직종을 선택해주세요</div>");
                                return;
                            } else {
                                $('#reviewJob').parent().children().eq(1).remove();
                            }
                            if($('#reviewEmployCate').val()=="고용형태") {
                                $('#reviewEmployCate').parent().append("<div class='message'>고용형태를 선택해주세요</div>");
                                return;
                            } else {
                                $('#reviewEmployCate').parent().children().eq(1).remove();
                            }
                            if($('#reviewCareer').val()=="총 경력 (이전 경력 포함)") {
                                $('#reviewCareer').parent().append("<div class='message'>총 경력을 선택해주세요</div>");
                                return;
                            } else {
                                $('#reviewCareer').parent().children().eq(1).remove();
                            }
                            if($('#reviewLocation').val()=="근무지역") {
                                $('#reviewLocation').parent().append("<div class='message'>근무지역 선택해주세요</div>");
                                return;
                            } else {
                                $('#reviewLocation').parent().children().eq(1).remove();
                            }


                            $('.review_form').eq(0).css("display","none");
                            $('.review_form').eq(1).css("display","inline-block");
                            $('html').scrollTop(0);
                        }

                        function fn_validate() {
                            if($('#reviewTotalScore').val()=="평점") {
                                $('#reviewTotalScore').parent().append("<div class='message'>기업 총 평점을 선택해주세요</div>");
                                return false;
                            } else {
                                $('#reviewTotalScore').parent().children().eq(1).remove();
                            }
                            if($('#reviewShort').val().length==0) {
                                $('#reviewShort').parent().append("<div class='message'>기업 한줄평을 입력해주세요</div>");
                                return false;
                            } else {
                                $('#reviewShort').parent().children().eq(1).remove();
                            }
                            if($('#reviewMerit').val().length==0) {
                                $('#reviewMerit').parent().append("<div class='message'>기업의 장점을 입력해주세요</div>");
                                return false;
                            } else {
                                $('#reviewMerit').parent().children().eq(1).remove();
                            }
                            if($('#reviewDisMerit').val().length==0) {
                                $('#reviewDisMerit').parent().append("<div class='message'>기업의 단점을 입력해주세요</div>");
                                return false;
                            } else {
                                $('#reviewDisMerit').parent().children().eq(1).remove();
                            }
                            if($('#reviewRequest').val().length==0) {
                                $('#reviewRequest').parent().append("<div class='message'>경영진에 바라는 점을 입력해주세요</div>");
                                return false;
                            } else {
                                $('#reviewRequest').parent().children().eq(1).remove();
                            }
                            if($('#reviewGrade01').val()=="평점") {
                                $('#reviewGrade01').parent().append("<div class='message'>승진기회 및 가능성 평점을 선택해주세요</div>");
                                return false;
                            } else {
                                $('#reviewGrade01').parent().children().eq(1).remove();
                            }
                            if($('#reviewGrade02').val()=="평점") {
                                $('#reviewGrade02').parent().append("<div class='message'>복지 및 급여 평점을 선택해주세요</div>");
                                return false;
                            } else {
                                $('#reviewGrade02').parent().children().eq(1).remove();
                            }
                            if($('#reviewGrade03').val()=="평점") {
                                $('#reviewGrade03').parent().append("<div class='message'>업무와 삶의 균형 평점을 선택해주세요</div>");
                                return false;
                            } else {
                                $('#reviewGrade03').parent().children().eq(1).remove();
                            }
                            if($('#reviewGrade04').val()=="평점") {
                                $('#reviewGrade04').parent().append("<div class='message'>사내문화 평점을 선택해주세요</div>");
                                return false;
                            } else {
                                $('#reviewGrade04').parent().children().eq(1).remove();
                            }
                            if($('#reviewGrade05').val()=="평점") {
                                $('#reviewGrade05').parent().append("<div class='message'>경영진 평점을 선택해주세요</div>");
                                return false;
                            } else {
                                $('#reviewGrade05').parent().children().eq(1).remove();
                            }
                        }

                    </script>
                    <!-- ---------------------------------------------------------- -->
                    
                    <h3>채용공고</h3>
                    <div id="right-company-hire">
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                    </div>
                    
            
                    
                    
                     <h3>기업뉴스</h3>
                    <div id="right-company-news">
                    	<c:forEach items="${news }" var="news" end="5">
                    	<div class="news-line">
                            <div class="news-title wow fadeInLeft" data-wow-delay="0.3s"><a href="${news.newsLink }">${news.newsTitle }</a></div>
                            </div>
		                </c:forEach>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>