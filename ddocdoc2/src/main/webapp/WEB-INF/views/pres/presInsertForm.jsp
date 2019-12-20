<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
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

.card-body {
   	height: 450px;
    overflow-y: auto;
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
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/customer/admin">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Admin Mode</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="/customer/admin">
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
            <a class="collapse-item" href='/hospital/hospitalList?customer=${customer }'>병원목록</a>
            <a class="collapse-item" href="/hospital/hospitalInsert">병원정보입력</a>
            <a class="collapse-item" href="/hospital/QRCode">QR CODE</a>
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
            <a class="collapse-item" href="/pharmacy/pharmacyList">약국목록</a>
            <a class="collapse-item" href="/pharmacy/pharmacyInsert">약국정보입력</a>
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
        
        <div id="wrapContent" style="padding:0 10px;">
        	<div style="padding: 15px 0 20px 50px;">
		        <!-- Content Row -->
				<div class="row">
					<h3>처방전 등록</h3>
				</div>
		          
				<div class="row">
					<!-- DataTales Example -->
					<div class="card shadow mb-4" style="width:30%;">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">약 리스트</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-sm">
									<thead>
										<tr>
											<th scope="col">#약번호</th>
											<th scope="col">약이름</th>
										</tr>
										</thead>
										<tbody>
											<c:forEach var="med" items="${medicinevo }">
											<tr>
												<td>${med.med_num }</td>
												<td>${med.med_name }</td>
											</tr>
											</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
		       		</div>
				</div> <!-- //row -->
        	
        	</div>
			<hr>
			


			<div style="padding-left:40px;">
				<h3 style="margin:30px 0 20px;">현재 처방전 약 등록 목록</h3>
				<c:forEach var="medicine" items="${list}" varStatus="status">
					<ul class="list-group list-group-flush" style="width:30%;">
						<li class="list-group-item">${medicine.med_num } &nbsp&nbsp ${medName[status.index] }</li>
					</ul>
					 <!-- 
					<table class="table table-bordered" style="width:30%;">
						<tr style="background-color:#fff;">
							<td scope="col">${medicine.med_num }</td>
							<td scope="col">${medName[status.index] }</td>
						</tr>
					</table>
						 -->
				</c:forEach>
				
				<form action="/hospital/medicineInsert" method="post">
					<input type = "hidden" name = "hos_res_num" value = "${hos_res_num }">
					<input type = "hidden" name = "pres_num" value = "${pres_num}">		      
					<div class="alert alert-warning" role="alert" style="width:34%;background-color: #fdf3d880;margin-top: 20px;">
					
						<table border="1">
							<thead>
								<tr>
									<th scope="col">#약 번호 입력</th>
									<th scope="col">약수량</th>
									<th scope="col">추가</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row"><input type="text" name="med_num" placeholder="약 번호를 입력해주세요" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"></th>
									<td><input type="text" name="med_count" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"></td>
									<td><input type="submit" value="약 추가" class="btn btn-warning btn-sm"></td>
								</tr>
							</tbody>
						</table>
					</div><!-- // alert alert-warning -->
					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				</form> 
			</div>
		</div><!-- //wrapContent -->
		


<!-- 


<h1>약이름</h1>
<c:forEach var="med" items="${medicinevo }">
<span>${med.med_num }</span>&nbsp &nbsp<span>${med.med_name }</span><br>
</c:forEach>

<hr>
<h1>현재 처방전 약 등록 목록</h1>
<c:forEach var="medicine" items="${list}" varStatus="status">
	<span>${medicine.med_num } &nbsp ${medName[status.index] }</span><br>
</c:forEach>

<br>
<form action="/DDOCDOC/hospital/medInsert.do" method="post">
	${hos_res_num }
	<input type = "hidden" name = "hos_res_num" value = "${hos_res_num }">
	<input type = "hidden" name = "pres_num" value = "${pres_num}">
	
	<table border="1">
		<tr>
			<td>약 번호 입력</td>
			<td>약수량</td>
			<td>추가</td>
		</tr>
		<tr>
			<td><input type="text" name="med_num" placeholder="약 번호를 입력해주세요"></td>
			<td><input type="text" name="med_count"></td>
			<td><input type="submit" value="약 추가"></td>
		</tr>
	</table>
	
</form>
<br><br>
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
          <a class="btn btn-primary" href="/customer/index">Logout</a>
        </div>
      </div>
    </div>
  </div>
	

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