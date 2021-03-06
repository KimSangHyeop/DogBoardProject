<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<mata name="viewport" content="width=device-width,initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<style> 
    body { background-color: #F7FFF5;}
	
	
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> <script
	src="https://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- "検索" Buttonを押す時、PopUpLayerが開かれる設定する --> <script>
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
	<div class="row">
	<div class="col-lg-5"></div>
       <div class="col-lg-2"> 
           
       <img src="./image/petLogo.png" alt="sitelogo" width="200" height="200" class="img-thumbnail"/>

       </div>
       <div class="col-lg-5"></div>
	</div>
       <div class="row">
		    <div class="col-lg-4"> 
		     	<div>
				    <a href="dogSide.jsp">  
				    <img src="./image/mainDog.jpg" alt="dogMain" width="480" height="350" class="rounded float-left img-thumbnail"/>
				    </a>   
		     	</div>
		     	<div style="height: 100px"></div>
		     	<div>
				    <a href="fishSide.jsp">  
				    <img src="./image/mainFish.jpg" alt="dogMain" width="480" height="350" class="rounded float-left img-thumbnail"/>
				    </a> 
		     	</div>
		    </div>
       		 <div class="col-lg-4" style="vertical-align: middle; margin-top: 50px"> 
			    <a href="#how">  
			    <img src="./image/how.jpg" alt="dogMain" class="rounded float-left img-thumbnail"/>
			    </a>   
		    </div>  
		   <div class="col-lg-4"> 
		     	<div>
				    <a href="catSide.jsp">  
				    <img src="./image/mainCat.jpg" alt="catMain" width="480" height="350" class="rounded float-left img-thumbnail"/>
				    </a>  
		     	</div>
		     	<div style="height: 100px"></div>
		     	<div>
				    <a href="mouseSide.jsp">  
				    <img src="./image/mainMouse.jpg" alt="dogMain" width="480" height="350" class="rounded float-left img-thumbnail"/>
				    </a>   
		     	</div>
		    </div>
       </div>				
	</div>
	<div style="border: 1px solid white-space; padding: 10px; height: auto; min-height: 100px; overflow: auto;"></div>
	
    <div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1 id="how">사이트 사용법</h1>
				<P>내용 후에 추가</P>
				<p>
					<a class="btn btn-primary btn-pull" href="#me">위로</a>
				</p>
			</div>
		</div>
	</div>
    
  
	<script type="js/bootstrap.js"></script>
</body>
</html>