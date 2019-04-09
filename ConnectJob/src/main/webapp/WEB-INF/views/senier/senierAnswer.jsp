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
			<div id="right"><button id="btn-senier" onclick="location.href='${path}/senierWrite.do'">선배에게 질문하기</button></div>
		</div>



		<div class="senier-middle">
			<c:forEach var="sen" items="${list}" varStatus="vs">
				<div class="middle-content">
					<div class="left">질문유형</div>
					<div class="right">
						<c:forEach items="${sen.qType}" var="type" varStatus="vs">
							${type}
						</c:forEach>
					</div>
				</div>
				<div class="middle-content">
					<div class="left">제목</div>
					<div class="right">${sen.sTitle}</div>
				</div>
				<div class="middle-content">
					<div class="left">내용</div>
					<div class="right">${sen.sContent}</div>
				</div>
			</c:forEach>

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
				<form method="post" name="comment-frm" class="form-inline" onsubmit="return fn_comment_confirm()">
					<div class="comment-write">
						<div class="left">
							<textarea name="cContent" maxlength="2000" placeholder="후배에게 성의있는 답변부탁드려요"></textarea>
							<input type="hidden" name="cNo" />
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
			<div id="comment-space"></div>

		</div>
	</div>

	<script>
		$.ajax({
			url: "${path}/senier/comAjaxList.do",
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
				$('#comment-message').html("<div style='display: inline-block; width: 700px;'><span>댓글 내용을 입력해주세요!</span></div>");
			}


			$.ajax({
				url: "${path}/senier/comWrite.do",
				type: "post",
				data: "cContent=" + comment + "&cWriter=${loginMember.p_id}",
				/* dataType: "json", */
				success: function (data) {
					var Ca = /\+/g;
					var resultData = decodeURIComponent(data.replace(Ca, " "));
					alert(resultData);
					window.location.reload();

					$("#comment-space").html(data);
				},
				error: function (request, status, error) {

				}
			});
		});
	</script>

</section>

<script>
	function fn_ajaxPaging(cPage) {
		var space = $('#comment-space');

		$.ajax({
			url: '${path}/senier/comAjaxList.do',
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