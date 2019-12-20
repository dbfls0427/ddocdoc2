<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<script type="text/javascript" src="/resources/js/user_height.js"></script>
<!-- jQuery -->
<style>
	/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
	.ui-datepicker-trigger{cursor: pointer;}
	/*datepicer input 롤오버 시 손가락 모양 표시*/
	.hasDatepicker{cursor: pointer;}
</style>
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
var j = jQuery.noConflict();
j(document).ready(function(){
	var num = '<c:out value="${ch_num }"/>';
 	var csrf = '<c:out value="${_csrf.token}"/>';
	var csrfName = '<c:out value="${_csrf.parameterName}"/>';
	var height = "";
	var date = "";
	console.log("csrf!!!! " + csrf);
	console.log(csrfName);
	
	showList();
	
	function showList(){
		height = new Array(); //for chart
		date = new Array();
		console.log("height초기화 : " + height.length);
		console.log("date초기화 : " + date.length);
		
		heightService.list({ch_num : num}, function(list){
			var str = "";
			for(var i=0, len = list.length || 0; i<len; i++){
				str += "<tr data-rno = '"+list[i].he_num+"'>"
				str += "<td style = 'text-align : center;' data-rno='"+list[i].he_num+"'>" + list[i].he_height + "</td>";
				str += "<td style = 'text-align : center;'>" + heightService.dTime(list[i].he_date) + "</td>";
				str += "</tr>";
				
				//for chart
				height.push(list[i].he_height);
				date.push(heightService.dTime(list[i].he_date));
				console.log(height);
			}
		j("table").append(str);
			
		});
		
	}
	
	j('#circle').mouseover(function(){
		j(this).css("color","darkblue");
	});
	
	j('#circle').mouseleave(function(){
		j(this).css("color","#f13ea1");
	});


	//chart start
	google.charts.load('current', {'packages':['line']});
	google.charts.setOnLoadCallback(drawChart);
	

    function drawChart() {
        var data = new google.visualization.DataTable();

        data.addColumn('string', 'Day');
        data.addColumn('number', '키');

  		
        if(height.length <=0) {
        	return;
        }
        for(var i=0; i<height.length; i++){
   		 
  	      	data.addRows([
  	      		[date[i], parseFloat(height[i])]
  	      	]);
  	      	
    	} 
        var options = {
        		
                chart: {
                  title: '우리아이 성장속도 한눈에 보기'
                },
                width: 900,
                height: 500,
                axes: {
                  x: {
                    0: {side: 'top'}
                  }
                }
          };
        var chart = new google.charts.Line(document.getElementById('line_top_x'));

         chart.draw(data, google.charts.Line.convertOptions(options));
    }

	
	
	//modal!!!!
	var modal = j("#myModal");
	var modalHeight = modal.find("input[name='he_height']");
	var modalDate = modal.find("input[name='he_date']");
	
	var modalModBtn = j('#modalModBtn');
	var modalRemoveBtn = j('#modalRemoveBtn');
	var modalRegisterBtn = j('#modalRegisterBtn');
	
	
	j('#circle').on("click", function(e){
		modal.find("input").val("");
		modal.find("button[id != 'modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		var inputData = "<input type='hidden' name='ch_num' value='"+num+"'/>"
		inputData += "<input type='hidden' name='"+csrfName+"' value='"+csrf+"'/>"
		j('#datepicker').after(inputData);
		jQuery(".modal").modal("show");
		
	});
	
	
	modalRegisterBtn.click(function(){
		
		var queryString = j("#testForm").serialize();
		alert(queryString);
		
		heightService.insert(queryString, function(result){
			
			modal.find("input").val("");
			
			/* modal.modal("hide"); */
			jQuery("#myModal").modal("hide");
			
			location.href="/height/heightList?ch_num=" + num;
			
		});
	});
	
	modalModBtn.click(function(){
		console.log("data들은 " + jQuery("#testForm").serialize());
		var modData = "<input type='hidden' name='he_num' value='"+modal.data("he_num")+"'/>";
		j("#he_height").before(modData);
		var modData2 = "<input type='hidden' name='"+csrfName+"' value='"+csrf+"'/>";
		jQuery("#testForm").append(modData2);
		
		var queryString2 = jQuery("#testForm").serialize();
		//특수문자 decode
		var queryDecode = decodeURIComponent(queryString2);
		console.log("queryDecode : "+ queryDecode);
		
		heightService.update(queryDecode, function(result){
			alert(result);
			jQuery(".modal").modal("hide");
			location.href="/height/heightList?ch_num=" + num;
		})
	})
	
	modalRemoveBtn.click(function(){
		var update = "";
		var he_num = modal.data("he_num");
		console.log(he_num);
		
		heightService.remove(he_num, function(result){
			alert(result);
			jQuery(".modal").modal("hide");
			location.href="/height/heightList?ch_num=" + num;
		});
	})

	
	//detail
	j("#btn2").on("click", "tr", function(e){
		var he_num = jQuery(this).attr("data-rno");
		
		heightService.detail(he_num,function(height){
			console.log("height디테일 " + heightService.dTime(height.he_date));
			modalHeight.val(height.he_height);
			/* modalDate.val(heightService.dTime(height.he_date)).attr("readonly","readonly"); */
			modalDate.val(heightService.dTime(height.he_date));
			modal.data("he_num", height.he_num);
			modal.data("ch_num", height.ch_num);
			modal.data("he_date", heightService.dTime(height.he_date));
			console.log("height 디테일2" +heightService.dTime(height.he_date));
			
			modalRegisterBtn.hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			jQuery(".modal").modal("show");
			
		})
		
	});

	
	//모든 datepicker에 대한 공통 옵션 설정
    j.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "-10Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+10Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
    });

    //input을 datepicker로 선언
    j("#datepicker").datepicker();                    
    
    //From의 초기값을 오늘 날짜로 설정
    j('#datepicker').datepicker('setDate', 'today');
	

});

