<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			actionForm.append("<input type='hidden' name='com_num' value='"+ $(this).attr("href")+"'>");
			actionForm.attr("action", "/customer/comDetail");
			actionForm.submit();
			
			
		});
		
	});
	

</script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
<style type="text/css">
 #back{
	background-image: url("http://image.sayup.co.kr/collection/undefined/704e3371a374b1594e6e3414d3a8b7af.jpg");
	background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 70%;
    
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
</head>
<body>
<%@include file="../includes/menu.jsp" %>

<!-- 
        ================================================== 
            TITLE: Global Page Section Start
        ================================================== -->
        <section class="global-page-header" id="back">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2 style="font-size: 35px;">커뮤니티</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="../index.html">
                                        <i class="ion-ios-home"></i>
                                        Home
                                    </a>
                                </li>
                               <!--  <li class="active">가까운 병원찾기</li> -->
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>



			<div style="display: flex; justify-content: center; margin-top: 50px;">
			<button onclick="location.href='/customer/comInsertForm'" class="btn btn-warning" style="margin-left:800px;">글 작성</button>
			</div>
 
		<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center; padding-left: 500px; padding-right: 500px; margin-top:30px;">
		<table  class="table table-hover" id = "table1" style="font-size: 18px;">
 	<tr>
 		<td style="text-align : center;"> 글번호 </td>
 		<td style="text-align : center;"> 제목 </td>
 		<td style="text-align : center;"> 작성자 </td>
 		<td style="text-align : center;"> 작성날짜 </td>
 		<td style="text-align : center;"> 조회수 </td>
 		<td style="text-align : center;"> 추천수 </td>
 	</tr>
 	<c:forEach var="com" items="${list }">
 	<tr>
 		<td style="text-align : center;">${com.com_num }</td>
 		<td style="text-align : center;"><a class="move" href="${com.com_num }">${com.com_title }</a></td>
 		<td style="text-align : center;">${com.com_writer }</td>
 		<td style="text-align : center;">${fn:substring(com.com_date,0,10) }</td>
 		<td style="text-align : center;">${com.com_hits }</td>
 		<td style="text-align : center;">${com.com_up }</td>
 	</tr>
 	</c:forEach>
	
 
 </table>
		
		
		</section>

 
	<div style="display: flex; justify-content: center;">
		<%-- <ul>
			<c:if test="${pageMaker.prev }">
				<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">Previous</a></li>
			</c:if>
		
			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }"><a href="${num }">${num }</a></li>
			</c:forEach>
			
			<c:if test="${pageMaker.next }">
				<li class="paginate_button next"><a href = "${pageMaker.endPage+1 }">Next</a></li>
			</c:if>
		</ul> --%>
		
		          
                <nav aria-label="Page navigation example">
               <ul class="pagination" style="margin-top:250px;">
                  <c:if test="${pageMaker.prev }">
                     <li class="page-item paginate_button previous"><a class="page-link" href="${pageMaker.startPage-1 }">Previous</a></li>
                  </c:if>
               
                  <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                     <li class="page-item paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }"><a class="page-link" href="${num }">${num }</a></li>
                  </c:forEach>
                  
                  <c:if test="${pageMaker.next }">
                     <li class="page-item paginate_button next"><a class="page-link" href = "${pageMaker.endPage+1 }">Next</a></li>
                  </c:if>
               </ul>
            </nav>
        
         <!--  end Pagination -->
		
		
		
		
		<form action="/customer/comList" method="get" id="actionForm">
			<input type="hidden" name="pageNum" value = "${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value = "${pageMaker.cri.amount}">
			
		</form>
	
	</div>
	<br><br><br>
	<%@include file="../includes/footer.jsp" %>

</body>
</html>