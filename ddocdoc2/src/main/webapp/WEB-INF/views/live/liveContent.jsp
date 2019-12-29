<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- header module -->
<%@include file="../includes/header.jsp" %>
<!-- end header module -->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
jQuery(document).ready(function(){
	var content = "${live.live_content }";
	jQuery("#test").html(content);
});

</script>
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
hr{
	margin-top : none;
	margin-bottom : none;
	border: 0;
    border-top: 1px solid #804545;
    border-width: 3px;
}

.labe{
	font-size : 20px;
	color : gray;
}

#bar{
	color : #804545;
	font-size : 25px;
}

.panel-title{
    margin-top: 0;
    margin-bottom: 0;
    font-size: 20px;
    color: inherit;
}

.panel-body{
	font-size : 17px;
}
</style>
</head>
<body>
<!-- header module -->
<%@include file="../includes/menu.jsp" %>
<!-- end header module -->
<!-- end menu module -->
        
	<!-- 
        ================================================== 
            TITLE: Global Page Section Start
        ================================================== -->
	<section class="global-page-header" id="back">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h2>Live 상담내역</h2>
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

	<section class="company-description" id="wrapjoin" style="padding-left : 30%; width : 1350px;">
	    <label style="font-size: 30px; margin-top: 16px;">${customer.cus_name }님의 상담 내역</label>&nbsp &nbsp
		<label id="bar">|</label><label class="labe">${live.live_name }</label>
		<label id="bar">|</label><label class="labe">${live.live_hos }</label><label id="bar">|</label>
	    <hr>
	    <br>
	</section>	

	<div id="test" style="width:700px; margin-left : 30%; margin-top:10px; margin-bottom : 7%;"> 
	
	</div>
	
<!-- header module -->
<%@include file="../includes/footer.jsp" %>
<!-- end header module -->	
</body>
</html>