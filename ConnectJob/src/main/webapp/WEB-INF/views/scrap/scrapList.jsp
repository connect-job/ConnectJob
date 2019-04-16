<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<section id="resumeView">
   <div id="resume-container">
      <div class="resume-top">
         내 스크랩 관리
      </div>
      <div class="resume-content">
         · 스크랩한 기업과 채용공고를 확인할 수 있습니다.<br>
         · 목록을 클릭하시면 해당페이지로 이동합니다.
      </div>
      
      <div class="resume-sub">
         <div class="sub-item">
            <div class="item-title">전체 스크랩</div>
            <div class="item-content"><a href="#AllScrapTitle">${cpScrapCnt+hnScrapCnt }</a></div>
         </div>
         <div class="sub-item">
            <div class="item-title">기업 스크랩</div>
            <div class="item-content"><a href="#CPScrapTitle">${cpScrapCnt }</a></div>
         </div>
         <div class="sub-item">
            <div class="item-title">채용공고 스크랩</div>
            <div class="item-content"><a href="#HNScrapTitle">${hnScrapCnt }</a></div>
         </div>
      </div>
      
      <div class="resume-top" id="AllScrapTitle">
         내 스크랩 목록
      </div>
      <div id="resume-list">

            <div class="list-item-top">
                  <div class="item1"  style="width: 20%">구분</div>
                  <div class="item2" style="width: 40%">회사명</div>
                  <div class="item3" style="width: 20%">진행중 공고</div>
                  <div class="item4">삭제</div>
               </div>
         <c:choose>
            <c:when test="${not empty cpList or not empty hnList}">
                  <c:forEach items="${cpList }" var="cpList">
                        <div class="list-item">
                              <div class="item1" style="width: 20%">기업 스크랩</div>
                              <div class="item2" style="width: 40%"><a href="${path }/company/companyView.do?no=${cpList.companyNo}">${cpList.companyName }</a></div>
                              <div class="item3" style="width: 20%">1개</div>
                              <div class="item4"><button type="button" onclick="location.href='${path}/scrap/deleteCPScrap.do?scrapNo=${cpList.scrapNo }&companyNo=0'">삭제</button></div>
                        </div>
                        
                  </c:forEach>
                  <c:forEach items="${hnList }" var="hnList">
                  <div class="list-item">
                              <div class="item1" style="width: 20%">채용공고 스크랩</div>
                              <div class="item2" style="width: 40%"><a href="${path }/company/companyView.do?no=${hnList.companyNo}">${hnList.companyName }</a></div>
                              <div class="item3" style="width: 20%"><a href="${path }/hireNotiView.do?no=${hnList.hnSeq}">${hnList.hnTitle }</a></div>
                              <div class="item4" ><button type="button" onclick="location.href='${path}/scrap/deleteHNScrap.do?scrapNo=${hnList.scrapNo}&hnSeq=0'">삭제</button></div>
                           </div>
                  </c:forEach>
            </c:when>
            <c:otherwise>
            
               스크랩 내역이 없습니다.
            </c:otherwise>
          </c:choose>
         
      </div>
      
      <div class="resume-top" id="CPScrapTitle">
         기업 스크랩 목록
      </div>
      <div id="resume-list">

            <div class="list-item-top">
                  <div class="item1"  style="width: 20%">구분</div>
                  <div class="item2" style="width: 40%">회사명</div>
                  <div class="item3" style="width: 20%">진행중 공고</div>
                  <div class="item4">삭제</div>
               </div>
         <c:choose>
            <c:when test="${not empty cpList}">
                  <c:forEach items="${cpList }" var="cpList">
                        <div class="list-item">
                              <div class="item1" style="width: 20%">기업 스크랩</div>
                              <div class="item2" style="width: 40%"><a href="${path }/company/companyView.do?no=${cpList.companyNo}">${cpList.companyName }</a></div>
                              <div class="item3" style="width: 20%">1개</div>
                              <div class="item4"><button type="button" onclick="location.href='${path}/scrap/deleteCPScrap.do?scrapNo=${cpList.scrapNo }&companyNo=0'">삭제</button></div>
                           </div>
                  </c:forEach>
                  
            </c:when>
            <c:otherwise>
               스크랩 내역이 없습니다.
            </c:otherwise>
         </c:choose> 
         
      </div>
      
      <div class="resume-top" id="HNScrapTitle">
         채용공고 스크랩 목록
      </div>
      <div id="resume-list">

            <div class="list-item-top">
                  <div class="item1"  style="width: 12%">구분</div>
                  <div class="item2"  style="width: 37%">공고명</div>
                  <div class="item4" style="width: 20%">지원</div>
                  <div class="item5" style="width: 15%">삭제</div>
               </div>
         <c:choose>
            <c:when test="${not empty hnList}">
                  <c:forEach items="${hnList }" var="hnList">
                  <div class="list-item">
                              <div class="item1" style="width: 10%">채용공고 스크랩</div>
                              <div class="item2" style="width: 40%; padding-top:3px">
                              <a href="${path }/hireNotiView.do?no=${hnList.hnSeq}">${hnList.hnTitle }</a><br>
                              <a href="${path }/company/companyView.do?no=${hnList.companyNo}">${hnList.companyName }</a></div>
                              <div class="item4" style="width: 22%"><button type="button">지원하기</button></div>
                              <div class="item5" style="width: 15%"><button type="button" onclick="location.href='${path}/scrap/deleteHNScrap.do?scrapNo=${hnList.scrapNo}&hnSeq=0'">삭제</button></div>
                           </div>
            </c:forEach>
            </c:when>
            <c:otherwise>
               스크랩 내역이 없습니다.
            </c:otherwise>
         </c:choose> 
         
      </div>
         
   </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>