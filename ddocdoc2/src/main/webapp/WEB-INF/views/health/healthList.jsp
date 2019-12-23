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
<script>
 jQuery(document).ready(function(){
/* 	var code = '<c:out value="${ele }"/>';
	console.log(code); */
	
/* 	jQuery(".date_author").remove();*/
	jQuery(".rel_trig").remove(); 
	
	jQuery(".list_item").on("click", "a" , function(e){
		var url = "http://health.chosun.com"+ jQuery(this).attr("href");
		jQuery(this).attr("href" , url);
	})
	
 });

</script>
<style type="text/css">
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: underline;}


.thumb{
	float : left;
}

#liContain{
/* 	margin-bottom: 25px; */
	height : 200px;
	width : 900px;
}
dt{
	font-size : 26px;
}
img{
	margin-right : 15px;
}
.list_item{
	margin-top : 25px;
}
.list_item dt{
	margin-left : 40px;
}
.date_author{
	margin-top: 40px;
}

#list-area{
/*     margin-top: 150px; */
    display: flex;
    justify-content: center;
}

#back{
	background-image: url("http://image.sayup.co.kr/collection/5615c9d21b45390300d445df/2b7b6df7ba291a8723a5b3daa0d9c48d.jpg");
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

<!-- header module -->
<%@include file="../includes/header.jsp" %>
<!-- end header module -->

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
		<!-- <img src="" /> -->
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h2>건강정보</h2>
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
	
 
<div id="list-area">
<%--    <ul>
		<c:forEach var="title" items="${titles }">
			<li class="list_item">
				<div>
					<a>${title }</a>
				</div>
			</li>
		</c:forEach>
		
		<c:forEach var="content" items="${contents }">
			<div>
					<a>${content }</a>
			</div>
		</c:forEach>
  </ul> --%>
   <div id="contain">
	  <c:forEach var="ii" items="${ele }">
	  	<div style="width:900px">
	  	<hr>
	  	</div>
	  	<div id="liContain">
		  	${ii }
	  	</div>
	  </c:forEach>
  </div>

</div>
	

<!-- footer module -->
<%@include file="../includes/footer.jsp" %>
<!-- end footer module -->	
</body>
</html>