<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
    <head>
 <%@include file="../includes/header.jsp" %>
        
    	<script type="text/javascript">
			function joinMember() {
				window.open("<%= request.getContextPath()%>/confirmForm.jsp", "confirm", "width=640, height=400")
			}
		
		</script>
        
        
        <style type="text/css">
        	#wrapjoin {
        	 	display: flex;
    			justify-content: center;
        	
        	}
        	
        	#joinformdiv {
        		width: 40%;
        	}
        	
        	.wrapbtnform{
        		display: flex;
    			justify-content: center;
        	}
        	
        	.wrapbtnform a, .wrapbtnform input{
        		width: 50%;
       		    text-align: center;
    			margin: 10px 0;
        	}
        
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
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
    <style>
    		 	#back{
	background-image: url("http://image.sayup.co.kr/contents/5657c29f1adac60300af7145/17027e6391feb9505371a8b4846e0763.jpg");
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
    
    </style>    
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
                            <h2>JOIN</h2>
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
        
        <section class="company-description" id="wrapjoin">
        	<div id="joinformdiv">
	        	<form action="/customer/joinAction" method="post">
	        		<div class="form-group">
						<label>ID</label>
						<input type = "text" name = "cus_id" class="form-control input-lg" placeholder="ID">
					</div>
					<div class="form-group">
						<label>PW</label>
						<input type = "text" name = "cus_pw" class="form-control input-lg" placeholder="Passward">
					</div>
					<div class="form-group">
						<label>이름</label>
						<input type = "text" name = "cus_name" class="form-control input-lg" placeholder="이름">
					</div>
					<div class="form-group">
						<label>주소</label>
						<input type = "text" name = "cus_addr" class="form-control input-lg" placeholder="주소">
					</div>
					<div class="form-group">
						<label>이메일</label>
						<input type = "text" name = "cus_email" class="form-control input-lg" placeholder="이메일">
					</div>
					<!-- <div class="form-group">
						<label>생년월일</label>
						<input type = "text" name = "cus_birth" class="form-control input-lg" placeholder="생년월일">
					</div> -->
					<div class="wrapbtnform">
						<!-- <a class="btn btn-default active" href="javascript:joinMember()">인증번호</a> -->
					</div>
					<hr>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="wrapbtnform">
						<input type = "submit" class="btn btn-warning" value = "가입">
					</div>
				</form>
				
				
				
        	</div>
        </section>
        
        
        
     <!--   
	<form action="joinAction.do" method = "post">
		ID : <input type = "text" name = "joinID"><br>
		PW : <input type = "text" name = "joinPW"><br>
		이름 : <input type = "text" name = "joinName"><br>
		주소 : <input type = "text" name = "joinAddr"><br>
		이메일 : <input type = "text" name = "joinEmail"><br>
		생년월일 : <input type = "text" name = "joinBirth"><br>
		인증번호 : <input type = "text" name = "confirmNum">
		
		<input type = "submit" value = "가입">
		
	</form>
	
	<button><a href = "javascript:joinMember()">인증번호</a></button>
	
	 --> 
	 
	 
	
	<!-- <form action="confirm.do" method = "post">
	<input type = "submit" value = "인증번호 받기">
	</form>
	<form action="confirm.do" method = "post">
	<input type = "submit" value = "인증번호 받기">
	</form> -->


<%@include file="../includes/footer.jsp" %>
 	</body>
</html>