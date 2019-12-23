<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../includes/header.jsp" %>
        
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script type="text/javascript">
 var j = jQuery.noConflict();
 j(document).ready(function() {
	 j("#datepickers").datepicker();
})
</script>
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
        <section class="global-page-header" style="padding: 100px 0 10px 0;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2 style="font-size: 35px;">병원 예약</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="../index.html">
                                        <i class="ion-ios-home"></i>
                                        Home
                                    </a>
                                </li>
                               <!--  <li class="active">가까운 병원찾기</li> -->
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>

	 <section class="company-description" style="margin-top: 50px; display: flex; justify-content: center; margin-bottom: 60px;">
	 
		<form action="/customer/hospitalRes" method="post" style="width: 35%;">
			<label>진료 종류</label>
			<select name="hos_res_type" class="form-control">
				      <option value="일반진료">일반진료</option>
				      <option value="수액">수액</option>
			    </select>
			<br>
			<label>진료 증상</label>
			 <input type = "text" name = "hos_res_sym" class="form-control"><br>
			<label>메모</label><br>
			<input type = "text" name = "hos_res_memo" class="form-control"><br>
		  	<label>예약 날짜</label><br>
		  	<input type="text" id="datepickers" name = "hos_res_date" class="form-control"/>
		  	<br>
		 	<label>진료 시간</label>
		 	<br>
			 <select name="hos_res_time" class="form-control">
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
			<input type = "hidden" name = "cus_num" value = ${customer.cus_num }><br>
			<input type = "hidden" name = "hos_name" value = ${hos_name }><br>
			<input type = "hidden" name = "hos_acpt" value = "예약 접수 대기 중"><br>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div style="display: flex; justify-content: center;">
				<input type = "submit" value = "예약" class="btn btn-warning btn-lg">
			</div>
		</form>
	 
	 </section>
<%@include file="../includes/footer.jsp" %>
</body>

</html>