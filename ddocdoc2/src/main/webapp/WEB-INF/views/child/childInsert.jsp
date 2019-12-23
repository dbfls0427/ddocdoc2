<%@page import="org.ddocdoc.vo.childvo.ChildVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<!-- menu module -->
<%@include file="../includes/header.jsp" %>
<!-- end menu module -->
 <style type="text/css">
 a:link { color : black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
/*  .kidsbtn{
 	font-family: 
 } */
 hr {
  height: 1px;
  background-color: #ffe307;
}
.p{
	font-family: fantasy;
	font-size: 26px;
	color : #ffe307;
}
tr:nth-child(2n) {
  				background-color: #FFFFA5;
			}
#intro{
	font-family: 'Stylish', sans-serif;
}
#table1{
font-family: 'Sunflower', sans-serif;
}

#back{
	background-image: url("http://image.sayup.co.kr/collection/55ed39e43dff460300ba2927/f76541f0eb59b97e4c95c33164af6fdd.jpg");
	background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    
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
 <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">    
<link href="https://fonts.googleapis.com/css?family=Stylish&display=swap&subset=korean" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap&subset=korean" rel="stylesheet">       
 	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
</head>
<body>
<!-- menu module -->
<%@include file="../includes/menu.jsp" %>
<!-- end menu module -->
        
        <!-- 
        ================================================== 
            TITLE: Global Page Section Start
        ================================================== -->
        <section class="global-page-header" id="back">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2>우리아이 관리</h2>
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
        
        
<section id="forming"  class="company-description" style="display: flex; justify-content: center; margin-bottom: 50px;font-size: 18px;">
	<form action="/child/childInsert" method="post" style="width: 450px;">
		<input type="hidden" name="cus_num" value="${customer.cus_num }"><br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<label>아이이름</label><br>
		<input type="text" name="ch_name" class="form-control"><br>
		<label>생년월일</label><br>
		<div style="display: flex">
			<input type="date" name="ch_birth" id="datepicker_kid2" class="form-control" style="width: 450px; margin-right: 10px;"><br>
			<input id="checkage" type="hidden" class="inputbox"> 
		</div><br>
		<label>나이</label><br>
		<input type="text" name="ch_age" class="form-control" id="putage"><br>
		<label>성별</label><br>
		<input type="text" name="ch_gender" class="form-control" placeholder="남/여"><br>
		<div style="display: flex; justify-content: center">
			<input type="submit" value="저장" class="btn btn-warning btn-lg" id="kidbtn">
		</div>
	</form>

</section>




<script type="text/javascript">
var j = jQuery.noConflict();
j(document).ready(function() {
		   // 생년월일 입력한 값 갖기
           j("#datepicker_kid2").change(function (){
               var date = $('#datepicker_kid2').val();
               $('#checkage').val(date);
               var urbirth =  $('#checkage').val();
               
               var birth = new Date(urbirth);
               var birthYear = birth.getFullYear();
               var currentYear = new Date().getFullYear();
               var age = currentYear - birthYear;
               if(age>11){
                  alert("아이등록은 만12세미만이 가능합니다.");
                  $( "#putage" ).prop( "disabled", true );
                  $("#kidbtn").prop('disabled', true);
               } else{
                  $('#putage').val(age);
                  $( "#putage" ).prop( "disabled", false );
                  $("#kidbtn").prop('disabled', false);
               }
           });
		
	
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
           j("#datepicker_kid2").datepicker();                    
           
           //From의 초기값을 오늘 날짜로 설정
           j('#datepicker_kid2').datepicker('setDate', 'today');
           
          
           
          
           
           
})
</script>


<!-- menu module -->
<%@include file="../includes/footer.jsp" %>
<!-- end menu module -->

</body>
</html>