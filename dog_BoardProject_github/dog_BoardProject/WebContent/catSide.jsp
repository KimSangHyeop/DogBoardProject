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
	background-image: url("./image/mainPage.png");
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
<!-- "検索" Buttonを押す時PopUｐLayerが開かせる設定する--> <script>
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();
	});
</script>
<title>나 대신 펫시터</title>
</head>
<body>
	<nav class="navbar navbar-default">


		<a class="navbar-brand" href="index.jsp"><img class="logo"
			id="logo" src="./image/logo.png"></a>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a> <!-- MainPageに移動する--></li>
				<li><a href="about.jsp">우리에 대해</a> <!-- AboutPageに移動する --></li>
				<li><a href="./board.do?command=search">게시판</a> <!-- 掲示板Pageに移動する --></li>
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
	<!--全版的構成をみせる -->



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
