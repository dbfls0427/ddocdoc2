<%-- 
<%@page import="org.ddocdoc.vo.customervo.CustomerVO"%>
<%@page import="ddocdoc.loginSession.LoginSession"%>
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <% String phar_name =request.getParameter("phar_name");
    request.setAttribute("phar_name", phar_name);
    String cus_name= request.getParameter("cus_name");
    request.setAttribute("cus_name", cus_name);
    %>
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

<script>
 $(function() {
  $("#datepicker").datepicker();
 });
</script>
<style type="text/css">
 #forming{
/*  	font-family: 'Jua', sans-serif; */
 	font-size: 20px;
 }
 	 #back{
	background-image: url("http://image.sayup.co.kr/collection/5673593e4e196103009ffce4/a018f2e44ebe10cad27931493e1d2a22.jpg");
	background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 85%;
    
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
</head>
<body>

	
<!-- menu module -->
<%@include file="../includes/menu.jsp" %>
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
                            <h2>약국 예약</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="/customer/loginSuccess">
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
    <section id="forming"  class="company-description" style="display: flex; justify-content: center; margin-bottom: 200px;">
		<div style="width: 400px;">
			<form action="/customer/pharRes" method = "post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div style="display: flex; justify-content: center;">
				<label>메모</label>&nbsp&nbsp<input type = "text" name = "phar_res_memo" class="form-control" style="width: 350px;"><br>
			</div>
			<br>
			<div>
				<label>방문 시간</label>&nbsp&nbsp<select name="phar_res_time" class="form-control">
					      <option value="09:00">09:00</option>
					      <option value="09:30">09:30</option>
					      <option value="10:00">10:00</option>
					      <option value="10:30">10:30</option>
					      <option value="11:00">11:00</option>
					      <option value="11:30">11:30</option>
					      <option value="12:00">12:00</option>
					      <option value="12:30">12:30</option>
					      <option value="13:00">13:00</option>
					      <option value="13:30">13:30</option>
					      <option value="14:00">14:00</option>
					      <option value="14:30">14:30</option>
					      <option value="15:00">15:00</option>
					      <option value="15:30">15:30</option>
					      <option value="16:00">16:00</option>
					      <option value="16:30">16:30</option>
					      <option value="17:00">17:00</option>
					      <option value="17:30">17:30</option>
					      <option value="18:00">18:00</option>
				    </select><br>
			
			</div>
			<input type = "hidden" name = "cus_num" value = ${customer.cus_num }><br>
			<input type = "hidden" name = "phar_name" value = ${phar_name }><br>
			<div style="display: flex; justify-content: center;">
				<input type = "submit" value = "예약" class="btn btn-warning btn-lg">
			</div>
			</form>
		</div>
    </section>
    
    
<!-- menu module -->
<%@include file="../includes/footer.jsp" %>
<!-- end menu module -->


</body>

</html>