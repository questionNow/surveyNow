<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%
   String msg = (String)request.getAttribute("msg");  // <- 다운캐스팅 필수 !! 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<title> 회원가입 성공 화면 </title>
<style>
body{
   background : url("<%=request.getContextPath()%>/image/suRegister.jpg") no-repeat;
   background-size : cover;
   
}
#success{
   color : black;
}

</style>
</head>
<body>
    <h1 align = center id = success> <%= msg %> </h1>
   <a href = "<%= request.getContextPath() %>/index.jsp" align = right>
   <h1> 설문하러가즈아 </h1> </a>
</body>
</html>