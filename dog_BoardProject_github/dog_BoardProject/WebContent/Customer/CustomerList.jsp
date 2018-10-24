<%@page import="customer.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>유저 목록</h1>
<table>
<tr><th>번호</th><th> 이름</th><th> 아이디</th><th>패스워드</th></tr>
<%--
ArrayList<Customer> resultList = (ArrayList<Customer>)request.getAttribute("resultList");
--%>
<jsp:useBean id="resultList" class="java.util.ArrayList" scope="request"/>
<% 
for(Object ob : resultList){
		Customer cu = (Customer)ob;
		
%>
<tr><td><%=cu.getUserid()%></td>
<td><a href="cust.do?command=view%userid=<%=cu.getUserid()%>"<%=cu.getName()%>></a>
<td><a href="cust.do?command=delete%userid=<%=cu.getUserid()%>">삭제</a>

<%
   }
%>
</table>
<a href ="index.jsp">처음페이지로 이동</a><br>
<a href ="CustomerInput.html">회원정보 입력페이지 이동</a>
</body>
</html>