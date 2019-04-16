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
            알림설정　<button id="alarmOn" onclick="fn_alarmOn()">알림 ON</button><button  id="alarmOff" onclick="fn_alarmOff()">알림 OFF</button>
        </div>

		<div class="sum">
            <div class="item">
                <div class="top">총 알림</div>
                <div class="count">${fn:length(list)}</div> 
            </div>
            <div class="item">
                <div class="top">읽은 알림</div>
                <div class="count">${readMessage }</div> 
            </div>
            <div class="item">
                <div class="top">읽지 않은 알림</div>
                <div class="count">${unReadMessage }</div> 
            </div>
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
        
        
        

        <div class="list">
            <h3>알림 최신순</h3>
        	<c:forEach var="m" items="${list }">
        		<div class="message">
        			<div class="content">${m.mMessage }</div>
                    <div class="date">
                    	<fmt:formatDate value="${m.mDate}" pattern="yyyy년 MM월 dd일" var="regDate"/>${regDate }</div>
                    <div class="status"><span class="statusSpan">${m.mStatus=='N'? "<b>읽지않음</b>" : "읽음" }</span></div>
                    <div class="button">
                    <button style="display:${m.mStatus=='N'? 'inline-block' : 'none'}" onclick='fn_status(${m.mNo})'>읽음</button>　<button class="delete" onclick="fn_delete(${m.mNo})">알림삭제</button></div>
        		</div>
            </c:forEach>

        </div>
    </div>
</section>


<script>
	
	$(function() {
		var alarmStatus = '${loginMember.alarmStatus}';
		
		var alarmOn = $('#alarmOn');
		var alarmOff = $('#alarmOff');
		
		if(alarmStatus=='Y') {
			alarmOn.addClass('selected');
		} else if (alarmStatus=='N') {
			alarmOff.addClass('selected');
		}
	});
	
	function fn_alarmOn() {
		if(confirm('알림기능을 ON 하시겠습니까? ')) {
			location.href="${path}/alarm/alarmOn.do?id=${loginMember.p_id}";
		} else {
			return;
		}
	}
	
	function fn_alarmOff() {
		if(confirm('알림기능을 OFF 하시겠습니까? ')) {
			location.href="${path}/alarm/alarmOff.do?id=${loginMember.p_id}";
		} else {
			return;
		}
	}

	function fn_status(num) {
		if(confirm('알림을 읽음으로 처리하시겠습니까?')) {
			location.href="${path}/alarm/alarmStatus.do?mNo=" + num + "&mTo=${loginMember.p_id}";
		} else {
			return;
		}
	}
	
	function fn_delete(num) {
		if(confirm('알림을 삭제하시겠습니까?')) {
			location.href="${path}/alarm/alarmDelete.do?mNo=" + num + "&mTo=${loginMember.p_id}";
		} else {
			return;
		}
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>