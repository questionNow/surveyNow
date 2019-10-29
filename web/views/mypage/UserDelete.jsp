<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.UserInfo"%>
    
<%
UserInfo user = (UserInfo)request.getAttribute("user"); 

String userId = user.getUserId();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
#deleteArea{margin-left:600px; margin-top:40px; height:700px; width:750px; border:1px solid;}
#deleteTop{height:200px; width:750px; margin-top:100px; border:1px solid; }

ul#type2 { list-style: circle; }

</style>
</head>
<body>
<%@ include file="../common/menubar2.jsp"  %>

	<div id="deleteArea">
	
	<div id="deleteTop" style=text-align:center;>
	<p > surveyNow을 이용해주셔서 진심으로 감사드립니다!</p>
	<P>탈퇴 전 아래 내용을 꼭 읽어주세요</P>
	<ul id="type2">
	<li>탈퇴 후 90일 동안은 재가입 하실 수 없습니다.</li>
	<li>탈퇴 후 90일 동안은 재가입 하실 수 없습니다.</li>
	<li>탈퇴 후 90일 동안은 재가입 하실 수 없습니다.</li>
	</ul>
	</div>
	<div class="btns" align="center">
	<form id="deleteForm" action="<%=request.getContextPath() %>/userdelete.ud" method="post">
		 <div class="div-lavel">아이디</div>
   	<div class="div-type">
    <input type=text id=id name=userId value=<%=userId %> readonly>
   </div>
	<div class="div-lavel">비밀번호</div>
   	<div class="div-type">
    <input type=text id=pwd name=userPwd>
   </div>
		<!--  <div class="div-lavel">비밀번호</div>
   	<div class="div-type">
           <input type = password id = pw1 name = userPwd placeholder = "비밀번호를 입력하세요" maxlength = 20 style = "ime-mode:inactive" required> 
   </div> -->
			<div id="deleteBtn" onclick="deleteMember();">탈퇴하기</div>
		</form>
	</div>
	</div>
	<script>
		function deleteMember() {
			var bool = confirm("정말루 탈퇴 할꼬얌?");
				if(bool){
				$("#deleteForm").submit();
				}
				}
	</script>
</body>
</html>