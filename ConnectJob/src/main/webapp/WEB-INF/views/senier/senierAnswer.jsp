<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>



<section>
	<div id="company-container">

		<div class="company-top">선배와의 대화</div>
		<div class="company-middle">
			<div id="company-location">후배에게 답변하기</div>

			<div id="company-location-detail">
				<button id="btn-senier"
					onclick="location.href='${path}/senierWrite.do'">선배에게 질문하기</button>

			</div>
		</div>
		<div class="company-content">



			<c:forEach var="sen" items="${list}" varStatus="vs">
				<div>
					제목
					<h2>${sen.sTitle}</h2>
				</div>
				<div>
					질문유형
					<c:forEach items="${sen.qType}" var="type" varStatus="vs">
								${type}
							</c:forEach>
				</div>
				<br />
				<br />

				<div>내용 ${sen.sContent}</div>
			</c:forEach>





			<h3>후배에게 답변하기</h3>




			<form method="post" name="comment-frm" class="form-inline"
				onsubmit="return fn_comment_confirm()">


				<div style="display: inline-block;">
					<textarea name="cContent" cols="80" rows="5" maxlength="2000"
						placeholder="후배에게 성의있는 답변부탁드려요"></textarea>
					<input type="hidden" name="cNo" />
					<input type="hidden" name="cWriter" />
				</div>

				<div style="display: inline-block;">
					<input type="button" id="commentAjaxInput" value="댓글등록" />
				</div>


				<div id="comment-message"></div>
			</form>





			<script>
                
	                $.ajax({  
	        			url: "${path}/senier/comAjaxList.do",
	        			success: function(data) {
	        				$("textarea").val("");
	        				$("#comment-space").html(data);
	        				
	        			},
	        			error: function(request, status, error) {
	        				
	        			}
	        		});
                

               $("#commentAjaxInput").click(function() {
            	   var comment = $('textarea[name=cContent]').val();
                     
	                 if(comment.trim().length == 0) {
	                     $('#comment-message').html("<div style='display: inline-block; width: 700px;'><span>댓글 내용을 입력해주세요!</span></div>");
	                 }
               

            		$.ajax({  
            			url: "${path}/senier/comWrite.do",
            			type: "post",
            			data: "cContent=" + comment + "&cWriter=${loginMember.p_id}",
            			/* dataType: "json", */
            			success: function(data) {
            				var Ca = /\+/g;
            				var resultData = decodeURIComponent(data.replace(Ca, " "));
            				alert(resultData);
            				window.location.reload();
            				
	        				$("#comment-space").html(data);
            			},
            			error: function(request, status, error) {
            				
            			}
            		});
                });
                 
          
                </script>




			<h3>선배들의 답변</h3>

			<div id="comment-space"></div>


		</div>

	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>