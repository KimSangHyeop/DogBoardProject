<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="js/bootstrap.js"></script>
<style>
body {
	
}

h1 {
	text-align: center;
}

h3 {
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div
		style="border: 1px solid white-space; padding: 10px; height: auto; min-height: 50px; overflow: auto;"></div>
	<div class="jumbotron">
		<div class="container">
			<h1>결과 페이지</h1>
			<div
				style="border: 1px solid white-space; padding: 10px; height: auto; min-height: 30px; overflow: auto;"></div>
			<h3>--${msg}--</h3>
			<p>
			<div
				style="border: 1px solid white-space; padding: 10px; height: auto; min-height: 30px; overflow: auto;"></div>
			<div class="container">
				<div class="col-lg-3"></div>
				<div class="col-lg-3">
					<a class="btn btn-primary btn-pull"
						style="width: 120px; height: 50px;" href="index.jsp"><h4>메인으로</h4></a>
				</div>
				<div class="col-lg-1"></div>
				<!-- <input type="button" value="메 인 으 로" onclick="location.href='index.jsp'"><p> -->
				<div class="col-lg-5">
					<a class="btn btn-info btn-pull"
						style="width: 120px; height: 50px;" href="board.do?command=search"><h4>게시판
							목록</h4></a>
					<!-- <input type="button" value="게시판목록" onclick="location.href='board.do?command=search'"> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>