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
   background : url("<%=request.getContextPath()%>/image/successJoin.jpg") no-repeat;
   background-size : 1550px 750px;
   
}
#successJoin{
   color : White;
   font-size : 2.5em;
   padding-left: 130px;
   color : #F95401;
}
#successJoin:hover{
	cursor:pointer;
	color : white;
}

</style>
</head>
<body>
    <h1 align = center id = success> <%= msg %> </h1> <br><br><br><br><br><br><br><br><br><br>
    <div id = successJoin onclick = "location.href='/surveyNow/views/common/loginPage.jsp'"> 설문하러가즈아 </div>
</body>
</html>