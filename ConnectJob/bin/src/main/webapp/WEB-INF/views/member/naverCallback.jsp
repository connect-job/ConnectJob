<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.connect.job.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<section>

<script type="text/javascript">
  var naver_id_login = new naver_id_login("HcAcv4cf7ZTp1x4Kkbdb", "BlbSoZehT6");

  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  function naverSignInCallback() {
	var id = naver_id_login.getProfileData('id');
  	var email = naver_id_login.getProfileData('email');
    var name = naver_id_login.getProfileData('nickname');
    
  	$.ajax({
		url: '${path}/member/isSns.do?p_id=test&is_sns=naver&naver_id=' + id,
	    success: function(data) {
	    	if(data=='1') {
	        	location.href="${path}/member/memberLoginSns.do?is_sns=naver&naver_id=" + id;
	        } else {
	            location.href="${path}/member/memberEnrollSns.do?p_id=" + email + "&is_sns=naver&naver_id=" + id + "&p_name=" + name;
	        }
	    }
	});
  }
</script>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>





