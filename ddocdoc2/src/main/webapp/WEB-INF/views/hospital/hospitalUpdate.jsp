<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../favicon.ico">
<title>똑닥-어드민모드</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">
	

	
<style type="text/css">
.bg-gradient-warning {
    background-color: #ffe208 !important;
    background-image: linear-gradient(180deg,#ffe000 10%,#ffe100 100%) !important;
    background-size: cover !important;
}


.sidebar-dark .nav-item.active .nav-link {
    color: #8c8c8c !important;
    <!--color: #5d5d5d !important;-->
}

.sidebar-dark .sidebar-brand {
    color: #8c8c8c !important;
}

.sidebar-dark .nav-item .nav-link {
	color: #5d5d5d !important;
}


.sidebar-dark .sidebar-heading {
    color: rgba(8, 8, 8, 0.4) !important;
}

.tobtnfromicon {
	width: 30%;
}

#contentBox1{
	margin-bottom: 30px; 
	margin-left:20px; 
	width:60%;
}

</style>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
   crossorigin="anonymous"></script>
	
</head>
<body id="page-top">
	
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <!--<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar"> -->
    <ul class="navbar-nav bg-gradient-warning sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/DDOCDOC/Customer/adminModeAction.do">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Admin Mode</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="/DDOCDOC/Customer/adminModeAction.do">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        	병원
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>병원관리</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">병원정보:</h6>
            <a class="collapse-item" href="/DDOCDOC/hospital/hospitalList.do?customer=${customer }">병원목록</a>
            <a class="collapse-item" href="/DDOCDOC/hospital/hospitalInsertForm.do">병원정보입력</a>
            <a class="collapse-item" href="/DDOCDOC/QRCode.jsp">QR CODE</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
			약국
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>약국관리</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">약국정보:</h6>
            <a class="collapse-item" href="/DDOCDOC/pharmacy/pharmacyList.do">약국목록</a>
            <a class="collapse-item" href="/DDOCDOC/pharmacy/pharmacyInsertForm.do">약국정보입력</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <span>
              <img src="/resources/images/logo.png" alt="logo">
          </span>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">
          

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
         
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              
            </li>


            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">똑닥 어드민</span>
                <img class="img-profile rounded-circle" src="/resources/img/smlogo.PNG" alt="smlogo">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <!--  
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                -->
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

       
		<!-- Content Row -->
          <div class="row" style="margin-left:30px;"s>
          	<h3>병원정보수정</h3>
          </div>
          
          <div class="row" style="margin-left:30px;">
	          <!-- DataTales Example -->
	          <div class="card shadow mb-4" style="width:60%;">
	            <div class="card-header py-3">
	              <h6 class="m-0 font-weight-bold text-primary">병원 수정</h6>
	            </div>
	            <div class="card-body">
	              <div class="table-responsive">
	              	<form action="/hospital/hospitalUpdate" method="post" class="form-group" enctype="multipart/form-data">
	              		<input type="hidden" value="${hos_num}" name="hos_num">
						<div class="form-group">
						    <label for="exampleSelect1">병원종류</label>
						    <select class="form-control" id="exampleSelect1"  name="hos_type">
					      		<option value="내과">내과</option>
								<option value="정형외과">정형외과</option>
								<option value="이빈인후과">이비인후과</option>
								<option value="치과">치과</option>
								<option value="피부과">피부과</option>
								<option value="안과">안과</option>
								<option value="소아과">소아과</option>
							</select>
						</div>
					    <div class="form-group">
					    	<label>병원이름</label>
					    	<input type="text" name="hos_name" class="form-control" placeholder="병원이름" value="${ hospitalvo.hos_name}">
					  	</div>
					  	<div class="form-group">
					    	<label>병원전화번호</label>
					    	<input type="text" name="hos_tel" class="form-control" placeholder="병원전화번호" value="${hospitalvo.hos_tel }">
					  	</div>
					  	<div class="form-group">
					    	<label>병원주소</label>
					    	<input type="text" name="hos_addr" class="form-control" placeholder="병원주소" value="${hospitalvo.hos_addr }">
					  	</div>
					  	<div class="form-group">
					    	<label>운영시간</label>
					    	<input type="text" name="hos_time" class="form-control" placeholder="운영시간" value="${hospitalvo.hos_time }">
					  	</div>
					  	<div class="form-group">
					    	<label for="exampleTextarea">병원정보사항</label>
						    <textarea class="form-control" rows="3" name="hos_info">${hospitalvo.hos_info}</textarea>
						</div>
						<div class="form-group">
					    	<label for="exampleTextarea">병원사진</label>
						    <input type="file" name="uploadfile" class="form-control" style="min-height:46px;">
						 	<div class="uploadResult">
						 		<ul>
						 		</ul>
						 	</div>
						 </div>
						<div style="display:flex;justify-content:center;">
							<input type="submit" value="저장" class="btn btn-primary" style="width:25%;">
						</div>
					</form>
				</div>
			  </div>
		   </div>
		</div>


