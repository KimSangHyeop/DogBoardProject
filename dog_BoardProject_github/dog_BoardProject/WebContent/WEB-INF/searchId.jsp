<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<mata name="viewport" content="width=device-width,initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <script
	src="https://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 --> <script>
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();
	});
</script>
<title>펫시터 게시판</title>
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
				<li class="dropdown">
					<!-- <a href="#" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expended="false">접속하기<span class="caret"></span></a> 아이콘생성 -->
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<!-- 한개의 홈페이지에만 들어갈수 있게 만듬 -->
						<li><a href="join.jsp">회원가입</a></li>
					</ul>

				</li>

			</ul>

		</div>
	</nav>
	<!--전반적 구성보여줌 -->

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 40px;">
				<form method="post" action="searchIdAction.jsp";>
					<!-- 로그인 액션으로 로그인 정보 보내기 -->
					<h3 style="text-align: center;">아이디 찾기</h3>
					<!-- 문장 가운데 정렬 -->
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="userName" maxlength="20">
						<!-- 길이 제한 -->
					</div>
					<div class="form-group">
						<input type="number" class="form-control" placeholder="나이"
							name="userAge" maxlength="20">
						<!-- 길이 제한 -->
					</div>

					<div class="form-group">
						<input type="text" class="form-control" placeholder="전화번호"
							name="userTel" maxlength="20">
						<!--  길이 제한 -->
					</div>

					<input type="submit" class="btn btn primary form-control"
						value="아이디 찾기">

				</form>
			</div>
		</div>
	</div>

	<div class="col-lg-4"></div>

	</div>

	<script type="js/bootstrap.js"></script>
</body>
</html>