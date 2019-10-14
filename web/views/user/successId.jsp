<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<title> 아이디 찾기 성공 </title>
<style>
#register {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
#register #logo1{
	margin-left:150px;
	display:inline-block;
	float:left;
	text-align:center;
}
#register #logo2{
	display:inline-block;
	margin-top:15px;
	float:left;
}
.nowlogo {
	width: 100px;
	margin-left: auto;
	margin-right: auto;
}

body{
	background-color : #F8EFE6;
}

#findId{
	text-align : center;
	color : #FF8C19;
}

#successId{
	text-align : center;
}

#successBtn{
	cursor : pointer;
	background : rightgray;
	border-radius : 20px;
	font-size : 15px;
	padding : 15px 20px;
}
#successBtn:hover{
	box-shadow : 0 12px 16px 0 #FF8C19;
}
</style>
</head>
<body>
<div id="register">
	<div id="logo1">
	<img src="<%=request.getContextPath() %>/image/semiLogo.png" class=nowlogo></div>
	<div id="logo2">
	<font size=60 color=#FF8C19> <b>설문 NOW</b> </font></div>
</div> <br clear="both">
	<br>
	<br>
	<div id = findId>
		<h2> 아이디 찾기 </h2>
	</div>
	<div id = successId>
		<h4> 입력하신 정보로 등록된 아이디는 ___ 입니다. </h4>
		<input type = button onclick = "loginMain();" id = successBtn value = "로그인 하기">
		<input type = button onclick = "findPwd();" id = successBtn value = "패스워드 찾기">
	</div>
	
	<script type="text/javascript">
		function findPwd(){
			location='findPw.jsp';
		}
		function loginMain(){
			location='../common/loginmain.jsp';
		}
	</script>
</body>
</html>