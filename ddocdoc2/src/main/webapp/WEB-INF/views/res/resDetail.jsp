<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
 <%@include file="../includes/header.jsp" %>

<style type="text/css">
	a{
		text-decoration: none;
		color: #FFFFFF;
	}
	
	button{
		color:#FFFF1C;
	}
	
	.p{
	font-family: fantasy;
	font-size: 26px;
	color : #ffe307;
	}

 #back{
	background-image: url("http://image.sayup.co.kr/collection/55e643ef59fd6203005da061/0715046b1fa8e2d7540773a896476213.jpg");
	background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 42%;
    
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



 <script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

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
					<h2>Detail Reservation</h2>
					<ol class="breadcrumb">
						<li><a href="success.do"> <i class="ion-ios-home"></i>
								Home
						</a></li>
						<li class="active">Detail Reservation</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	</section>
	
	<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center;">
		<div>
		<p class = "p">Detail</p>
		<div class="panel panel-warning" style="width: 400px" >
			
			<div class="panel-heading" align="center">예약번호</div>
  				<div class="panel-body" align="center"> ${res.hos_res_num }</div>
  				<div class="panel-heading" align="center">예약고객</div>
  				<div class="panel-body" align="center"> ${cus_name } </div>
  				<div class="panel-heading" align="center">진료종류</div>
  				<div class="panel-body" align="center"> ${res.hos_res_type } </div>
  				<div class="panel-heading" align="center">진료증상</div>
  				<div class="panel-body" align="center"> ${res.hos_res_sym } </div>
  				<div class="panel-heading" align="center">메모</div>
  				<div class="panel-body" align="center"> ${res.hos_res_memo } </div>
  				<div class="panel-heading" align="center">예약날짜</div>
  				<div class="panel-body" align="center"> ${res.hos_res_date } </div>
  				<div class="panel-heading" align="center">예약시간</div>
  				<div class="panel-body" align="center"> ${res.hos_res_time } </div>
  				<div class="panel-heading" align="center">대기번호</div>
  				<div class="panel-body" align="center"> ${count}</div>
		</div><br>
			</div>
		
		
	</section>
	<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center; margin-top: 20px; margin-bottom: 30px;">
	<div style="margin-left: 50px">
	<button type="button" class="btn btn-warning"><a href = "deleteRes.do?hos_res_num=${res.hos_res_num }&hos_num=${res.hos_num}">예약취소</a></button> &nbsp&nbsp&nbsp&nbsp
	<button type="button" class="btn btn-warning"><a href = "resWaitSms.do?count=${count}&hos_res_num=${res.hos_res_num}">대기 번호 문자로 받기</a></button>
		</div>
		</section>
	
<%@include file="../includes/footer.jsp" %>
</body>
	
	
</html>



