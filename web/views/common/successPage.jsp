<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String MyMain = (String)request.getAttribute("MyMain");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center"><%= MyMain %></h1>
	<a href="<%=request.getContextPath() %>/index.jsp" align="center" ><h1>메인으로 돌아가기</h1></a>
</body>
</html>