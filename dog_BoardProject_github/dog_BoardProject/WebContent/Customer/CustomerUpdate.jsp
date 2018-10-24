<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<mata name="viewport" content="width=device-width,initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <script
	src="https://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 --> <script>
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();
	});
</script>
<title>펫시터 회원수정</title>
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
				<li><a href="./custo.do?command=logout">로그아웃</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
	<!--전반적 구성보여줌 -->

	<div class="container" align="center">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 30px;">
				<jsp:useBean id="Info" class="customer.Customer" scope="request"></jsp:useBean>
				<form method="post" action="./custo.do?command=update">
					<!-- 로그인 액션으로 로그인 정보 보내기 -->
					<h3 style="text-align: center;">회 원 정 보 수 정</h3>
					<p>
						<!-- 문장 가운데 정렬 -->
					<div class="form-group">
						<input type="text" class="form-control" readonly="readonly"
							value="${Info.getName()}" name="name" maxlength="100">
						<!-- 길이 제한 -->
					</div>
					<div class="form-group">
						<input type="text" class="form-control" readonly="readonly"
							value="${Info.getAge()}" name="age" maxlength="3">
						<!-- 길이 제한 -->
					</div>
					<div class="form-group">
						<input type="text" class="form-control" readonly="readonly"
							value="${Info.getUserid()}" name="userid" maxlength="20">
						<!-- 아이디 길이 제한 -->
					</div>

					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="비밀번호" name="password" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control"
							value="${Info.getTelNum()}" placeholder="핸드폰 번호 ' - ' 를 빼고 입력"
							name="telNum" maxlength="20">
						<!--  길이 제한 -->
					</div>

					<input type="text" name="addr"
						class="postcodify_address form-control"
						value="${Info.getAddr()}" readonly="readonly" />

					<button type="button" id="postcodify_search_button"
						class="form-control">주 소 검 색</button>

					<br> <input type="text" name="detailAddr"
						class="postcodify_details form-control" placeholder="상세 주소입력"
						value="${Info.getDetailAddr()}"/><br>
					<div class="form-group">
						<textarea name="content" rows="5px" cols="30px"
							placeholder="자기소개를 입력하세요.">${Info.getContent()}</textarea>
					</div>

					<input type="submit" class="btn btn primary form-control"
						value="회 원 수 정">

				</form>
				<%
				if(Info.getPassword().isEmpty()){
				%>
				<script type="text/javascript">
					window.alert("비밀번호를 입력해주세요.");
				</script>
				<%} else if(Info.getTelNum().isEmpty()) {%>
				<script type="text/javascript">
					window.alert("전화번호를 입력해주세요.");
				</script>
				<%} else if(Info.getDetailAddr().isEmpty()){%>
				<script type="text/javascript">
					window.alert("상세주소를 입력해주세요.");
				</script>
				<%} else if(Info.getContent().isEmpty()){ %>
				<script type="text/javascript">
					window.alert("자기소개를 입력해주세요.");
				</script>
				<%} %>
			</div>

			<div class="col-lg-4"></div>

		</div>
	</div>

	<script type="../js/bootstrap.js"></script>
</body>
</html>