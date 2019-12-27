<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <h1>${ind }</h1> --%>
	
	<h2>Live 신청</h2>
	<form action="/insertLiveAction" method="post">
		<input type="hidden" name = "live_address" value="${ind }">
		<label>방송제목 : </label><input type="text" name="live_name">
		<label>소속병원 : </label>
		<select id="sel1" name="live_hos">
		
		
		</select>
		
	</form>
</body>
</html>