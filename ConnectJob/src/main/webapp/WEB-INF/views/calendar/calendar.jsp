<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.connect.job.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link href='${path }/resources/packages/core/main.css' rel='stylesheet' />
<link href='${path }/resources/packages/daygrid/main.css' rel='stylesheet' />
<script src='${path }/resources/packages/core/main.js'></script>
<script src='${path }/resources/packages/interaction/main.js'></script>
<script src='${path }/resources/packages/daygrid/main.js'></script>

<script>
<%
	List<HireEvent> eventList=(List<HireEvent>)request.getAttribute("eventList");
%>
document.addEventListener('DOMContentLoaded', function() { 
	 var eventDataSet=[
		<%for(int i=0;i<eventList.size();i++){
			if(i<eventList.size()-1){
		%>
			{
				"title":'[<%=eventList.get(i).getSeFlag()%>] <%=eventList.get(i).getCompanyName()%>',
				"start":'<%=eventList.get(i).getEventDate()%>',
				<%if(eventList.get(i).getSeFlag().equals("시작")){%>
				"color":"RGB(71,78,98)"
				<%}else{%>
				"color":"RGB(167,82,82)"
				<%}%>
			},
		<%}else{%>
			{
				"title":'[<%=eventList.get(i).getSeFlag()%>] <%=eventList.get(i).getCompanyName()%>',
				"start":'<%=eventList.get(i).getEventDate()%>',
				<%if(eventList.get(i).getSeFlag().equals("시작")){%>
				"color":"RGB(71,78,98)"
				<%}else{%>
				"color":"RGB(167,82,82)"
				<%}%>
			}
		<%}
		}%>
	]; 
	 console.log(eventDataSet);
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      defaultDate: '2019-04-16',
      editable: false,
      eventLimit: true, // allow "more" link when too many events
      events: eventDataSet
    });

    calendar.render();
  });



</script>
<!-- <style>
 #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
</style> -->
<section>
 <div id='calendar'></div>
</section>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>

