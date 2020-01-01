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
						<h2>의학용어 상세보기</h2>
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
	
	<section class="company-description paddingSide" style="min-height:420px;">
          <div class="row">
	          <!-- DataTales Example -->
	          <div class="card shadow mb-4" style="padding: 0 120px;">
	            <div class="card-header py-3">
	              <h6 class="m-0 font-weight-bold text-primary">의학용어 상세보기</h6>
	            </div>
	            <div class="card-body">
	              				<div class="alert alert-warning" role="alert" style="background-color:#fff0c75c;">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th style="width:80px;">타이틀</th>
												<th>컨텐츠</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td style="width:80px;">글번호</td>
												<td><c:out value="${termvo.term_num }"/></td>
											</tr>
											<tr>
												<td style="width:80px;">제목</td>
												<td><c:out value="${termvo.term_title }"/></td>
											</tr>
											<tr>
												<td style="width:80px;">내용</td>
												<td><c:out value="${termvo.term_content }"/></td>
											</tr>
										</tbody>
											
									</table>
								</div>
							</div>
			
							<div style="display:flex;justify-content: center;">
								<a href="/customer/termList" role="button" class="btn btn-warning btn-sm" style="width:10%;">리스트</a> <br>
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