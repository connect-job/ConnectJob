<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<section>
    <div id="senier-container">

        <div class="senier-top">
            선배와의 대화
        </div>

        <div class="senier-subTitle">
            <div id="left">우리학교 동문의 취업고민과 선배의 답변이에요</div>
            <div id="right"><button id="btn-senier" onclick="location.href='${path}/senierWrite.do'">선배에게 질문하기</button></div>
        </div>

        <div class="senier-middle">
            <div class="senier-item">
                <div class="item-cate">13학번 회사고민</div>
                <div class="item-title">이력서 열람 후 연락까지</div>
                <div class="item-content">이력서를 넣고 열람한 회사들이 면접연락이 보통 언제쯤......</div>
                <div class="item-info">7일전　답변 7개　조회수 382</div>
            </div>
            <div class="senier-item">
                <div class="item-cate">13학번 회사고민</div>
                <div class="item-title">이력서 열람 후 연락까지</div>
                <div class="item-content">이력서를 넣고 열람한 회사들이 면접연락이 보통 언제쯤......</div>
                <div class="item-info">7일전　답변 7개　조회수 382</div>
            </div>
            <div class="senier-item">
                <div class="item-cate">13학번 회사고민</div>
                <div class="item-title">이력서 열람 후 연락까지</div>
                <div class="item-content">이력서를 넣고 열람한 회사들이 면접연락이 보통 언제쯤......</div>
                <div class="item-info">7일전　답변 7개　조회수 382</div>
            </div>
            <div class="senier-item">
                <div class="item-cate">13학번 회사고민</div>
                <div class="item-title">이력서 열람 후 연락까지</div>
                <div class="item-content">이력서를 넣고 열람한 회사들이 면접연락이 보통 언제쯤......</div>
                <div class="item-info">7일전　답변 7개　조회수 382</div>
            </div>
            <div class="senier-item">
                <div class="item-cate">13학번 회사고민</div>
                <div class="item-title">이력서 열람 후 연락까지</div>
                <div class="item-content">이력서를 넣고 열람한 회사들이 면접연락이 보통 언제쯤......</div>
                <div class="item-info">7일전　답변 7개　조회수 382</div>
            </div>
            <div class="senier-item">
                <div class="item-cate">13학번 회사고민</div>
                <div class="item-title">이력서 열람 후 연락까지</div>
                <div class="item-content">이력서를 넣고 열람한 회사들이 면접연락이 보통 언제쯤......</div>
                <div class="item-info">7일전　답변 7개　조회수 382</div>
            </div>
        </div>
    </div>
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





