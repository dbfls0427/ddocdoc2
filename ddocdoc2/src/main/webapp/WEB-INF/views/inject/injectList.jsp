<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<!-- header module -->
<%@include file="../includes/header.jsp" %>
<!-- end header module -->

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
        
        <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap&subset=korean" rel="stylesheet">      
        <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
        
<style type="text/css">
	#chart_div{
		padding-left: 0
	}
</style>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
	   var percent = '<c:out value="${pc }"/>';
  
  		if(percent <= 0){
  			return;
	    }
  		google.charts.load('current', {packages: ['corechart', 'bar']});
  		google.charts.setOnLoadCallback(drawMultSeries);
  		
	  function drawMultSeries() {
		  var data = google.visualization.arrayToDataTable([
	        [' ', '접종률', { role: 'style' },'전체달성',{ role: 'style' }],
	        [' ', percent, 'fill-color: #FA5882', 100, 'fill-color: #A4A4A4']
	      ]);
	
	      
	      var options = {
	        chartArea: {width: '30%'},
	        hAxis: {
	          title: '접종달성 현황',
	          minValue: 0
	        }
	      };
	
	      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
	      chart.draw(data, options);
	    }
  </script>
  <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap&subset=korean" rel="stylesheet">      
  <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
   <style type="text/css">
 	tr:nth-child(2n+1) {
  				background-color: #FFFFA5;
			}
	 a:link { color : red; text-decoration: none;}
	 a:visited { color: red; text-decoration: none;}
	 #childHO{
	 color:black;
	 }
 	#btn{
 		 /* font-family: 'Sunflower', sans-serif; */
 		/* font-family: 'Do Hyeon', sans-serif; */
 		/* font-family: 'Jua', sans-serif; */
 	}
 	#intro{
 		/* font-family: 'Jua', sans-serif; */
 	}
 	#sun{
 		/* font-family: 'Sunflower', sans-serif; */
 	}
 	
 </style>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<h2>예방접종 목록</h2>
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
		<button class="btn btn-default btn-lg"><a href="../map/injSearch.jsp?cus_name=${cus_name }" id="childHo">가까운 소아과 예약하기</a></button>
	</section>
	<section class="company-description" style="margin-top: 10px; display: flex; justify-content: center; font-weight: 500; font-size: 25px; margin-top: 30px;">
		<label id="sun" style="padding: 8px ">접종률</label>&nbsp<label id="btn" style="color: #6472dc;font-size: 35px;">${percent }</label><br>
	</section>	
		<div id="chart_div"></div>
			<label id="sun" style="display: flex; justify-content: center; margin-top: 50px; font-size: 25px; margin-bottom: 0;">미접종/접종완료 버튼을 눌러 접종기록을 관리하세요!</label>
			<section id="btn" class="company-description" style="display: flex; justify-content: center; margin-top: 20px;">
				<div>
				<table style="font-size: 22px;" class = "table table-hover">
				<c:forEach var="list" items="${list }">
					<tr>
						<td colspan="2" style="text-align : center;">${list.inj_info_name }</td>
						<td rowspan="2" style="text-align : center;">
							<c:set var="loop_flag" value="false"/>
							<c:set var="answer" value="미접종"/>
							<c:forEach var="inj" items="${injList }">
								<c:if test="${not loop_flag }">
									<c:choose>
										<c:when test="${inj eq list.inj_info_num}">
											<c:set var="answer" value="접종완료"/>
											<a href="InjectDetail?ch_num=${ch_num }&inj_content=${list.inj_info_num}&inj_info_name=${list.inj_info_name}&inj_info_date=${list.inj_info_date }&inj_name=${list.inj_info_name }"><c:out value="${answer }"/></a>
											<c:set var="loop_flag" value="true"/>
										</c:when>
									</c:choose>
								</c:if>
							</c:forEach>
							<c:if test="${answer ne '접종완료' }">
								<a href="/inject/injectInsert?ch_num=${ch_num }&inj_content=${list.inj_info_num}&inj_info_name=${list.inj_info_name}&inj_info_date=${list.inj_info_date }&inj_name=${list.inj_info_name }"><c:out value="${answer }"/></a>
							</c:if>
							
							
						</td>
					</tr>
					<tr>
						<td style="text-align : center;">${list.inj_info_price }</td>
						<td style="text-align : center;">${list.inj_info_date }</td>
					</tr>
				</c:forEach>
				</table>
				</div>
			</section>

<!-- footer module -->
<%@include file="../includes/footer.jsp" %>
<!-- end footer module -->
</body>
</html>