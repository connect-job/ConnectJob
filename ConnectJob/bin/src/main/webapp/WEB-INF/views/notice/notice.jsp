<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
<<<<<<< HEAD
<<<<<<< HEAD

	function fn_paging(cPage) {
   		window.location.href="${path}/notice.do?cPage=" + cPage;
   	}
	
	function checkSearch(){
		if($('#select').val()==null){
			alert("옵션을 선택하세요");
			return false;
		}
		if($('#searchKey').val().length==0){
			alert("검색할 키워드를 입력하세요");
			return false;
		}	
	}
	
=======
	$(function(){		
		var searchTitle=$('#search-title');
		var searchContent=$('#search-content');		
		var searchType=$('#searchType');
		
		searchType.on("change", function(){
			searchTitle.css("display", "none");
			searchContent.css("display", "none");			
			
			$('[name=cPage]').val('1');
			$('[name=numPerPage]').val('10');
			$('#search-'+$(this).val()).css("display", "inline-block");
		});
		
		 $('#searchType').trigger("change"); 
	});
	
=======

>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git
	function fn_paging(cPage) {
   		window.location.href="${path}/notice.do?cPage=" + cPage;
   	}
<<<<<<< HEAD
>>>>>>> branch 'PSH' of https://github.com/connect-job/ConnectJob.git
=======
	
	function checkSearch(){
		if($('#select').val()==null){
			alert("옵션을 선택하세요");
			return false;
		}
		if($('#searchKey').val().length==0){
			alert("검색할 키워드를 입력하세요");
			return false;
		}	
	}
	
>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git
</script>

 <section>    
<<<<<<< HEAD
<<<<<<< HEAD
	<div id="notice-container">

		<div class="notice-title">공지사항　|　NOTICE</div>

		<div class="notice-write">관리자일 때만 보여짐　　<input type="button" value="글쓰기" onclick="location.href='${path}/notice/noticeForm'"/></div>

		<div class="notice-top-list">
			<c:forEach var="noticeTop" items="${topList }">
				<div class="item-top">
					<div class="head">NOTICE</div>
					<dlv class="title"><a href="${path }/notice/noticeView?notice_no=${noticeTop.notice_no}">${noticeTop.title}</a></dlv>
					<div class="date">${noticeTop.notice_date}</div>
				</div>
			</c:forEach>
		</div>

		<div class="notice-search">
			<form method="post" action="${path }/notice/noticeSearch" onsubmit="return checkSearch();">			
				<select name="searchType" id="select">
					<option value="none" disabled selected>검색타입</option>
					<option value="title" <c:if test="${map.searchType eq 'title'}">selected</c:if>>제목</option>
					<option value="content"<c:if test="${map.searchType eq 'content'}">selected</c:if>>내용</option>
				</select>
			
				<input type="text" id="searchKey" name="searchKey" value="${map.searchKey!=null?map.searchKey:''}"/>
				<input type="submit" value="검색">			
			</form>
		</div>

		<div class="notice-list">
			<c:forEach var="notice" items="${list }">
				<div class="list-item">
					<div class="no">${notice.notice_no}</div>
					<div class="title"><a href="${path }/notice/noticeView?notice_no=${notice.notice_no}">${notice.title }</a></div>
					<div class="date">${notice.notice_date }</div>
				</div>
         	</c:forEach> 
		</div>

		<div id="pageBar" class="notice-bottom">
				${pageBar }
		</div>

	</div>
=======
    	   	  	
 	<table>
 		<%-- <c:if test="${loginMember!=null && loginMember.p_id eq 'admin@admin.com' }"> --%>
			<tr>            	
				<td>
					<input type="button" value="글쓰기" onclick="location.href='${path}/notice/noticeForm'"/>
				</td>
        	</tr> 
        <%-- </c:if> --%>                       
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>작성일</th>
            <th>조회수</th>
         </tr>
       
         	<c:forEach var="notice" items="${list }">
         		<tr>
            		<td>${notice.notice_no }</td>
            		<td>${notice.writer }</td>
            		<td><a href="${path }/notice/noticeView?notice_no=${notice.notice_no}">${notice.title }</a></td>
            		<td>${notice.notice_date }</td>
            		<td>${notice.read_count }</td>
         		</tr>
         	</c:forEach>
         
	</table> 
	
	<div id="paging-container"> 
		${pageBar }             
   	</div>
   	       
   	<div>       
        <select id="searchType">
            <option value="title">제목</option>
            <option value="content">내용</option>                
        </select>            
		<div id="search-title">
        	<form>
        		<input type="hidden" name="searchType" value="title"/>            		
            	<input type="hidden" name="cPage"/>
            	<input type="hidden" name="numPerPage"/>
            	<input type="search" name="searchKey" placeholder="제목"/>
            	<button type="submit" id="search-btn">검색</button>
      		</form>
    	</div>            
		<div id="search-content">
      		<form>
            	<input type="hidden" name="searchType" value="content"/>            		
            	<input type="hidden" name="cPage"/>
            	<input type="hidden" name="numPerPage"/>
            	<input type="search" name="searchKey" placeholder="내용"/>
            	<button type="submit" id="search-btn">검색</button>
        	</form>
		</div>           	               
	</div> 
              
	
>>>>>>> branch 'PSH' of https://github.com/connect-job/ConnectJob.git
=======
	<div id="notice-container">

		<div class="notice-title">공지사항　|　NOTICE</div>

		<div class="notice-write">관리자일 때만 보여짐　　<input type="button" value="글쓰기" onclick="location.href='${path}/notice/noticeForm'"/></div>

		<div class="notice-top-list">
			<c:forEach var="noticeTop" items="${topList }">
				<div class="item-top">
					<div class="head">NOTICE</div>
					<dlv class="title"><a href="${path }/notice/noticeView?notice_no=${noticeTop.notice_no}">${noticeTop.title}</a></dlv>
					<div class="date">${noticeTop.notice_date}</div>
				</div>
			</c:forEach>
		</div>

		<div class="notice-search">
			<form method="post" action="${path }/notice/noticeSearch" onsubmit="return checkSearch();">			
				<select name="searchType" id="select">
					<option value="none" disabled selected>검색타입</option>
					<option value="title" <c:if test="${map.searchType eq 'title'}">selected</c:if>>제목</option>
					<option value="content"<c:if test="${map.searchType eq 'content'}">selected</c:if>>내용</option>
				</select>
			
				<input type="text" id="searchKey" name="searchKey" value="${map.searchKey!=null?map.searchKey:''}"/>
				<input type="submit" value="검색">			
			</form>
		</div>

		<div class="notice-list">
			<c:forEach var="notice" items="${list }">
				<div class="list-item">
					<div class="no">${notice.notice_no}</div>
					<div class="title"><a href="${path }/notice/noticeView?notice_no=${notice.notice_no}">${notice.title }</a></div>
					<div class="date">${notice.notice_date }</div>
				</div>
         	</c:forEach> 
		</div>

		<div id="pageBar" class="notice-bottom">
				${pageBar }
		</div>

	</div>
>>>>>>> branch 'ljb' of https://github.com/connect-job/ConnectJob.git
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>