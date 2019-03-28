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
                                <div class="avgPoint"><h3>전체 평점<br>3.5/5.0&nbsp;&nbsp;|&nbsp;&nbsp;★★★☆☆</h3></div>
                                <h4>"트래픽이 있으며 편하게 다니는 사람도 많고 고생하는 사람은 고생하는 구조입니다."</h4>
                                <div class="review-info">
                                    승진 기회 및 가능성<div class="line wow fadeInLeft" data-wow-delay="0.2s" style="width:30%;" ></div><br>
                                    복지 및 급여<div class="line wow fadeInLeft" style="width:60%;" data-wow-delay="0.4s"></div><br>
                                    업무와 삶의 균형(워라밸)<div class="line wow fadeInLeft" style="width:40%;" data-wow-delay="0.6s"></div><br>
                                    사내문화<div class="line wow fadeInLeft" style="width:70%;" data-wow-delay="0.8s"></div><br>
                                    경영진<div class="line wow fadeInLeft" style="width:20%;" data-wow-delay="1s"></div>
                                    
                                </div>
                               
                            </div>
                    	</div>
                    </div>
                    
                    <h3>기업리뷰&nbsp;&nbsp;&nbsp;<button>기업리뷰 작성하기</button></h3>
                    <div id="right-company-review">
                        <div class="review-list">"개발하기 좋음 사람들이 좋음 칼퇴하는 분위기"</div>
                        <div class="review-list">"개발부문보단 사업부가 우선인 곳, 개발은 시다바리.."</div>
                        <div class="review-list">"개발자 커리어에 그다지 도움 안되었던 곳. it회사라기 보단 유통회사가 딱이야."</div>
                        <div class="review-list">"묵묵히 열심히 일하기 보다는 했던 일에 비해 과장하고 떠벌리고 다니면 인정받음"</div>
                    </div>
                    
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




<!-- 
<div id="company-location">
    지역선택
    <select>
        <option>전국</option>
        <option>서울</option>
        <option>부산</option>
        <option>대구</option>
        <option>인천</option>
        <option>광주</option>
        <option>대전</option>
        <option>울산</option>
        <option>세종</option>
        <option>경기</option>
        <option>강원</option>
        <option>충북</option>
        <option>충남</option>
        <option>전북</option>
        <option>전남</option>
        <option>경북</option>
        <option>경남</option>
        <option>제주</option>
    </select>
</div>
<div id="company-location-detail">
    <select>
        <option>전체</option>
        <option>강남구</option>
        <option>강동구</option>
        <option>강북구</option>
        <option>강서구</option>
        <option>관악구</option>
        <option>광진구</option>
        <option>구로구</option>
        <option>금천구</option>
        <option>노원구</option>
        <option>도봉구</option>
        <option>동대문구</option>
        <option>동작구</option>
        <option>마포구</option>
        <option>서대문구</option>
        <option>서초구</option>
        <option>성동구</option>
        <option>성북구</option>
        <option>송파구</option>
        <option>양천구</option>
        <option>영등포구</option>
        <option>용산구</option>
        <option>은평구</option>
        <option>종로구</option>
        <option>중구</option>
        <option>중랑구</option>
    </select>
</div> -->