<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/user_height.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
</head>
<script type="text/javascript" src="/resources/js/user_height.js"></script>
<script type="text/javascript">
var j = jQuery.noConflict();
j(document).ready(function(){
	var num = '<c:out value="${ch_num }"/>';
	var list = j(".list");
	
	showList();
	
	function showList(){
		heightService.list({ch_num : num}, function(list){
			var str = "";
			
			for(var i=0, len = list.length || 0; i<len; i++){
				str += "<td style = 'text-align : center;'><a class='aa' href='/height/detail'>" + list[i].he_height + "</a></td>";
				str += "<td style = 'text-align : center;'>" + list[i].he_date + "</td>";
			}
			
			list.append(str);
			
		});
	}
});
})
</script>
<body>

<table class="table table-hover" id="sun" style="font-size: 18px;">
				<tr>
					<td style="text-align : center;">등록한 키</td>
					<td style="text-align : center;">등록 날짜</td>
				</tr>
				
				<tr class=".list">
					
				</tr>
</table>
			



</body>
</html>