<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp" %>



<section>
    <div id="senier-container">

        <div class="senier-top">
          1:1문의
        </div>

  	<c:if test="${loginMember != null}">
        <div class="senier-subTitle">
            <div id="left"></div>
            <div id="right"><button id="btn-service" onclick="location.href='${path}/help/myInquiry.do'">나의문의내역</button></div>
        </div>
	</c:if>
        <div class="senier-middle">
            <form action="${path}/help/inquiryWriteEnd.do" method="post" onsubmit="return validate();">
                <div id="senier-write-container">
                    <div class="write-cate">
                        <div class="left">문의종류</div>
                        <div class="right">
                            <input type="radio" name="iType" id="radio1" value="서비스이용문의"><label for="radio1">서비스이용문의</label>
                            <input type="radio" name="iType" id="radio2" value="오류신고"><label for="radio2">오류신고</label>
                            <input type="radio" name="iType" id="radio4" value="서비스칭찬"><label for="radio4">서비스칭찬</label>
                            <input type="radio" name="iType" id="radio5" value="서비스제안"><label for="radio5">서비스제안</label>
                        </div>
                    </div>
                    <div class="write-title">
                        <div class="left">제목</div>
                        <div class="right"><input type="text" name="iTitle" placeholder="제목을 입력해주세요"></div>
                    </div>
                    <div class="write-content">
                        <div class="left">내용</div>
                        <div class="right"><textarea name="iContent" placeholder="구체적인 내용을 입력해주세요"></textarea></div>
                        <input type="hidden" name="iWriter"  value="${loginMember.p_id}">
                    </div>
                    <div class="write-btn"><button type="submit">문의하기</button></div>
                </div>
            </form>
        </div>
    </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>