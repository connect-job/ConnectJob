<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
	$('#logo').hide();
	$('#searchfrm').hide();
	$('header').css("height","90px");
	$('header').css("background","none");
	$('header').hover(function() {
		$(this).css("background-color","#2c3142c5");
	});
	$('header').mouseleave(function() {
		$(this).css("background","none");
	});
	
	$(window).scroll(function () { 
        var sc = $(document).scrollTop();

        if(sc>150) {
        	$('header').css("background-color","#2c3142c5");
        	$('#logo').show();
        	$('header').css("height","120px");
        } else {
        	$('header').css("background","none");
        	$('#logo').hide();
        	$('header').css("height","90px");
        }
		});
	
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



<%@ include file="/WEB-INF/views/common/footer.jsp" %>


