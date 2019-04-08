<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<section>	
	<form name="noticeFrm" action="${path }/notice/insertNotice" method="post">
    	<table>
         	<tr>
            	<th>작성자</th>
            	<td>                
               		<input type="text" name="writer" value="관리자" readonly/>
            	</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                 	<input type="text" name="title" placeholder="제목을 입력하세요"/>                 	
                </td>
            </tr>             
            <tr>
                <th>내용</th>
                <td>
                 	<textarea name="content" id="content"></textarea>                 	
                </td>
            </tr>                     
        </table>
      
    	<div>
        	<input type="submit" value="등록" />
        	<input type="button" value="취소" onclick="fn_cancle()"/>
    	</div>
    </form>
</section>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>