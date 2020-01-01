<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 #footer2{
	background-image: url("/resources/img/footImg.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: 50% 90%;
	width: 100%;
	height: 334px;
    position: relative;
}

#footer2::before{
    content: " ";
    position: absolute;
    top: 0;
    bottom:0;
    right:0;
    left: 0;
    display: block;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
}

.box3{
	/* 
    width: 280px;
    height: 140px;
	 */
    width: 220px;
    height: 100px;
    margin: 0 20px;
    //outline: 1px solid red;
    background: #ffffffba;
}

.txtBox{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 80px;
}

.nowTime{
    padding-top: 30px;
    padding-bottom: 10px;
}



.txtBox div{
    text-align: center;
}

.weatherBox div {
    font-size: 1.8rem;
    font-weight: 600;
}

.weatherBox p {
    font-size: 1.2rem;
    font-weight: 300;
    color: #3e3e3e;
}

.noiconP{
	padding-top: 15px;
}

.noiconDiv{
	margin-top: -8px
}
</style>


<script src="http://code.jquery.com/jquery-1.7.min.js" ></script>
<script>
$(document).ready(function(){
    $.getJSON('http://api.openweathermap.org/data/2.5/weather?id=1835848&APPID=937890ee3a756cc55a0e253e2a228a6b&units=metric', 
	function(data){
      	//alert(data);
          var $minTemp = data.main.temp_min;
          var $maxTemp = data.main.temp_max;
          var $cTemp = data.main.temp;
          var $now = new Date($.now());
          var $cDate = $now.getFullYear() + '/' + ($now.getMonth() +1) + '/'
            + $now.getDate() + '&nbsp;&nbsp;  ' + $now.getHours() + ':' + $now.getMinutes();
          var $wIcon = data.weather[0].icon;


          $('.ctemp').append($cTemp);
          $('.clowtemp').append($minTemp);
          $('.chightemp').append($maxTemp);
          $('.cicon').append('<img src="http://openweathermap.org/img/w/'+$wIcon+'.png"/>');
          $('.nowTime').append($cDate);
    });
});

</script>


</head>
<body>
<script id="embeddedChatbot" data-botId="B1e44x" src="https://www.closer.ai/js/webchat.min.js"> </script>
<!--
            ==================================================
            Footer Section Start
            ================================================== -->

      
            
            
            <footer id="footer2">
            	<div style="width:98%;display:flex;justify-content:center;">
            		<h2 class="nowTime"> </h2>
           		</div>
	       	    <div style="width:98%;display:flex;justify-content:center;margin-bottom:25px;">
	                <div class="row">
					  <div class="col-md-4 box3">
					  	<div class="txtBox">
					  		<div class="weatherBox">
					  			<p class="noiconP">최저온도</p>
					  			<div class="clowtemp noiconDiv"></div>
					  		</div>
					  	</div>
					  </div>
					  <div class="col-md-4 box3">
					  	<div class="txtBox">
					  		<div class="weatherBox">
					  			<p style="height: 30px;"><span>현재온도</span><span class="cicon"></span></p>
					  			<div class="ctemp"></div>
					  		</div>
					  	</div>
					  </div>
					  <div class="col-md-4 box3">
					  	<div class="txtBox">
					  		<div class="weatherBox">
						  		<p class="noiconP">최고온도</p>
						  		<div class="chightemp noiconDiv"></div>
					  		</div>
					  	</div>
					  </div>
					</div>        
	            </div>
                <div class="container" style="margin-left:0;">
                    <div class="col-md-8">
                        <p class="copyright" style="padding-top: 35px;">Copyright: <span><script>document.write(new Date().getFullYear())</script></span> Design and Developed by <a href="mailto:amydreamsyou@gmail.com" target="_blank" style="color:#ffffff9e;">Lee Min-hye</a>. <br> 
                           
                        </p>
                    </div>
                    <div class="col-md-4">
                        <!-- Social Media 
                        <ul class="social">
                            <li>
                                <a href="http://wwww.fb.com/themefisher" class="Facebook">
                                    <i class="ion-social-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="http://wwww.twitter.com/themefisher" class="Twitter">
                                    <i class="ion-social-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="Linkedin">
                                    <i class="ion-social-linkedin"></i>
                                </a>
                            </li>
                            <li>
                                <a href="http://wwww.fb.com/themefisher" class="Google Plus">
                                    <i class="ion-social-googleplus"></i>
                                </a>
                            </li>
                        </ul>
                        -->
                    </div>
                </div>
            </footer> <!-- /#footer -->

	<!-- Template Javascript Files
	================================================== -->
	<!-- jquery -->
	<script src="<c:url value="/resources/plugins/jQuery/jquery.min.js" />"></script>
	<!-- Form Validation -->
    <script src="<c:url value="/resources/plugins/form-validation/jquery.form.js" />"></script>
    <script src="<c:url value="/resources/plugins/form-validation/jquery.validate.min.js" />"></script>
	<!-- owl carouserl js -->
	 <script src="<c:url value="/resources/plugins/owl-carousel/owl.carousel.min.js" />"></script>
	<!-- bootstrap js -->
	 <script src="<c:url value="/resources/plugins/bootstrap/bootstrap.min.js" />"></script>
	<!-- wow js -->
	 <script src="<c:url value="/resources/plugins/wow-js/wow.min.js" />"></script>
	<!-- slider js -->
	 <script src="<c:url value="/resources/plugins/slider/slider.js" />"></script>
	<!-- Fancybox -->
	 <script src="<c:url value="/resources/plugins/facncybox/jquery.fancybox.js" />"></script>
	<!-- template main js -->
	 <script src="<c:url value="/resources/js/main.js" />"></script>
</body>
</html>