</script>

<!-- Basic Page Needs
        ================================================== -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" href="favicon.ico">
<title>똑딱</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<!-- Mobile Specific Metas
        ================================================== -->
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- Template CSS Files
        ================================================== -->
<!-- Twitter Bootstrs CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/bootstrap/bootstrap.min.css">
<!-- Ionicons Fonts Css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/ionicons/ionicons.min.css">
<!-- animate css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/animate-css/animate.css">
<!-- Hero area slider css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/slider/slider.css">
<!-- owl craousel css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.carousel.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.theme.css">
<!-- Fancybox -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/facncybox/jquery.fancybox.css">
<!-- template main css file -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<style type="text/css">
 	tr:nth-child(2n) {
  				background-color: #FFFFA5;
			}
	 a:link { color : black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
 	#btn{
 		 font-family: 'Jua', sans-serif;
 		/* font-family: 'Do Hyeon', sans-serif; */
 	}
 	#sun{
 		font-family: 'Do Hyeon', sans-serif;
 	}
</style>
<body>
	<!--
        ==================================================
       MENU: Header Section Start
        ================================================== -->
	<header id="top-bar" class="navbar-fixed-top animated-header">
		<div class="container">
			<div class="navbar-header">
				<!-- responsive nav button -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- /responsive nav button -->

				<!-- logo -->
				<div class="navbar-brand">
					<a href="/DDOCDOC/Customer/success.do"> <img
						src="/resources/images/logo.png" alt="">
					</a>
				</div>
				<!-- /logo -->
			</div>
			<!-- main menu -->
			<nav class="collapse navbar-collapse navbar-right" role="navigation">
				<div class="main-menu">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/DDOCDOC/Customer/success.do">Home</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">병원찾기 <span class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a
										href="/DDOCDOC/Customer/map.do?cus_num=${customer.cus_num }">병원찾기</a></li>
									<li><a href="../Customer/resList.do">예약내역</a></li>
								</ul>
							</div></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">아이관리 <span class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a href="/child/childList">아이관리</a></li>
									<li><a href="/DDOCDOC/Customer/detailCustomer.do">성장관리</a></li>
									<li><a href="/DDOCDOC/Customer/detailCustomer.do">예방접종</a></li>
									<li><a href="/DDOCDOC/Customer/detailCustomer.do">건강검진</a></li>
								</ul>
							</div></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">QR코드 <span class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a href="/DDOCDOC/Customer/detailCustomer.do">QR코드
											발급</a></li>
								</ul>
							</div></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">후기<span class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a href="../Customer/reviewInsertForm.do">후기 작성</a></li>
									<li><a href="../Customer/reviewList.do">후기 목록</a></li>
								</ul>
							</div></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">${customer.cus_name } 님 <span class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a href="../Customer/myPageForm.do">마이페이지</a></li>
								</ul>
							</div></li>
						<li><a href="../Customer/logout.do">로그아웃</a></li>
					</ul>
				</div>
			</nav>
			<!-- /main nav -->
		</div>
	</header>


	<!-- 
        ================================================== 
            TITLE: Global Page Section Start
        ================================================== -->
	<section class="global-page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h2>우리아이 관리</h2>
						<ol class="breadcrumb">
							<li><a href="/DDOCDOC/Customer/success.do"> <i
									class="ion-ios-home"></i> Home
							</a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

