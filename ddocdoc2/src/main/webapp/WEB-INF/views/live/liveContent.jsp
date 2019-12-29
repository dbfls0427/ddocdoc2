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
</style>
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

	<section class="company-description" id="wrapjoin" style="display: flex; padding-left : 15%">
		<label>Live방송 제목 </label>
	    <label style="font-size: 30px; margin-top: 16px;">${customer.cus_name }님의 상담 내역</label>
	</section>	
	
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Panel title</h3>
  </div>
  <div class="panel-body">
    Panel content
  </div>
</div>

	<div id="test" class="class="panel panel-danger"> 
	
	</div>
	
<!-- header module -->
<%@include file="../includes/footer.jsp" %>
<!-- end header module -->	
</body>
</html>