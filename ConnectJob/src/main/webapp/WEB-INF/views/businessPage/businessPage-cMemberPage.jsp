<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param value="" name="pageTitle"/>
</jsp:include>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jQuery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">


<section>
   <div id="enroll-container">
      <div class="title">
         <div class="title-left">기업회원가입</div>
         <div class="title-right">무료 채용공고 등록　|　원하는 인재 찜하기 서비스<br>커넥트잡 기업회원에게 <b>모든 서비스를 무료</b>로 이용 가능합니다</div>
      </div><br>
      <div id="memberEnroll">
         <form action="${path }/cMemberEnrollEnd.do" method="post" class="signup-frm" autocomplete="off">
            <div class="enroll-title">
               기업정보 인증
            </div>
            <div class="enroll-item">
               <div class="left">
                  사업자번호
               </div>
               <div class="right">
                  <input type="text" class="CMember" id="CMemberBNum" name="CMemberBNum"  required maxlength="12"/>
                  <select type="select" class="CMember" id="CMemberDiv" name="CMemberDiv" required><i class="fas fa-arrow-down"></i></br>
                     <option value="divide" selected disabled>기업구분</option>
                     <option value="normal">일반</option>
                     <option value="staffing">인재파견</option>
                     <option value="headhunting">헤드헌팅</option>
                  </select>
               </div>
            </div>
            
            <div class="enroll-item">
               <div class="left">
                  기업선택
               </div>
               <div class="right">
                  <input type="text" class="CMember" id="cId" name="cId"  required/>
               </div>
            </div>
            
            <div class="enroll-item">
               <div class="left">
                  기업 연락처
               </div>
               <div class="right">
                  <input type="text" class="CMember" id="CMemberCPhone" name="CMemberCPhone" required/>
               </div>
            </div>

            <div class="enroll-title">
               담당자 정보 입력
            </div>

            

            <div class="enroll-item">
               <div class="left">아이디</div>
               <div class="right"><input type="text" class="CMember" id="CMemberId" name="CMemberId"  maxlength="12"/></div>
            </div>

            <div class="enroll-item">
               <div class="left">비밀번호</div>
               <div class="right"><input type="password" class="CMember" id="CMemberPw"/></div>
            </div>

            <div class="enroll-item">
               <div class="left">비밀번호 확인</div>
               <div class="right"><input type="password" class="CMember" id="CMemberPwCk" name="CMemberPw"/></div>
            </div>

            <div class="enroll-item">
               <div class="left">담당자 이름</div>
               <div class="right"><input type="text" class="CMember" id="CMemberName" name="CMemberName"/></div>
            </div>

            <div class="enroll-item">
               <div class="left">담당자 연락처</div>
               <div class="right"><input type="text" class="CMember" id="CMemberPhone" name="CMemberPhone"/></div>
            </div>

            <div class="enroll-item">
               <div class="left">담당자 이메일</div>
               <div class="right"><input type="email" class="CMember" id="CMemberEmail" name="CMemberEmail" /></div>
            </div>

            <div class="enroll-title">
               약관동의
            </div>

            <div class="enroll-text">
               전체동의 <input type="checkbox" id="ACCEPT_TERMS" value="ACCEPT_TERMS_ALL"  class="chk" />
            </div>

            <div class="enroll-text">
               기업회원 약관에 동의(필수)<input type="checkbox" id="CMemberAccept" class="chk" name="chk" required />
            </div>

            <div class="enroll-text">
               개인정보 수집 및 이용에 동의(필수)<input type="checkbox" id="CMemberAccept" class="chk" name="chk" required />
            </div>

            <div class="enroll-text">
               마케팅 정보 수신 동의 - 이메일 (선택)<input type="checkbox" id="CMemberAccept" class="chk" name="chk" />
            </div>

            <div class="enroll-text">
               마케팅 정보 수신 동의 - SMS/MMS (선택)<input type="checkbox" id="CMemberAccept" class="chk" name="chk" />
            </div>

            <div class="enroll-text">
               개인정보 제 3자 제공 및 위탁사항 이용약관
            </div>

            <div class="enroll-text">
               <button>회원가입완료</button>
            </div>
      
         </form>
      </div>
   </div>
</section>
<script>

   //회원가입 유효성 검사
   const signupFrm = $('.signup-frm');
   const signupPw = $('.signup-frm #CMemberPw');
   const signupPwCk = $('.signup-frm #CMemberPwCk');
   const signupId = $('.signup-frm #CMemberId');
   const signupEmail = $('.signup-frm #emailCksub');
   const signupPhone = $('.signup-frm #CMemberPhone');

   const validationMsg = $('.validation-msg');
   const signupInputs = $('.validation-msg').prev();
   const idAvail = $('#idAvail');

   //회원가입 submit시 체크
   $(() => {
      signupFrm.on('submit', e => {
         let invalidCount = 0;

         checkBlank();
         if (!idRegExpValid(e)) invalidCount++;
         if (idAvail.val() == 'false') invalidCount++;
         if (!pwRegExpValid(e)) invalidCount++;
         if (!emailRegExpValid(e)) invalidCount++;
         if (!pwCkValid(e)) invalidCount++;
         if (!phoneRegExpValid(e)) invalidCount++;

         if (invalidCount == 0) {
            console.log('됩니까?');
            return true;
         }
         else {
            alert('회원가입 양식에 수정이 필요합니다.');
            return false;
         }
      });
   });

   //아이디 중복체크
   const idAvailAjax = (e) => {
      $.ajax({
         url: '${path}/checkId?memberId=' + signupId.val(),
         type: 'get',
         dataType: 'text',
         success: data => {
            if (data == 'true') {
               idAvail.val('false');
               $(e.target).next().css('color', 'crimson');
               $(e.target).next().text('해당 아이디가 이미 존재합니다.');


            }
            else {
               idAvail.val('true');
               $(e.target).next().css('color', 'green');
               $(e.target).next().text('사용가능한 아이디입니다.');

               $(e.target).parent().next().children().show();

            }
         }
      });
   }

   //회원가입란 공백체크
   const checkBlank = () => {
      for (let i = 0; i < signupInputs.length; i++) {
         if (signupInputs[i].value.trim().length == 0) {
            signupInputs[i].focus();
            return;
         }
      }
   }

   //아이디 정규식
   const idRegExpValid = (e) => {
      if (signupId.val().length == 0) return;

      const regex = new RegExp('^[a-zA-Z][a-zA-Z0-9]{3,11}$');
      const result = regex.test(signupId.val());
      if (!result) $(e.target).next().css('color', 'crimson').text('잘못된 아이디 문자 조합입니다.');
      return result;
   }
   
 //체크박스 전체선택 및 전체해제
   $("#ACCEPT_TERMS").click(function(){
       if($("#ACCEPT_TERMS").is(":checked")){
           $(".chk").prop("checked",true);
       }
       else{
           $(".chk").prop("checked",false);
       }
   });

   //한개의 체크박스 선택 해제시 전체선택 체크박스도 해제
   $(".chk").click(function(){
       if($("input[name='chk']:checked").length == 4){
           $("#ACCEPT_TERMS").prop("checked",true);
       }else{
           $("#ACCEPT_TERMS").prop("checked",false);
       }
   });






</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>