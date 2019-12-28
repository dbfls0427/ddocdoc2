<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
 		<td><a href="/customer/comDetail?com_num=${com.com_num }">${com.com_title }</a></td>
 		<td>${com.com_writer }</td>
 		<td>${fn:substring(com.com_date,0,10) }</td>
 		<td>${com.com_hits }</td>
 		<td>${com.com_up }</td>
 	</tr>
 	</c:forEach>

 
 </table>

</body>
</html>