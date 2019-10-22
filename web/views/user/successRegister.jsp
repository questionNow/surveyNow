<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
   background-size : 2000px 950px;
   
}
#successJoin{
   color : White;
   font-size : 2.5em;
   font-family: 맑은 고딕;
   padding-left: 130px;
   color : #F95401;
}
#successJoin:hover{
	cursor:pointer;
	color : white;
}
#success{
	padding-left : 450px;
	padding-top : 350px;
}
</style>
</head>
<body>
    <h1 align = center id = success> </h1> 
    <label id = successJoin onclick = "location.href='/surveyNow/views/common/loginPage.jsp'"> 설문하러가즈아 </label>
</body>
</html>