<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.ddocdoc.vo.heightvo.HeightVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link rel="stylesheet" href="../plugins/bootstrap/bootstrap.min.css">
        <!-- Ionicons Fonts Css -->
        <link rel="stylesheet" href="../plugins/ionicons/ionicons.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="../plugins/animate-css/animate.css">
        <!-- Hero area slider css-->
        <link rel="stylesheet" href="../plugins/slider/slider.css">
        <!-- owl craousel css -->
        <link rel="stylesheet" href="../plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="../plugins/owl-carousel/owl.theme.css">
        <!-- Fancybox -->
        <link rel="stylesheet" href="../plugins/facncybox/jquery.fancybox.css">
        <!-- template main css file -->
        <link rel="stylesheet" href="../css/style.css">
        
        <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap&subset=korean" rel="stylesheet">      
        <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    var height = new Array();
	var date = new Array();
		<%for(int i=0; i<height.length; i++){%>
			height.push('<%=height[i]%>')
			date.push('<%=date[i]%>')
			document.write(<%=height[i]%>);
		<%}%>
	
	
    // 성장그래프
    if(height.length > 0){
	    google.charts.load('current', {'packages':['line']});
	    google.charts.setOnLoadCallback(drawChart);
    }


    function drawChart() {
      var data = new google.visualization.DataTable();

      data.addColumn('string', 'Day');
      data.addColumn('number', '키');

		
      for(var i=0; i<height.length; i++){
 		 
	      	data.addRows([
	      		[date[i], parseFloat(height[i])]
	      	]);
	      	
  		} 
      var options = {
		
        chart: {
          title: '우리아이 성장속도 한눈에 보기'
        },
        width: 900,
        height: 500,
        axes: {
          x: {
            0: {side: 'top'}
          }
        }
      };

      var chart = new google.charts.Line(document.getElementById('line_top_x'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }
    
    //빅데이터 그래프
    if(height.length > 0){
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart2);
    }
    
	function drawChart2() {
	      var data = google.visualization.arrayToDataTable([
	        ['또래의 평균 키', '<%=ch_name%>', '평균 키'],
	        ['키 분석', <%=height[height.length-1]%>, <%=st_height%>]
	      ]);
	
	      var options = {
	        chart: {
	          title: '<%=ch_name%>의 또래 평균 키는 ' + <%=st_height%> + ' cm입니다',
	          subtitle: '',
	        }
	      };
	
	      var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	
	      chart.draw(data, google.charts.Bar.convertOptions(options));
	    }
    
 
  </script>
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap&subset=korean" rel="stylesheet">      
  <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
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
<meta charset="UTF-8">
<title>Insert title here</title>
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
                            <img src="../images/logo.png" alt="">
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
                             <li><a href="/DDOCDOC/child.index.jsp?cus_name=${customer.cus_name } ">아이관리</a></li>
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
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${cus_name } 님 <span class="caret"></span></a>
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
                            <h2>아이관리</h2>
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

	<section id="btn" class="company-description" style="margin-bottom: 0; display: flex; justify-content: center">
		<button class="btn btn-default btn-lg"><a href="HeightInsertFormAction.do?ch_num=<%=ch_num%>&ch_name=<%=ch_name%>&cus_name=${cus_name}">키 등록</a></button>
	</section>
	<section id="btn" class="company-description" style="margin-top: 10px; display: flex; justify-content: center; font-weight: 600;">
		
		<div style="width:500px;">
			<table class="table table-hover" id="sun" style="font-size: 18px;">
				<tr>
					<td style="text-align : center;">등록한 키</td>
					<td style="text-align : center;">등록 날짜</td>
				</tr>
				<c:forEach var="height" items="${list }">
					<tr>
						<td style="text-align : center;"><a class="aa" href="detailHeight.do?he_num=${height.he_num }&ch_name=<%=ch_name%>&ch_num=${ch_num}&cus_name=${cus_name}">${height.he_height }</a></td>
						<td style="text-align : center;">${height.he_date }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
	</section>
	
	<section id="btn" class="company-description" style="display: flex; justify-content: center; margin-bottom: 100px; font-size: 16px;">
		<div class="panel panel-default"  style="margin-right: 80px;">
			<div id="line_top_x" class="panel-body"></div>
		</div>
		<div class="panel panel-default">
			<div id="columnchart_material" style="width: 400px; height: 500px;" class="panel-body"></div>
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
	<script src="../plugins/jQurey/jquery.min.js"></script>
	<!-- Form Validation -->
    <script src="../plugins/form-validation/jquery.form.js"></script> 
    <script src="../plugins/form-validation/jquery.validate.min.js"></script>
	<!-- owl carouserl js -->
	<script src="../plugins/owl-carousel/owl.carousel.min.js"></script>
	<!-- bootstrap js -->
	<script src="../plugins/bootstrap/bootstrap.min.js"></script>
	<!-- wow js -->
	<script src="../plugins/wow-js/wow.min.js"></script>
	<!-- slider js -->
	<script src="../plugins/slider/slider.js"></script>
	<!-- Fancybox -->
	<script src="../plugins/facncybox/jquery.fancybox.js"></script>
	<!-- template main js -->
	<script src="../js/main.js"></script>
	
</body>
</html>