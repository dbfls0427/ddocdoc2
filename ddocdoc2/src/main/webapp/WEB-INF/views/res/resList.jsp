<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
  <%@include file="../includes/header.jsp" %>
        
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
			tr:nth-child(2n) {
  				background-color: #FFFFA5;
			}

			hr {
  				height: 1px;
  				background-color: #FFD819;
			}
			
			.aa{
				text-decoration: none;
				color: #FFFFFF;
			}
			
	</style>
	 <script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		var error = $(".error");
		if(error.val() == 'error'){
			alert("����ȣ �߱� ����");
		}
		</script>
        
    </head>
    <body>
		<input type="hidden" value=${error} class="error"/>
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
					<h2>RESERVATION</h2>
					<ol class="breadcrumb">
						<li><a href="success.do"> <i class="ion-ios-home"></i>
								Home
						</a></li>
						<li class="active">RESERVATION</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	</section>
        
		<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center;">

			<div>
			<p class = "p">Hospital Reservation</p><br>
			<table class="table table-hover" id = "table1" style="font-size: 18px;">
		<tr>
			<td style="text-align : center;">예약번호</td>
			<td style="text-align : center;">병원이름</td>
			<td style="text-align : center;">예약날짜</td>
			<td style="text-align : center;">처방전</td>
			
		</tr>
		
		<c:forEach var="resVO" items="${list }" varStatus="status">
			<tr>
				<td style="text-align : center;">${resVO.hos_res_num }</td>
				<td style="text-align : center;"><a href = "/customer/hospitalResDetail?hos_res_num=${resVO.hos_res_num}">${hosName[status.index] }</td>
				<td style="text-align : center;">${fn:substring(resVO.hos_res_date,0,10) }</td>
				<td style="text-align : center;"><button class="btn btn-warning"><a class="aa" href = "/customer/presDetail?hos_res_num=${resVO.hos_res_num }&hos_num=${resVO.hos_num}">처방전 보기</a></button></td>
				
			</tr>
		</c:forEach>
			</table>
			<br><br><br>
			<hr>
		</div>

		
		</section>
		<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center;">
			<div style="width:390px; margin-bottom: 80px">
				<p class = "p">Pharmacy Reservation</p><br>
				<table class="table table-hover" id = "table1" style="font-size: 18px;">
					<tr>
						<td style="text-align : center;">예약번호</td>
						<td style="text-align : center;">약국이름</td>
						<td style="text-align : center;">예약시간</td>
			
					</tr>
		
					<c:forEach var="pResVO" items="${pharList }" varStatus="status">
						<tr>
							<td style="text-align : center;">${pResVO.phar_res_num }</td>
							<td style="text-align : center;"><a href = "/customer/pharResDetail?phar_res_num=${pResVO.phar_res_num}&phar_num=${pResVO.phar_num}">${pharNameList[status.index] }</td>
							<td style="text-align : center;">${pResVO.phar_res_time }</td>
						</tr>
					</c:forEach>
				</table>
			
			</div>
		</section>
<%@include file="../includes/footer.jsp" %>
 	</body>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border = "1">
		<tr>
			<td>�����ȣ</td>
			<td>�����̸�</td>
			<td>���೯¥</td>
			<td>ó����</td>
			
		</tr>
		
		<c:forEach var="resVO" items="${list }" varStatus="status">
			<tr>
				<td>${resVO.hos_res_num }</td>
				<td><a href = "detailRes.do?hos_res_num=${resVO.hos_res_num}">${hosName[status.index] }</td>
				<td>${resVO.hos_res_date }</td>
				<td><button><a href = "presDetail.do?hos_res_num=${resVO.hos_res_num }&hos_num=${resVO.hos_num}">ó���� ����</a></button></td>
				
			</tr>
		</c:forEach>
	</table>
	<br><br>
	<hr/>
		<table border = "1">
		<tr>
			<td>�����ȣ</td>
			<td>�౹�̸�</td>
			<td>����ð�</td>
			
		</tr>
		
		<c:forEach var="pResVO" items="${pharList }" varStatus="status">
			<tr>
				<td>${pResVO.phar_res_num }</td>
				<td><a href = "pharResDetail.do?phar_res_num=${pResVO.phar_res_num}&phar_num=${pResVO.phar_num}">${pharNameList[status.index] }</td>
				<td>${pResVO.phar_res_time }</td>
			</tr>
		</c:forEach>
	</table>
	
	
	
</body>
</html> --%>