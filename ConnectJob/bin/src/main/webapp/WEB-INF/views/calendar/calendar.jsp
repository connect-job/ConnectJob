<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
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
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      defaultDate: '2019-03-12',
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2019-03-01'
        },
        {
          title: 'Long Event',
          start: '2019-03-07',
          end: '2019-03-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2019-03-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2019-03-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2019-03-11',
          end: '2019-03-13'
        }
      ]
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

