<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

   <script src="https://code.jquery.com/jquery-3.3.1.min.js"
      integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
      crossorigin="anonymous"></script>
      

<script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
			
		});
		
		
		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='term_num' value='"+ $(this).attr("href")+"'>");
			actionForm.attr("action", "/customer/termDetail");
			actionForm.submit();
		});
		
		
		
		var searchForm = $("#searchForm");

		$("#searchForm button").on(
				"click",
				function(e) {

					if (!searchForm.find("option:selected")
							.val()) {
						alert("검색종류를 선택하세요");
						return false;
					}

					if (!searchForm.find(
							"input[name='keyword']").val()) {
						alert("키워드를 입력하세요");
						return false;
					}

					searchForm.find("input[name='pageNum']")
							.val("1");
					e.preventDefault();

					searchForm.submit();

				});
		
		
		
	});
	

</script>	

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
						<h2>의학용어 목록</h2>
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
	
	<section>
	
	</section>



	<section class="company-description paddingSide" style="min-height:450px;">
		<!-- search 
		<div class='row'> 	
			<div class="col-lg-12">
				<form id='searchForm' action="/customer/termList" method='get'>
					<select name='type'>
						<option value=""
							<c:out value="${pageMaker.cri2.type == null?'selected':''}"/>>--</option>
						<option value="T"
							<c:out value="${pageMaker.cri2.type eq 'T'?'selected':''}"/>>제목</option>
						<option value="C"
							<c:out value="${pageMaker.cri2.type eq 'C'?'selected':''}"/>>내용</option>
						<option value="TC"
							<c:out value="${pageMaker.cri2.type eq 'TC'?'selected':''}"/>>제목
							or 내용</option>
					</select> 
					<input type='text' name='keyword' value='<c:out value="${pageMaker.cri2.keyword}"/>' /> 
					<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri2.pageNum}"/>' /> 
					<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri2.amount}"/>' />
					<button class='btn btn-default'>Search</button>
				</form>
			</div>
		</div>
		 //search -->
		
		<div style="display:flex;justify-content:center;">
          <div class="row" style="width:60%;">
          		<!-- search -->
				<div class='row'> 	
					<div class="col-lg-12" style="display: flex;justify-content: center;">
						<form id='searchForm' action="/customer/termList" method='get' style="display:flex;">
							<select name='type' class="form-control" style="width:30%;">
								<option value=""
									<c:out value="${pageMaker.cri2.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri2.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri2.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="TC"
									<c:out value="${pageMaker.cri2.type eq 'TC'?'selected':''}"/>>제목or내용</option>
							</select> 
							<input class="form-control" style="width:100%;" type='text' name='keyword' value='<c:out value="${pageMaker.cri2.keyword}"/>' /> 
							<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri2.pageNum}"/>' /> 
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri2.amount}"/>' />
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>
				<!-- //search -->
          
          
	          <!-- DataTales Example -->
	          <div class="card shadow mb-4">
	            <div class="card-header py-3">
	              <h6 class="m-0 font-weight-bold text-primary">의학용어 리스트</h6>
	            </div>
	            <div class="card-body">
	              <div class="table-responsive">
	              	<table class="table table-hover">
					   <tr>
							<td style="width:270px;">의학용어 번호</td>
							<td>의학용어 제목</td>
						</tr>
						<c:forEach var="termvo" items="${list}">
							<tr>
								<td>${termvo.term_num }</td>
								<td><a class="move" href='${termvo.term_num }'>${termvo.term_title }</a></td>
								
							</tr>
						</c:forEach>
					</table>
	              </div>
	            </div>
	          </div>
			
           </div>
          <!-- Content Row -->
       </div> 
          
		<!-- pagination -->	
		<div style="display: flex;justify-content: center;">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li class="page-item paginate_button previous"><a class="page-link" href="${pageMaker.startPage-1 }">Previous</a></li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="page-item paginate_button ${pageMaker.cri2.pageNum == num ? "active" : "" }"><a class="page-link" href="${num }">${num }</a></li>
					</c:forEach>
					
					<c:if test="${pageMaker.next }">
						<li class="page-item paginate_button next"><a class="page-link" href = "${pageMaker.endPage+1 }">Next</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
		<!--  end Pagination -->
	
	</section>
	<form id="actionForm" action="/customer/termList" method="get">
		<input type="hidden" name="pageNum" value = "${pageMaker.cri2.pageNum }">
		<input type="hidden" name="amount" value = "${pageMaker.cri2.amount}">
		<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri2.type }"/>'> 
		<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri2.keyword }"/>'>
	</form>
	
	
	
<!-- footer module -->
<%@include file="../includes/footer.jsp" %>
<!-- end footer module -->	
</body>
</html>