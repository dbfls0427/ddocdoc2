<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/resources/js/sockjs.min.js"></script>
</head>

<style>
.chatting {
	border: 5px ridge #ff5722;
}
</style>
<body>
	<div id="chat" style="width: 400px; height: 400px" class="chatting"></div>
	<form id="chatForm">
		<input type="text" id="message" />
		<button>send</button>
	</form>

	<script>
		var sock = new SockJS("/echo");
		sock.onmessage = function(e) {
			$("#chat").append(e.data + "<br/>");
		}

		sock.onclose = function() {
			$("#chat").append("연결 종료");
		}
		$(document).ready(function() {
			$("#chatForm").submit(function(event) {
				event.preventDefault();
				sock.send($("#message").val());
				$("#message").val('').focus();
			});
		});
	</script>
</body>
</html>