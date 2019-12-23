<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<head>
 <%@include file="../includes/header.jsp" %>

<style type="text/css">
</style>
<script type="text/javascript">
	function next() {
		if (confirm("탈퇴하시겠습니까?")) {
			location.href = "/customer/myPageDelete?cus_num=${customer.cus_num}";
		} else {
			location.href = "myPageForm.do";
		}
	}
</script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

<style>
    		 	#back{
	background-image: url("http://image.sayup.co.kr/contents/5657c30e1adac60300afba48/c90e5039182f9ebc7ca8de8272d63184.jpg");
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
						<h2>My Page</h2>
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



	<!-- 
================================================== 
    Works Section Start
================================================== -->
	<section class="works service-page"
		style="display: flex; justify-content: center;">

		<div class="btn-group" role="group" aria-label="...">

			<form action="/customer/myPageUpdateForm" method="get">
				<input type="hidden" name="cus_num" value="${customer.cus_num}">
				<input type="submit" value="개인 정보 수정" class="btn btn-warning"
					style="height: 150px; width: 150px;">
			</form>
		</div>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<div class="btn-group" role="group" aria-label="...">
			<button onclick="next()" class="btn btn-warning"
				style="height: 150px; width: 150px;">회원 탈퇴</button>
		</div>










	</section>



<%@include file="../includes/footer.jsp" %>
</body>
</html>


<%-- <html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function next(){
	 if(confirm("탈퇴하시겠습니까?"))
	 {
	   location.href="customerDelete.do?cus_num=${customer.cus_num}"; 
	 }
	 else
	 {
		location.href="myPageForm.do"; 
	 }
	}
	</script>
</head>
<body>

	<form action="customerUpdateForm.do" method="post">
		<input type = "hidden" name = "cus_num" value = "${customer.cus_num}">
		<input type = "submit" value = "정보 수정"/>
	</form>
	
	<button onclick="next()">탈퇴하기</button>

</body>
</html> --%>