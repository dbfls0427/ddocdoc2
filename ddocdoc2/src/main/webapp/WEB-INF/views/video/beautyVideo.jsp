<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
    <title>Search YouTube</title>
<!-- header module -->
<%@include file="../includes/header.jsp" %>
<!-- end header module -->    
    
<!--     Bootstrap core CSS
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
<!--     Custom styles for this template -->
    <link href="/resources/css/album.css" rel="stylesheet">

	<script src="/resources/js/fortest.js"></script>
	<script type="text/javascript">
 	jQuery(document).ready(function(){
		var searchKey = '팔로우미';
		Service.startGet(searchKey);
		jQuery("#youSearch").on("click" , function(e){
			 searchKey = jQuery("div").find("input").val();
			 jQuery("#content").empty();
			 Service.startGet(searchKey);
		});
	})
	
	</script>
	
  </head>
  <body>
	<!-- menu module -->
<%@include file="../includes/menu.jsp" %>
<!-- 
        ================================================== 
            TITLE: Global Page Section Start
        ================================================== -->
	<section class="global-page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h2>똑닥 TV</h2>
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
<!-- end menu module -->

<main role="main" style="margin-bottom: 50px;">
  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading"></h1>
      <p class="lead text-muted">궁금한 뷰티 키워드를 검색해보세요!</p>
      <div class="input-group mb-3">
	        <input type="text" name="searchText" class="form-control" aria-label="Username" placeholder="ex) 코성형 , 눈매 교정" style="width: 380px;">
      </div>
      <p style="margin-top: 20px;">
        <button class="btn btn-primary my-2" id="youSearch" style="width : 200px;">검색하기</button>
        <!-- <button class="btn btn-secondary my-2">I'm Feeling Lucky</button> -->
      </p>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row" id="content">


      </div>
    </div>
  </div>

</main>

<!-- menu module -->
<%@include file="../includes/footer.jsp" %>
</body>
</html>