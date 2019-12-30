<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%@include file="../includes/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
                            <h2>커뮤니티</h2>
                            <ol class="breadcrumb">
                                <li>
                                    <a href="/index/index">
                                        <i class="ion-ios-home"></i>
                                        Home
                                    </a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
         <section class="company-description" id="wrapjoin" style="display: flex; justify-content: center;">
         <div id="joinformdiv">
         
         <form action="/customer/comUpdate" method="post" role='form'>
	        		<div class="form-group">
						<label>글번호</label>
						<input type="text" name="com_num" value = "${com.com_num }"  class="form-control input-lg" readonly><br>
					</div>
					<div class="form-group">
						<label>제목</label>
						<input type="text" name="com_title" value = "${com.com_title }" class="form-control input-lg"><br>
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input type="text" name="com_writer" value = "${com.com_writer }" class="form-control input-lg" readonly><br>
					</div>
					<div class="form-group">
						<label>내용</label>
						<input type="text" name="com_content" value = "${com.com_content }" class="form-control input-lg"><br>
					</div>
					<hr>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" name="pageNum" value='${cri.pageNum }'>
					<input type="hidden" name="amount" value='${cri.amount }'>
					<div class="wrapbtnform" style="display: flex; justify-content: center;">
						<input type = "submit" class="btn btn-warning" value = "수정"> &nbsp&nbsp
						<button onclick="location.href='/customer/comList'" class="btn btn-warning">글 목록</button>
					</div>
				</form>
         
         
         
         </div>
         </section>
        
	
	<%@include file="../includes/footer.jsp" %>
</body>

<script type="text/javascript">
/* 	$(document).ready(function() {
		var formObj = $("form");
		
		$('button')
		
		
	}); */

</script>
</html>