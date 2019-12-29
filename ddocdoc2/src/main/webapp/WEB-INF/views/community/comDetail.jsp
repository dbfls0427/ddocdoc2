<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");
		
		$(".modifyButton").on("click", function(e) {
			e.preventDefault();
			operForm.attr("action","/customer/comUpdateForm").submit();
			
			
		});
		
		
	});
</script>
</head>
<body>
	
	�۹�ȣ<br>
	<input type="text" name="com_num" value = "${com.com_num }" readonly><br>
	����<br>
	<input type="text" name="com_title" value = "${com.com_title }" readonly><br>
	�ۼ���<br>
	<input type="text" name="com_writer" value = "${com.com_writer }" readonly><br>
	�ۼ���¥<br>
	<input type="text" name="com_date" value = "${fn:substring(com.com_date,0,10) }" readonly><br>
	����<br>
	<input type="text" name="com_content" value = "${com.com_content }" readonly><br>
	
	��õ �� &nbsp ${com.com_up }&nbsp&nbsp&nbsp ${com.com_down } &nbsp ����õ �� <br>
	
	<button class="modifyButton">�� ����</button> 
	<button onclick="location.href='/customer/comDelete?com_num=${com.com_num}'">�� ����</button>
	<button onclick="location.href='/customer/comList'">�� ���</button>
	

	<form method="get" id="operForm">
		<input type="hidden" id="com_num" name="com_num" value='${com.com_num }'/>
		<input type="hidden" name="pageNum" value='${cri.pageNum }'>
		<input type="hidden" name="amount" value='${cri.amount }'>
	</form>

</body>

</html>