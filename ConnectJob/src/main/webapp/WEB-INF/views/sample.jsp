<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
        <div id="company-container">
            <div class="company-top">
                기업탐색
            </div>
            <div class="company-middle">
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
                </div>
            </div>
            <div class="company-content">
                <table>
                    <tr>
                        <th style="width:100px">기업구분</th>
                        <th style="width:250px">기업명</th>
                        <th style="width:250px">주소</th>
                        <th style="width:100px">리뷰수</th>
                        <th style="width:100px">평점</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





