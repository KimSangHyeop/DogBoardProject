<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<mata name="viewport" content="width=device-width,initial-scale="1">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <script
		src="https://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 --> <script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
	<title>펫시터 회원가입</title>
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

	<div class="container" align="center">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 30px;">
				<form method="post" action="../custo.do?command=save">
					<!-- 로그인 액션으로 로그인 정보 보내기 -->
					<h3 style="text-align: center;">회 원 가 입</h3>
					<p>
						<!-- 문장 가운데 정렬 -->
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름"
							name="name" maxlength="100">
						<!-- 길이 제한 -->
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="나이"
							name="age" maxlength="3">
						<!-- 길이 제한 -->
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userid" maxlength="20">
						<!-- 아이디 길이 제한 -->
					</div>

					<div class="form-group">
						<input type="password" class="form-control"
							placeholder="비밀번호 (8자 이상 작성하세요)" name="password"
							maxlength="20">
						<!-- 비밀번호 길이 제한 -->
					</div>
					<div class="form-group">
						<input type="text" class="form-control"
							placeholder="핸드폰 번호 ' - ' 를 빼고 입력" name="telNum" maxlength="11">
						<!--  길이 제한 -->
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="dropdown">

							<select id="gender" name="gender" title="성별"
								class="sel form-control">
								<option value="" selected="selected">성별</option>
								<option value="0">남자</option>
								<option value="1">여자</option>
							</select>
						</div>
					</div>
					<input type="text" class="form-control postcodify_postcode5" placeholder="우편번호"
						disabled="disabled" /> 
					
					<input type="text" name="addr"
						class="postcodify_address form-control"
						placeholder="'주소검색' 을 눌러 입력" readonly="readonly"/>
					
					<button type="button" id="postcodify_search_button"
						class="form-control">주 소 검 색</button>
					
					<br> <input type="text" name="detailAddr"
						class="postcodify_details form-control" placeholder="상세 주소입력"
						value="" /><br>
					<div class="form-group">
						<textarea name="content" rows="5px" cols="30px" placeholder="자기소개를 입력하세요."></textarea>
					</div>

					<input type="submit" class="btn btn primary form-control" value="회 원 가 입">

				</form>


			</div>

			<div class="col-lg-4"></div>

		</div>
	</div>

	<script type="../js/bootstrap.js"></script>
</body>
</html>