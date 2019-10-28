<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "user.model.vo.UserInfo"
%>
<%
	UserInfo userInfo = (UserInfo)request.getAttribute("UserInfo");

	String userId = userInfo.getUserId();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<title> 아이디 찾기 성공 </title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url(//fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
@import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css);
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
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
	font-family: 'Jeju Hallasan', cursive;
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
	font-family: 'Hanna', sans-serif;
	letter-spacing: 10px;
	font-size : 1.4em;
}

#successId{
	text-align : center;
	font-family: 'Nanum Gothic Coding', monospace;
    font-size : 1.3em;
}

#successBtn{
	cursor : pointer;
	padding : 15px 20px;
	background : #F1CFBE;
    border-radius : 15px;
    font-size : 18px;
}
#successBtn:hover{
	box-shadow : 10px 10px 10px 0 #FACF61;
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
		<h4> 입력하신 정보로 등록된 아이디는    [ <%=userId %> ]   입니다. </h4> 
		<input type = button onclick = "loginMain();" id = successBtn value = "로그인 하기">
		<input type = button onclick = "findPwd();" id = successBtn value = "패스워드 찾기">
	</div>
	
	<script type="text/javascript">
		function findPwd(){
			location.href = '/surveyNow/views/user/findPw.jsp';
		}
		function loginMain(){
			location.href = '/surveyNow/views/common/loginPage.jsp';
		}
	</script>
</body>
</html>