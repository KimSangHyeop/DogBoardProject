<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<style type="text/css">
	#cen {
		align-items: center;
		margin-top: 10%;
		margin-left: 30%;
		margin-right: 30%;
	}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<mata name="viewport" content="width=device-width,initial-scale="1">
	<link rel="stylesheet" href=".\css\bootstrap.css">
	<title>�ʴ�� �����</title>
</head>
	<nav class="navbar navbar-default">


		<a class="navbar-brand" href="index.jsp"><img class="logo"
			id="logo" src="./image/logo.png"></a>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">����</a> <!-- �������� �Ѿ�� --></li>
				<li><a href="about.jsp">�츮�� ����</a> <!-- ��ٿ����� �Ѿ�� --></li>
				<li><a href="./board.do?command=search">�Խ���</a> <!-- �Խ������� �Ѿ�� --></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<jsp:useBean id="userid" class="java.lang.String" scope="session" />
				<%
					if (userid.isEmpty()) {
				%>
					<li><a href="./Customer/login.jsp">�α���</a></li>
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
							<ul><a class="dropdown-item" href="Customer/loginCheck.jsp">ȸ�� ����</a></ul>
							 <ul><a class="dropdown-item" href="custo.do?command=delete&userid=<%=userid%>">ȸ�� Ż��</a></ul>
						</div>
					</div>
				</li>
				<li><a href="./custo.do?command=logout">�α׾ƿ�</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
		<div id="cen" align="center">
			<h3>${msg}</h3><br>
			<a href="index.jsp" class="form-control">��������</a>
		</div>
	</body>
</html>