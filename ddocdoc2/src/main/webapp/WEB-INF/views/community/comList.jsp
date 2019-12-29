<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
</head>
<body>

 <table>
 	<tr>
 		<td> 글번호 </td>
 		<td> 제목 </td>
 		<td> 작성자 </td>
 		<td> 작성날짜 </td>
 		<td> 조회수 </td>
 		<td> 추천수 </td>
 	</tr>
 	<c:forEach var="com" items="${list }">
 	<tr>
 		<td>${com.com_num }</td>
 		<td><a class="move" href="${com.com_num }">${com.com_title }</a></td>
 		<td>${com.com_writer }</td>
 		<td>${fn:substring(com.com_date,0,10) }</td>
 		<td>${com.com_hits }</td>
 		<td>${com.com_up }</td>
 	</tr>
 	</c:forEach>

 
 </table>
 
	<div>
		<ul>
			<c:if test="${pageMaker.prev }">
				<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">Previous</a></li>
			</c:if>
		
			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : "" }"><a href="${num }">${num }</a></li>
			</c:forEach>
			
			<c:if test="${pageMaker.next }">
				<li class="paginate_button next"><a href = "${pageMaker.endPage+1 }">Next</a></li>
			</c:if>
		</ul>
		
		<form action="/customer/comList" method="get" id="actionForm">
			<input type="hidden" name="pageNum" value = "${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value = "${pageMaker.cri.amount}">
			
		</form>
	
	</div>
	
	

</body>
</html>