<%@page import="org.ddocdoc.vo.childvo.ChildVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%@include file="../includes/header.jsp" %>
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<style type="text/css">
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}
hr {
	height: 1px;
	background-color: #ffe307;
}

.p {
	font-family: fantasy;
	font-size: 26px;
	color: #ffe307;
}

tr:nth-child(2n) {
	background-color: #FFFFA5;
}

/* #intro {
	font-family: 'Stylish', sans-serif;
}

#table1 {
	font-family: 'Sunflower', sans-serif;
} */
</style>
<link
	href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Stylish&display=swap&subset=korean"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap&subset=korean"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

	
<script type="text/javascript">
	var j = jQuery.noConflict();
	j(document).ready(function(){
		j('#circle').mouseover(function(){
			j(this).css("color","darkblue");
		});
		
		j('#circle').mouseleave(function(){
			j(this).css("color","#f13ea1");
		});

		
	});
	
</script>
</head>
<body>
<!-- menu module -->
<%@include file="../includes/menu.jsp" %>
<!-- end menu module -->
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

	<label id="intro"
		style="display: flex; justify-content: center; margin-top: 50px; margin-bottom: 0; font-size: 24px;">아이의
		이름을 눌러 건강피드를 관리해보세요!</label>
	<br>
	<section class="company-description"
		style="display: flex; justify-content: center; margin-top: 15px; margin-bottom: 80px;">
		<div>
			<div style="display: flex;">
			<a href="/child/childInsert" style="margin-left: 80%; ">
				<i class="fas fa-plus-circle fa-3x"
					id="circle" title="아이등록"
					style="margin-bottom: 10px; color: #f13ea1;"></i>
			</a>
			</div>
			<table class="table table-hover" align="center"
				style="width: 400px; text-align: center; font-size: 20px; margin-bottom: 0; font-weight: 600;"
				id="table1">
				<c:forEach var="ChildVO" items="${childList}">
					<tr>
						<td style="text-align: center;"><a
							href="/child/childDetail?ch_num=${ChildVO.ch_num}">${ChildVO.ch_name }</a></td>
						<td style="text-align: center;">${ChildVO.ch_birth }</td>
					</tr>
				</c:forEach>

			</table>
			<hr style="margin-top: 3px;">
		</div>
	</section>

<!-- menu module -->
<%@include file="../includes/footer.jsp" %>
<!-- end menu module -->

</body>
</html>