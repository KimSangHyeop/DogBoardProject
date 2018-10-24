<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<mata name="viewport" content="width=device-width,initial-scale="1">
	<link rel="stylesheet" href="..\css\bootstrap.css">
	<title>펫시터 게시판</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<a class="navbar-brand" href="../index.jsp"><img class="logo"
			id="logo" src="../image/logo.png"></a>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="../index.jsp">메인</a> <!-- 메인으로 넘어간다 --></li>
				<li><a href="../about.jsp">우리에 대해</a> <!-- 어바웃으로 넘어간다 --></li>
				<li><a href="../board.do?command=search">게시판</a> <!-- 게시판으로 넘어간다 --></li>
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
				<li><a href="./custo.do?command=logout">로그아웃</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
	<!--전반적 구성보여줌 -->

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 40px">
				<form method="post" action="../custo.do?command=search">
					<!-- 로그인 액션으로 로그인 정보 보내기 -->
					<h3 style="text-align: center;">회원 수정</h3>
					<!-- 문장 가운데 정렬 -->
					<div class="form-group">
						<input type="text" class="form-control" readonly="readonly"
							name="userid" maxlength="20" value='<%=userid%>'>
						<!-- 아이디 길이 제한 -->
					</div>

					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="password" id="password" maxlength="20">
					</div>
					<input type="submit" class="btn btn primary form-control" value="확  인">
				</form>
			</div>

			<div class="col-lg-4"></div>

		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="../js/bootstrap.js"></script>
</body>
</html>