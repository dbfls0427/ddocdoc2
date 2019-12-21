<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
		audio.src = "/resources/game/main.mp3";
		audio.play();
		
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
			audio.src = "/resources/game/result.mp3";
			audio.play();



			
			typingTxt = '� �޴��� �����Ͻðڽ��ϱ�?<br/>1.���� �˻� 2.�¶��� ����';
			typingBool = false;
			typingIdx = 0;
			
			if(typingBool==false){
				typingBool=true;
				
				tyInt = setInterval(typing2,100);
			}
			var inputText = '<input type="text" id="menuNum"/>';
			var inputButton = '<button class="menuSubmit">�Է�</button>';
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
				audio.src = "/resources/game/menu1.mp3";
				audio.play();
				typingTxt = '���� �˻��� �����ϼ̽��ϴ�. � �޴��� �����Ͻðڽ��ϱ�? \n 1. ���� �Է��ϱ� 2. �������� ���� �˻�';
				typingBool = false;
				typingIdx = 0;
				if(typingBool==false){
					typingBool=true;
					
					tyInt = setInterval(typing2,100);
				}
				var inputText = '<input type="text" id="menuNum2"/>';
				var inputButton = '<button class="menuSubmit2">�Է�</button>';
				var str = '';
				str += inputText;
				str += inputButton;
				$('.customer').html(str);
				
			}else if(menuNum == '2'){
				location.href="/customer/chatting";
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
					console.log("���⼭��" + form);
					e.preventDefault();
					gameAjax.symptomInsert(form, function(result) {
						alert("���� �Է��� ���������� �Ϸ�Ǿ����ϴ�.");
						var modal = document.getElementById('myModal');
						modal.style.display = "none";
						audio.pause();
						audio.src = "/resources/game/symptom.mp3";
						audio.play();
						var selectSymptom = $(".symptom").val();
						var detailSymptom = $(".detailSymptom").val();
						resultSymptom = selectSymptom;
						console.log(selectSymptom);
						console.log(detailSymptom);
						typingTxt = '����� ������ ���� ������ ������ �����ϴ�.\n ';
						typingTxt += '1. ���� : ' + selectSymptom + '\n ';
						typingTxt += '2. �������� : ' + detailSymptom + '\n';
						typingTxt += '���� �˻��� ���� ����� ġ�� ����� ���ðڽ��ϱ� ? ';
						
						typingBool = false;
						typingIdx = 0;
						$(".test").remove();
						if(typingBool==false){
							typingBool=true;
							tyInt = setInterval(typing2,60);
						}
						var str = '';
						
						var inputButton = '<button class = "closeRes" style="margin-top:50px;">��</button>';
						var inputButton2 = '<button class = "realcloseRes" style="margin-top:50px;">�ƴϿ�</button>';
						str += inputButton;
						str += inputButton2;
						
						$(".customer").html(str);
						
					});
					
				});  
				
				// ajax ó��, ���â ó��
				span.onclick = function() {
		            modal.style.display = "none";
		        }
				
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
		
		
		/* ���������� ���� �ν�*/
		$(document).on("click", ".closeRes", function() {
			audio.pause();
			$('onloineRes').remove();
			$('closeRes').remove();
			clear();
			
			var cus_num = $(".customerNum").val();
			
			
			gameAjax.symptomDetail(cus_num, function(data) {
				
				/* ���� ���� for������ ������ ����ϱ� */
				console.log(data.symptomexampledetail);
				typingTxt = "������ �����Դϴ�. ";
				typingTxt += data.symptomexampledetail;
				typingTxt += " ���� ���� ġ�� ����� ";
				typingTxt += data.symptomsolution;
				typingTxt += "�� ������ ������ ��Ȳ�� ���� �ٸ� ���� �ֽ��ϴ�. ��Ȯ�� ġ��� �Ǵ��� ���� �¶������� ������ �����Ͻðڽ��ϱ�?";
				typingBool = false;
				typingIdx = 0;
				
				if(typingBool==false){
					typingBool=true;
					
					tyInt = setInterval(typing2,50);
				}
				
				var str = '';
				var inputButton = '<button class = "onlineRes" style="margin-top:30px;">��</button>';
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
			
			return {
				symptomInsert : symptomInsert,
				symptomDetail : symptomDetail
				
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
	
	
	
	.malpoong{
		height : 400px;
		width : 400px;
		background-image: url('/resources/game/mal.jpg');
		background-size: 400px 400px;
		margin-top: 300px;
		
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
    
        /* Modal Content/Box */
        .modal-content {
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

<div>
<div class="malpoong" style="position: absolute;">
		<p class="typing-txt">����ʽÿ�. �����ϰ� ����� ���Ḧ �� �� �ִ� �ȴ� �¶��� ���� �ý����Դϴ�.</p>
		<p class="typing" style="margin-top: 150px; margin-left: 50px"></p>
		 <!--  <img src="mal.jpg"> -->
	</div>
	
<div class="customer" style="position: absolute; margin-top: 500px; margin-left: 100px">

</div>

<!-- 	<div class="backgroundHospital" style="position: absolute;"> -->
	 	<img src="/resources/game/hospital.jpg">
		
<!-- 	</div> -->
	
</div>

 <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <form name="symptomForm" class = "symptomForm" method="post">
        	<input type="hidden" name = "cus_num" value="${customer.cus_num }" class = "customerNum">
        	<select name = "symptom" class = "symptom">
        		<option value="����">����</option>
        		<option value="����">����</option>
        		<option value="����">����</option>
      			
        		<option value="����">����</option>
        		<option value="��������">��������</option>
        		<option value="��������">��������</option>
        		<option value="�ε巯��">�ε巯��</option>
        		
        		<option value="������">������</option>
        		<option value="õ��">õ��</option>
        		<option value="��������">��������</option>
        		
        	</select>
        	<input type="text" name = "detailSymptom" class = "detailSymptom" placeholder = "���������� �Է����ּ���.">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
         <button class="submit">�����Է�</button> 
      </div>
 
    </div>






</body>
</html>