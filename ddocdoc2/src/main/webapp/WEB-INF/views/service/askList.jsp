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
 
 <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">       
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

.card-header{
	background-color: rgba(0,0,0,.03);
    border: 1px solid rgba(0,0,0,.125);
    border-radius: 2px;
}

.bodycollap {
    border: 1px solid rgba(0,0,0,.125);
}

.card-body{
    flex: 1 1 auto;
    min-height: 1px;
    padding: 2.8rem 1.25rem;
}

.accrdionBox{
    display: flex;
    justify-content: center;
}

.width60 {
	width: 50%;
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
						<h2>자주묻는 질문</h2>
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
	
	<section class="company-description paddingSide" style="min-height: 450px;padding-bottom: 100px;">
		<div class="accrdionBox">
			<div class="accordion width60" id="accordionExample">
			  	<c:forEach var="askvo" items="${list}">
				  	<div class="card">
					    <div class="card-header" id="heading${askvo.ask_num }">
					      <h2 class="mb-0" style="margin-top:10px;margin-bottom:10px;">
					        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse${askvo.ask_num }" aria-expanded="false" aria-controls="collapse${askvo.ask_num }">
					        	<i class="fa fa-question-circle-o" aria-hidden="true" style="padding-right: 8px;color: #ff2a2a;"></i>
					        	${askvo.ask_title }
					        </button>
					      </h2>
					    </div>
					    <div id="collapse${askvo.ask_num }" class="collapse bodycollap" aria-labelledby="heading${askvo.ask_num }" data-parent="#accordionExample">
					      <div class="card-body">
					      	<i class="fa fa-exclamation-circle" aria-hidden="true" style="padding-right: 8px;"></i>
					      	${askvo.ask_content }
					      </div>
					    </div>
				  </div>
			  	</c:forEach>
			</div>
		</div>	
	</section>
	
	
	
	
<!-- footer module -->
<%@include file="../includes/footer.jsp" %>
<!-- end footer module -->	
</body>
</html>