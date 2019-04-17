<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section>
<div class="biz-left">
        <div id="biz-container">
                <!-- ------------------ -->
                <div class="biz-left">
                    <div class="menu-top">
                        기업페이지
                    </div>
                    <ul>
                        <li class="menu">
                            채용공고<span class="icon"><i class="fas fa-sort-down"></i></span>
                            <ul class="hide">
                                <li><a href="${path }/hireNotiAdd.do">채용공고등록</a></li>
                                <li><a href="${path }/hireNotiAllList.do?id=${loginCMember.cMemberId}">전체공고</a></li>
                            </ul>
                        </li>
        
                        <li class="menu">
                            인재관리<span class="icon"><i class="fas fa-sort-down"></i></span>
                            <ul class="hide">
                                <li><a href="${path }/AllResume.do">전체 인재정보</a></li>
                                <li><a href="${path }/comResume.do">자사 지원 인재정보</a></li>
                                <li><a href="${path }/openResume.do">공개 인재정보</a></li>
                            </ul>
                        </li>
        
                        <li class="menu">
                            기업정보수정<span class="icon"><i class="fas fa-sort-down"></i></span>
                            <ul class="hide">
                                <li><a href="${path }/updateI.do">기업정보수정</a></li>
                                <li><a href="${path }/cMemberUpdate.do">담당자 정보 수정</a></li>
                            </ul>
                        </li>
        
                    </ul>
                </div>



                <div class="biz-right">
                        <div class="biz-title">기업정보수정</div>
            
                        <div>
                                <form action="${path}/updateCom.do">
                                <div>기업명<input type="text"/></div>
                                <div>기업 우편번호<input type="text"/></div>
                                <div>기업 지번주소<input type="text"/></div>
                                <div>기업 도로명주소<input type="text"/></div>
                                <div>기업 상태(법인/개인)</div>
                                <div>기업 산업코드</div>
                                <div>기업 산업분류</div>
                                <div>기업 설립일자</div>
                                <div>기업 전체인원</div>
                                <div>기업 국민연금 납부금액(월)</div>
                                <div>기업 입사자</div>
                                <div>기업 퇴사자</div>
                                <div>기업 사업자등록번호</div>
                                <div><button>수정</button></div>
                                </form>
                            </div>

            
                    </div>

</section>


<script>
        $(document).ready(function () {
            $(".menu").click(function () {
                var submenu = $(this).children('ul');
                if (submenu.is(":visible")) {
                    submenu.slideUp();
                    $(this).children('.icon').html("<i class='fas fa-sort-down'></i>");
                } else {
                    submenu.slideDown();
                    $(this).children('.icon').html("<i class='fas fa-sort-up'></i>");
                }
            });
        });
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>