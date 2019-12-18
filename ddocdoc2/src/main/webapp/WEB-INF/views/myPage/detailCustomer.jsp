<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<!-- Basic Page Needs
        ================================================== -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="icon" href="favicon.ico">
        <title>똑딱</title>
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <!-- Mobile Specific Metas
        ================================================== -->
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        
        <!-- Template CSS Files
        ================================================== -->
        <!-- Twitter Bootstrs CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/bootstrap/bootstrap.min.css">
        <!-- Ionicons Fonts Css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/ionicons/ionicons.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/animate-css/animate.css">
        <!-- Hero area slider css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/slider.css">
        <!-- owl craousel css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.theme.css">
        <!-- Fancybox -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/facncybox/jquery.fancybox.css">
        <!-- template main css file -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<script type="text/javascript" src = "/resources/js/jquery.min.js"></script>
<script type="text/javascript" src = "/resources/js/qrcode.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
<style type="text/css">
hr {
  height: 1px;
  background-color: #ffe307;
}

.p{
	font-family: fantasy;
	font-size: 26px;
	color : #ffe307;
}

</style>
</head>
<body>

	<!--
        ==================================================
       MENU: Header Section Start
        ================================================== -->
	<header id="top-bar" class="navbar-fixed-top animated-header">
	<div class="container">
		<div class="navbar-header">
			<!-- responsive nav button -->
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- /responsive nav button -->

			<!-- logo -->
			<div class="navbar-brand">
				<a href="success.do"> <img src="/resources/images/logo.png" alt="">
				</a>
			</div>
			<!-- /logo -->
		</div>
		<!-- main menu -->
			<nav class="collapse navbar-collapse navbar-right" role="navigation">
				<div class="main-menu">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="success.do">Home</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">병원찾기 <span class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a href="/customer/hosSearch">병원찾기</a></li>
									<li><a href="/customer/hospitalResList">예약내역</a></li>
								</ul>
							</div></li>
						<li><a href="/DDOCDOC/child.index.jsp?cus_name=${customer.cus_name }">아이관리</a></li>
						<li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">QR코드 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="detailCustomer.do">QR코드 발급</a></li>
                                    </ul>
                                </div>
                            </li>
                         <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">후기<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="reviewInsertForm.do">후기 작성</a></li>
                                        <li><a href="reviewList.do">후기 목록</a></li>
                                    </ul>
                                </div>
                            </li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">${customer.cus_name } 님 <span
								class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a href="/customer/myPageForm">마이페이지</a></li>
								</ul>
							</div></li>
						<li><a href="logout.do">로그아웃</a></li>
					</ul>
				</div>
			</nav>
			<!-- /main nav -->
	</div>
	</header>

	<!-- 
        ================================================== 
            TITLE: Global Page Section Start
        ================================================== -->
	<section class="global-page-header" style="background: #ffe307;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block">
					<h2>QR CODE</h2>
					<ol class="breadcrumb">
						<li><a href="success.do"> <i class="ion-ios-home"></i>
								Home
						</a></li>
						<li class="active">QR CODE</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	</section>
	
	<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center; margin-bottom: 60px;">
	
		<div>
			<p class = "p">Info</p>
			<table class="table table-condensed" align="center" style="font-size: 18px;">
		  		<tr>
		  			<td>회원 아이디</td>
		  			<td>회원 이름</td>
		  			<td>회원 주소</td>
		  			<td>회원 이메일</td>
		  			<!-- <td>회원 생년월일</td> -->
		  		</tr>
		  		<tr>
		  			<td>${customer.cus_id }</td>
		  			<td>${customer.cus_name }</td>
		  			<td>${customer.cus_addr }</td>
		  			<td>${customer.cus_email }</td>
		  			<%-- <td>${customer.cus_birth }</td> --%>
		  		</tr>
		  		
			</table>
			
		<hr>
		<br>
			<textarea cols="71" rows="6" class = "autosize" onkeydown="resize(this)" onkeyup = "resize(this)" id = "led-text" charset = "UTF-8" style="margin-left: 30px;" readonly="readonly">${customer.cus_num},${customer.cus_id },${customer.cus_name },${customer.cus_addr },${customer.cus_email }<%-- ,${customer.cus_birth } --%></textarea><br>
				<button type = button  class="btn btn-warning btn-lg" id = "led-button1" onclick="button1_click()" style="margin-left: 198px; margin-top: 20px;">QR코드 발급</button>
		</div>
	
		<div id = "qrcode" style = "width:200px; height:200px; margin-top:160px; margin-left: 198px"></div> 
				<script>
				var qrcode = new QRCode(document.getElementById("qrcode"),{height : 150, width : 150});
			
				function makeCode(){
					var elText = document.getElementById("led-text");
					if(!elText.value){
						alert("Input a text");
						elText.focus();
						return;
					}
					alert(elText.value);
					
					qrcode.makeCode(elText.value);
				}
				function button1_click(){
					makeCode();
				}
				function resize(obj){
					obj.style.height = "1px";
					obj.style.height = (12 + obj.scrollHeight) + "px";
				}
			
			</script>
		</section>
	
	<footer id="footer">
	<div class="container">
		<div class="col-md-8">
			<p class="copyright">
				Copyright: <span><script>document.write(new Date().getFullYear())</script></span>
				Design and Developed by <a href="mailto:amydreamsyou@gmail.com"
					target="_blank">Lee Min-hye</a>. <br> Get More <a
					href="https://themefisher.com/free-bootstrap-templates/"
					target="_blank"> Free Bootstrap Templates </a>
			</p>
		</div>
		<div class="col-md-4">
			<!-- Social Media -->
			<ul class="social">
				<li><a href="http://wwww.fb.com/themefisher" class="Facebook">
						<i class="ion-social-facebook"></i>
				</a></li>
				<li><a href="http://wwww.twitter.com/themefisher"
					class="Twitter"> <i class="ion-social-twitter"></i>
				</a></li>
				<li><a href="#" class="Linkedin"> <i
						class="ion-social-linkedin"></i>
				</a></li>
				<li><a href="http://wwww.fb.com/themefisher"
					class="Google Plus"> <i class="ion-social-googleplus"></i>
				</a></li>
			</ul>
		</div>
	</div>
	</footer>
	<!-- /#footer -->

