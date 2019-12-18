<%@page import="org.ddocdoc.vo.childvo.ChildVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
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
 <!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
	
 <style type="text/css">
 a:link { color : black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
/*  .kidsbtn{
 	font-family: 
 } */
 hr {
  height: 1px;
  background-color: #a9a8a8;
  height: 2px;
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

</style>   
 <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">    
<link href="https://fonts.googleapis.com/css?family=Stylish&display=swap&subset=korean" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap&subset=korean" rel="stylesheet">       
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
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
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <!-- /responsive nav button -->
                    
                    <!-- logo -->
                    <div class="navbar-brand">
                        <a href="/DDOCDOC/Customer/success.do" >
                            <img src="/resources/images/logo.png" alt="">
                        </a>
                    </div>
                    <!-- /logo -->
                </div>
                <!-- main menu -->
                <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="/DDOCDOC/Customer/success.do" >Home</a>
                            </li>
                             <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">병원찾기 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/DDOCDOC/Customer/map.do?cus_num=${customer.cus_num }">병원찾기</a></li>
                                        <li><a href="../Customer/resList.do">예약내역</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">아이관리 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/child/childList">아이관리</a></li>
                                        <li><a href="/DDOCDOC/Customer/detailCustomer.do">성장관리</a></li>
                                        <li><a href="/DDOCDOC/Customer/detailCustomer.do">예방접종</a></li>
                                        <li><a href="/DDOCDOC/Customer/detailCustomer.do">건강검진</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">QR코드 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/DDOCDOC/Customer/detailCustomer.do">QR코드 발급</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">후기<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="../Customer/reviewInsertForm.do">후기 작성</a></li>
                                        <li><a href="../Customer/reviewList.do">후기 목록</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${customer.cus_name } 님 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="../Customer/myPageForm.do">마이페이지</a></li>
                                    </ul>
                                </div>
                            </li>
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
        
        <section id="btn" class="company-description" style="display: flex; justify-content: center; margin-top: 80px; margin-left: 30px; margin-bottom : 30px">
		 <div style="display: flex; justify-content: center;">
			<form action="/height/heightList" method="post">
				<input type="hidden" name="ch_num" value="${childVO.ch_num}">
				<input type="hidden" name="ch_name" value="${childVO.ch_name}">
				<input type = "submit" value="성장 관리" class="btn btn-default btn-lg" style="font-size: 20px; margin-right: 30px; width: 140px;">
			</form>
			
			<form action="/DDOCDOC/Inject/InjectListAction.do" method="post">
				<input type="hidden" name="ch_num" value="${childVO.ch_num}">
				<input type="hidden" name="ch_name" value="${childVO.ch_name}">
				<input type = "submit" value="예방접종" class="btn btn-default btn-lg" style="font-size: 20px; margin-right: 20px; width: 140px;">
			</form>
		 </div>
		</section>
		<div style="width: 800px;margin-left:30%;">
			<hr>
		</div>
        <section style="margin-top: 0;">
		 <div style="display: flex; justify-content: center; width: 500px; padding: 30px; margin-left: 37%;">
			 <i class="fas fa-user-friends fa-7x" style="padding-right: 30px;"></i>
			  <div style="font-size: 25px; margin-left: 20px;" id="childIntro">
						 <label>${childVO.ch_name} / ${childVO.ch_gender}</label> <a href="/child/childList" style="font-size: 18px;"><i class="fas fa-chevron-circle-down fa-lg" title="목록보기"></i></a><br>
						 <label>${childVO.ch_birth}</label>
						 <label>(${childVO.ch_age}세)</label> <br>
			  </div>
		 </div>
        </section>

		<br>
		<section id="btn" class="company-description" style="display: flex; justify-content: flex-end; padding-right: 700px; margin-top: 0; margin-bottom: 100px;">
			<button class="btn btn-default"><a href="/child/childUpdate?ch_num=${childVO.ch_num}" style="font-size: 18px;">수정</a></button>&nbsp
			<button class="btn btn-default"><a href="/child/childDelete?ch_num=${childVO.ch_num}" style="font-size: 18px;">삭제</a></button>
		</section>
		

<!--
            ==================================================
            Footer Section Start
            ================================================== -->
            <footer id="footer">
                <div class="container">
                    <div class="col-md-8">
                        <p class="copyright">Copyright: <span><script>document.write(new Date().getFullYear())</script></span> Design and Developed by <a href="mailto:amydreamsyou@gmail.com" target="_blank">Lee Min-hye</a>. <br> 
                            Get More 
                            <a href="https://themefisher.com/free-bootstrap-templates/" target="_blank">
                                Free Bootstrap Templates
                            </a>
                        </p>
                    </div>
                    <div class="col-md-4">
                        <!-- Social Media -->
                        <ul class="social">
                            <li>
                                <a href="http://wwww.fb.com/themefisher" class="Facebook">
                                    <i class="ion-social-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="http://wwww.twitter.com/themefisher" class="Twitter">
                                    <i class="ion-social-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="Linkedin">
                                    <i class="ion-social-linkedin"></i>
                                </a>
                            </li>
                            <li>
                                <a href="http://wwww.fb.com/themefisher" class="Google Plus">
                                    <i class="ion-social-googleplus"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </footer> <!-- /#footer -->

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