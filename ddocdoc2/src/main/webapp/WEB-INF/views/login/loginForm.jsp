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
    </head>
    <body>
<%@include file="../includes/menu.jsp" %>
        
        <!-- 
        ================================================== 
            TITLE: Global Page Section Start
        ================================================== -->
        <section class="global-page-header" style="background: #ffe307;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2>LOGIN</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="../index.html">
                                        <i class="ion-ios-home"></i>
                                        Home
                                    </a>
                                </li>
                                <li class="active">LOGIN</li>
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