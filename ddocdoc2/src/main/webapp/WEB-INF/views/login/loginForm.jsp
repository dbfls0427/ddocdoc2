<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
    <head>
  <%@include file="../includes/header.jsp" %>
        
        
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
	<style>
			 	#back{
	background-image: url("http://image.sayup.co.kr/contents/5657c3bf1adac60300b0039a/ac75955cd33a3b9c2a9c9f7da2ba1538.jpg");
	background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 40%;
    
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
    </head>
    <body>
        <!--
        ==================================================
        Header Section Start
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
                        <a href="index.html" >
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
                                <a href="/customer/loginSuccess" >Home</a>
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
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">아이관리 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/child/childList">아이관리</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">QR코드 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/DDOCDOC/Customer/detailCustomer.do">QR코드 발급</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">똑닥뷰티<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/video/beautyVideo">뷰티TV</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">서비스<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/health/healthList">건강정보</a></li>
                                        <li><a href="../Customer/reviewInsertForm.do">후기 작성</a></li>
                                        <li><a href="../Customer/reviewList.do">후기 목록</a></li>
                                    </ul>
                                </div>
                            </li>
                             <li><a href="/customer/loginForm">로그인</a></li>
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
        <section class="global-page-header" id="back">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2>LOGIN</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="/index/index">
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
						<form action="/customer/joinForm" method = "get">
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
		
		
		
		

		
<%@include file="../includes/footer.jsp" %>
 	</body>
</html>