<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="/customer/comInsert" method="post">
		<input type="hidden" name="cus_num" value="${customer.cus_num }"/>
		<input type="text" name="com_title"><br>
		<input type="text" name="com_writer" value="${customer.cus_name }" readonly/><br>
		<textarea rows="6" cols="70" name="com_content"></textarea><br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="작성"/>

	
	</form>



</body>
</html>