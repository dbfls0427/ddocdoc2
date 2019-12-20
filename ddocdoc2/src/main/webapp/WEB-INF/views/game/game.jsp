<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/resources/js/game.js"></script>
<script type="text/javascript">
	
		
		
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



			
			typingTxt = '� �޴��� �����Ͻðڽ��ϱ�?\n1.���� �˻� 2.�¶��� ����';
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
			
		}
		
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
				
			}
			
		});
		
		$(document).on("click", ".menuSubmit2", function() {
			var menuNum = document.getElementById("menuNum2").value;
			$('#menuNum2').remove();
			$('.menuSubmit2').remove();
			if(menuNum == '1'){
				clear();
				typingTxt = '';
				var modal = document.getElementById('myModal');
				var span = document.getElementsByClassName("close")[0]; 
				var form = $(".symptom").seri
				modal.style.display = "block";
				
				// ajax ó��, ���â ó��
				span.onclick = function() {
		            modal.style.display = "none";
		        }
				
			}
			
			var str = "<button class = 'test'>����</button>";
			$(".customer").html(str);
			
		});
		
		
		/* ���� ajaxó���� ���â ó�� �� �ӽ� �̺�Ʈ */
		
		$(document).on("click", ".test", function() {
			audio.pause();
			audio.src = "/resources/game/symptom.mp3";
			audio.play();
			typingTxt = '���� ����� ������ ���� ������ ooo���� ���Խ��ϴ�. ���� ���� ����� ������ �� ��Ȯ���� �ʴ� ������ ���� �ֽ��ϴ�. �� �� ��Ȯ�� ������ ���� �¶������� ������ �����Ͻðڽ��ϱ�?';
			typingBool = false;
			typingIdx = 0;
			$(".test").remove();
			if(typingBool==false){
				typingBool=true;
				
				tyInt = setInterval(typing2,100);
			}
			var str = '';
			var inputButton = '<button class = "onlineRes" style="margin-top:30px;">��</button>';
			var inputButton2 = '<button class = "closeRes" style="margin-top:30px;">�ƴϿ�</button>';
			str += inputButton;
			str += inputButton2;
			
			$(".customer").html(str);
			
		});
		
		
		/* ���������� ���� �ν�*/
		$(document).on("click", ".closeRes", function() {
			audio.pause();
			$('onloineRes').remove();
			$('closeRes').remove();
			clear();
			typingTxt = "���� ������ ���� ���� ����Դϴ�. ������ ������ �����̸� �̷��̷��� ������ ��Ÿ���� ��ʴϴ�. ���� �����ϰ� �Ͻð� � � ���� ó���������.";
			typingBool = false;
			typingIdx = 0;
			
			if(typingBool==false){
				typingBool=true;
				
				tyInt = setInterval(typing2,100);
			}
			
			
		});
		
		
		/* �¶��� ���� ó�� */
		$(document).on("click", ".onlineRes", function() {
			
		});
		
		
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
        <form action="" class = "symptom">
        	<select name = "����">
        		<option value="����">����</option>
        		<option value="����">����</option>
        		<option value="����">����</option>
        	</select>
        	<input type="text" name = "detailSymptom" placeholder = "���������� �Է����ּ���.">
        	<input type="submit" value="���� �Է�">
        </form>
      </div>
 
    </div>






</body>
</html>