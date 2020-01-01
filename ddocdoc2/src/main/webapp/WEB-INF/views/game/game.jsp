<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
    <head>
  <%@include file="../includes/header.jsp" %>
<meta name="_csrf" th:content="${_csrf.token}"/>
<meta name="_csrf_header" th:content="${_csrf.headerName}"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!--  <script src="/resources/js/game.js"></script> -->
<script type="text/javascript">
	var resultSymptom;
		
		
	$(function() {
		var typingBool = false;
		var typingIdx=0;
		var typingTxt=$(".typing-txt").text();
		var tyInt;
		
		
		typingTxt=typingTxt.split("");
		var audio = new Audio();
		var audio2 = new Audio();
		audio.src = "/resources/game/main.mp3";
		audio2.src = "/resources/game/back.mp3";
		audio.play();
		audio2.play();
		
		if(typingBool==false){
			typingBool=true;
			
			tyInt = setInterval(typing,150);
		}
		
		function typing(){
			
			if(typingIdx<typingTxt.length){
				$(".typing").append(typingTxt[typingIdx]);
				typingIdx++;
			}else{
				clearInterval(tyInt);
				clear();
				selectOne();
			}
		}
		
		function selectOne() {
			audio.src = "/resources/game/menuone.mp3";
			audio.play();



			/* 음성 고쳐야 됌 */
			typingTxt = '어떤 메뉴를 선택하시겠습니까? \n 1.증상 검색 2.사전 온라인 상담';
			typingBool = false;
			typingIdx = 0;
			
			if(typingBool==false){
				typingBool=true;
				
				tyInt = setInterval(typing2,100);
			}
			var inputText = '<input type="text" id="menuNum" style="margin-top: 150px; margin-left: 600px;"/>';
			var inputButton = '<button class="menuSubmit" style="margin-top: 150px; margin-left: 10px;">입력</button>';
			var str = '';
			
			str += inputText;
			str += inputButton;
			
			$('.customer').html(str);
			
		};
		
		function typing2() {
			if(typingIdx<typingTxt.length){
				$(".typing").append(typingTxt[typingIdx]);
				typingIdx++;
			}else{
				clearInterval(tyInt);
			}
		}
		function clear() {
			$(".typing").empty();
		}
		
		$(document).on("click", ".menuSubmit", function(){
			var menuNum = document.getElementById("menuNum").value;
			console.log(menuNum);
			$('#menuNum').remove();
			$('.menuSubmit').remove();
			if(menuNum == '1'){
				clear();
				audio.pause();
				audio.src = "/resources/game/menutwo.mp3";
				audio.play();
				typingTxt = '증상 검색을 선택하셨습니다. 어떤 메뉴를 선택하시겠습니까? \n 1. 증상을 통한 검색 2. 영상으로 간단히 증상 검색';
				typingBool = false;
				typingIdx = 0;
				if(typingBool==false){
					typingBool=true;
					
					tyInt = setInterval(typing2,100);
				}
				var inputText = '<input type="text" id="menuNum2" style="margin-top: 180px; margin-left: 600px;"/>';
				var inputButton = '<button class="menuSubmit2" style="margin-top: 180px; margin-left: 10px;">입력</button>';
				var str = '';
				str += inputText;
				str += inputButton;
				$('.customer').html(str);
				
				
			}else if(menuNum == '2'){
				var cus_num = $(".customerNum").val();
				var modal = document.getElementById('myModal2');
				var span = document.getElementsByClassName("close")[0];
				gameAjax.hospitalList(function(list) {
					console.log("dddddddd")
					var str = '';
					str += '상담 신청을 하실 병원을 선택해주세요.</br>';
					for(var i = 0, len = list.length||0; i < len; i++){
						console.log(list[i]);
						 str += '<a href="/customer/chatting?hos_num='+ list[i].hos_num + '">' + list[i].hos_name + '</a></br>';
						$(".modal-hospital").html(str); 
					}
					modal.style.display = "block";
				});

				modal.style.display = "none";
				span.onclick = function() {
		            modal.style.display = "none";
		        }
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


		
		$(document).on("click", ".menuSubmit2", function() {
			var menuNum = document.getElementById("menuNum2").value;
			$('#menuNum2').remove();
			$('.menuSubmit2').remove();
			if(menuNum == '1'){
				clear();
				typingTxt = '';
				var modal = document.getElementById('myModal');
				var span = document.getElementsByClassName("close")[0]; 
				
				modal.style.display = "block";
				
				
				  $(".submit").on("click",function(e){
					const form = $("form[name=symptomForm]").serializeObject();
					console.log("여기서는" + form);
					e.preventDefault();
					gameAjax.symptomInsert(form, function(result) {
						alert("증상 입력이 정상적으로 완료되었습니다.");
						var modal = document.getElementById('myModal');
						modal.style.display = "none";
						audio.pause();
						audio.src = "/resources/game/menuthree.mp3";
						audio.play();
						var selectSymptom = $(".symptom").val();
						var detailSymptom = $(".detailSymptom").val();
						resultSymptom = selectSymptom;
						console.log(selectSymptom);
						console.log(detailSymptom);
						typingTxt = '예상 증상과 고객님의 세부 증상은 다음과 같습니다.\n ';
						typingTxt += '1. 예상 증상 : ' + selectSymptom + '\n ';
						typingTxt += '2. 세부증상 : ' + detailSymptom + '\n';
						typingTxt += '예상 증상의 치료 방법을 보시겠습니까 ? ';
						
						typingBool = false;
						typingIdx = 0;
						$(".test").remove();
						if(typingBool==false){
							typingBool=true;
							tyInt = setInterval(typing2,60);
						}
						var str = '';
						
						var inputButton = '<button class = "closeRes" style="margin-top: 180px; margin-left: 670px;">예</button>';
						var inputButton2 = '<button class = "realcloseRes" style="margin-top: 180px; margin-left: 10px;">아니오</button>';
						str += inputButton;
						str += inputButton2;
						
						$(".customer").html(str);
						
					});
					
				});  
				
				// ajax 처리, 모달창 처리
					span.onclick = function() {
			            modal.style.display = "none";
			        }
				
			}else if(menuNum == '2'){
				location.href = "/customer/machine";
			}
			
			
		});
		
		
		
		
		
		
		$(document).on("click", ".onlineRes", function() {
			location.href = "/customer/hosSearch";
		});
		
		$(document).on("click", ".realcloseRes", function() {
			clear();
			typingBool = false;
			typingIdx = 0;
			selectOne();
			
		});
		
		
		/* 여기전까지 음성 인식*/
		$(document).on("click", ".closeRes", function() {
			audio.pause();
			$('onloineRes').remove();
			$('closeRes').remove();
			clear();
			
			var cus_num = $(".customerNum").val();
			
			
			gameAjax.symptomDetail(cus_num, function(data) {
				
				audio.src = "/resources/game/menufour.mp3";
				audio.play();
				/* 음성 파일 for문으로 돌려서 재생하기 */
				console.log(data.symptomexampledetail);
				typingTxt = "고객님의 예상 증상입니다. ";
				typingTxt += data.symptomexampledetail;
				typingTxt += " 증상에 대한 치료 방법은 ";
				typingTxt += data.symptomsolution;
				typingTxt += "이 정보는 고객님의 상황에 따라 다를 수도 있습니다. 정확한 치료와 판단을 위해 온라인으로 병원을 예약하시겠습니까?";
				typingBool = false;
				typingIdx = 0;
				
				if(typingBool==false){
					typingBool=true;
					
					tyInt = setInterval(typing2,50);
				}
				
				var str = '';
				var inputButton = '<button class = "onlineRes" style="margin-top: 210px; margin-left: 660px;">예</button>';
				str += inputButton;
				$(".customer").html(str);
			});
			
		});
		
		
		
		
		
		
		
		
		var gameAjax = (function() {
			
		 	function symptomInsert(form, callback, error) {
				console.log(form);
				$.ajax({
					type : 'POST',
					url : '/game/symptomInsert',
					data : JSON.stringify(form),
					beforeSend : function(xhr) {
				            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					contentType : "application/json; charset=utf-8",
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
		 	
		 	function symptomDetail(cus_num, callback, error) {
				$.get("/game/" + cus_num + ".json", function(result) {
					
					if(callback){
						callback(result);
					}
					
				}).fail(function(xhr, status, err) {
					if(error){
						error();
					}
				});
		 		
			};
			
			
			function notifyInsert(cus_num, callback, error) {
				$.get("/game/notifyInsert/" + cus_num + ".json",function(result){
					if(callback){
						callback(result);
					}
					
					
				}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});
			};
			
			function hospitalList(callback, error) {
				$.getJSON("/game/hospitalList", function(data) {
					if(callback){
						callback(data);
					}
				}).fail(function(xhr, status, err) {
					if(error){
						error();
					}
					
				})
			}
			
			return {
				symptomInsert : symptomInsert,
				symptomDetail : symptomDetail,
				notifyInsert : notifyInsert,
				hospitalList : hospitalList
				
			};
		})();
	});
	
	
	
	
</script>

<style type="text/css">
	p.typing-txt{display : none;}
	
	.typing{
		display: inline-block;
		animation-name : cursor;
		animation-duration:0.3s;
		animation-iteration-count:infinite;
	}
	
	.box_malpoong{
		position: relative;
	}
	
	.malpoong{
		position: absolute;
	    top: -50px;
	    right: 0;
	    left: 0;
	    width: 100%;
	    height: 690px;
	    background-repeat-y: no-repeat;
	    background-repeat-x: no-repeat;
	    background-position: center;
	    background-size: cover;
	/* 
		height : 700px;
		width : 1000px;
		background-size: 700px 650px; 
		 */
		background-image: url('/resources/game/ddocdoc2.jpg');
	}
	
	#footer{
	    position: absolute;
	    bottom: 0px;
	    width: 100%;
	}
	
	/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
        .modal2 {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        .modal-hospital {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
	
	
</style>

</head>
<body>
 <%@include file="../includes/menu.jsp" %>
<section class="company-description" >
 

<div class="box_malpoong">
	<div class="malpoong" style="position: absolute;">
		<div style="margin-left: 490px; margin-top: 150px; height:100px; width: 400px; overflow: auto;">
		<p class="typing-txt">어서오십시오. 간단하게 증상과 진료를 볼 수 있는 똑닥 온라인 진료 시스템입니다.</p>
		<p class="typing" style=" margin-left: 50px"></p>
		 </div>
		 <!--  <img src="mal.jpg"> -->
	</div>
		
	<div class="customer" style="position: absolute;/*  margin-top: 150px; margin-left: 600px; */">
	
	</div>

	
	<!-- 	<div class="backgroundHospital" style="position: absolute;"> -->
		 	<!-- <img src="/resources/game/doctor.png" style="width: 400px; height: 400px;"> -->
			
	<!-- 	</div> -->
		
</div>
</section>

 <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <form name="symptomForm" class = "symptomForm" method="post">
        	<input type="hidden" name = "cus_num" value="${customer.cus_num }" class = "customerNum">
        	<select name = "symptom" class = "symptom">
        		<option value="감기">감기</option>
        		<option value="몸살">몸살</option>
        		<option value="설사">설사</option>
      			
        		<option value="두통">두통</option>
        		<option value="붉은 반점">붉은 반점</option>
        		<option value="가려움증">가려움증</option>
        		<option value="두드러기">두드러기</option>
        		
        		<option value="구내염">구내염</option>
        		<option value="천식">천식</option>
        		<option value="어지럼증">어지럼증</option>
        		
        		<!--  -->
        		<option value="크론병">크론병</option>
        		<option value="수두">수두</option>
        		<option value="갑상선결절">갑상선결절</option>
        		<option value="볼거리">볼거리</option>
        		<option value="종기">종기</option>
        		<option value="피부암">피부암</option>
        		<option value="봉와직염">봉와직염</option>
        		<option value="혓바늘">혓바늘</option>
        		<option value="결절">결절</option>
        		<option value="습진">습진</option>
        		<option value="하지정맥류">하지정맥류</option>
        		<option value="아나필락시스">아나필락시스</option>
        		<option value="모공각화증">모공각화증</option>
        		<option value="홍반">홍반</option>
        		<option value="쯔쯔가무시">쯔쯔가무시</option>
        		<option value="사랑니">사랑니</option>
        		<option value="원형탈모증">원형탈모증</option>
        		<option value="어루러기">어루러기</option>
        		<option value="각막염">각막염</option>
        		
        		
        	</select>
        	<input type="text" name = "detailSymptom" class = "detailSymptom" placeholder = "세부증상을 입력해주세요.">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
         <button class="submit">증상입력</button> 
      </div>
 		
 		
 		
 		
    </div>

	<!-- Modal two -->
 		<div id = "myModal2" class="modal2">
 			 <span class="close">&times;</span> 
 			<div class="modal-hospital">
 			
 			
 			</div>
 		
 		</div>
 		
 		




	<%@include file="../includes/footer3.jsp" %>
 	</body>
</html>