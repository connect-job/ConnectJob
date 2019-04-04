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
                <div id="left">우리 직종의 취업고민과 선배의 답변이에요</div>
                <div id="right"><button id="btn-senier" onclick="location.href='${path}/senierWrite.do'">선배에게 질문하기</button></div>
            </div>

            <div class="senier-middle">
                 <textarea cols="50" maxlength="2000" rows="2" placeholder="답변부탁드려요"></textarea>
                 
                 
                 <h3>후배에게 답변하기</h3>
 
                
        <table class="board_view">
                <tr>
                    <td>
                        <div>
                          
                            <textarea name="comment" rows="5" cols="90" name="com_contents" maxlength="2000" placeholder="후배에게 성의있는 답변부탁드려요"></textarea>
                            <p align="right" >
                            	<button id="commentAjaxInput" <%-- onclick="location.href='${path}/ttt.do'" --%>>등록</button>
                            </p>
                        </div>
                    </td>
                </tr>
        </table>
               
               <div id="comment-message">
				</div>
               
               
               
               
               
<%--     <form id="commentForm" name="commentForm" method="post">
     <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="" rows="5" cols="90" id="comment" name="comment" placeholder="후배에게 성의있는 답변부탁드려요"></textarea>
                            <br>
                            <div>
                                <a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="${result.code }" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        
        </div>
    </form>
</div> --%>
               
               
                
                <script>
                
                
                $(function() {
                	$("#commentAjaxInput").click(function() {
                		var comment = $('textarea[name=comment]').val();
                       <%--  var logined = <%=logined %>; --%>
                        
                        if(comment.trim().length == 0) {
                            $('#comment-message').html("<div style='display: inline-block; width: 700px;'><span>코멘트 내용을 입력해주세요!</span></div>");
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
            		$.ajax({
            		
            			url: "${path}/senier/comWrite.do",
            			type: "post",
            			data: formData,
            			dataType: "html",
            			success: function(data) {
            				/* $(".close").click(); */
            				
            				$("textarea").val("");
            				$("#comment-space").html(data);
            				
            			},
            			error: function(request, status, error) {
            				
            			}
            		});
                }
                
                
                
                
                
                
                
                 /* // 댓글 등록하기(Ajax)
                 
                function fn_comment(code){
                    
                    $.ajax({
                        type:'POST',
                        url : "<c:url value='/board/addComment.do'/>",
                        data:$("#commentForm").serialize(),
                        success : function(data){
                            if(data=="success")
                            {
                                getCommentList();
                                $("#comment").val("");
                            }
                        },
                        error:function(request,status,error){
                            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                       }
                        
                    });
                }
                 
                // 초기 페이지 로딩시 댓글 불러오기
                 
                $(function(){
                    
                    getCommentList();
                    
                });
                 
                
                 // 댓글 불러오기(Ajax)
                 
                function getCommentList(){
                    
                    $.ajax({
                        type:'GET',
                        url : "<c:url value='/board/commentList.do'/>",
                        dataType : "json",
                        data:$("#commentForm").serialize(),
                        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
                        success : function(data){
                            
                            var html = "";
                            var cCnt = data.length;
                            
                            if(data.length > 0){
                                
                                for(i=0; i<data.length; i++){
                                    html += "<div>";
                                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                                    html += data[i].comment + "<tr><td></td></tr>";
                                    html += "</table></div>";
                                    html += "</div>";
                                }
                                
                            } else {
                                
                                html += "<div>";
                                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                                html += "</table></div>";
                                html += "</div>";
                                
                            }
                            
                            $("#cCnt").html(cCnt);
                            $("#commentList").html(html);
                            
                        },
                        error:function(request,status,error){
                            
                       }
                        
                    });
                }  */
                
                
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