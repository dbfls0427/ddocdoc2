<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
        
        
        <style type="text/css">
        	#wrapLoginform {
				height: 450px;
			}
			
			#loginformdiv {
				width: 40%; 
				margin: 0 auto;
			}
			
			#btnsubWrap {
				text-align: center;
			}
			
			#btnsubWrap input {
				width: 40%;
			}
			
			#wrapform2{
				text-align: center;
			}
			
			#wrapform2 input {
				width: 40%;
			}
        
        </style>
        
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
                        <a href="../index.html" >
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
                                <a href="../index.html" >Home</a>
                            </li>
                             <li><a href="/DDOCDOC/map/NohosSearch.jsp">병원찾기</a></li>
                            <li><a href="../child/childPleaseLogin.do">아이관리</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">QR코드 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="detailCustomer.do">QR코드 발급</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li><a href="loginForm.do">로그인</a></li>
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
                            <h2>LOGIN</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="../index.html">
                                        <i class="ion-ios-home"></i>
                                        Home
                                    </a>
                                </li>
                                <li class="active">LOGIN</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        
        
        


		<section class="company-description" id="wrapLoginform">
		
			<div class="panel panel-default" id="loginformdiv">
				<div class="panel-body">
					<form action="/login" method = "post">
						<div class="form-group">
							<label>ID</label>
							<input type = "text" name = "username" class="form-control input-lg" placeholder="ID">
						</div>
						<div class="form-group">
							<label>Password</label>
							<input type = "text" name = "password" class="form-control input-lg" placeholder="Password">
						</div>
						
						<div id="btnsubWrap">
							<input type = "submit" value = "로그인"  class="btn btn-warning btn-lg">
							<hr>
						</div>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					</form>
					<div id="wrapform2">
						<form action="join.do" method = "post">
							<input type = "submit" value = "회원가입" class="btn btn-default active btn-lg">
						</form>
					</div>
			  		
			  		<!-- 
					<form action="login.do" method = "post">
						ID : <input type = "text" name = "customerID"><br>
						PW : <input type = "text" name = "customerPW"><br>
						<input type = "submit" value = "로그인">
					</form> <br>
					<form action="join.do" method = "post">
						<input type = "submit" value = "회원가입">
					</form>
					 -->
			  </div>
			</div>
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