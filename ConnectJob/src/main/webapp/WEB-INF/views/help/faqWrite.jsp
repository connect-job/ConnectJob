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
            FAQ
        </div>

        <div class="senier-subTitle">
            <div id="left">자주묻는질문</div>
            <div id="right"></div>
        </div>

        <div class="senier-middle">
            <form action="${path}/help/faq/FaqWriteEnd.do" method="post" onsubmit="return validate();">
                <div id="senier-write-container">
                	
                    
                    <div class="write-title">
                        <div class="left">제목</div>
                        <div class="right">
                            <input name="fTitle" placeholder="질문을 입력해주세요"/>
                        </div>
                    </div>
                    <div class="write-content">
                        <div class="left">내용</div>
                        <div class="right">
                            <textarea id="editor" name="fContent" placeholder="구체적인 내용을 입력해주세요"></textarea>
                        </div>
                    </div>
                    <input type="hidden" name="pId" value="${loginMember.p_id }" />
                    <div class="write-btn"><button type="submit">질문하기</button></div>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
    ClassicEditor
        .create(document.querySelector('#editor'))
        .catch(error => {
            console.error(error);
        });
    
    

    
   

</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>