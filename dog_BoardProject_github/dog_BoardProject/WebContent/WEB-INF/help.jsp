<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
        height: 75%;
        width: 53%;
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


		<a class="navbar-brand" href="main.jsp"><img class="logo"
			id="logo" src="./image/logo.png"></a>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a> <!-- 메인으로 넘어간다 --></li>
				<li><a href="about.jsp">우리에 대해</a> <!-- 어바웃으로 넘어간다 --></li>
				<li><a href="list.jsp">게시판</a> <!-- 게시판으로 넘어간다 --></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="login.jsp">로그인</a> <!-- 메인으로 넘어간다 --></li>
			</ul>
			<ul class="dropdown-menu">
				<li class="active"><a href="login.jsp">로그인</a></li>
				<!-- 한개의 홈페이지에만 들어갈수 있게 만듬 -->
				<li><a href="join.jsp">회원가입</a></li>
			</ul>


		</div>
	</nav>
	<!--전반적 구성보여줌 -->
	<div class="container">
		<div class="row"> <!-- 주소 적는 칸 -->
			<h2 style= "text-align:center">원하는 펫시팅 위치를 검색하세요</h2>
			<div style="border: 1px solid white-space; padding: 2px; height: auto; min-height: 40px; overflow: auto;"></div><!-- 빈 공간 설정 -->
			<div id="custom-search-input">
				<div class="input-group col-md-12">
					<input type="text" class="search-query form-control"
						placeholder="주소를 입력하세요" id="autocomplete" /><!-- <span class="input-group-btn">
					<button class="btn btn-success" type="button">
							<span class=" glyphicon glyphicon-search"></span>
						</button> 
					</span> -->
				</div>
			</div>
		</div>
	</div>
	<div style="border: 5px solid white-space; padding:5px; height: auto; min-height: 40px; overflow: auto;"></div> <!-- 빈 공간 설정 -->

  </body>


</body>
</html>