<!-- Template Javascript Files
	================================================== -->
	<!-- jquery -->
	<script src="<c:url value="/resources/plugins/jQuery/jquery.min.js" />"></script>
	<!-- Form Validation -->
    <script src="<c:url value="/resources/plugins/form-validation/jquery.form.js" />"></script>
    <script src="<c:url value="/resources/plugins/form-validation/jquery.validate.min.js" />"></script>
	<!-- owl carouserl js -->
	 <script src="<c:url value="/resources/plugins/owl-carousel/owl.carousel.min.js" />"></script>
	<!-- bootstrap js -->
	 <script src="<c:url value="/resources/plugins/bootstrap/bootstrap.min.js" />"></script>
	<!-- wow js -->
	 <script src="<c:url value="/resources/plugins/wow-js/wow.min.js" />"></script>
	<!-- slider js -->
	 <script src="<c:url value="/resources/plugins/slider/slider.js" />"></script>
	<!-- Fancybox -->
	 <script src="<c:url value="/resources/plugins/facncybox/jquery.fancybox.js" />"></script>
	<!-- template main js -->
	 <script src="<c:url value="/resources/js/main.js" />"></script>
</body>
	
	
</html>



<%-- 
<body>
	
	
	
	<div class = "led-group" align = "center">
	회원 아이디 : <h1 id = "let-text">${customer.cus_id }</h1><br>
	회원 이름 : ${customer.cus_name }<br>
	회원 주소 : ${customer.cus_addr }<br>
	회원  이메일 : ${customer.cus_email }<br>
	회원 생년월일 : ${customer.cus_birth }<br>
	
	
		<h1>고객 상세정보 QR코드</h1> 
		<textarea cols="18" rows="20" class = "autosize" onkeydown="resize(this)" onkeyup = "resize(this)" id = "led-text" charset = "UTF-8">고객 아이디 : ${customer.cus_id }     고객 이름 : ${customer.cus_name }       고객 주소 : ${customer.cus_addr }       고객 이메일 : ${customer.cus_email }     고객 생년월일 : ${customer.cus_birth }</textarea>
		<button type = button id = "led-button1" onclick="button1_click()">QR코드 발급</button>
		<div id = "qrcode" style = "width:100px; height:100px; margin-top:15px;"></div> 
	
	</div>
	
	<script>
		var qrcode = new QRCode(document.getElementById("qrcode"),{height : 100, width : 100});
	
		function makeCode(){
			var elText = document.getElementById("led-text");
			if(!elText.value){
				alert("Input a text");
				elText.focus();
				return;
			}
			alert(elText.value);
			
			qrcode.makeCode(elText.value);
		}
		function button1_click(){
			makeCode();
		}
		function resize(obj){
			obj.style.height = "1px";
			obj.style.height = (12 + obj.scrollHeight) + "px";
		}
	
	</script>
	

</body> --%>