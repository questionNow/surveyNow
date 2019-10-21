<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>  <%--  import = "user.model.vo.UserInfo" --%> 
<%-- <% 
	UserInfo userInfo = (UserInfo)request.getAttribute("UserInfo");
	String userPwd = userInfo.getUserPwd();
	String userId = userInfo.getUserId();
%> --%>
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

#successPwd{
	text-align : center;
	color : #FF8C19;
}
#changePwd{
	padding : 19px 510px;
}
input[type = password]{
   width : 460px;
   display : inline-block;
   border : 1px solid #ccc;
   border-radius : 10px;
   box-sizing : border-box;
   padding : 12px 20px;
}
#successBtn{
	width : 225px;
	cursor : pointer;
	background : rightgray;
	border-radius : 20px;
	font-size : 16px;
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
</div> <br clear="both"><br>
	
	<div id = successPwd>
		<h2> 비밀번호 재설정하기  </h2>
	</div>
	
	<form onsubmit = "return checkPwd();" id = changePwdForm action = "<%=request.getContextPath()%>/changePwd.cp" method = post>
	<div id = changePwd>
		<div class = pwd>
			<label> 비밀번호 </label> <br>
			<input type = hidden id = userId name = userId ><%-- value = "<%=userId %>" --%>
			<input type = password id = pw1 name = userPwd placeholder = "비밀번호를 입력하세요" maxlength = 20 required>
			<br><br>
			<label> 비밀번호 확인 </label> <br>
			<input type = password id = pw2 name = userPwd1 placeholder = "비밀번호를 일치시켜주세요" maxlength = 20>
			<label id = resultPw> </label>
		</div> <br><br>
		
		<button id = successBtn class = changeBtn onclick = "changePwd();"> 변경하기 </button>
		<input type = button value = "로그인" onclick = "login();" id = successBtn>
	</div>
	</form>
	
	<script type="text/javascript">
		function login(){   
			location.href = '/surveyNow/views/common/loginPage.jsp';
		} // <- 로그인 버튼 누르면 로그인 화면으로
		
		function changePwd() {  
	        $("#changePwdForm").submit();  // <- /changePwd.cp Servlet
	    }  
		// -------> 여기서부터 비밀번호 유효성 검사
		$(".changeBtn").click(function(){
			var checkPwd = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	         if($("#pw1").val() == ""){
	            alert("비밀번호를 입력해주세요");
	            $("#pw1").focus();
	            return false;
	         } else if(!checkPwd.test($("#pw1").val())) {
	        	 alert("비밀번호는 8자 이상이며, 숫자/영어/특수문자를 모두 포함해야합니다.");
		            $("#pw1").val("");
		            $("#pw1").focus();
		            return false;
	         } else {
	        	 alert("새로운 비밀번호로 로그인을 해주세요");
	        	 $("#changePwdForm").submit();  // <- /changePwd.cp Servlet
	        	 return true;
	         }
		});
		
		 $(function(){
	         var checkPwd = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	         $("#pw1").change(function(){
	            if(!checkPwd.test($("#pw1").val())){
	               $("#resultPw").html("비밀번호는 8자 이상이며, 숫자/영어/특수문자를 모두 포함해야합니다.").css("color", "red");
	               $("#pw1").val("");
	               $("#pw1").focus();
	            }   
	         });
	         
	         $("#pw2").change(function(){
	          if($('#pw1').val() != $(this).val()){
	            $("#resultPw").html("비밀번호가 일치하지 않습니다.").css("color", "red");
	            $("#pw2").val("");
	            $(this).focus();
	          } else {
	             $("#resultPw").html("비밀번호가 일치 합니다.").css("color", "navy");
	          }
	         });
		 }); 
		 // <------- 여기까지 비밀번호 유효성 검사 완료
		 
	</script>
</body>
</html>