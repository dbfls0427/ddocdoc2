<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="/customer/comUpdate" method="post">
	글번호<br>
	<input type="text" name="com_num" value = "${com.com_num }" readonly><br>
	제목<br>
	<input type="text" name="com_title" value = "${com.com_title }"><br>
	작성자<br>
	<input type="text" name="com_writer" value = "${com.com_writer }" readonly><br>
	내용<br>
	<input type="text" name="com_content" value = "${com.com_content }"><br>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="submit" value = "수정">
	</form>
	<button onclick="location.href='/customer/comList'">글 목록</button>
</body>
</html>