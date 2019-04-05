<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
            <!-- <div class="footer-middle">
                커넥트잡 (ConnectJob)&nbsp;&nbsp;&nbsp;사업자등록번호 123-45-78910&nbsp;&nbsp;&nbsp;
                서울 강남 제2019-01호&nbsp;&nbsp;&nbsp;
                서울특별시 강남구 역삼동 커넥트빌딩
            </div> -->
            
            <div class="footer-bottom">
                    Copyright (C) 2019 CONNECT JOB All Rights Reserved.
                    <br><br>
            </div>
        </div>
    </footer>
</body>
</html>




