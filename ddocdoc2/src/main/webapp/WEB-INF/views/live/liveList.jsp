<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../includes/header.jsp" %>
<link
	href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<style type="text/css">
#back{
	background-image: url("https://cdn.ddocdoc.com/contents/1741217071e53812499a76095.jpg");
	background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 43%;
    
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
<script>
var timer = new Date();
	setInterval(function(){
		var h = timer.getHours();
		var m = timer.getMinutes();
		var s = timer.getSeconds();
		$('#clock1').append = h + ":" + m + ":" + s;
	},1000);


</script>
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
						<h2>Live 상담</h2>
						<ol class="breadcrumb">
							<li><a href="/customer/loginSuccess"> <i
									class="ion-ios-home"></i> Home
							</a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>
<section class="company-description" id="wrapjoin" style="display: flex; padding-left : 15%">
	<label style="font-weight: bolder; font-size: 50px; color: #b71a12;">|</label>
    <label style="font-size: 30px; margin-top: 16px;">실시간 방송</label>
</section>	
<div style = "display: flex; margin-left : 11%; height:360px;">
	<c:set var = "i" value="1"/>
	<c:forEach var="on" items="${live_list }">
		<div class="row" style="margin-top:15px; margin-bottom : 20%; margin-right:10px;">
		  <div class="col-sm-6 col-md-4" style="width: 350px; margin-left:23%;">
		    <div class="thumbnail">
		      <img src="/resources/images/on6.PNG" alt="on air image">
		      <div class="caption">
		        <h3>${on.live_name }</h3>
		        <p>${on.live_hos } | <i class="fas fa-user-friends"></i>${on.live_count}/2</p>
		        <p id="clock">${on.live_start }</p>
		        <p><a href="/live/liveUpdate?cus_num=${customer.cus_num}&live_num=${on.live_num}&live_address=${on.live_address}" class="btn btn-default" role="button" id="clock1">상담하러가기</a></p>
		      </div>
		    </div>
		  </div>
		</div>
		<br>
		<br>
		<c:if test="${i%4 eq 0}">
			<c:out value="<br>" escapeXml="true"/>
		</c:if>
		<c:set var="i" value="${i+1}"/>
	</c:forEach>
</div>

<section class="company-description" id="wrapjoin" style="display: flex; padding-left : 15%">
	<label style="font-weight: bolder; font-size: 50px; color: #b71a12;">|</label>
    <label style="font-size: 30px; margin-top: 16px;">${customer.cus_name }님의 상담 내역</label>
</section>	

<div style = "margin-bottom : 20%;display: flex; margin-left : 11%">
	<c:set var = "i" value="1"/>
	<c:forEach var="past" items="${past_list }">
		<div class="row" style="margin-top:15px; margin-bottom : 20%; margin-right:10px;">
		  <div class="col-sm-6 col-md-4" style="width: 350px; margin-left:23%;">
		    <div class="thumbnail">
		      <img src="/resources/images/on6_gray.png" alt="past live image">
		      <div class="caption">
		        <h3>${past.live_name }</h3>
		        <p>${past.live_hos } | <i class="fas fa-user-friends"></i>${on.live_count}/2</p>
		        <p id="clock">${past.live_start }</p>
		        <p><a href="#" class="btn btn-default" role="button" id="clock1">상담내역보기</a></p>
		      </div>
		    </div>
		  </div>
		</div>
		<br>
		<br>
		<c:if test="${i%4 eq 0}">
			<c:out value="<br>" escapeXml="true"/>
		</c:if>
		<c:set var="i" value="${i+1}"/>
	</c:forEach>
</div>
<%@include file="../includes/footer.jsp" %>
</body>
</html>