<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="/resources/js/reply.js"></script> -->
<script type="text/javascript">
	$(function() {
		var operForm = $("#operForm");
		var modal = document.getElementById('myModal');
		var span = document.getElementsByClassName("close")[0];
		
		/* $(".list").on("click", function() {
			operForm.submit();
			
		}); */
		
		$(".modifyButton").on("click", function(e) {
			e.preventDefault();
			operForm.attr("action", "/customer/comUpdateForm").submit();

		});

		var comNum = $(".comNumc").val();
		var replyUL = $("#chat");

		

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
/* 				str += "<a>" + list[i].rep_num + "</a></br>";
				str += "<a> " + list[i].rep_writer + " </a></br>";
				str += "<a>" + list[i].rep_content + "</a></br>";
				str += "<a>" + list[i].rep_date + "</a></br>";
				str += "<button onclick='remove("+ list[i].rep_num +")'>댓글 삭제</button></br>"; */
				replyUL.empty();
				
 				str += '<div class="media" style="margin-bottom: 10px;">';
				str += '<div class="media-left" style="padding-right:0">';
				str += '<a href="#">';
				str += '<img class="media-object" src="/resources/images/comment2.jpeg" alt="..." style="width:70px;">';
				str += '</a>';
				str += '</div>';
				str += '<div class="media-body" class="chat" style="padding-top: 10px; padding-left: 10px;">';
				str += '<div style="display: flex; justify-content : center;">';
				str += '<div style=" width:400px">';
				str += '<h5 class="media-heading">'+ list[i].rep_writer  +'</h5>';
				str += '<a>' + list[i].rep_content +'</a>';
				str += '</div>';
				str += '<button onclick="remove('+list[i].rep_num+')" class="btn btn-default">삭제</button>';
				str += '</div>';
				str += '</div>';
				str += '</div>';
		
		

			}

			replyUL.html(str);
		}); 

		

		/* 		replyJs.update({rep_num : , com_num : comNum, rep_content : }, function(result) {
		 alert("수정이 완료되었습니다.");
		 }); */
			
		 
		 
		 $("#replyInsert").on("click",function(e){
			 e.preventDefault();
			 
			 
			 modal.style.display = "block";
			 
			 span.onclick = function() {
		            modal.style.display = "none";
		        }
			 
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
			 alert($(".cumm").val());
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
					replyUL.empty();
					for (var i = 0, len = list.length || 0; i < len; i++) {
						console.log(list.rep_num);
/* 						str += "<a>" + list[i].rep_num + "</a></br>";
						str += "<a> " + list[i].rep_writer + " </a></br>";
						str += "<a>" + list[i].rep_content + "</a></br>";
						str += "<a>" + list[i].rep_date + "</a></br>";
						str += "<button onclick='remove("+ list[i].rep_num +")'>댓글 삭제</button></br>"; */
						
		 				str += '<div class="media" style="margin-bottom: 10px;">';
						str += '<div class="media-left" style="padding-right:0">';
						str += '<a href="#">';
						str += '<img class="media-object" src="/resources/images/comment2.jpeg" alt="..." style="width:70px;">';
						str += '</a>';
						str += '</div>';
						str += '<div class="media-body" class="chat" style="padding-top: 10px; padding-left: 10px;">';
						str += '<div style="display: flex; justify-content : center;">';
						str += '<div style=" width:400px">';
						str += '<h5 class="media-heading">'+ list[i].rep_writer  +'</h5>';
						str += '<a>' + list[i].rep_content +'</a>';
						str += '</div>';
						str += '<button onclick="remove('+list[i].rep_num+')" class="btn btn-default">삭제</button>';
						str += '</div>';
						str += '</div>';
						str += '</div>';
					}

					replyUL.append(str);
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
			console.log("리스트에서 : " + comNum);
			
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
		  console.log("dddd"+comNum);
		  var replyUL = $("#chat");
		  replyJs.remove(rep_nums, function(result) {
			
			if(result === "success"){
				alert("삭제에 성공하였습니다.");
				 replyJs.list({
						com_num : comNum
					}, function(list) {
						var str = "";
						console.log("adfsfd");
						if (list == null || list.length == 0) {
							console.log(list);
							replyUL.html("");
							return;
						}
						console.log("여깅");
						console.log(list);
						
						for (var i = 0, len = list.length || 0; i < len; i++) {
							console.log("포문");
			 				str += '<div class="media" style="margin-bottom: 10px;">';
							str += '<div class="media-left" style="padding-right:0">';
							str += '<a href="#">';
							str += '<img class="media-object" src="/resources/images/comment2.jpeg" alt="..." style="width:70px;">';
							str += '</a>';
							str += '</div>';
							str += '<div class="media-body" class="chat" style="padding-top: 10px; padding-left: 10px;">';
							str += '<div style="display: flex; justify-content : center;">';
							str += '<div style=" width:400px">';
							str += '<h5 class="media-heading">'+ list[i].rep_writer  +'</h5>';
							str += '<a>' + list[i].rep_content +'</a>';
							str += '</div>';
							str += '<button onclick="remove('+list[i].rep_num+')" class="btn btn-default">삭제</button>';
							str += '</div>';
							str += '</div>';
							str += '</div>';

							
							
						}
						
						replyUL.empty();
						replyUL.append(str);
					}); 
			}
		}, function(err) {
			alert("에러");
		}); 
	};
	
</script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
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

 #back{
	background-image: url("http://image.sayup.co.kr/collection/undefined/704e3371a374b1594e6e3414d3a8b7af.jpg");
	background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 70%;
    
}
#back::before{
     content: " ";
    position: absolute;
    top: 0px;
    left: 0px;
    display: block;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
 }
