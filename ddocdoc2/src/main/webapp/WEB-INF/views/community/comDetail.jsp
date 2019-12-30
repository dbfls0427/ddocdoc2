<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="/resources/js/reply.js"></script> -->
<script type="text/javascript">
	$(function() {
		var operForm = $("#operForm");
		var modal = document.getElementById('myModal');
		
		$(".modifyButton").on("click", function(e) {
			e.preventDefault();
			operForm.attr("action", "/customer/comUpdateForm").submit();

		});

		var comNum = $(".comNumc").val();
		var replyUL = $(".chat");

		

		 replyJs.list({
			com_num : comNum
		}, function(list) {
			var str = "";
			if (list == null || list.length == 0) {
				replyUL.html("");
				return;
			}

			for (var i = 0, len = list.length || 0; i < len; i++) {
				console.log(list.rep_num);
				str += "<a>" + list[i].rep_num + "</a></br>";
				str += "<a> " + list[i].rep_writer + " </a></br>";
				str += "<a>" + list[i].rep_content + "</a></br>";
				str += "<a>" + list[i].rep_date + "</a></br>";
				str += "<button onclick='remove("+ list[i].rep_num +")'>댓글 삭제</button></br>";

			}

			replyUL.html(str);
		}); 

		

		/* 		replyJs.update({rep_num : , com_num : comNum, rep_content : }, function(result) {
		 alert("수정이 완료되었습니다.");
		 }); */
			
		 
		 
		 $(".replyInsert").on("click",function(e){
			 e.preventDefault();
			 
			 var span = document.getElementsByClassName("close")[0];
			 modal.style.display = "block";
			 
			 
		 });
		 
		 
		  jQuery.fn.serializeObject = function() { 
		      var obj = null; 
		      try { 
		          if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
		              var arr = this.serializeArray(); 
		              if(arr){ obj = {}; 
		              jQuery.each(arr, function() { 
		                  obj[this.name] = this.value; }); 
		              } 
		          } 
		      }catch(e) { 
		          alert(e.message); 
		      }finally {} 
		      return obj; 
		    }; 
		 
		 $(".replyInsertButton").on("click", function(e) {
			 e.preventDefault();
			 console.log("ㅇㅇㄹㅇㄹㅇㄹㅇㄹㅇㄹㅇ");
			 var inputWriter = $(".replyInsertForm").find("input[name=rep_writer]");
			 console.log(inputWriter.val());
			 var inputContent = $(".replyInsertForm").find("input[name=rep_content]");
			 console.log(inputContent.val());
			 var inputComNum = $(".replyInsertForm").find("input[name=com_num]");
			 console.log(inputComNum.val());
			  const form = $("form[name=replyInsertForm]").serializeObject(); 
			  var reply = {
					 rep_writer : inputWriter.val(),
					 rep_content : inputContent.val(),
					 com_num : comNum
			 }; 
			 
			 replyJs.insert(reply, function(result) {
			 alert("댓글 작성이 완료되었습니다.");
			 modal.style.display = "none";
			 
			 replyJs.list({
					com_num : comNum
				}, function(list) {
					var str = "";
					if (list == null || list.length == 0) {
						replyUL.html("");
						return;
					}

					for (var i = 0, len = list.length || 0; i < len; i++) {
						console.log(list.rep_num);
						str += "<a>" + list[i].rep_num + "</a></br>";
						str += "<a> " + list[i].rep_writer + " </a></br>";
						str += "<a>" + list[i].rep_content + "</a></br>";
						str += "<a>" + list[i].rep_date + "</a></br>";
						str += "<button onclick='remove("+ list[i].rep_num +")'>댓글 삭제</button></br>";
					}

					replyUL.html(str);
				}); 
			 
			 }); 
			 
		});
		 
		 
		 
		 
		 
		 
		 
	});
	
	
	
	var replyJs = (function() {
		console.log("replyJs");
		
		function insert(reply, callback, error) {
			console.log("fucking");
			console.log(reply);
			$.ajax({
				type : 'POST',
				url : '/reply/new',
				data : JSON.stringify(reply),
				beforeSend : function(xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					console.log("success");
					if(callback){
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					console.log("fail");
					if(xhr){
						console.log(xhr);
					}
				}
				
				
				
			});
			
		};
		
		
		function list(param, callback, error) {
			var comNum = param.com_num;
			
			$.getJSON("/reply/pages/" + comNum + ".json", function(data) {
				if(callback){
					callback(data);
				}
			}).fail(function(xhr, status, err) {
				if(error){
					error();
				}
			})
			
		};
		
		function remove(rep_num, callback, error) {
			console.log(rep_num);
			$.ajax({
				type : 'get',
				url : '/reply/' + rep_num,
				success : function(result, status, xhr) {
					if(callback){
						callback(result);
					}
					
				},
				error : function(xhr, status, er) {
					if(error){
						error(er);
					}
				}
				
				
			});
		};
		
		function update(reply, callback, error) {
			
			$.ajax({
				type : 'put',
				url : '/reply/' + reply.rep_num,
				data : JSON.stringify(reply),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr){
					if(callback){
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					if(error){
						error(er);
					}
				}
				
				
			});
		}
		
		
		
		return{
			insert : insert,
			list : list,
			remove : remove,
			update : update
			
		};
		
	})();
	
	
	
	
	
	function remove(rep_nums) {
		  console.log(rep_nums);
		  var comNum = $(".comNumc").val();
		  var replyUL = $(".chat");
		  replyJs.remove(rep_nums, function(result) {
			
			if(result === "success"){
				alert("삭제에 성공하였습니다.");
				 replyJs.list({
						com_num : comNum
					}, function(list) {
						var str = "";
						if (list == null || list.length == 0) {
							replyUL.html("");
							return;
						}

						for (var i = 0, len = list.length || 0; i < len; i++) {
							console.log(list.rep_num);
							str += "<a>" + list[i].rep_num + "</a></br>";
							str += "<a> " + list[i].rep_writer + " </a></br>";
							str += "<a>" + list[i].rep_content + "</a></br>";
							str += "<a>" + list[i].rep_date + "</a></br>";
							str += "<button onclick='remove("+ list[i].rep_num +")'>댓글 삭제</button></br>";

						}

						replyUL.html(str);
					}); 
			}
		}, function(err) {
			alert("에러");
		}); 
	};
	
</script>
<style type="text/css">
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>

	글번호
	<br>
	<input type="text" class="comNumc" name="com_num"
		value="${com.com_num }" readonly>
	<br> 제목
	<br>
	<input type="text" name="com_title" value="${com.com_title }" readonly>
	<br> 작성자
	<br>
	<input type="text" name="com_writer" value="${com.com_writer }"
		readonly>
	<br> 작성날짜
	<br>
	<input type="text" name="com_date"
		value="${fn:substring(com.com_date,0,10) }" readonly>
	<br> 내용
	<br>
	<input type="text" name="com_content" value="${com.com_content }"
		readonly>
	<br> 추천 수 &nbsp ${com.com_up }&nbsp&nbsp&nbsp ${com.com_down }
	&nbsp 비추천 수
	<br>

	<button class="modifyButton">글 수정</button>
	<button
		onclick="location.href='/customer/comDelete?com_num=${com.com_num}'">글
		삭제</button>
	<button onclick="location.href='/customer/comList'">글 목록</button>


	<form method="get" id="operForm">
		<input type="hidden" id="com_num" name="com_num"
			value='${com.com_num }' /> <input type="hidden" name="pageNum"
			value='${cri.pageNum }'> <input type="hidden" name="amount"
			value='${cri.amount }'>
	</form>

	<div class="chat"></div>
	<div>
		<button class="replyInsert">댓글 작성</button>
	</div>
	
	
	


	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<form method="post" class="replyInsertForm" name = "replyInsertForm">
				작성자 : <input type="text" name="rep_writer" value="fff" readonly><br>
				내용 : <input type="text" name="rep_content"><br>
				<input type="hidden" name="com_num" value="${com.com_num }">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button class="replyInsertButton">댓글입력</button>
			
				
			</form>
				
		</div>




	</div>


</body>

</html>