<section id="btn" class="company-description" style="margin-bottom: 0; display: flex; justify-content: center">
		
</section>
<div style="display: flex; justify-content : center;">
	<!--  data-toggle="modal" data-target="#myModal" -->
				<i class="fas fa-plus-circle fa-3x" id="circle" title="키등록"
			style="margin-bottom: 10px; color: #f13ea1;"></i>


</div>

<section id="btn2" class="company-description" style="margin-top: 10px; display: flex; justify-content: center; font-weight: 600;">
		
	<div style="width:500px;">
		<table  border="1" class="table table-hover" id="sun" style="font-size: 18px;">
			<tr>
			<td style = 'text-align : center;'>등록키</td>
			<td style = 'text-align : center;'>등록일</td>
			</tr>		
		</table>
	</div>
</section>

<section id="btn" class="company-description" style="display: flex; justify-content: center; margin-bottom: 100px; font-size: 16px;">
		<div class="panel panel-default"  style="margin-right: 80px;">
			<div id="line_top_x" class="panel-body"></div>
		</div>
		<div class="panel panel-default">
			<div id="columnchart_material" style="width: 400px; height: 500px;" class="panel-body"></div>
		</div>
		
		</div>
</section>

<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">키 등록하기</h4>
            </div>
            <div class="modal-body">
            	<form name = "testForm" id="testForm">
	              <div class="form-group">
	                <label>키 입력 (단위 : cm)</label> 
	                <input type="text" class="form-control" name="he_height" id="he_height">
	              </div>      
	              <div class="form-group">
	                <label>등록일</label> 
	                <input type="text" class="form-control" name="he_date" id="datepicker">
	              </div>
            	</form>
            </div>
<div class="modal-footer">
         <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
	<!--
            ==================================================
            Footer Section Start
            ================================================== -->
	<footer id="footer">
		<div class="container">
			<div class="col-md-8">
				<p class="copyright">
					Copyright: <span><script>
						document.write(new Date().getFullYear())
					</script></span>
					Design and Developed by <a href="mailto:amydreamsyou@gmail.com"
						target="_blank">Lee Min-hye</a>. <br> Get More <a
						href="https://themefisher.com/free-bootstrap-templates/"
						target="_blank"> Free Bootstrap Templates </a>
				</p>
			</div>
			<div class="col-md-4">
				<!-- Social Media -->
				<ul class="social">
					<li><a href="http://wwww.fb.com/themefisher" class="Facebook">
							<i class="ion-social-facebook"></i>
					</a></li>
					<li><a href="http://wwww.twitter.com/themefisher"
						class="Twitter"> <i class="ion-social-twitter"></i>
					</a></li>
					<li><a href="#" class="Linkedin"> <i
							class="ion-social-linkedin"></i>
					</a></li>
					<li><a href="http://wwww.fb.com/themefisher"
						class="Google Plus"> <i class="ion-social-googleplus"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</footer>
	<!-- /#footer -->

	<!-- Template Javascript Files
	================================================== -->
	<!-- jquery -->
 	<script src="<c:url value="/resources/plugins/jQuery/jquery.min.js" />"></script> 
	<!-- Form Validation -->
	<script
		src="<c:url value="/resources/plugins/form-validation/jquery.form.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/form-validation/jquery.validate.min.js" />"></script>
	<!-- owl carouserl js -->
	<script
		src="<c:url value="/resources/plugins/owl-carousel/owl.carousel.min.js" />"></script>
	<!-- bootstrap js -->
	<script
		src="<c:url value="/resources/plugins/bootstrap/bootstrap.min.js" />"></script>
	<!-- wow js -->
	<script src="<c:url value="/resources/plugins/wow-js/wow.min.js" />"></script>
	<!-- slider js -->
	<script src="<c:url value="/resources/plugins/slider/slider.js" />"></script>
	<!-- Fancybox -->
	<script
		src="<c:url value="/resources/plugins/facncybox/jquery.fancybox.js" />"></script>
	<!-- template main js -->
	<script src="<c:url value="/resources/js/main.js" />"></script>



</body>
</html>