<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
	$('#logo').hide();
	$('#searchfrm').hide();
	$('header').css("height","100px");
	$('header').css("background-color","#2c3142c7");
</script>

    <section id="index">
        <div id="index-container">
				<img src="${path }/resources/images/index-text.png"><br>
				<div class="index">
					<div class="index-search">
						<img src="${path }/resources/images/icon-search.png" width="14px"><input type="search" id="search" placeholder="기업을 검색해보세요" autocomplete="off" autofocus/>
					</div>
					<div id="index-search-result"></div>
				</div>
			</div>
        
        <script>
	        function fn_keywordCheck(no) {
	    		location.href="${path}/company/companyView.do?no=" + no;
	    		$('#index-search-result').css("display","none");
	    	}
        
        
        	$(function() {
        		$.ajax({
        			url: '${path}/company/companyCount.do',
        			dataType: 'html',
        			success: function(data) {
        				      $('#counter').html(data);
        			}
        		});
        		
        		
    			var result = $('#index-search-result');
        		
        		$('#search').keyup(function () {
        			var keyword = $('#search').val();
        			$.ajax({
        				url: '${path}/company/searchCompany.do?keyword='+ keyword,
        				type: 'POST',
        				dataType: 'text',
        				success: function(data) {
        					var Ca = /\+/g;
							var resultSet = decodeURIComponent(data.replace(Ca, " "));
        					console.log(resultSet);
							result.css("display","block");
        					result.empty();
        					result.html(resultSet);
        				}
        			});
        		});
        		
        		/* $('#search').blur(function() {
        			result.css("display","none");
        		}) */
        		$("#loginModal").modal({
                    fadeDuration: 100
                  });
        		
        	});
        	
        </script>
    </section>

    <footer>
        <div id="footer-container">
            <div class="footer-top">
                <ul>
                    <li>이용약관</li>
                    <li onclick="location.href='${path}/privacyPolicy.do'">개인정보처리방침</li>
                    <li>이메일무단수집거부</li>
                    <li>자주묻는질문</li>
                </ul>
            </div>
           <div class="footer-middle">
                커넥트잡 (ConnectJob)&nbsp;&nbsp;&nbsp;사업자등록번호 123-45-78910&nbsp;&nbsp;&nbsp;
                서울 강남 제2019-01호&nbsp;&nbsp;&nbsp;
                서울특별시 강남구 역삼동 커넥트빌딩
            </div>
            
            <div class="footer-bottom">
                    Copyright (C) 2019 CONNECT JOB All Rights Reserved.
                    <br><br><br><br>
            </div>
        </div>
    </footer>
</body>
</html>



