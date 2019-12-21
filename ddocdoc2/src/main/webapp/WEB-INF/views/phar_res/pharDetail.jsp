<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
	

</style>

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
	<section class="global-page-header" style="background: #ffe307;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block">
					<h2>DETAIL PHARMACY</h2>
					<ol class="breadcrumb">
						<li><a href="/customer/index"> <i class="ion-ios-home"></i>
								Home
						</a></li>
						<li class="active">Detail Pharmacy</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	</section>

	
	
	<section class="company-description" style="display: flex; justify-content: center;">
		<div>
			<p class = "p">Detail</p>
			<table class="table table-condensed" align="center">
		  		<tr>
					<td>예약 번호</td>
					<td>예약 시간</td>
					<td>메모</td>
					<td>약국이름</td>
					<td>대기번호</td>
				</tr>
				  
				<tr>
					<td>${res.phar_res_num }</td>
					<td>${res.phar_res_time }</td>
					<td>${res.phar_res_memo }</td>
					<td>${pharName }</td>
					<td>${phar_wait }</td>
				</tr>

			</table>
	
	</section>
	<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center;">
	
		</section>
	
<!-- menu module -->
<%@include file="../includes/footer.jsp" %>
<!-- end menu module -->



</body>
	
	
</html>












<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>똑닥</title>
</head>
<body>
<h3> 약국 예약 상세보기 </h3>

	<table border = "1">
		<tr>
			<td>예약 번호</td>
			<td>예약 시간</td>
			<td>메모</td>
			<td>약국이름</td>
			<td>대기번호</td>
		</tr>
		<tr>
			<td>${res.phar_res_num }</td>
			<td>${res.phar_res_time }</td>
			<td>${res.phar_res_memo }</td>
			<td>${pharName }</td>
			<td>${phar_wait }</td>
		</tr>
	</table>

</body>
</html> --%>