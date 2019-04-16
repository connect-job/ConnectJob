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
            <div id="left">직종 선배에게 취업고민 상담하기</div>
            <div id="right"></div>
        </div>

        <div class="senier-middle">
            <form action="${path}/senierWriteEnd.do" method="post" onsubmit="return check();">
                <div id="senier-write-container">
                	<div>
                        <div class="left">직종분류</div>
                        <div class="right"> 

            				 <select id="hopeJobArea" name="sCate">
								<option value="" disabled="disabled">직종선택</option>
								<option value="웹 개발자">웹 개발자</option>
								<option value="서버 개발자">서버 개발자</option>
								<option value="시스템개발">시스템개발</option>
								<option value="프론트엔드 개발자">프론트엔드 개발자</option>
								<option value="자바 개발자">자바 개발자</option>
								<option value="파이썬 개발자">파이썬 개발자</option>
								<option value="안드로이드 개발자">안드로이드 개발자</option>
								<option value="IOS개발자">IOS개발자</option>
								<option value="데이터 엔지니어">데이터 엔지니어</option>
								<option value="시스템,네트워크 관리자">시스템,네트워크 관리자</option>
								<option value="node.js 개발자">node.js 개발자</option>
								<option value="php 개발자">php 개발자</option>
								<option value="DevOps / 시스템 관리자">DevOps / 시스템 관리자</option>
								<option value="C,C++개발자">C,C++개발자</option>
								<option value="개발 매니저">개발 매니저</option>
								<option value="데이터 사이언티스트">데이터 사이언티스트</option>
							</select>
							
                        </div>
                    </div>
                    
                    
                
                    <div class="write-cate">
                        <div class="left">질문유형</div>
                        <div class="right">
                            <input type="radio" name="qType" id="radio1" value="회사고민"><label for="radio1">회사고민</label>
                            <input type="radio" name="qType" id="radio2" value="직무고민"><label for="radio2">직무고민</label>
                            <input type="radio" name="qType" id="radio3" value="진로고민"><label for="radio4">진로고민</label>
                            <input type="radio" name="qType" id="radio4" value="기타고민"><label for="radio5">기타고민</label>
                        </div>
                    </div>
                    <div class="write-title">
                        <div class="left">제목</div>
                        <div class="right">
                            <input name="sTitle" placeholder="궁금한 질문을 입력해주세요"/>
                        </div>
                    </div>
                    <div class="write-content">
                        <div class="left">내용</div>
                        <div class="right">
                            <textarea id="editor" name="sContent" placeholder="구체적인 내용을 입력해주세요"></textarea>
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
    
    
    function check() {
    	
    	
    	 if($('#hopeJobArea').val()==""){
    	    	alert('직종을 선택해주세요');
    	     	return false;
    	    } 
    	 

	}
    
   

</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>