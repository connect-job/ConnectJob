<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.connect.job.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section>

	<div id="senier-container">
		<div class="senier-top">
			선배와의 대화
		</div>


		<div class="senier-subTitle">
			<div id="left">우리 직종의 취업고민과 선배의 답변이에요</div>
			<div id="right">
				<c:if test="${loginMember!=null}">
					<c:if test="${loginMember.p_id == s.pId }"> 
								<button id="btn-senier" onclick="location.href='${path}/senierUpdate.do?no=${s.sNo}'">수정</button>
								<button id="btn-senier" onclick="location.href='${path}/senierDelete.do?sNo=${s.sNo}'">삭제</button>
					</c:if>
				</c:if>
				
			<button id="btn-senier" onclick="location.href='${path}/senierWrite.do'">선배에게 질문하기</button>
			</div>
		</div>



		<div class="senier-middle">


				<div class="middle-subtitle" style="font-size: 18px;">
						<i class="fab fa-quora"></i> ${s.sTitle}
					</div>

				<div class="middle-subtitle">
					#${s.qType}　|　${s.sCate}　|　${s.sDate}
				</div>
				

				<div class="middle-content">
					<div class="right">${s.sContent}</div>
				</div>

			<br><br><br>

			<div class="senier-top">
					후배에게 답변하기
			</div>

			<div class="senier-subTitle">
				<div id="left">후배에게 성의있는 답변 부탁 드려요</div>
				<div id="right"></div>
			</div>

			<br><br><br>

			<div class="senier-comment">
				<form method="post" name="commentFrm" class="form-inline" action="${path}/senier/comWrite.do">
					<div class="comment-write">
						<div class="left">
							<textarea name="cContent" maxlength="2000" placeholder="후배에게 성의있는 답변부탁드려요"></textarea>
							<input type="hidden" id="sNo" name="sNo" value="${s.sNo }"/>
							<input type="hidden" name="cWriter" value="${loginMember.p_id}" />
						</div>
						<div class="right">
							<input type="button" id="commentAjaxInput" value="댓글등록" />
						</div>
					</div>
				</form>
			</div>

			<br><br><br>

			<div class="senier-top">
					선배들의 답변
			</div>
			<div id="comment-space">
			</div>

		</div>
	</div>





	<script>
		$.ajax({
			url: "${path}/senier/comAjaxList.do?no=${s.sNo}",
			success: function (data) {
				$("textarea").val("");
				$("#comment-space").html(data);

			},
			error: function (request, status, error) {

			}
		});


		$("#commentAjaxInput").click(function () {
			var comment = $('textarea[name=cContent]').val();

			if (comment.trim().length == 0) {
				alert("댓글 내용을 입력해주세요!");
				return false;
			}

			commentFrm.submit();

	
		});
	</script>

</section>

<script>
	var cNo;
	var content;
	var sNo=$('#sNo').val();

$(document).on('click', '.updateBtn', function() {
	cNo = $('#cNo').val();
	content = $(this).parent().children('.content-container').text();
	$(this).parent().children('.content-container').html('<input type="text" id="cContent" name="cContent" value="' + content + '"/>');
	$(this).text('수정완료');
	$(this).attr("class","afterUpdate");
});

$(document).on('click', '.deleteBtn', function() {
	cNo = $('#cNo').val();
	if(confirm('삭제 하시겠습니까?')) {
		location.href='${path}/sCommentDelete.do?cNo=' + cNo +'&sNo=' + sNo;
	} else {
		return;
	}
});

$(document).on('click', '.afterUpdate', function() {
	var cContent = $('#cContent').val();
	if(confirm('수정 하시겠습니까?')) {
		location.href='${path}/sCommentUpdate.do?cContent=' + cContent + '&cNo=' + cNo +'&sNo=' + sNo;
	} else {
		return;
	}
});



	function fn_ajaxPaging(cPage) {
		var space = $('#comment-space');

		$.ajax({
			
			url: '${path}/senier/comAjaxList.do?no=${s.sNo}', 
			data: { "cPage": cPage },
			dataType: "html",
			success: function (data) {
				var Ca = /\+/g;
				var resultSet = decodeURIComponent(data.replace(Ca, " "));
				space.empty();
				space.html(resultSet);
			}
		});

	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>