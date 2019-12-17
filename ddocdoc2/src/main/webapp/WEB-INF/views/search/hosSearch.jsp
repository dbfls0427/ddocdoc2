<%@page import="ddocdoc.vo.CustomerVO"%>
<%@page import="ddocdoc.loginSession.LoginSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cus_num = request.getParameter("cus_num");
	request.setAttribute("cus_num", cus_num);

%>    

<!DOCTYPE html>
<html>
<head>
    <!-- Basic Page Needs
        ================================================== -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="icon" href="favicon.ico">
        <title>똑딱</title>
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <!-- Mobile Specific Metas
        ================================================== -->
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        
        <!-- Template CSS Files
        ================================================== -->
        <!-- Twitter Bootstrs CSS -->
        <link rel="stylesheet" href="../plugins/bootstrap/bootstrap.min.css">
        <!-- Ionicons Fonts Css -->
        <link rel="stylesheet" href="../plugins/ionicons/ionicons.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="../plugins/animate-css/animate.css">
        <!-- Hero area slider css-->
        <link rel="stylesheet" href="../plugins/slider/slider.css">
        <!-- owl craousel css -->
        <link rel="stylesheet" href="../plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="../plugins/owl-carousel/owl.theme.css">
        <!-- Fancybox -->
        <link rel="stylesheet" href="../plugins/facncybox/jquery.fancybox.css">
        <!-- template main css file -->
        <link rel="stylesheet" href="../css/style.css">
        
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
</head>
<body>
 <!--
        ==================================================
       MENU: Header Section Start
        ================================================== -->
	<header id="top-bar" class="navbar-fixed-top animated-header">
		<div class="container">
			<div class="navbar-header">
				<!-- responsive nav button -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- /responsive nav button -->

				<!-- logo -->
				<div class="navbar-brand">
					<a href="success.do"> <img src="../images/logo.png" alt="">
					</a>
				</div>
				<!-- /logo -->
			</div>
			<!-- main menu -->
			<nav class="collapse navbar-collapse navbar-right" role="navigation">
				<div class="main-menu">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="success.do">Home</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">병원찾기 <span class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a href="map.do?cus_num=${customer.cus_num }">병원찾기</a></li>
									<li><a href="resList.do">예약내역</a></li>
								</ul>
							</div></li>
						<li><a href="/DDOCDOC/child.index.jsp?cus_name=${customer.cus_name }&cus_num=${customer.cus_num }">아이관리</a></li>
						<li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">QR코드 <span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="detailCustomer.do">QR코드 발급</a></li>
                                    </ul>
                                </div>
                            </li>
                        <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">후기<span class="caret"></span></a>
                                <div class="dropdown-menu">
                                    <ul>
                                        <li><a href="../Customer/reviewInsertForm.do">후기 작성</a></li>
                                        <li><a href="../Customer/reviewList.do">후기 목록</a></li>
                                    </ul>
                                </div>
                        </li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">${customer.cus_name } 님 <span
								class="caret"></span></a>
							<div class="dropdown-menu">
								<ul>
									<li><a href="myPageForm.do">마이페이지</a></li>
								</ul>
							</div></li>
						<li><a href="logout.do">로그아웃</a></li>
					</ul>
				</div>
			</nav>
			<!-- /main nav -->
		</div>
	</header>
            
     
        <!-- 
        ================================================== 
            TITLE: Global Page Section Start
        ================================================== -->
        <section class="global-page-header" style="padding: 100px 0 10px 0; background: #ffe307;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block">
                            <h2 style="font-size: 35px;">가까운 병원찾기</h2>
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
        
   <section class="company-description" style="margin-top: 50px;">
		<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		                <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <select name="keyword" id="keyword" onchange="changeSelect()">
			           		<option value="병원" selected="selected">내 주변 병원</option>
			           		<option value="소아청소년과">소아청소년과</option>
			           		<option value="이비인후과">이비인후과</option>
			           		<option value="산부인과">산부인과</option>
			           		<option value="내과">내과</option>
			           		<option value="피부과">피부과</option>
			           		<option value="정형외과">정형외과</option>
			           		<option value="치과">치과</option>
			           		<option value="안과">안과</option>
			           		<option value="응급실">응급실</option>
			           </select>
		                    <!-- 키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> -->
		                    <button type="submit">검색하기</button> 
		                </form>
		            </div>
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div>
   </section>             

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=505b2c52a62eb0c7e717c059e782deab&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	   
	   // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	   navigator.geolocation.getCurrentPosition(function(position) {
	       
	       var lat = position.coords.latitude; // 위도
	       var lon = position.coords.longitude; // 경도

	       geocoder.coord2RegionCode(lon, lat, callback);
	           
	     });
	   
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	   
	   var locPosition = new kakao.maps.LatLng(37.566826, 126.9786567);
	
	} 
	
	var geocoder = new daum.maps.services.Geocoder();
	
	//현재 주소 저장해주기
	var addr;
	
	//콜백함수
	var callback = function(result, status){
	    if(status === daum.maps.services.Status.OK){
	    	var select = document.getElementById("keyword");
	    	if(select.options[select.selectedIndex].value == '병원'){
		    	select.options[select.selectedIndex].value = result[0].address_name + " 병원";
		    	//addr 값 넣어주기
		    	addr = result[0].address_name;
	    	}else if(select.options[select.selectedIndex].value == '소아청소년과'){
	    		select.options[select.selectedIndex].value = result[0].address_name + " 소아청소년과";
	    	}else if(select.options[select.selectedIndex].value == '이비인후과'){
	    		select.options[select.selectedIndex].value = result[0].address_name + " 이비인후과";
	    	}else if(select.options[select.selectedIndex].value == '산부인과'){
	    		select.options[select.selectedIndex].value = result[0].address_name + " 산부인과";
	    	}
	    	searchPlaces();
	    	//alert("전체보기 value : "+select.options[select.selectedIndex].value);
	        //alert("지역명 : " + result[0].address_name);
	        
	    }
	};

	
