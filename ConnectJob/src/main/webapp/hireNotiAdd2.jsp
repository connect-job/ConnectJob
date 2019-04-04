<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param value="" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jQuery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<section>
<style>
            body{
        margin-top: 100px;
        font-family: 'Trebuchet MS', serif;
        line-height: 1.6
        }
        .container{
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

<div class="container">
 
    <ul class="tabs">
      <li class="tab-link current" data-tab="tab-1">메뉴_하나</li>
      <li class="tab-link" data-tab="tab-2">메뉴_둘</li>
      <li class="tab-link" data-tab="tab-3">메뉴_셋</li>
    </ul>
   
    <div id="tab-1" class="tab-content current">
  ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ----
    </div>

    <div id="tab-2" class="tab-content">
  ---- ---- ★------ ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ★-- ---- ---- ------★ ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- ★------ ---- ---- ---- ----
    </div>

    <div id="tab-3" class="tab-content">
  ---- ★-- -------- ---- ---- ---- -★- ---- ---- -------- ---- -★- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- --★ -------- ★-- ---- ---- ---- ---- ---- -------- ---- ---- --★ ---- ---- ---- -------- ---- ---- ---- --★
    </div>

</div>

  <input type="checkbox" class="chk" id="chk_all"/>전체선택<br/><br/><br/>
  <input type="checkbox" class="chk" name="chk" id="ch2"/>선택지 1번<br/>
  <input type="checkbox" class="chk" name="chk" id="ch3"/>선택지 2번<br/>
  <input type="checkbox" class="chk" name="chk" id="ch4"/>선택지 3번<br/>
  <br/><br/>---------------------------------------------------------------<br/><br/>

<script>
            //탭나눔
            $(document).ready(function(){
        
            $('ul.tabs li').click(function(){
            var tab_id = $(this).attr('data-tab');
        
            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');
        
            $(this).addClass('current');
            $("#"+tab_id).addClass('current');

            })
        })

        //체크박스 전체선택 및 전체해제
        $("#chk_all").click(function(){
            if($("#chk_all").is(":checked")){
                $(".chk").prop("checked",true);
            }
            else{
                $(".chk").prop("checked",false);
            }
        });

        //한개의 체크박스 선택 해제시 전체선택 체크박스도 해제
        $(".chk").click(function(){
            if($("input[name='chk']:checked").length == 3){
                $("#chk_all").prop("checked",true);
            }else{
                $("#chk_all").prop("checked",false);
            }
        });
        </script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>