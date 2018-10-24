<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<mata name="viewport" content="width=device-width,initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<style>
body {
	background-image: url("./image/fishSide.jpg");
}

h1 {
	text-align: center;
}

p {
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <script
	src="https://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 --> <script>
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();
	});
</script>
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
	<div
		style="border: 1px solid white-space; padding: 10px; height: auto; min-height: 100px; overflow: auto;"></div>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>펫시팅 찾는 곳</h1>
				<div
					style="border: 1px solid white-space; padding: 3px; height: auto; min-height: 30px; overflow: auto;"></div>
				<P>이곳에서 펫시팅을 할 수 있습니다.</P>
				<div
					style="border: 1px solid white-space; padding: 3px; height: auto; min-height: 30px; overflow: auto;"></div>
				<div class=”btn-group” role=”group” aria-label=”…”>

					<div class="col-lg-2"></div>
					<div class="col-lg-6">
						<a class="btn btn-primary btn-pull"
							style="WIDTH: 100pt; HEIGHT: 40pt" href="findSitter.jsp"><h4>펫시터
								찾기</h4></a>
					</div>
					<div class="col-lg-4">
						<a class="btn btn-success btn-pull"
							style="WIDTH: 100pt; HEIGHT: 40pt" href="findLord.jsp"><h4>주인
								찾기</h4></a>
					</div>

				</div>

			</div>

		</div>


		<!-- <div class="container"></div>
	<div class="col-lg-4"></div> -->
		<script type="js/bootstrap.js"></script>
</body>
</html>