function changeSelect(){
	
	var select = document.getElementById("keyword");
	if(select.options[select.selectedIndex].value == '병원'){
    	select.options[select.selectedIndex].value = addr + " 병원";
    	//addr 값 넣어주기
    	alert("change select에서 addr:" + addr);
	}else if(select.options[select.selectedIndex].value == '소아청소년과'){
		select.options[select.selectedIndex].value = addr + " 소아청소년과";
	}else if(select.options[select.selectedIndex].value == '이비인후과'){
		select.options[select.selectedIndex].value = addr + " 이비인후과";
	}else if(select.options[select.selectedIndex].value == '산부인과'){
		select.options[select.selectedIndex].value = addr + " 산부인과";
	}else if(select.options[select.selectedIndex].value == '내과'){
		select.options[select.selectedIndex].value = addr + " 내과";
	}else if(select.options[select.selectedIndex].value == '피부과'){
		select.options[select.selectedIndex].value = addr + " 피부과";
	}else if(select.options[select.selectedIndex].value == '정형외과'){
		select.options[select.selectedIndex].value = addr + " 정형외과";
	}else if(select.options[select.selectedIndex].value == '치과'){
		select.options[select.selectedIndex].value = addr + " 치과";
	}else if(select.options[select.selectedIndex].value == '안과'){
		select.options[select.selectedIndex].value = addr + " 안과";
	}else if(select.options[select.selectedIndex].value == '응급실'){
		select.options[select.selectedIndex].value = addr + " 응급실";
	}
	//alert("선택한 value : "+select.options[select.selectedIndex].value);
    //alert("지역명 : " + result[0].address_name);
	
}



// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	   
	   // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	   navigator.geolocation.getCurrentPosition(function(position) {
	       
	       var lat = position.coords.latitude; // 위도
	       var lon = position.coords.longitude; // 경도
			
	       var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", // 마커이미지의 주소입니다    
	       imageSize = new kakao.maps.Size(24, 35), // 마커이미지의 크기입니다
	       imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	         
		   // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		       markerPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다
	
		   // 마커를 생성합니다
		   var marker = new kakao.maps.Marker({
		       position: markerPosition, 
		       image: markerImage // 마커이미지 설정 
		   });
	
		   // 마커가 지도 위에 표시되도록 설정합니다
		   marker.setMap(map);
		   
		   
		   var iwContent = '<div style="padding-left:5px;">현재 위치</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(lat, lon); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
		    
	     });
	   
	};
	
	
	
	
	
    var keyword = document.getElementById('keyword').value;
    

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
		
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
            	var posit = marker.getPosition();
            	//marker.getPosition();
            	
                displayInfowindow(marker, title, posit);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                //infowindow.close();
            });

            itemEl.onmouseover =  function () {
            	var posit = marker.getPosition();
                displayInfowindow(marker, title, posit);
            };

            itemEl.onmouseout =  function () {
                //infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title, posit) {
	 var content = '<div style="padding:5px;">'+title+'<br><a href="../Customer/hos_resform.do?hos_name='+title+'&cus_num=${cus_num}" style="color:blue" target="_blank">접수하기</a> <a href="https://map.kakao.com/link/to/'+title+','+posit.getLat()+','+posit.getLng()+'" style="color:blue" target="_blank">길찾기</a></div>';
    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>

 <!--
            ==================================================
            Footer Section Start
            ================================================== -->
            <footer id="footer">
                <div class="container">
                    <div class="col-md-8">
                        <p class="copyright">Copyright: <span><script>document.write(new Date().getFullYear())</script></span> Design and Developed by <a href="mailto:amydreamsyou@gmail.com" target="_blank">Lee Min-hye</a>. <br> 
                            Get More 
                            <a href="https://themefisher.com/free-bootstrap-templates/" target="_blank">
                                Free Bootstrap Templates
                            </a>
                        </p>
                    </div>
                    <div class="col-md-4">
                        <!-- Social Media -->
                        <ul class="social">
                            <li>
                                <a href="http://wwww.fb.com/themefisher" class="Facebook">
                                    <i class="ion-social-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="http://wwww.twitter.com/themefisher" class="Twitter">
                                    <i class="ion-social-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="Linkedin">
                                    <i class="ion-social-linkedin"></i>
                                </a>
                            </li>
                            <li>
                                <a href="http://wwww.fb.com/themefisher" class="Google Plus">
                                    <i class="ion-social-googleplus"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </footer> <!-- /#footer -->

	<!-- Template Javascript Files
	================================================== -->
	<!-- jquery -->
	<script src="../plugins/jQurey/jquery.min.js"></script>
	<!-- Form Validation -->
    <script src="../plugins/form-validation/jquery.form.js"></script> 
    <script src="../plugins/form-validation/jquery.validate.min.js"></script>
	<!-- owl carouserl js -->
	<script src="../plugins/owl-carousel/owl.carousel.min.js"></script>
	<!-- bootstrap js -->
	<script src="../plugins/bootstrap/bootstrap.min.js"></script>
	<!-- wow js -->
	<script src="../plugins/wow-js/wow.min.js"></script>
	<!-- slider js -->
	<script src="../plugins/slider/slider.js"></script>
	<!-- Fancybox -->
	<script src="../plugins/facncybox/jquery.fancybox.js"></script>
	<!-- template main js -->
	<script src="../js/main.js"></script>
</body>
</html>