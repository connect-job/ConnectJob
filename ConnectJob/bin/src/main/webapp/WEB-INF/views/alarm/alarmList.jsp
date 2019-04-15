<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
    <div id='alarm-container'>
        <div class="title">알림센터</div>
        
        <div class="center">
            알림설정　<button class="selected">알림 ON</button><BUTTON>알림 OFF</BUTTON>
        </div>

        <div class="subtitle">
            <div>
                <div class="top">추천 채용정보 알림</div>
                <div class="bottom">회원님의 최근 구직활동을 분석하여 꼭 맞는 채용정보를 추천해드립니다.</div>
            </div>

            <div>
                <div class="top">입사지원 상태 알림</div>
                <div class="bottom">입사지원 이력서 열람, 지원한 채용공고 마감, 인사담당자가 발송한 이메일 등 입사지원 상태를 빠르게 알려드립니다.</div>
            </div>

            <div>
                <div class="top">인재공개 상태 알림</div>
                <div class="bottom">내 이력서를 열람한 기업, 기업의 면접/입사 제의를 빠짐없이 알려드립니다.</div>
            </div>

            <div>
                <div class="top">관심기업/스크랩 알림</div>
                <div class="bottom">관심기업 신규공고, 스크랩한 공고의 채용 마감을 꼭 확인하세요.</div>
            </div>
        </div>  
        
        <div class="sum">
            <div class="item">
                <div class="top">총 알림</div>
                <div class="count">${fn:length(list)}</div> 
            </div>
            <div class="item">
                <div class="top">읽은 알림</div>
                <div class="count"></div> 
            </div>
            <div class="item">
                <div class="top">읽지 않은 알림</div>
                <div class="count"></div> 
            </div>
        </div>
        <div class="left">2019-04-11</div>
        <div class="right">
            <h3>맞춤채용공고 알림</h3>
        	<c:forEach var="m" items="${list }">
        		<div class="message">
        			<div class="content">${m.mMessage }</div>
                    <div class="date">${m.mDate }</div>
                    <div class="status">${m.mStatus=='N'? "읽지않음" : "읽음" }</div>
                    <div class="button"><button onclick="fn_status(${m.mNo})">읽음</button>　<button onclick="fn_delete(${m.mNo})">알림삭제</button></div>
        		</div>
            </c:forEach>
            <h3>이력서 지원현황 알림</h3>
        	<c:forEach var="m" items="${list }">
        		<div class="message">
        			<div class="content">${m.mMessage }</div>
                    <div class="date">${m.mDate }</div>
                    <div class="status">${m.mStatus=='N'? "읽지않음" : "읽음" }</div>
                    <div class="button"><button onclick="fn_status(${m.mNo})">읽음</button>　<button onclick="fn_delete(${m.mNo})">알림삭제</button></div>
        		</div>
        	</c:forEach>
        </div>
        <div class="left">2019-04-10</div>
        <div class="right">
            <h3>맞춤채용공고 알림</h3>
        	<c:forEach var="m" items="${list }">
        		<div class="message">
        			<div class="content">${m.mMessage }</div>
                    <div class="date">${m.mDate }</div>
                    <div class="status">${m.mStatus=='N'? "읽지않음" : "읽음" }</div>
                    <div class="button"><button onclick="fn_status(${m.mNo})">읽음</button>　<button onclick="fn_delete(${m.mNo})">알림삭제</button></div>
        		</div>
            </c:forEach>
            <h3>이력서 지원현황 알림</h3>
        	<c:forEach var="m" items="${list }">
        		<div class="message">
        			<div class="content">${m.mMessage }</div>
                    <div class="date">${m.mDate }</div>
                    <div class="status">${m.mStatus=='N'? "읽지않음" : "읽음" }</div>
                    <div class="button"><button onclick="fn_status(${m.mNo})">읽음</button>　<button onclick="fn_delete(${m.mNo})">알림삭제</button></div>
        		</div>
        	</c:forEach>
        </div>
    </div>
</section>

<script>
	function fn_status(num) {
		if(confirm('알림을 읽음으로 처리하시겠습니까?')) {
			location.href="${path}/alarm/alarmStatus.do?no=" + num;		
		} else {
			return;
		}
	}
	
	function fn_delete(num) {
		if(confirm('알림을 삭제하시겠습니까?')) {
			location.href="${path}/alarm/alarmDelete.do?no=" + num;		
		} else {
			return;
		}
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>