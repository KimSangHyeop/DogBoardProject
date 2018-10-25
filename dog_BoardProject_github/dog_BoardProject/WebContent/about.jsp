<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<mata name="viewport" content="width=device-width,initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
h1 {
	text-align: center;
}
</style>
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
		<div class="jumbotron">
			<div class="container">
				<h1 id="me">나 대신 펫시터란?</h1>
				<div
					style="border: 1px solid white-space; padding: 2px; height: auto; min-height: 30px; overflow: auto;"></div>
				<P>반려동물을 사랑하는 사람들의 모임입니다.</P>
				<div
					style="border: 1px solid white-space; padding: 2px; height: auto; min-height: 30px; overflow: auto;"></div>

				<div class=”btn-group” role=”group” aria-label=”…”>

					<a class="btn btn-primary btn-pull" href="#what">펫 시터란</a> <a
						class="btn btn-success btn-pull" href="#work">우리가 하는 일</a> <a
						class="btn btn-info btn-pull" href="#vision">우리가 꿈꾸는 세계</a>

				</div>

			</div>

		</div>
		<div class="jumbotron">
			<div class="container">
				<h1 id="what">펫시터란</h1>
				<div
					style="border: 1px solid white-space; padding: 2px; height: auto; min-height: 30px; overflow: auto;"></div>
				<P>내용 후에 추가</P>
				<div
					style="border: 1px solid white-space; padding: 2px; height: auto; min-height: 30px; overflow: auto;"></div>
				<p>
					<a class="btn btn-primary btn-pull" href="#me">위로</a>
				</p>

			</div>

		</div>

		<div class="jumbotron">
			<div class="container">
				<h1 id="work">우리가 하는 일</h1>
				<div
					style="border: 1px solid white-space; padding: 2px; height: auto; min-height: 30px; overflow: auto;"></div>
				<P>내용 후에 추가</P>
				<div
					style="border: 1px solid white-space; padding: 2px; height: auto; min-height: 30px; overflow: auto;"></div>
				<p>
					<a class="btn btn-primary btn-pull" href="#me">위로</a>
				</p>

			</div>

		</div>

	</div>


	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel"><!-- アルバムを作る -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<!-- 同じIDを持ちなければならない -->

			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="./image/about1.png" style="height: 760px">
				</div>
				<div class="item">
					<img src="./image/about2.png" style="height: 760px">
				</div>
				<div class="item">
					<img src="./image/about3.png" style="height: 760px">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left"></span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<div
		style="border: 1px solid white-space; padding: 10px; height: auto; min-height: 30px; overflow: auto;"></div>

	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1 id="vision">우리가 꿈꾸는 세계</h1>
				<div
					style="border: 1px solid white-space; padding: 2px; height: auto; min-height: 30px; overflow: auto;"></div>
				<P>내용 후에 추가</P>
				<div
					style="border: 1px solid white-space; padding: 2px; height: auto; min-height: 30px; overflow: auto;"></div>
				<p>
					<a class="btn btn-primary btn-pull" href="#me">위로</a>
				</p>

			</div>

		</div>
	</div>


</body>
</html>
