<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<!-- header module -->
<%@include file="../includes/header.jsp" %>
<!-- end header module -->

<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
        
        <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap&subset=korean" rel="stylesheet">      
        <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
#back{
	background-image: url("https://cdn.ddocdoc.com/collection/141945158cc83086859cfbbbd.jpg");
	background-size: cover;
	   background-repeat: no-repeat;
	   background-position: 50% 90%;
    
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

.paddingSide{
	padding: 0 200px;
}
</style>


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
						<h2>공지사항 목록</h2>
						<ol class="breadcrumb">
							<li><a href="/customer/loginSuccess"> 
								<i class="ion-ios-home"></i> Home
							</a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="company-description paddingSide">
          <div class="row">
	          <!-- DataTales Example -->
	          <div class="card shadow mb-4">
	            <div class="card-header py-3">
	              <h6 class="m-0 font-weight-bold text-primary">공지사항 리스트</h6>
	            </div>
	            <div class="card-body">
	              <div class="table-responsive">
	              	<table class="table table-hover">
					   <tr>
							<td>공지사항 번호</td>
							<td>공지사항 제목</td>
							<td>공지사항 날짜</td>
						</tr>
						<c:forEach var="noticevo" items="${list}">
							<tr>
								<td>${noticevo.not_num }</td>
								<td><a href='/customer/noticeDetail?not_num=${noticevo.not_num }'>${noticevo.not_title }</a></td>
								<td>${fn:substring(noticevo.not_date,0,10) }</td>
								
							</tr>
						</c:forEach>
					</table>
	              </div>
	            </div>
	          </div>
			
           </div>
          <!-- Content Row -->
	
	</section>
	
	
	
	
<!-- footer module -->
<%@include file="../includes/footer.jsp" %>
<!-- end footer module -->	
</body>
</html>