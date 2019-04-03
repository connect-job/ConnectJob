<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param value="" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<section>
	<input type="text" id="testDatepickers"/>
	~
	<input type="text" id="testDatepickere"/>


</section>
<script>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>