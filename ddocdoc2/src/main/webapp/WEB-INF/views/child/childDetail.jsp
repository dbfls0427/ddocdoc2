<%@page import="org.ddocdoc.vo.childvo.ChildVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<!-- menu module -->
<%@include file="../includes/header.jsp" %>
<!-- end menu module -->
 <!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
	
 <style type="text/css">
 a:link { color : black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
/*  .kidsbtn{
 	font-family: 
 } */
 hr {
  height: 1px;
  background-color: #a9a8a8;
  height: 2px;
}
.p{
	font-family: fantasy;
	font-size: 26px;
	color : #ffe307;
}
tr:nth-child(2n) {
  				background-color: #FFFFA5;
			}
#intro{
	font-family: 'Stylish', sans-serif;
}
#table1{
font-family: 'Sunflower', sans-serif;
}

#back{
	background-image: url("http://image.sayup.co.kr/collection/55ed39e43dff460300ba2927/f76541f0eb59b97e4c95c33164af6fdd.jpg");
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
 <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">    
<link href="https://fonts.googleapis.com/css?family=Stylish&display=swap&subset=korean" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap&subset=korean" rel="stylesheet">       
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
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
                            <h2>우리아이 관리</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="/customer/loginSuccess">
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
        
        <section id="btn" class="company-description" style="display: flex; justify-content: center; margin-top: 80px; margin-left: 30px; margin-bottom : 30px">
		 <div style="display: flex; justify-content: center;">
			<button class="btn btn-default btn-lg" style="font-size: 20px; margin-right: 30px; width: 140px;"><a href = "/height/heightList?ch_num=${childVO.ch_num }&ch_gender=${childVO.ch_gender}&ch_name=${childVO.ch_name}">성장 관리</a></button>
			<button class="btn btn-default btn-lg" style="font-size: 20px; margin-right: 30px; width: 140px;"><a href = "/inject/injectList?ch_num=${childVO.ch_num }">예방 접종</a></button>
			<button class="btn btn-default btn-lg" style="font-size: 20px; width: 140px;"><a href = "/checkup/checkupList?ch_num=${childVO.ch_num }">건강 검진</a></button>
		 </div>
		</section>
		<div style="width: 800px;margin-left:30%;">
			<hr>
		</div>
        <section style="margin-top: 0;">
		 <div style="display: flex; justify-content: center; width: 500px; padding: 30px; margin-left: 37%;">
			 <i class="fas fa-user-friends fa-7x" style="padding-right: 30px;"></i>
			  <div style="font-size: 25px; margin-left: 20px;" id="childIntro">
						 <label>${childVO.ch_name} / ${childVO.ch_gender}</label> <a href="/child/childList" style="font-size: 18px;"><i class="fas fa-chevron-circle-down fa-lg" title="목록보기"></i></a><br>
						 <label>${childVO.ch_birth}</label>
						 <label>(${childVO.ch_age}세)</label> <br>
			  </div>
		 </div>
        </section>

		<br>
		<section id="btn" class="company-description" style="display: flex; justify-content: flex-end; padding-right: 700px; margin-top: 0; margin-bottom: 100px;">
			<button class="btn btn-default"><a href="/child/childUpdate?ch_num=${childVO.ch_num}" style="font-size: 18px;">수정</a></button>&nbsp
			<button class="btn btn-default"><a href="/child/childDelete?ch_num=${childVO.ch_num}" style="font-size: 18px;">삭제</a></button>
		</section>
		

<!-- menu module -->
<%@include file="../includes/footer.jsp" %>
<!-- end menu module -->


</body>
</html>