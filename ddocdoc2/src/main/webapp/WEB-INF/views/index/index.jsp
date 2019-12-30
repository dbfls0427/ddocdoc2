<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
    <head>
    <%@include file="../includes/header.jsp" %>
        
        
        <style type="text/css">
        #feature .icon {
		    text-decoration: none;
		    color: #fff;
		    background-color: #ffe30a !important;
		    height: 100px;
		    text-align: center;
		    width: 100px;
		    font-size: 50px;
		    line-height: 100px;
		    overflow: hidden;
		    -webkit-border-radius: 50%;
		    -moz-border-radius: 50%;
		    -ms-border-radius: 50%;
		    -o-border-radius: 50%;
		    text-shadow: #FFC107 1px 1px, #FFEB3B 2px 2px, #00a4ba 3px 3px, #00a4ba 4px 4px, #00a4ba 5px 5px, #00a4ba 6px 6px, #00a4ba 7px 7px, #00a4ba 8px 8px, #00a4ba 9px 9px, #00a4ba 10px 10px, #00a4ba 11px 11px, #00a4ba 12px 12px, #00a4ba 13px 13px, #00a4ba 14px 14px, #00a4ba 15px 15px, #FFC107 16px 16px, #00a4ba 17px 17px, #00a4ba 18px 18px, #FF9800 19px 19px, #00a4ba 20px 20px, #FFEB3B 21px 21px, #00a4ba 22px 22px, #00a4ba 23px 23px, #00a4ba 24px 24px, #00a4ba 25px 25px, #00a4ba 26px 26px, #00a4ba 27px 27px, #00a4ba 28px 28px, #00a4ba 29px 29px, #00a4ba 30px 30px, #00a4ba 31px 31px, #00a4ba 32px 32px, #00a4ba 33px 33px, #00a4ba 34px 34px, #00a4ba 35px 35px, #00a4ba 36px 36px, #00a4ba 37px 37px, #00a4ba 38px 38px, #00a4ba 39px 39px, #FF9800 40px 40px, #00a4ba 41px 41px, #00a4ba 42px 42px, #00a4ba 43px 43px, #00a4ba 44px 44px, #00a4ba 45px 45px, #00a4ba 46px 46px, #00a4ba 47px 47px, #00a4ba 48px 48px, #00a4ba 49px 49px, #00a4ba 50px 50px, #00a4ba 51px 51px, #00a4ba 52px 52px, #00a4ba 53px 53px, #00a4ba 54px 54px, #00a4ba 55px 55px, #00a4ba 56px 56px, #00a4ba 57px 57px, #00a4ba 58px 58px, #00a4ba 59px 59px, #00a4ba 60px 60px, #00a4ba 61px 61px, #00a4ba 62px 62px, #00a4ba 63px 63px, #00a4ba 64px 64px, #00a4ba 65px 65px, #00a4ba 66px 66px, #00a4ba 67px 67px, #00a4ba 68px 68px, #00a4ba 69px 69px, #00a4ba 70px 70px, #00a4ba 71px 71px, #00a4ba 72px 72px, #00a4ba 73px 73px, #00a4ba 74px 74px, #00a4ba 75px 75px, #00a4ba 76px 76px, #00a4ba 77px 77px, #00a4ba 78px 78px, #00a4ba 79px 79px, #00a4ba 80px 80px, #00a4ba 81px 81px, #00a4ba 82px 82px, #00a4ba 83px 83px, #00a4ba 84px 84px, #00a4ba 85px 85px, #00a4ba 86px 86px, #00a4ba 87px 87px, #00a4ba 88px 88px, #00a4ba 89px 89px, #00a4ba 90px 90px, #00a4ba 91px 91px, #00a4ba 92px 92px, #00a4ba 93px 93px, #00a4ba 94px 94px, #00a4ba 95px 95px, #00a4ba 96px 96px, #00a4ba 97px 97px, #00a4ba 98px 98px, #00a4ba 99px 99px, #FF9800 100px 100px !important;
		}
		
		        .callID{
		background-image: url(https://cdn.imweb.me/thumbnail/20190520/5ce213e3577f2.jpg);
	    background-color: rgb(221, 221, 221);
	    background-repeat: no-repeat;
	    background-size: cover;
	    background-position: 50% 66%;
	    height: 400px;
	    position: relative;
		
	}
	
	.callID::before{
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
        <!--
        ==================================================
        Header Section Start
        ================================================== -->
        <header id="top-bar" class="navbar-fixed-top animated-header">
            <div class="container">
                <div class="navbar-header">
                    <!-- responsive nav button -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <!-- /responsive nav button -->
                    
                    <!-- logo -->
                    <div class="navbar-brand">
                        <a href="index.html" >
                            <img src="/resources/images/logo.png" alt="">
                        </a>
                    </div>
                    <!-- /logo -->
                </div>
 				<!-- main menu -->
                <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="/customer/loginSuccess" >Home</a>
                            </li>
                             <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">����ã�� <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/customer/hosSearch">����ã��</a></li>
                                        <li><a href="/customer/hospitalResList">���೻��</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">���̰��� <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/child/childList">���̰���</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">QR�ڵ� <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/DDOCDOC/Customer/detailCustomer.do">QR�ڵ� �߱�</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">�ȴں�Ƽ<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/video/beautyVideo">��ƼTV</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">����<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="/health/healthList">�ǰ�����</a></li>
                                        <li><a href="../Customer/reviewInsertForm.do">�ı� �ۼ�</a></li>
                                        <li><a href="../Customer/reviewList.do">�ı� ���</a></li>
                                    </ul>
                                </div>
                            </li>
                             <li><a href="/customer/loginForm">�α���</a></li>
                        </ul>
                    </div>
                </nav>
                <!-- /main nav -->
            </div>
        </header>
        

<!--
==================================================
Slider Section Start
================================================== -->
<section id="hero-area" >
<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <div class="block wow fadeInUp" data-wow-delay=".3s">
                <!-- Slider -->
                <section class="cd-intro">
                    <h1 class="wow fadeInUp animated cd-headline slide" data-wow-delay=".4s" >
                    <span>����ã����� ����, �������� �ѹ���!</span><br>
                    <span class="cd-words-wrapper" style="color:#FF9800;">
                        <b class="is-visible">����� ����</b>
                        <b>����� �౹</b>
                        <b>����/�౹</b> 
                    </span>
                    </h1>
                    </section> <!-- cd-intro -->
                    <!-- /.slider -->
                    <h2 class="wow fadeInUp animated" data-wow-delay=".6s" >
                       	  <br>
                       	 ����/���� ���� ���� 10,938<br>
                       	 ���� ����/���� �Ǽ� 6,752,994<br><br>
                       	 �ȴ����� �Ƴ��ð� 202,589,820��
                    </h2>
                    <!--  
                    <a class="btn-lines dark light wow fadeInUp animated smooth-scroll btn btn-default btn-green" data-wow-delay=".9s" href="/DDOCDOC/map/hosSearch.jsp" data-section="#works">����ã��</a>
                    -->
                    <a class="btn-lines dark light wow fadeInUp animated smooth-scroll btn btn-default btn-green" data-wow-delay=".9s" href="#works" data-section="#works">View Works</a>
                </div>
            </div>
        </div>
    </div>
</section><!--/#main-slider-->
<!--
==================================================
About Section Start
================================================== -->
  
<section id="works" style="padding: 110px 0;">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <div class="block wow fadeInLeft" data-wow-delay=".3s" data-wow-duration="500ms" style="margin-top:50px;">
                    <h2>
                    	����� ���� ã��
                    </h2>
                    <p>
                       	 ���� ��𼭳� ������ ����� ������ �˰�ʹٸ�?
                    </p>
                    <p>
                        	�ǽð����� ������ ã���ְ� ����, ����ڼ����� Ȯ���ϴ� �ȴ�!
                    </p>
                    <div style="margin:30px 0;">
                    	<a type="button" class="btn btn-default" style="width:40%;" href="/DDOCDOC/map/NohosSearch.jsp">����ã��</a>
                    </div>
                </div>
                
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="block wow fadeInRight" data-wow-delay=".3s" data-wow-duration="500ms">
                    <img src="/resources/images/main4.png" alt="map" style="width:588px;height:430px;"> 
                </div>
            </div>
        </div>
    </div>
</section> <!-- /#about -->


<!-- 
================================================== 
    Works Section Start
================================================== -->
<section class="works service-page" style="margin-top:0;" >
    <div class="container">
        <div class="section-heading">
            <h1 class="title wow fadeInDown" data-wow-delay=".3s">�ȴ�, �̷��� ���մϴ�.</h1>
            <p class="wow fadeInDown" data-wow-delay=".5s">
               ������� �ǰ������� ���� ����� �����ϴ�
            </p>
        </div>
        <div class="row">
            <div class="col-sm-3">
                 <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                    <div class="img-wrapper">
                        <img src="/resources/images/1.PNG" class="img-responsive" alt="this is a information" style="width: 150px; height : 130px; margin-left:50px; margin-top:10px">
                    </div>
                    <figcaption>
                        <h4>
                         	ȸ�� ������
                        </h4>
                        <p>
                            QR CODE�� �� ������ �ѹ��� ����
                        </p>
                        
                    </figcaption>
                </figure>
            </div>

            <div class="col-sm-3">
                <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="300ms">
                    <div class="img-wrapper">
                        <img src="/resources/images/2.PNG" class="img-responsive" alt="this is a schedule" style="width: 150px; height : 130px; margin-left:50px; margin-top:10px">
                    </div>
                    <figcaption>
                        <h4>
                         	�ǽð� �����Ȳ
                        </h4>
                        <p>
                                                       ���ð��� ���� �� �ִ� ����
                        </p>
                    </figcaption>
                </figure>
            </div>

            <div class="col-sm-3">
                <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="300ms">
                    <div class="img-wrapper">
                        <img src="/resources/images/3.PNG" class="img-responsive" alt="child care" style="width: 150px; height : 130px; margin-left:50px; margin-top:10px">
                    </div>
                    <figcaption>
                        <h4>
                         	 ���̰���
                        </h4>
                        <p>
                                                     ���� Ű ��� �� ���� ��õ ����
                        </p>
                    </figcaption>
                </figure>
            </div>

            <div class="col-sm-3">
                <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="600ms">
                    <div class="img-wrapper">
                        <img src="/resources/images/4.PNG" class="img-responsive" alt="mypage" style="width: 150px; height : 130px; margin-left:50px; margin-top:10px">
                    </div>
                    <figcaption>
                        <h4>
                           	 ����������
                        </h4>
                        <p>
                                                        �� �վȿ� �������� ������
                        </p>
                    </figcaption>
                </figure>
            </div>
        </div>
    </div>
</section>

		


<!--
==================================================
Portfolio Section Start
================================================== 
<section id="works" class="works">
    <div class="container">
        <div class="section-heading">
            <h1 class="title wow fadeInDown" data-wow-delay=".3s">Latest Works</h1>
            <p class="wow fadeInDown" data-wow-delay=".5s">
                Aliquam lobortis. Maecenas vestibulum mollis diam. Pellentesque auctor neque nec urna. Nulla sit amet est. Aenean posuere <br> tortor sed cursus feugiat, nunc augue blandit nunc, eu sollicitudin urna dolor sagittis lacus.
            </p>
        </div>
        <div class="row">
            <div class="col-sm-4 col-xs-12">
                <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                    <div class="img-wrapper">
                        <img src="images/portfolio/item-1.jpg" class="img-responsive" alt="this is a title" >
                        <div class="overlay">
                            <div class="buttons">
                                <a rel="gallery" class="fancybox" href="images/portfolio/item-1.jpg">Demo</a>
                                <a target="_blank" href="single-portfolio.html">Details</a>
                            </div>
                        </div>
                    </div>
                    <figcaption>
                    <h4>
                    <a href="#">
                        Dew Drop
                    </a>
                    </h4>
                    <p>
                        Redesigne UI Concept
                    </p>
                    </figcaption>
                </figure>
            </div>
            <div class="col-sm-4 col-xs-12">
                <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="300ms">
                    <div class="img-wrapper">
                        <img src="images/portfolio/item-2.jpg" class="img-responsive" alt="this is a title" >
                        <div class="overlay">
                            <div class="buttons">
                                <a rel="gallery" class="fancybox" href="images/portfolio/item-2.jpg">Demo</a>
                                <a target="_blank" href="single-portfolio.html">Details</a>
                            </div>
                        </div>
                    </div>
                    <figcaption>
                    <h4>
                    <a href="#">
                        Bottle Mockup
                    </a>
                    </h4>
                    <p>
                        Lorem ipsum dolor sit.
                    </p>
                    </figcaption>
                </figure>
            </div>
            <div class="col-sm-4 col-xs-12">
                <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="300ms">
                    <div class="img-wrapper">
                        <img src="images/portfolio/item-3.jpg" class="img-responsive" alt="" >
                        <div class="overlay">
                            <div class="buttons">
                                <a rel="gallery" class="fancybox" href="images/portfolio/item-3.jpg">Demo</a>
                                <a target="_blank" href="single-portfolio.html">Details</a>
                            </div>
                        </div>
                    </div>
                    <figcaption>
                    <h4>
                    <a href="#">
                        Table Design
                    </a>
                    </h4>
                    <p>
                        Lorem ipsum dolor sit amet.
                    </p>
                    </figcaption>
                </figure>
            </div>
            <div class="col-sm-4 col-xs-12">
                <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="600ms">
                    <div class="img-wrapper">
                        <img src="images/portfolio/item-4.jpg" class="img-responsive" alt="" >
                        <div class="overlay">
                            <div class="buttons">
                                <a rel="gallery" class="fancybox" href="images/portfolio/item-4.jpg">Demo</a>
                                <a target="_blank" href="single-portfolio.html">Details</a>
                            </div>
                        </div>
                    </div>
                    <figcaption>
                    <h4>
                    <a href="#">
                        Make Up elements
                    </a>
                    </h4>
                    <p>
                        Lorem ipsum dolor.
                    </p>
                    </figcaption>
                </figure>
            </div>
            <div class="col-sm-4 col-xs-12">
                <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="900ms">
                    <div class="img-wrapper">
                        <img src="images/portfolio/item-5.jpg" class="img-responsive" alt="" >
                        <div class="overlay">
                            <div class="buttons">
                                <a rel="gallery" class="fancybox" href="images/portfolio/item-5.jpg">Demo</a>
                                <a target="_blank" href="single-portfolio.html">Details</a>
                            </div>
                        </div>
                    </div>
                    <figcaption>
                    <h4>
                    <a href="#">
                        Shoping Bag Concept
                    </a>
                    </h4>
                    <p>
                        Lorem ipsum dolor.
                    </p>
                    </figcaption>
                </figure>
            </div>
            <div class="col-sm-4 col-xs-12">
                <figure class="wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="1200ms">
                    <div class="img-wrapper">
                        <img src="images/portfolio/item-6.jpg" class="img-responsive" alt="" >
                        <div class="overlay">
                            <div class="buttons">
                                <a rel="gallery" class="fancybox" href="images/portfolio/item-6.jpg">Demo</a>
                                <a target="_blank" href="single-portfolio.html">Details</a>
                            </div>
                        </div>
                    </div>
                    <figcaption>
                    <h4>
                    <a href="#">
                        Caramel Bottle
                    </a>
                    </h4>
                    <p>
                        Lorem ipsum dolor.
                    </p>
                    </figcaption>
                </figure>
            </div>
        </div>
    </div>
</section>  #works -->
<!--
==================================================
Portfolio Section Start
================================================== -->
<section id="feature">
    <div class="container">
        <div class="section-heading">
            <h1 class="title wow fadeInDown" data-wow-delay=".3s">�ǰ��� �������� �ȴ�</h1>
            <p class="wow fadeInDown" data-wow-delay=".5s">
               ���� ����/�౹ ã����� ��������, �������Ȯ�α��� �ѹ��� �ȴ�!
            </p>
        </div>
        <div class="row">
            <div class="col-md-4 col-lg-4 col-xs-12">
                <div class="media wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="300ms">
                    <div class="media-left">
                        <div class="icon">
                            <i class="ion-ios-flask-outline"></i>
                        </div>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">������ ���� ����</h4>
                        <p>3�鸸 �ȴ� �����</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-xs-12">
                <div class="media wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="600ms">
                    <div class="media-left">
                        <div class="icon">
                            <i class="ion-ios-lightbulb-outline"></i>
                        </div>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">����� ����/�౹</h4>
                        <p>ȿ���� �˻����� ���� �ȳ�����!</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-xs-12">
                <div class="media wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="900ms">
                    <div class="media-left">
                        <div class="icon">
                            <i class="ion-ios-lightbulb-outline"></i>
                        </div>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">�� ������ ���վȿ�</h4>
                        <p>QR CODE�� �������� �ѹ���</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-xs-12">
                <div class="media wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="1200ms">
                    <div class="media-left">
                        <div class="icon">
                            <i class="ion-ios-americanfootball-outline"></i>
                        </div>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">���ʿ��� ���ð�</h4>
                        <p>���ð��� ���̰� 2�� ���� ���� ȿ������!</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-xs-12">
                <div class="media wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="1500ms">
                    <div class="media-left">
                        <div class="icon">
                            <i class="ion-ios-keypad-outline"></i>
                        </div>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">��ȣ�� ���� ����</h4>
                        <p>EMR ���� �ڵ� ����</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-xs-12">
                <div class="media wow fadeInDown animated" data-wow-duration="500ms" data-wow-delay="1800ms">
                    <div class="media-left">
                        <div class="icon">
                            <i class="ion-ios-barcode-outline"></i>
                        </div>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">ȯ�� ���� ���� �ľ�</h4>
                        <p>���� �׸�, ���� ���� ������ ȿ��������</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> <!-- /#feature -->



            <!--
            ==================================================
            Call To Action Section Start
            ================================================== -->
            <section id="call-to-action" class="callID">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12" style="margin-top:80px; margin-left:35%">
                            <div class="block">
                                <h2 class="title wow fadeInDown" data-wow-delay=".3s" data-wow-duration="500ms">���� / ���� �ȴ� ���� ��õ�ϱ�</h1>
                                <p class="wow fadeInDown" data-wow-delay=".5s" data-wow-duration="500ms" style="margin-left:50px;">�ǰ��� �������� �ȴ��� ���� ����������!</p>
                                <a href="/DDOCDOC/Customer/loginForm.do" class="btn btn-default btn-contact wow fadeInDown" data-wow-delay=".7s" data-wow-duration="500ms" style="margin-left:100px;">Join Us</a>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </section>

     <%@include file="../includes/footer.jsp" %>
 	</body>
</html>