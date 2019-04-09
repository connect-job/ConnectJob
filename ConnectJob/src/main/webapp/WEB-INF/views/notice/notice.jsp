<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
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
</script>

 <section>    
    	   	  	
 	<table>
		<tr>            	
			<td>
				<input type="button" value="글쓰기" onclick="location.href='${path}/notice/noticeForm'"/>
			</td>
        </tr>                        
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
              
	
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>