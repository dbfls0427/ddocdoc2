<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

			hr {
  				height: 1px;
  				background-color: #FFD819;
			}
			
			.aa{
				text-decoration: none;
				color: #FFFFFF;
			}
			
	</style>
	 <script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		var error = $(".error");
		if(error.val() == 'error'){
			alert("대기번호 발급 실패");
		}
		</script>
        
    </head>
    <body>
		<input type="hidden" value=${error} class="error"/>
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
                        <a href="success.do" >
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
                                <a href="success.do" >Home</a>
                            </li>
                             <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">병원찾기 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/customer/hosSearch">병원찾기</a></li>
                                        <li><a href="/customer/hospitalResList">예약내역</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li><a href="/DDOCDOC/child.index.jsp?cus_name=${customer.cus_name } ">아이관리</a></li>
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
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${customer.cus_name } 님 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/customer/myPageForm">마이페이지</a></li>
                                    </ul>
                                </div>
                            </li>
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
					<h2>RESERVATION</h2>
					<ol class="breadcrumb">
						<li><a href="success.do"> <i class="ion-ios-home"></i>
								Home
						</a></li>
						<li class="active">RESERVATION</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	</section>
        
		<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center;">

			<div>
			<p class = "p">Hospital Reservation</p><br>
			<table class="table table-hover" id = "table1" style="font-size: 18px;">
		<tr>
			<td style="text-align : center;">예약번호</td>
			<td style="text-align : center;">병원이름</td>
			<td style="text-align : center;">예약날짜</td>
			<td style="text-align : center;">처방전</td>
			
		</tr>
		
		<c:forEach var="resVO" items="${list }" varStatus="status">
			<tr>
				<td style="text-align : center;">${resVO.hos_res_num }</td>
				<td style="text-align : center;"><a href = "/customer/hospitalResDetail?hos_res_num=${resVO.hos_res_num}">${hosName[status.index] }</td>
				<td style="text-align : center;">${fn:substring(resVO.hos_res_date,0,10) }</td>
				<td style="text-align : center;"><button class="btn btn-warning"><a class="aa" href = "/customer/presDetail?hos_res_num=${resVO.hos_res_num }&hos_num=${resVO.hos_num}">처방전 보기</a></button></td>
				
			</tr>
		</c:forEach>
			</table>
			<br><br><br>
			<hr>
		</div>

		
		</section>
		<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center;">
			<div style="width:390px; margin-bottom: 80px">
				<p class = "p">Pharmacy Reservation</p><br>
				<table class="table table-hover" id = "table1" style="font-size: 18px;">
					<tr>
						<td style="text-align : center;">예약번호</td>
						<td style="text-align : center;">약국이름</td>
						<td style="text-align : center;">예약시간</td>
			
					</tr>
		
					<c:forEach var="pResVO" items="${pharList }" varStatus="status">
						<tr>
							<td style="text-align : center;">${pResVO.phar_res_num }</td>
							<td style="text-align : center;"><a href = "pharResDetail.do?phar_res_num=${pResVO.phar_res_num}&phar_num=${pResVO.phar_num}">${pharNameList[status.index] }</td>
							<td style="text-align : center;">${pResVO.phar_res_time }</td>
						</tr>
					</c:forEach>
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




<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border = "1">
		<tr>
			<td>예약번호</td>
			<td>병원이름</td>
			<td>예약날짜</td>
			<td>처방전</td>
			
		</tr>
		
		<c:forEach var="resVO" items="${list }" varStatus="status">
			<tr>
				<td>${resVO.hos_res_num }</td>
				<td><a href = "detailRes.do?hos_res_num=${resVO.hos_res_num}">${hosName[status.index] }</td>
				<td>${resVO.hos_res_date }</td>
				<td><button><a href = "presDetail.do?hos_res_num=${resVO.hos_res_num }&hos_num=${resVO.hos_num}">처방전 보기</a></button></td>
				
			</tr>
		</c:forEach>
	</table>
	<br><br>
	<hr/>
		<table border = "1">
		<tr>
			<td>예약번호</td>
			<td>약국이름</td>
			<td>예약시간</td>
			
		</tr>
		
		<c:forEach var="pResVO" items="${pharList }" varStatus="status">
			<tr>
				<td>${pResVO.phar_res_num }</td>
				<td><a href = "pharResDetail.do?phar_res_num=${pResVO.phar_res_num}&phar_num=${pResVO.phar_num}">${pharNameList[status.index] }</td>
				<td>${pResVO.phar_res_time }</td>
			</tr>
		</c:forEach>
	</table>
	
	
	
</body>
</html> --%>