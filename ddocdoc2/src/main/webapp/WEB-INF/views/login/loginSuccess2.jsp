<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
    <head>
<%@include file="../includes/header.jsp" %>
        
    	
        
        
        <style type="text/css">
        	
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
        
    </head>
    <body>
	<%@include file="../includes/menu.jsp" %>
        
        
<!--        
로그인 성공!



<form action="logout.do" method="post">
	<input type = "submit" value="로그아웃">
</form>

${customer.cus_name }

<form action="detailCustomer.do" method = "post">
	<input type = "submit" value="회원 상세정보">
</form>
<br>
<form action="map.do" method="post">
	<input type="hidden" name="cus_num" value="${customer.cus_num }">
	<input type = "submit" value="가까운 병원 찾기">
</form>

<form action="resList.do" method = "post">
	<input type = "submit" value = "예약 내역">
</form>

<br>

<form action="/DDOCDOC/child.index.html" method = "post">
	<input type = "submit" value="아이관리">
</form>

<form action="myPageForm.do" method="post">
	<input type = "submit" value = "마이페이지">
</form>

 --> 



<!-- 
================================================== 
    Works Section Start
================================================== -->
<section class="works service-page" style="margin-top:80px;">
    <div class="container">
    <h1>환영합니다!   ${customer.cus_name }님</h1>
        <h2 class="subtitle wow fadeInUp animated" data-wow-delay=".3s" data-wow-duration="500ms">Convenient useful better</h2>
            <p class="subtitle-des wow fadeInUp animated" data-wow-delay=".5s" data-wow-duration="500ms">
               국내 NO.1 의료 플랫폼 똑닥
            </p>
        <div class="row">
            <div class="col-sm-3">
                 <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                    <div class="img-wrapper">
                        <!--  <img src="../images/portfolio/item-1.jpg" class="img-responsive" alt="this is a title" > -->
                        <img src="/resources/images/portfolio/info.jpg" class="img-responsive" alt="this is a information" style="width: 262.5px; height: 175px;">
                    </div>
                    <figcaption>
                        <h4>
                         	병원 예약/접수
                        </h4>
                        <p>
                           	 병원 방문 후 기다림은 끝<br>
                         	온라인 접수 후, 시간에 맞춰 방문
                        </p>
                        <form action="map.do" method = "post">
							<input type = "submit" value="병원예약하기" class="btn btn-primary">
						</form>
                    </figcaption>
                </figure>
            </div>

            <div class="col-sm-3">
                <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="300ms">
                    <div class="img-wrapper">
                        <!-- <img src="../images/portfolio/item-2.jpg" class="img-responsive" alt="this is a title" > -->
                        <img src="/resources/images/portfolio/schedule.jpg" class="img-responsive" alt="this is a schedule">
                    </div>
                    <figcaption>
                        <h4>
                         	진료 대기현황판
                        </h4>
                        <p>
                          	 어느 곳에서도 편하게 진료 순번을 확인하세요
                        </p>
                        <form action="resList.do" method = "post">
							<input type = "submit" value = "예약 내역" class="btn btn-success">
						</form>
                    </figcaption>
                </figure>
            </div>

            <div class="col-sm-3">
                <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="300ms">
                    <div class="img-wrapper">
                       <!-- <img src="../images/portfolio/item-3.jpg" class="img-responsive" alt="" > -->
                        <img src="/resources/images/portfolio/child.jpg" class="img-responsive" alt="child care" >
                    </div>
                    <figcaption>
                        <h4>
                         	 아이건강피드
                        </h4>
                        <p>
                           	 우리아이의 성장,진료기록을 똑닥 건강피드에서 관리하세요
                        </p>
                        <form action="/DDOCDOC/child.index.jsp?cus_name=${customer.cus_name }" method = "post">
							<input type = "submit" value="아이관리" class="btn btn-info">
						</form>
                    </figcaption>
                </figure>
            </div>

            <div class="col-sm-3">
                <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="600ms">
                    <div class="img-wrapper">
                         <!--<img src="../images/portfolio/item-4.jpg" class="img-responsive" alt="" >-->
                        <img src="/resources/images/portfolio/mypage.jpg" class="img-responsive" alt="mypage" >
                    </div>
                    <figcaption>
                        <h4>
                           	 마이페이지
                        </h4>
                        <p>
                           	나의 똑닥 등록 정보와<br>
                           	현재 예약상황을 확인하세요
                        </p>
                        <form action="myPageForm.do" method="post">
							<input type = "submit" value = "마이페이지" class="btn btn-warning">
						</form>
                    </figcaption>
                </figure>
            </div>
        </div>
    </div>
</section>

<%@include file="../includes/footer.jsp" %>
 	</body>
</html>