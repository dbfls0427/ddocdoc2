<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<%@include file="../includes/header.jsp" %>

<style type="text/css">
	a{
		text-decoration: none;
		color: #FFFFFF;
	}
	
	button{
		color:#FFFF1C;
	}
	
	.p{
	font-family: fantasy;
	font-size: 26px;
	color : #ffe307;
	}
	
	.pz{
		font-weight: bold;
		font-size: 28px;
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
					<h2>처방전 상세</h2>
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
	
	<section class="company-description" style="display: flex; justify-content: center;">
		<div>
		<p class = "p">Detail</p>
		<br>
		<div>
			<table class="table table-condensed" align="center" style="font-size: 16px;">
				  <tr>
					<td>처방전번호</td>
					<td>발급일</td>
					<td>복용횟수</td>
					<td>고객이름</td>
					<td>병원이름</td>
					<td>예약번호</td>
					<td>결제여부</td>
				 </tr>
				  <tr>
					<td>${pres.pres_num }</td>
					<td>${pres.pres_date }</td>
					<td>${pres.pres_count }</td>
					<td>${cus_name }</td>
					<td>${hos_name }</td>
					<td>${pres.hos_res_num }</td>
					<td>${check }</td>
				  </tr>
		  		
			</table>
		</div>
		</div>
		<div style="margin-left: 100px; border: 1; width: 400px; border-color: #ffe307;" class="panel panel-default" >
		<div class="panel-body" id="div1" style="font-size: 18px;">
		<p class = "pz">처방전 약 목록</p>
		<br>
		<c:forEach var="medicine" items="${list}" varStatus="status">
		<span>${medicine.med_num } &nbsp ${list2[status.index] }</span><br>
		</c:forEach>
		<hr>
		<span>약 총 가격 : ${price }</span>
		</div>
		
		</div>
		
	</section>
	
	<b></b>
	
	
	<section class="company-description" style="display: flex; justify-content: center;">
		<div style="margin-left: 850px; margin-bottom: 100px">
		<form action="/customer/payAction" method="post" style="display: flex; justify-content: center;">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="hidden" value = "${pres.pres_num }" name = "pres_num">
			<input type="hidden" value = "${pres.cus_num }" name = "cus_num">
			<select name = "pay_type" class="form-control" style="margin-top: 5px;">
				<option value="카드">카드</option>
				<option value="계좌이체">계좌이체</option>
			</select>&nbsp&nbsp
			<input type = "submit" value = "선 결제하기" onclick="check()" class="btn btn-warning btn-lg">
			<script type="text/javascript">
			function check() {
				alert("결제가 완료되었습니다.");
			}
			</script>
	</form>
	<form action="/customer/pharSearch" method="post" style="float: right; margin-top: 10px">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	
		<input type = "submit" value="약국예약" class="btn btn-warning btn-lg">
	</form>	
		
		
		</div>
	
	</section>
	
<%@include file="../includes/footer.jsp" %>
</body>
	
	
</html>



