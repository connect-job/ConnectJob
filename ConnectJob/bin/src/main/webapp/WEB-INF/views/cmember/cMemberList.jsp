<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param value="" name="pageTitle"/>
</jsp:include>
<section>
	<form action="${path}/cmemberList.do">
        <div>
            <div>구분</div><div><input type="text"></div>
            <div>기업명</div><div><input type="text"></div>
            <div>사업자번호</div><div><input type="text"></div>
            <div>담당자이름</div><div><input type="text"></div>
            <div>담당자연락처</div><div><input type="text"></div>
            <div>기업연락처</div><div><input type="text"></div>
            <div>담당자이메일</div><div><input type="text"></div>
            <div>가입일</div><div><input type="text"></div>
        </div>
    </form>
    <br/>
    <table>
    	<tr>
    		<th>구분</th>
    		<th>기업명</th>
    		<th>사업자번호</th>
    		<th>담당자이름</th>
    		<th>담당자연락처</th>
    		<th>기업연락처</th>
    		<th>담당자이메일</th>
    		<th>가입일</th>
    	</tr>
    	<c:forEach items="${list }" var="cmemberList">
    		<tr>
    			<td>${cmemberList.DIVD }</td>
    			<td>${cmemberList.COMPANY_NAME }</td>
    			<td>${cmemberList.CMEMBERBNUM }</td>
    			<td>${cmemberList.CMEMBERNAME }</td>
    			<td>${cmemberList.CMEMBERPHONE }</td>
    			<td>${cmemberList.CMEMBERCPHONE }</td>
    			<td>${cmemberList.CMEMBEREMAIL }</td>
    			<td>${cmemberList.CMEMBERENROLL }</td>
    		</tr>
    	</c:forEach>
    </table>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>