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
            선배에게 질문하기
        </div>

        <div class="senier-subTitle">
            <div id="left">동문선배에게 취업고민 상담하기</div>
            <div id="right"></div>
        </div>

        <div class="senier-middle">
            <form action="${path}/senierWriteEnd.do" method="post" onsubmit="return validate();">
                <div id="senier-write-container">
                    <div class="write-cate">
                        <div class="left">질문유형</div>
                        <div class="right">
                            <input type="radio" name="cate" id="radio1"><label for="radio1">회사</label>
                            <input type="radio" name="cate" id="radio2"><label for="radio2">직무</label>
                            <input type="radio" name="cate" id="radio3"><label for="radio3">업계/산업</label>
                            <input type="radio" name="cate" id="radio4"><label for="radio4">진로</label>
                            <input type="radio" name="cate" id="radio5"><label for="radio5">기타</label>
                        </div>
                    </div>
                    <div class="write-title">
                        <div class="left">제목</div>
                        <div class="right"><input type="text" placeholder="궁금한 질문을 입력해주세요"></div>
                    </div>
                    <div class="write-content">
                        <div class="left">내용</div>
                        <div class="right"><textarea placeholder="구체적인 내용을 입력해주세요"></textarea></div>
                    </div>
                    <div class="write-btn"><button type="submit">질문하기</button></div>
                </div>
            </form>
        </div>
    </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>