</style>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
</head>
<body>

<%@include file="../includes/menu.jsp" %>

<!-- 
        ================================================== 
            TITLE: Global Page Section Start
        ================================================== -->
        <section class="global-page-header" id="back">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2 style="font-size: 35px;">커뮤니티</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="../index.html">
                                        <i class="ion-ios-home"></i>
                                        Home
                                    </a>
                                </li>
                               <!--  <li class="active">가까운 병원찾기</li> -->
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    
		<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center; font-size: 25px; margin-top: 60px;">
			<div style="width: 700px;">
				<label style="margin-left: 50%;">${com.com_title }</label>
				<hr style=" border-top: 2px solid #908d8d;">
			</div>
		</section>
	<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center; margin-top:0;">

		<div style="display: flex; justify-content:center; margin-left:528px; margin-bottom:30px;">
			<label>글쓴이 : ${com.com_writer }</label> <label style="color:gray;">&nbsp(${fn:substring(com.com_date,0,10) }) </label>
		</div>
	</section>
	
	<div style="display: flex; justify-content: center; font-size:15px; margin-bottom:20px;">
		<i class="far fa-thumbs-up fa-2x"></i>&nbsp<label>${com.com_up }</label> &nbsp&nbsp&nbsp&nbsp <i class="far fa-thumbs-down fa-2x"></i>&nbsp<label>${com.com_down }<label></label>
	</div>
	
	<section class="company-description" id="wrapjoin" style="display: flex; justify-content: center; margin-top:0;">
		<div class="well well-lg" style="width:600px;">
			${com.com_content }
		</div>
	</section>
		
	<div style="display: flex; justify-content: center; margin-left:380px;">
	    <button class="btn btn-default"class="modifyButton" style="margin-right:5px;">글 수정</button>
		<button class="btn btn-default" onclick="location.href='/customer/comDelete?com_num=${com.com_num}'" style="margin-right:5px;">글 삭제</button>
		<button class="btn btn-default" class="list" onclick="location.href='/customer/comList'" style="margin-right:5px;">글 목록</button>
   	</div>

		<form method="get" id="operForm">
			<input type="hidden" id="com_num" name="com_num"
				value='${com.com_num }' class="comNumc" /> <input type="hidden" name="pageNum"
				value='${cri.pageNum }'> <input type="hidden" name="amount"
				value='${cri.amount }'>
		</form>
	<div style="display: flex; justify-content:center; margin-top: 50px;">
		<div style="width: 600px;">
			<div class="panel panel-default">
			  <div class="panel-body" id="chat">
			   
			   		<!-- 댓글 -->
<!-- 					<div class="media" style="margin-bottom: 10px;">
							  <div class="media-left" style="padding-right:0">
							    <a href="#">
							      <img class="media-object" src="/resources/images/comment2.jpeg" alt="..." style="width:70px;">
							    </a>
							  </div>
							<div class="media-body" class="chat" style="padding-top: 10px; padding-left: 10px;">
							 	 <div style="display: flex; justify-content : center;">
							 	 	<div style=" width:440px">
								    <h5 class="media-heading">Media heading</h5>
								    <a>ddfawefasefasdfasdfasefasf</a>
							 	 	</div>
								    <button class="btn btn-default">hey</button>
								    <hr>
								  </div>
							  </div>
					</div>	 -->
						   
			   
			   
			   
			  </div>
			</div>
		</div>
	</div>

	

		<!-- <div class="chat"></div> -->
		<div style="display: flex; justify-content:center; margin-left:500px">
			<button id="replyInsert" class="btn btn-default">댓글 작성</button>
		</div>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<form method="post" class="replyInsertForm" name = "replyInsertForm">
				작성자 : <input type="text" name="rep_writer" value="fff" readonly><br>
				내용 : <input type="text" name="rep_content"><br>
				<input type="hidden" name="com_num" value="${com.com_num }" class="cumm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<button class="replyInsertButton">댓글입력</button>
			
				
			</form>
				
		</div>




	</div>

	<%@include file="../includes/footer.jsp" %>
</body>

</html>