<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%@include file="../includes/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
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
         		<form action="/customer/comInsert" method="post" role='form'>
			<input type="hidden" name="cus_num" value="${customer.cus_num }"/>
					<div class="form-group">
						<label>제목</label>
						<input type="text" name="com_title" value = "${com.com_title }" class="form-control input-lg"><br>
					</div>
					<div class="form-group">
						<label>작성자</label>
						<input type="text" name="com_writer" value = "${customer.cus_name }" class="form-control input-lg" readonly><br>
					</div>
					<div class="form-group">
						<label>내용</label><br>
						<textarea rows="6" cols="75" name="com_content"></textarea><br>
					</div>
					<hr>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" name="pageNum" value='${cri.pageNum }'>
					<input type="hidden" name="amount" value='${cri.amount }'>
					<div class="wrapbtnform" style="display: flex; justify-content: center;">
						<input type = "submit" class="btn btn-warning" value = "작성"> &nbsp&nbsp
						<button onclick="location.href='/customer/comList'" class="btn btn-warning">글 목록</button>
					</div>
				</form>
         
         
         </div>
         </section>


	<%-- <form action="/customer/comInsert" method="post">
		<input type="hidden" name="cus_num" value="${customer.cus_num }"/>
		<input type="text" name="com_title"><br>
		<input type="text" name="com_writer" value="${customer.cus_name }" readonly/><br>
		<textarea rows="6" cols="70" name="com_content"></textarea><br>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="작성"/>

	
	</form> --%>



</body>
</html>