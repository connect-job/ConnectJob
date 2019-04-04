<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
	div.msgdiv{
		display: none;
	}
	div.error{
		display: none;
	}
	div.success{
		display: none;
	}
	/* 개인회원 기업회원 탭나눔 스타일 */
	.enroll-container{
        width: 500px;
        margin: 0 auto;
        }     
        ul.tabs{
        margin: 0px;
        padding: 0px;
        list-style: none;
        }
        ul.tabs li{
        background: none;
        color: #222;
        display: inline-block;
        padding: 10px 15px;
        cursor: pointer;
        }
        
        ul.tabs li.current{
        background: #ededed;
        color: #222;
        }
        
        .tab-content{
        display: none;
        background: #ededed;
        padding: 15px;
        }
        
        .tab-content.current{
        display: inherit;
        }
</style>

<section>
	<div id="enroll-container">
	<!-- 개인회원가입 -->
	<div class="title">
		<div class="title-left">회원가입</div>
		<div class="title-right">심사를 통해 게재된 믿을 수 있는 기업리뷰　|　이력서를 통한 기업 매칭 시스템<br>커넥트잡 회원이 되어 <b>모든 서비스를 무료</b>로 이용하세요</div>
	</div><br>
	<div class="enrollType">
		<div class="enroll-item" onclick="location.href='${path}/member/memberEnrollPage.do'"><i class="fas fa-user-edit"></i><br>일반회원가입</div>
		<div class="enroll-item" onclick="location.href='${path}/cmember/cmemberEnroll.do'"><i class="fas fa-building"></i><br>기업회원가입</div>
	</div>
</section>

<script src="http://code.jquery.com/jquery-3.3.1.min.js">	
	
	$(function(){
		var pw=$('#pw').val();
		var pw2=$('#pw2').val();
		
		$('#pw2').click(function(){			
			console.log(pw);
			console.log(pw2);
			if(pw!=pw2){
				$('.msgdiv').css("display", "show");
				$('.error').css("display", "show");
				pw2.focus();
			};
		})
		
	})
	
	$(function(){
		var pw=sdiv;
		var num=pw.search(/[0-9]/g);
		var eng=pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
		if(pw.length<8 || pw.length>20){
			alert("영문, 숫자, 특수문자 혼합해 8자리~20자리 이내로 입력하세요");
			return false;
		}		
		if(pw.search(/₩s/) != -1){
			  alert("비밀번호는 공백없이 입력해주세요.");
			  return false;
		} 
		if(num < 0 || eng < 0 || spe < 0 ){
			alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			return false;
		}
		return divue;			
	})
	
	//탭화면 나눔
 	$(document).ready(function(){
        
            $('div.enroll-container ul.tabs li').click(function(){
            var tab_id = $(this).atdiv('data-tab');
        
            $('div.enroll-container ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');
        
            $(this).addClass('current');
            $("#"+tab_id).addClass('current');

            })
        }) 

         //체크박스 전체선택 및 전체해제
        $("#chk_all").click(function(){
            if($("#chk_all").is(":checked")){
                $(".chk").prop("checked",divue);
            }
            else{
                $(".chk").prop("checked",false);
            }
        });

        //한개의 체크박스 선택 해제시 전체선택 체크박스도 해제
        $(".chk").click(function(){
            if($("input[name='chk']:checked").length == 4){
                $("#chk_all").prop("checked",divue);
            }else{
                $("#chk_all").prop("checked",false);
            }
        });
</script>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>





