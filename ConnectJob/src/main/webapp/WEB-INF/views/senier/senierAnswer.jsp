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
            		제목<h2>${sen.sTitle}</h2>
            	</div>
            	<div>
            		질문유형 	<c:forEach items="${sen.qType}" var="type" varStatus="vs">
								${type}
							</c:forEach>
            	</div>
            	<br/><br/>

            	<div>
            		내용 ${sen.sContent}
            	</div>
            	</c:forEach>
            	
          
                 
                 
                 
                 <h3>후배에게 답변하기</h3>
 
 
 
               
          <form  method="post" name="comment-frm" class="form-inline" onsubmit="return fn_comment_confirm()">
			
			<label class="sr-only" for="comment">Comment</label>
			
				<div style="display:inline-block;">
					<textarea name="cContent"  cols="80" rows="5" maxlength="2000" placeholder="후배에게 성의있는 답변부탁드려요"></textarea>
					<input type="hidden" name="cNo" />
							<!-- <input type="hidden" name="cContent" value=""/> -->
					<input type="hidden" name="cWriter"/>
				</div>
				
					<div style="display:inline-block;"><input type="button" id="commentAjaxInput" value="댓글등록" /></div>
				
		
			<div id="comment-message">
			</div>
		</form> 
               
               
               
               

               
               
                
                <script>
                
                
                 $(function() {
                	$("#commentAjaxInput").click(function() {
                		var comment = $('textarea[name=cContent]').val();
                         <%-- var logined = <%=logined %>; --%>
                            
                        if(comment.trim().length == 0) {
                            $('#comment-message').html("<div style='display: inline-block; width: 700px;'><span>댓글 내용을 입력해주세요!</span></div>");
                        }
                       /*  else if(logined == false) {
                            $('#comment-message').html("<div style='display: block; width: 700px;'><span>로그인후 코멘트작성이 가능합니다!</span></div>");
                        } */
                        else { 
                        	
            	            /* $('#message .modal-body').text("댓글을 등록 하시겠습니까?"); */
            	            $("#detail-modal-btn").css('display','none');
            	            $("#detail-confirm-btn").css('display','inline-block');
            	            $("#detail-cancel-btn").css('display','inline-block');
            	            $("#detail-confirm-btn").attr("onclick", "fn_comment_input_ajax()");
            				$('#message').modal();
                		} 
                	});
               }); 
                
                
                function fn_comment_input_ajax() {
                	
                	var formData = $('form[name=comment-frm]').serialize();
                	alert(2)
            		$.ajax({  
            			url: "${path}/senier/comWrite.do",
            			type: "post",
            			data: formData,
            			/* dataType: "json", */
            			success: function(data) {
            				alert(1)
            				/* $(".close").click(); */
            				$("textarea").val("");
            				$("#comment-space").html(data);
            				
            			},
            			error: function(request, status, error) {
            				
            			}
            		});
                }
                 
                
                
                
                
                
                
                 
                
                
                
                
                </script>
          
          
          
         
  <div class="modal fade" id="message">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">

        <div class="modal-header">
          <h3 class="modal-title">댓글을 등록 하시겠습니까?</h3> 		
        </div>
       

        <div class="modal-footer">
          <button type="button" id="detail-modal-btn"  data-dismiss="modal">확인</button>
          <button type="button" id="detail-confirm-btn"  style="display:none;">예</button>
          <button type="button" id="detail-cancel-btn"   style="display:none;">아니오</button>
        </div>
        
      </div>
    </div>
  </div>      
       
       
       <div id="comment-space"></div>         
                
                
                <h3>선배들의 답변</h3>
                
                
				<!-- <dl>
					<dt>
						<strong>직종 선배</strong>  
					</dt>
					<dd>
						본인 자소서나 포트폴리오를 중요 정보는 가린 후<br />온라인에서 평가 받거나 선배나 먼저 취업한 친구들에게
						보여주고 평가를 받아보세요. 지금은 뼈있는 충고나 쓴소리를 해줄 수 있는 사람이 더 필요해보이네요. 제 친구 중에도
						구직활동만 3년넘게 한 친구도 있어요. 희망 잃지마시고 좋은 결과 있으시길 바랄게요~
					</dd>
				</dl> -->


			
                
            </div>
            
        </div>
    </section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>