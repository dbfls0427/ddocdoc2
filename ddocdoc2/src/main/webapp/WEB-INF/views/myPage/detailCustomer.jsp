<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<%@include file="../includes/header.jsp" %>
<script type="text/javascript" src = "/resources/js/jquery.min.js"></script>
<script type="text/javascript" src = "/resources/js/qrcode.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
<style type="text/css">
hr {
  height: 1px;
  background-color: #ffe307;
}

.p{
	font-family: fantasy;
	font-size: 26px;
	color : #ffe307;
}

#back{
	background-image: url("https://cdn.ddocdoc.com/collection/fbe5f362bd5c10ec6677f9361a6c809b.jpg");
	background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    
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
					<h2>QR 코드</h2>
					<ol class="breadcrumb">
						<li><a href="/customer/loginSuccess"> <i class="ion-ios-home"></i>
								Home
						</a></li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	</section>
	
	<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center; margin-bottom: 60px;">
	
		<div>
			<p class = "p">Info</p>
			<table class="table table-condensed" align="center" style="font-size: 18px;">
		  		<tr>
		  			<td>회원 아이디</td>
		  			<td>회원 이름</td>
		  			<td>회원 주소</td>
		  			<td>회원 이메일</td>
		  			<!-- <td>회원 생년월일</td> -->
		  		</tr>
		  		<tr>
		  			<td>${customer.cus_id }</td>
		  			<td>${customer.cus_name }</td>
		  			<td>${customer.cus_addr }</td>
		  			<td>${customer.cus_email }</td>
		  			<%-- <td>${customer.cus_birth }</td> --%>
		  		</tr>
		  		
			</table>
			
		<hr>
		<br>
			<textarea cols="71" rows="6" class = "autosize" onkeydown="resize(this)" onkeyup = "resize(this)" id = "led-text" charset = "UTF-8" style="margin-left: 30px;" readonly="readonly">${customer.cus_num},${customer.cus_id },${customer.cus_name },${customer.cus_addr },${customer.cus_email }<%-- ,${customer.cus_birth } --%></textarea><br>
				<button type = button  class="btn btn-warning btn-lg" id = "led-button1" onclick="button1_click()" style="margin-left: 198px; margin-top: 20px;">QR코드 발급</button>
		</div>
	
		<div id = "qrcode" style = "width:200px; height:200px; margin-top:160px; margin-left: 198px"></div> 
				<script>
				var qrcode = new QRCode(document.getElementById("qrcode"),{height : 150, width : 150});
			
				function makeCode(){
					var elText = document.getElementById("led-text");
					if(!elText.value){
						alert("Input a text");
						elText.focus();
						return;
					}
					alert(elText.value);
					
					qrcode.makeCode(elText.value);
				}
				function button1_click(){
					makeCode();
				}
				function resize(obj){
					obj.style.height = "1px";
					obj.style.height = (12 + obj.scrollHeight) + "px";
				}
			
			</script>
		</section>
	
<%@include file="../includes/footer.jsp" %>
</body>
	
	
</html>



<%-- 
<body>
	
	
	
	<div class = "led-group" align = "center">
	회원 아이디 : <h1 id = "let-text">${customer.cus_id }</h1><br>
	회원 이름 : ${customer.cus_name }<br>
	회원 주소 : ${customer.cus_addr }<br>
	회원  이메일 : ${customer.cus_email }<br>
	회원 생년월일 : ${customer.cus_birth }<br>
	
	
		<h1>고객 상세정보 QR코드</h1> 
		<textarea cols="18" rows="20" class = "autosize" onkeydown="resize(this)" onkeyup = "resize(this)" id = "led-text" charset = "UTF-8">고객 아이디 : ${customer.cus_id }     고객 이름 : ${customer.cus_name }       고객 주소 : ${customer.cus_addr }       고객 이메일 : ${customer.cus_email }     고객 생년월일 : ${customer.cus_birth }</textarea>
		<button type = button id = "led-button1" onclick="button1_click()">QR코드 발급</button>
		<div id = "qrcode" style = "width:100px; height:100px; margin-top:15px;"></div> 
	
	</div>
	
	<script>
		var qrcode = new QRCode(document.getElementById("qrcode"),{height : 100, width : 100});
	
		function makeCode(){
			var elText = document.getElementById("led-text");
			if(!elText.value){
				alert("Input a text");
				elText.focus();
				return;
			}
			alert(elText.value);
			
			qrcode.makeCode(elText.value);
		}
		function button1_click(){
			makeCode();
		}
		function resize(obj){
			obj.style.height = "1px";
			obj.style.height = (12 + obj.scrollHeight) + "px";
		}
	
	</script>
	

</body> --%>