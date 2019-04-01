<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>



<section>
        <div id="company-container">
            
            <div class="company-top">
             선배와의 대화
            </div>
            <div class="company-middle">
                <div id="company-location">
                                후배에게 답변하기
                   
                </div>
                 
                <div id="company-location-detail">
                   <button id="btn-senier" onclick="location.href='${path}/senierWrite.do'">선배에게 질문하기</button>
                  
                </div>
            </div>
            <div class="company-content">
            
          
            	
            	<c:forEach var="sen" items="${list}" varStatus="vs">
            	<div>
            		제목 ${sen.sTitle}
            	</div>
            	<div>
            		질문유형 	<c:forEach items="${sen.qType}" var="type" varStatus="vs">
								${type}
							</c:forEach>
            	</div>

            	<div>
            		내용 ${sen.sContent}
            	</div>
            	</c:forEach>
            	
          
                 
                 
                 
                 <h3>후배에게 답변하기</h3>
                <textarea cols="50" maxlength="2000" rows="2" placeholder="후배에게 성의있는 답변부탁드려요"></textarea>
                
                <h3>선배들의 답변</h3>
                
                
				<dl>
					<dt>
						<strong>직종 선배</strong>  
					</dt>
					<dd>
						본인 자소서나 포트폴리오를 중요 정보는 가린 후<br />온라인에서 평가 받거나 선배나 먼저 취업한 친구들에게
						보여주고 평가를 받아보세요. 지금은 뼈있는 충고나 쓴소리를 해줄 수 있는 사람이 더 필요해보이네요. 제 친구 중에도
						구직활동만 3년넘게 한 친구도 있어요. 희망 잃지마시고 좋은 결과 있으시길 바랄게요~
					</dd>
				</dl>


			
                
            </div>
            
        </div>
    </section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>