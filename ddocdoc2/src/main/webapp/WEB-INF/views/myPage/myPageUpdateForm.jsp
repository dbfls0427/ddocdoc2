<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<%@include file="../includes/header.jsp" %>

<style type="text/css">
#wrapjoin {
	display: flex;
	justify-content: center;
}

#joinformdiv {
	width: 40%;
}

.wrapbtnform {
	display: flex;
	justify-content: center;
}

.wrapbtnform a, .wrapbtnform input {
	width: 50%;
	text-align: center;
	margin: 10px 0;
}

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


	<section class="company-description" id="wrapjoin" style="padding-bottom: 50px;">
	<div id="joinformdiv">
		<form action="/customer/myPageUpdate" method="post">
			<input type="hidden" name="cus_num" value="${customer.cus_num }"><br>
			<div class="form-group">
				<input type="text" class="form-control input-lg" name = "cus_id" value=${customer.cus_id } readonly/>
			</div>
			<div class="form-group">
				<label>PW</label> <input type="text" name="cus_pw"
					class="form-control input-lg" placeholder="Passward">
			</div>
			<div class="form-group">
				<label>이름</label> <input type="text" name="cus_name"
					class="form-control input-lg" placeholder="이름" value=${customer.cus_name }>
			</div>
			<div class="form-group">
				<label>주소</label> <input type="text" name="cus_addr"
					class="form-control input-lg" placeholder="주소" value=${customer.cus_addr }>
			</div>
			<div class="form-group">
				<label>이메일</label> <input type="text" name="cus_email"
					class="form-control input-lg" placeholder="이메일" value=${customer.cus_email }>
			</div>
			<%-- <div class="form-group">
				<label>생년월일</label> <input type="text" name="cus_birth"
					class="form-control input-lg" placeholder="생년월일" value=${customer.cus_birth }>
			</div> --%>
			<hr>
			<div class="wrapbtnform">
				<input type="submit" class="btn btn-warning" value="수정">
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>


	</div>
	</section>

	<b></b>
<%@include file="../includes/footer.jsp" %>
</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="customerMypageUpdate.do" method="post">
		<input type = "hidden" name = "cus_num" value="${cus_num }"><br>
		아이디 : ${cus_id }<br>
		비밀 번호 : <input type = "text" name = "cus_pw"><br>
		이름 : <input type = "text" name = "cus_name"><br>
		주소 : <input type = "text" name = "cus_addr"><br>
		이메일 : <input type = "text" name = "cus_email"><br>
		생년 월일 : <input type = "text" name = "cus_birth"><br>
		<input type = "submit" value = "수정">
	
	</form>


</body>
</html> --%>