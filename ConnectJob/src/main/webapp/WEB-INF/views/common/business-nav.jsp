<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param value="" name="pageTitle"/>
</jsp:include>

<section>
    <div>
        <ul>
            <li class="menu">
                <a><img src="" alt="채용공고"/></a>
                <ul class="hide">
					<li><a href="${path }/hireNotiAdd.do">채용공고등록</a></li>
                    <li><a href="#">전체공고</a></li>
                    <li><a href="#">진행 중 공고</a></li>
                    <li><a href="#">대기 중 공고</a></li>
                    <li><a href="#">대기 중 공고</a></li>
                    <li><a href="#">마감 된 공고</a></li>
                </ul>
            </li>
     
            <li class="menu">
                <a><img src="" alt="인재관리"/></a>
                <ul class="hide">
                    <li><a href="#">전체 인재정보</a></li>
                    <li><a href="#">자사 지원 인재정보</a></li>
                    <li><a href="#">공개 인재정보</a></li>
                    <li><a href="#">매칭 인재정보</a></li>
                </ul>
            </li>

            <li class="menu">
                <a><img src="" alt="인재관리"/></a>
                <ul class="hide">
                    <li><a href="#">기업정보수정</a></li>
                    <li><a href="#">담당자 정보 수정</a></li>
                    <li><a href="#">비밀번호 변경</a></li>
                </ul>
            </li>

            <li class="menu">
                <a><img src="" alt="기업리뷰"/></a>
                <ul class="hide">
                    <li><a href="#">기업 리뷰 조회</a></li>
                </ul>
            </li>
        </ul>
    </div>
</section>
    
    <style>
        .menu a{cursor:pointer;}
        .menu .hide{display:none;}
    </style>
    
    
    <script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".menu>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>

