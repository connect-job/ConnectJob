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
            <form action="${path}/senierUpdateEnd.do?sNo=${s.sNo}" method="post" onsubmit="return validate();">
                <div id="senier-write-container">
                    <div class="write-cate">
                   	
                   	 <div>
                        <div class="left">직종분류</div>
                        <div class="right"> 
                                                                               
            				 <select id="hopeJobArea" name="sCate">
								<option value="" disabled="disabled">직종선택</option>
								<option value="웹 개발자" ${s.sCate=="웹 개발자"?"selected":""}>웹 개발자</option>
								<option value="서버 개발자" ${s.sCate=="서버 개발자"?"selected":""}>서버 개발자</option>
								<option value="시스템개발" ${s.sCate=="시스템개발"?"selected":""}>시스템개발</option>
								<option value="프론트엔드 개발자" ${s.sCate=="프론트엔드 개발자"?"selected":""}>프론트엔드 개발자</option>
								<option value="자바 개발자" ${s.sCate=="자바 개발자"?"selected":""}>자바 개발자</option>
								<option value="파이썬 개발자" ${s.sCate=="파이썬 개발자"?"selected":""}>파이썬 개발자</option>
								<option value="안드로이드 개발자" ${s.sCate=="안드로이드 개발자"?"selected":""}>안드로이드 개발자</option>
								<option value="IOS개발자" ${s.sCate=="IOS개발자"?"selected":""}>IOS개발자</option>
								<option value="데이터 엔지니어" ${s.sCate=="데이터 엔지니어"?"selected":""}>데이터 엔지니어</option>
								<option value="시스템,네트워크 관리자" ${s.sCate=="시스템/네트워크 관리자"?"selected":""}>시스템/네트워크 관리자</option>
								<option value="node.js 개발자" ${s.sCate=="node.js 개발자"?"selected":""}>node.js 개발자</option>
								<option value="php 개발자" ${s.sCate=="php 개발자"?"selected":""}>php 개발자</option>
								<option value="DevOps / 시스템 관리자" ${s.sCate=="DevOps / 시스템 관리자"?"selected":""}>DevOps / 시스템 관리자</option>
								<option value="C,C++개발자" ${s.sCate=="C/C++개발자"?"selected":""}>C/C++개발자</option>
								<option value="개발 매니저" ${s.sCate=="개발 매니저"?"selected":""}>개발 매니저</option>
								<option value="데이터 사이언티스트" ${s.sCate=="데이터 사이언티스트"?"selected":""}>데이터 사이언티스트</option>
							</select>
							
                        </div>
                    </div>
                    
                        <div class="left">질문유형</div> 
                        	
                        <div class="right">
                            <input type="radio" name="qType" id="radio1" value="회사고민" ${s.qType=="회사고민"? "checked" : "" }><label for="radio1">회사고민</label>
                            <input type="radio" name="qType" id="radio2" value="직무고민" ${s.qType=="직무고민"? "checked" : "" }><label for="radio2">직무고민</label>   
                            <input type="radio" name="qType" id="radio3" value="진로고민" ${s.qType=="진로고민"? "checked" : "" }><label for="radio3">진로고민</label>
                            <input type="radio" name="qType" id="radio4" value="기타고민" ${s.qType=="기타고민"? "checked" : "" }><label for="radio4">기타고민</label>
                        </div>
                        
                    </div>
                    <div class="write-title">
                        <div class="left">제목</div>
                        <div class="right"><input type="text" name="sTitle" autocomplete="off" placeholder="궁금한 질문을 입력해주세요" value="${s.sTitle}"></div>
                    </div>
                    <div class="write-content">
                        <div class="left">내용</div>
                        <div class="right"><textarea id="editor" name="sContent" placeholder="구체적인 내용을 입력해주세요">${s.sContent}</textarea></div>
                    </div>
                    <input type="hidden" name="pId" value="${loginMember.p_id }"/>
                    <div class="write-btn"><button type="submit">수정하기</button></div>
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
    
    <script>
    	$(function() {
    		$('#hopeJobArea').
		})	
    
    </script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>