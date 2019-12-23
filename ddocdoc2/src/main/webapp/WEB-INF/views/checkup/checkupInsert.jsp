<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">       
<style>
	/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
	.ui-datepicker-trigger{cursor: pointer;}
	/*datepicer input 롤오버 시 손가락 모양 표시*/
	.hasDatepicker{cursor: pointer;}
	#forming{
		font-family: 'Jua', sans-serif;
	}
	img{
		    height: 32px;
    		margin-left: 5px;
	}
	#fsize{
		font-size: 20px;
	}
	#fsize2{
		font-size: 25px;
	}
	#back{
	background-image: url("https://cdn.ddocdoc.com/collection/141945158cc83086859cfbbbd.jpg");
	background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 90%;
    
}
#back::before{
     content: " ";
    position: absolute;
    top: 0px;
    left: 0px;
    display: block;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
}
</style>
</head>
<body>
	<%@include file="../includes/menu.jsp" %>

        <!-- 
        ================================================== 
            TITLE: Global Page Section Start
        ================================================== -->
        <section class="global-page-header" id="back">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2>건강검진 기록</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="/customer/loginSuccess">
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

	<section id="forming"  class="company-description" style="display: flex; justify-content: center; margin-bottom: 50px;">
	  <div style="display: flex; justify-content: center;">
	  		<div>
	  			<div style="display: flex; justify-content: center;">
					<label style="font-size: 30px; color: #2c4ab5;">${che_name }</label>
	  			</div>
				<br>
				<div style="display: flex; justify-content: center; margin-bottom: 20px; margin-top: 10px;">
					<label id="fsize2">검진시기</label>&nbsp&nbsp<label id="fsize2" style="color: #dc4040;">${infoVO.che_info_date }</label><br>
				</div>
				<form action="/checkup/insertChe" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" name="ch_num" value="${ch_num }">
					<input type="hidden" name="cup_content" value="${cup_content}">
					<div style="display: flex; justify-content: center">
						<label id="fsize" style="margin-right: 10px;">검진일</label><br>
						<input type="text" name="cup_date" id="datepicker" class="form-control" style="width: 150px; font-size: 20px;margin-right: 0; width: 280px;">
					</div>
						<script>
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
						               ,minDate: "-10Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
						               ,maxDate: "+10Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
						           });
			
						           //input을 datepicker로 선언
						           j("#datepicker").datepicker();                    
						           
						           //From의 초기값을 오늘 날짜로 설정
						           j('#datepicker').datepicker('setDate', 'today');
						})
						</script>
						<div style="margin-top: 10px;">
							<label id="fsize">메모</label>&nbsp&nbsp<input type="text" name="che_memo" class="form-control"><br>
						</div>
						<div style="display: flex;justify-content: center;">
							<input type="submit" value="완료" class="btn btn-warning">
						</div>
				</form>
	  		</div>
	  </div>
	</section>
	
<%@include file="../includes/footer.jsp" %>
	
</body>
</html>