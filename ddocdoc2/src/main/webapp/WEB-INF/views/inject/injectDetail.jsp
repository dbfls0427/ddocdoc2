<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- header module -->
<%@include file="../includes/header.jsp" %>
<!-- end header module -->
        
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">       
<style>
	/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
	.ui-datepicker-trigger{cursor: pointer;}
	/*datepicer input 롤오버 시 손가락 모양 표시*/
	.hasDatepicker{cursor: pointer;}
/* 	#forming{
		font-family: 'Jua', sans-serif;
	}
	#intro{
		font-family: 'Jua', sans-serif;
	} */
	img{
		    height: 32px;
    		margin-left: 5px;
	}
	hr {
  			height: 1px;
  			background-color: #FFD819;
	}
	a:link { color : black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
</style>
<script type="text/javascript">
jQuery(document).ready(function(){
	
	jQuery("#upd").on("click",function(e){
		var QueryString = jQuery("#updateForm").serialize();
		location.href="/inject/injectUpdate?"+QueryString;
	})
});

</script>
</head>
<body>
<!-- menu module -->
<%@include file="../includes/menu.jsp" %>
<!-- end menu module -->
        
        <!-- 
        ================================================== 
            TITLE: Global Page Section Start
        ================================================== -->
        <section class="global-page-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2>접종기록</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="/DDOCDOC/Customer/success.do">
                                        <i class="ion-ios-home"></i>
                                        Home
                                    </a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        
 	<section id="forming"  class="company-description" style="margin-bottom: 50px; font-size: 20px; margin-left: 40%;">
		<div>
			<div style="margin-left: 130x; width: 400px;"><label style="font-size: 40px; color: #152571; margin-left: 110px;">${inj_name }</label><hr></div>
			<div><label style="margin-left: 5px">접종시기</label>&nbsp&nbsp<span>${infoVO.inj_info_date }</span></div>
		</div>
	<form style="margin-bottom: 10px;" id="updateForm">
	 <div style="width: 300px">
	 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="ch_num" value="${civo.ch_num }">
		<input type="hidden" name="inj_content" value="${civo.inj_content}">
		<div style="display: flex; justify-content: center; height: 33px; width: 350px;" >
			<label style="margin-left: 4px">접종일</label>  &nbsp&nbsp<input type="text" name="inj_date" id="datepicker" value="${civo.inj_date }" style="width: 230px;" class="form-control">
		</div>
		<script type="text/javascript">
			var j = jQuery.noConflict();
			j(document).ready(function() {
			           //모든 datepicker에 대한 공통 옵션 설정
			           j.datepicker.setDefaults({
			               dateFormat: 'yy-mm-dd' //Input Display Format 변경
			               ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			               ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			               ,changeYear: true //콤보박스에서 년 선택 가능
			               ,changeMonth: true //콤보박스에서 월 선택 가능                
			               ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			               ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
			               ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
			               ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
			               ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
			               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
			               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			               ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			               ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			               ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
			           });
	
			           //input을 datepicker로 선언
			           j("#datepicker").datepicker();                    
			           
			           //From의 초기값을 오늘 날짜로 설정
			           j('#datepicker').datepicker('setDate', 'today');
			})
		</script>
		<label style="margin-left: 7px">메모</label> <input type="text" name="inj_memo" value="${civo.inj_memo }" class="form-control" style="margin-left: 2px"><br>
		<!-- <input type="submit" value="기록변경" class="btn btn-default btn-lg" style="margin-left: 260px;"> -->
	</div>
	</form>
	<div style="display: flex; justify-content : left;margin-left: 45px;">
		<div style="display: flex; justify-content : center">
			<button class="btn btn-default btn-lg" style="width: 80px" id="upd">변경</button>
			<button class="btn btn-default btn-lg" style="margin-left: 10px;width: 80px"><a href="/inject/injectDelete?ch_num=${civo.ch_num }&inj_content=${civo.inj_content}">삭제</a></button>
		</div>
	</div>
 
 </section>
	
<!-- footer module -->
<%@include file="../includes/footer.jsp" %>
<!-- end footer module -->
</body>
</html>