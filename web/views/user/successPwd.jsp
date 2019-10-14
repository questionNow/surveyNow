<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<title> 비밀번호 찾기 성공 </title>
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

.register {
	font-size : 2em;
	font-weight : bold;
	letter-spacing : 22px;
	text-align : center; 
}

#findPwd{
	text-align : center;
	color : #FF8C19;
}

#successPwd{
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
	<img src="<%=request.getContextPath() %>/images/semiLogo.png" class=nowlogo></div>
	<div id="logo2">
	<font size=60 color=#FF8C19> <b>설문 NOW</b> </font></div>
</div> <br clear="both">
	<br>
	<br>
	<div id = findPwd>
		<h2> 비밀번호 찾기 </h2>
	</div>
	<div id = successPwd>
		<h4> 비밀번호 재설정 하기  </h4>
	</div>
	<div id = changePwd>
	<form align = center>
		<table align = center>
			<tr>
				<td id = title align = center> 비밀번호 </td>
				<td><input type = password name = password1 maxlength=20 onchange = "pwSame();"></td>
				<td> 여기에는 뭘 넣을까 </td>
			</tr> <tr></tr><tr></tr><tr></tr>
			<tr>
				<td id = title align = center> 비밀번호 일치 </td>
				<td> <input type = password name = password2 maxlength = 20 onchange = "pwSame();"> </td>
				<td> 일치 불일치 </td>
			</tr>
		</table> <br>
		<button onclick = "changeBtn();" id = successBtn> 변경하기 </button>
		<button onclick = "login();" id = successBtn> 로그인 </button>
	</form>
	</div>
	
	<script type="text/javascript">
		function changeBtn(){
			alert("새로운 비밀번호로 로그인하세요");
		}
	</script>
</body>
</html>