<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<mata name="viewport" content="width=device-width,initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<title>게시판 글 등록</title>
</head>
<body>
	<nav class="navbar navbar-default">


		<a class="navbar-brand" href="index.jsp"><img class="logo"
			id="logo" src="./image/logo.png"></a>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="./index.jsp">메인</a> <!-- 메인으로 넘어간다 --></li>
				<li><a href="./about.jsp">우리에 대해</a> <!-- 어바웃으로 넘어간다 --></li>
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
				<li><a href="./custo.do?command=logout">로그아웃</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
	<!--전반적 구성보여줌 -->
	<div class="container">
		<div class="row">
			<form method="post" action="board.do?command=update&num=${resultUpdate.num}"> <!-- 글을 등록하게 하는 기능으로 보내는 버튼 -->
				<table class="table table-striped"
					style="text-align: center; border: ipx solid #dddddd">
					<!-- 홀수와 짝수 구분하여 테이블 색상 변경 -->
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #dddddd; text-align: center;">게시판
								글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
					<jsp:useBean id="resultUpdate" class="board.Board" scope="request"/>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="title" maxlength="100" value="${resultUpdate.title}"></td>
							<td><input type="text" class="form-control" readonly="readonly"
							 value="<%=userid%>" name="write" id="write" maxlength="20">
								
							</td>
							</tr>
							<tr>
							<td colspan="2"><textarea class="form-control"
									placeholder="글 내용" name="content" maxlength="4000"
									style="height: 350px;">${resultUpdate.cont}</textarea>
							</tr>	
						 
					</tbody>
				</table>
				
				<input type="submit" class="btn btn-primary pull-right" value="수정">
				<!-- value= 함수값 -->
			</form>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="js/bootstrap.js"></script>
</body>
</html>