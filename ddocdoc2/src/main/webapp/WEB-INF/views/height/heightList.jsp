<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/user_height.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
</head>
<script type="text/javascript" src="/resources/js/user_height.js"></script>
<script type="text/javascript">
var j = jQuery.noConflict();
j(document).ready(function(){
	var num = '<c:out value="${ch_num }"/>';
	
	
	showList();
	
	function showList(){
		heightService.list({ch_num : num}, function(list){
			var str = "";
			
			for(var i=0, len = list.length || 0; i<len; i++){
				str += "<tr>"
				str += "<td style = 'text-align : center;'><a class='aa' href='/height/detail'>" + list[i].he_height + "</a></td>";
				str += "<td style = 'text-align : center;'>" + list[i].he_date + "</td>";
				str += "</tr>";
				console.log(list[i]);
				
				console.log(str);
			}
		j("table").append(str);
			
		});
	}
});

</script>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/bootstrap/bootstrap.min.css">
<!-- Ionicons Fonts Css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/ionicons/ionicons.min.css">
<!-- animate css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/animate-css/animate.css">
<!-- Hero area slider css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/slider/slider.css">
<!-- owl craousel css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.carousel.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.theme.css">
<!-- Fancybox -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/facncybox/jquery.fancybox.css">
<!-- template main css file -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<style type="text/css">
 	tr:nth-child(2n) {
  				background-color: #FFFFA5;
			}
	 a:link { color : black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
 	#btn{
 		 font-family: 'Jua', sans-serif;
 		/* font-family: 'Do Hyeon', sans-serif; */
 	}
 	#sun{
 		font-family: 'Do Hyeon', sans-serif;
 	}
</style>
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
					<a href="/DDOCDOC/Customer/success.do"> <img
						src="/resources/images/logo.png" alt="">
					</a>
				</div>
				<!-- /logo -->
			</div>
			<!-- main menu -->
			<nav class="collapse navbar-collapse navbar-right" role="navigation">
				<div class="main-menu">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/DDOCDOC/Customer/success.do">Home</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">병원찾기 <span class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a
										href="/DDOCDOC/Customer/map.do?cus_num=${customer.cus_num }">병원찾기</a></li>
									<li><a href="../Customer/resList.do">예약내역</a></li>
								</ul>
							</div></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">아이관리 <span class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a href="/child/childList">아이관리</a></li>
									<li><a href="/DDOCDOC/Customer/detailCustomer.do">성장관리</a></li>
									<li><a href="/DDOCDOC/Customer/detailCustomer.do">예방접종</a></li>
									<li><a href="/DDOCDOC/Customer/detailCustomer.do">건강검진</a></li>
								</ul>
							</div></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">QR코드 <span class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a href="/DDOCDOC/Customer/detailCustomer.do">QR코드
											발급</a></li>
								</ul>
							</div></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">후기<span class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a href="../Customer/reviewInsertForm.do">후기 작성</a></li>
									<li><a href="../Customer/reviewList.do">후기 목록</a></li>
								</ul>
							</div></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">${customer.cus_name } 님 <span class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a href="../Customer/myPageForm.do">마이페이지</a></li>
								</ul>
							</div></li>
						<li><a href="../Customer/logout.do">로그아웃</a></li>
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
	<section class="global-page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h2>우리아이 관리</h2>
						<ol class="breadcrumb">
							<li><a href="/DDOCDOC/Customer/success.do"> <i
									class="ion-ios-home"></i> Home
							</a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

<section id="btn" class="company-description" style="margin-bottom: 0; display: flex; justify-content: center">
		
</section>
	
<section id="btn" class="company-description" style="margin-top: 10px; display: flex; justify-content: center; font-weight: 600;">
		
	<div style="width:500px;">
		<table  border="1" class="table table-hover" id="sun" style="font-size: 18px;">
							<tr>
								<td style="text-align : center;">등록한 키</td>
								<td style="text-align : center;">등록 날짜</td>
							</tr>
							
		</table>
	</div>
</section>
			
	<!--
            ==================================================
            Footer Section Start
            ================================================== -->
	<footer id="footer">
		<div class="container">
			<div class="col-md-8">
				<p class="copyright">
					Copyright: <span><script>
						document.write(new Date().getFullYear())
					</script></span>
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
	<script
		src="<c:url value="/resources/plugins/form-validation/jquery.form.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/form-validation/jquery.validate.min.js" />"></script>
	<!-- owl carouserl js -->
	<script
		src="<c:url value="/resources/plugins/owl-carousel/owl.carousel.min.js" />"></script>
	<!-- bootstrap js -->
	<script
		src="<c:url value="/resources/plugins/bootstrap/bootstrap.min.js" />"></script>
	<!-- wow js -->
	<script src="<c:url value="/resources/plugins/wow-js/wow.min.js" />"></script>
	<!-- slider js -->
	<script src="<c:url value="/resources/plugins/slider/slider.js" />"></script>
	<!-- Fancybox -->
	<script
		src="<c:url value="/resources/plugins/facncybox/jquery.fancybox.js" />"></script>
	<!-- template main js -->
	<script src="<c:url value="/resources/js/main.js" />"></script>



</body>
</html>