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
	
	��õ �� &nbsp ${com.com_up }&nbsp&nbsp&nbsp ${com.com_down } ����õ �� <br>
	
	<button onclick="location.href='/customer/comUpdateForm?com_num=${com.com_num}'">�� ����</button> 
	<button onclick="location.href='/customer/comDelete?com_num=${com.com_num}'">�� ����</button>
	<button onclick="location.href='/customer/comList'">�� ���</button>
	

</body>
</html>