<!--  
<form action="/DDOCDOC/hospital/hospitalUpdate.do" method="post">
	<input type="hidden" value="${hos_num}" name="hos_num">
	병원종류 <select name="hos_type">
		      <option value="내과">내과</option>
		      <option value="정형외과">정형외과</option>
		      <option value="이빈인후과">이비인후과</option>
		      <option value="치과">치과</option>
		      <option value="피부과">피부과</option>
		      <option value="안과">안과</option>
		      <option value="소아과">소아과</option>
	    </select><br>
	병원이름 <input type="text" name="hos_name"><br>
	병원전화번호 <input type="text" name="hos_tel"><br>
	병원주소 <input type="text" name="hos_addr"><br>
	운영시간 <input type="text" name="hos_time"><br>
	병원정보사항 <textarea rows="4" cols="10" name="hos_info"></textarea>


	<input type="submit" value="저장">
</form>
-->

	
	 <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; LEE MINHYE 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="/DDOCDOC/index.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
	

  <script>
  $(document).ready(function(e){
  
  
  
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880; //5MB

  function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  $("input[type='file']").change(function(e){
	  console.log("111");
	  var formData = new FormData();
	  
	  var inputFile = $("input[name='uploadFile']");
	  
//	  var files = inputFile[0].files;
var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#profileImg").attr("src", e.target.result);
        	$("#profileImg").css("height", "100px")
        }
        reader.readAsDataURL(f);
    });		
	  var file = files[0]
      console.log(file)
	  
	  formData.append("uploadFile", file);
	  console.log("222");
	  console.log(inputFile);
	  	
	  /* 
	  for(var i = 0; i < files.length; i++){

	    if(!checkExtension(files[i].name, files[i].size) ){
	      return false;
	    }
	    formData.append("uploadFile", files[i]);
	    
	  }
	  
 */	  
	  
	  $.ajax({
	    url: '/hospital/uploadAjaxAction',
	    processData: false,
	    contentType: false,
	    data:formData,
	    type: 'POST',
	    dataType:'json',
	      success: function(result){
	        console.log("-------------------!!");
	        console.log(result);
	        showUploadResult(result); //업로드 결과 처리 함수
	        alert("사진");

	    }
	  }); //$.ajax
	    console.log("33333333333");
	  
	});
  
  
  
	function showUploadResult(uploadResultArr){
	    
	    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
	    
	    var uploadUL = $(".uploadResult ul");
	    
	    var str ="";
	    
	    $(uploadResultArr).each(function(i, obj){
	   
	        
	        if(obj.image){
	            var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
	            str += "<li data-path='"+obj.uploadPath+"'";
	            str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
	            str +" ><div>";
	            str += "<span> "+ obj.fileName+"</span>";
	            str += "<button type='button' data-file=\'"+fileCallPath+"\' "
	            str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	            str += "<img src='/display?fileName="+fileCallPath+"'>";
	            str += "</div>";
	            str +"</li>";
	        }

	    });
	    
	    uploadUL.append(str);
	  }
  
  });
  </script>
  
  
  <!-- Bootstrap core JavaScript-->
  <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

  <!-- Core plugin JavaScript-->
  <script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value="/resources/js/sb-admin-2.min.js"/>"></script>

  <!-- Page level plugins -->
  <script src="<c:url value="/resources/vendor/chart.js/Chart.min.js"/>"></script>
  
  
  <!-- Page level custom scripts -->
  <script src="<c:url value="/resources/js/demo/chart-area-demo.js"/>"></script>
  <script src="<c:url value="/resources/js/demo/chart-pie-demo.js"/>"></script>
	
  
	

</body>
</html>