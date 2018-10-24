<%@page import="customer.Customer"%>
<%@page import="customer.CustomerDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="location.LocationDao"%>
<%@page import="location.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	LocationDao ld = new LocationDao();
	ArrayList<Location> larr = ld.search();
	
	CustomerDao cd = new CustomerDao();
	ArrayList<Customer> carr = cd.search();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<mata name="viewport" content="width=device-width,initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 90%;
	width: 45%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <script
	src="https://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> <!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->

<title>나 대신 펫시터</title>
</head>
<body>
	<nav class="navbar navbar-default">


		<a class="navbar-brand" href="index.jsp"><img class="logo"
			id="logo" src="./image/logo.png"></a>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a> <!-- 메인으로 넘어간다 --></li>
				<li><a href="about.jsp">우리에 대해</a> <!-- 어바웃으로 넘어간다 --></li>
				<li><a href="./board.do?command=search">게시판</a> <!-- 게시판으로 넘어간다 --></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<jsp:useBean id="userid" class="java.lang.String" scope="session" />
				<%
					if (userid.isEmpty()) {
				%>
					<li><a href="./Customer/login.jsp">로그인</a></li>
				<%
					} else {
				%>
				<li>
					<div class="dropdown">
						<button class="btn btn-outline-dark dropdown-toggle" type="button"
							data-toggle="dropdown">
							<li><a class="dropdown-item"><%=userid %></a></li>
						
						</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<ul><a class="dropdown-item" href="Customer/loginCheck.jsp">회원 수정</a></ul>
							 <ul><a class="dropdown-item" href="custo.do?command=delete&userid=<%=userid%>">회원 탈퇴</a></ul>
						</div>
					</div>
				</li>
				<li><a href="custo.do?command=logout">로그아웃</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
	<!--전반적 구성보여줌 -->
	<div class="container">
		<div class="row">
			<!-- 주소 적는 칸 -->
			<h2 style="text-align: center">원하는 펫시팅 위치를 검색하세요</h2>
			<div
				style="border: 1px solid white-space; padding: 2px; height: auto; min-height: 40px; overflow: auto;"></div>
			<div id="custom-search-input">
				<div class="input-group col-md-12">
					<input type="text" class="search-query form-control"
						placeholder="주소를 입력하세요" id="autocomplete" />

				</div>
			</div>
		</div>
	</div>
	<div
		style="border: 1px solid white-space; padding: 5px; height: auto; min-height: 40px; overflow: auto;"></div>
	<div class="col-lg-5" id="map"></div>
	<!-- 지도 -->
	<script>
		var map;
		var markers;
		var locations = [ // DB에 저장된 위도와 경도 표시
		<%
			for(int i=0; i<larr.size()-1; i++){
				Location l = larr.get(i);
				out.println("{");
				out.println("	lat : " + l.getLat() + ",");
				out.println("	lng : " + l.getLng());
				out.println("}");
				out.println(",");
			}
		%>
		<%
			Location l = larr.get(larr.size()-1);
			out.println("{");
			out.println("	lat : " + l.getLat() + ",");
			out.println("	lng : " + l.getLng());
			out.println("}");
		%>
		]
		function initMap() {

			var address = '';
			var markLocation = null;
			var infowindow = new google.maps.InfoWindow();

			map = new google.maps.Map(document.getElementById('map'), {
				center : markLocation,
				zoom : 7
			});
			markers = locations.map(function(location, i) {
				return new google.maps.Marker({
					position : location,
					map : map
				});
			});

			var input = document.getElementById('autocomplete');
			var autocomplete = new google.maps.places.Autocomplete(input);
			autocomplete.bindTo('bounds', map);
			
			 var marker = new google.maps.Marker({ // 마커 표시
				position: markLocation,
			    map: map,
			    anchorPoint: new google.maps.Point(0, -29)
			});
			
			/* google.maps.event.addListener(map, 'click', function(event){
				markLocation = event.latLng; // 클릭할 떄마다 위치 
			
				if(marker){
					
			  		marker.setPosition(markLocation);
				}
			});  */
			
			
			// 자동 주소완료 함수
			autocomplete.addListener('place_changed', function() { 
				infowindow.close();
				
				var place = autocomplete.getPlace();
				
				if (place.geometry.viewport) {
		            map.fitBounds(place.geometry.viewport);
		        } else {
		            map.setCenter(place.geometry.location);
		            map.setZoom(17);
		        }
				
				if (place.address_components) {
		            address = [
		              (place.address_components[0] && place.address_components[0].short_name || ''),
		              (place.address_components[1] && place.address_components[1].short_name || ''),
		              (place.address_components[2] && place.address_components[2].short_name || '')
		            ].join(' ');
		        }
				infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
		        infowindow.open(map, marker);
		        
				// If the place has a geometry, then present it on a map.
				if (place.geometry.viewport) {
					map.fitBounds(place.geometry.viewport);
				} else {
					map.setCenter(place.geometry.location);
					map.setZoom(12);
				}
				infowindow.open(map, marker);
			});

			// 클러스터링
			var markerCluster = new MarkerClusterer(
					map,
					markers,
					{
						imagePath : 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'
					});

			// 현재 GPS 위치
			function onSuccessGeolocation(position) {
				markLocation = new google.maps.LatLng(position.coords.latitude,
						position.coords.longitude);
				
				map.setCenter(markLocation); // 얻은 좌표를 지도의 중심으로 설정합니다.
				map.setZoom(12); // 지도의 줌 레벨을 변경합니다.
			}
			function onErrorGeolocation() {
				var center = map.getCenter();
				infowindow.open(map, center);
			}
			$(window).on("load",function() {
				if (navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
				} else {
					var center = map.getCenter();
						infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
						infowindow.open(map, center);
				}
			});
		}
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBY9YXRLZjv9rgobbXp8zyankNrVlEoK5I&callback=initMap"
		async defer></script>
	<script
		src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
		
	</script>
	<div class="section-preview">

		<div class="container">
			<div class="row">
				<%
					for(int i=0; i<carr.size(); i++){
				%>
				<div class="col-lg-3 col-sm-6 rounded float-left img-thumbnail">
					<div class="preview">
						<div class="image" align="center">
							<a href="#"><img src="./image/default.jpg"
								class="img-responsive" alt="Cerulean" width="90px" height="90px"></a>
						</div>
						<div class="options" align="center">
				<h6><% Customer c = carr.get(i); 
							out.println(c.getAddr());
						%></h6>
						<h4>ID : <%out.print(c.getUserid());%>  </h4>
						<h5><% out.println(c.getAge()); %> 세</h5>
						</div>
					</div>
				</div>
				<%} %>
				
			</div>
		</div>
	</div>
</body>
</html>