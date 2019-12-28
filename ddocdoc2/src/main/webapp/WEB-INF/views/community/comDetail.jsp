<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	글번호<br>
	<input type="text" name="com_num" value = "${com.com_num }" readonly><br>
	제목<br>
	<input type="text" name="com_title" value = "${com.com_title }" readonly><br>
	작성자<br>
	<input type="text" name="com_writer" value = "${com.com_writer }" readonly><br>
	작성날짜<br>
	<input type="text" name="com_date" value = "${fn:substring(com.com_date,0,10) }" readonly><br>
	내용<br>
	<input type="text" name="com_content" value = "${com.com_content }" readonly><br>
	
	추천 수 &nbsp ${com.com_up }&nbsp&nbsp&nbsp ${com.com_down } 비추천 수 <br>
	
	<button onclick="location.href='/customer/comUpdateForm?com_num=${com.com_num}'">글 수정</button> 
	<button onclick="location.href='/customer/comDelete?com_num=${com.com_num}'">글 삭제</button>
	<button onclick="location.href='/customer/comList'">글 목록</button>
	

</body>
</html>