<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.UserInfo"%>
<%    
	UserInfo user = (UserInfo)request.getAttribute("user"); 
	String userId = user.getUserId();
	String phone = user.getPhone();
	String email = user.getEmail();
	String address = user.getAddress();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	
	
	/* 마이페이지 정보화면 스타일 */
	#myPageArea{width:750px; height:900px; background:pink; margin-left:480px; margin-top:20px;}
	#mainMyPage{ float:left; margin-left:10px; width:700px; height:700px; background:purple; display:inline-block;}
	
	/* 좌측 바 스타일 */
	#subMenubar{ width:200px; height:700px; background:yellow; display:inline-block; }
	.subBar{width:200px; height:40px; background:red; border-bottom:1px solid #ccc; padding-top:20px; text-align:center;}
	.userInformation{font-size:20px; padding-top:60px; margin-left:100px; border:1px solid;}
	
	
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar2.jsp" %>
	<%--   <%@ include file="../common/menubarUser.jsp"  %> --%>

	<h2 align="center"> Hello </h2>
	
	
<!-- 마이페이지부분 전체 div -->	
<div id = "myPageArea" >
	<!-- 마이페이지 개인정보 화면 -->
	<div id="mainMyPage">
		
		<%-- <div class = "userInformation"style=margin-left:400px;><%=loginUser.getUserName() %> 아이디 들어옴</div> --%>
		<div class = "userInformation"style=margin-left:400px;>
		<input value="<%=userId %>" readonly>
		</div>
		<div class = "userInformation">포인트</div>
 
		<div class = "userInformation">휴대폰
		<input name="phone" value=<%=phone %> readonly>
		</div> 
		<div class = "userInformation">E-Mail
		<input name="email" value=<%=email %> readonly>
		</div> 
		<div class = "userInformation">주소
		<input type="text" maxlength="150" name="address" value=<%=address %> readonly>
		</div> 
		<div class = "userInformation">설문 참여 횟수</div> 
	</div>

<%-- 	<!-- 좌측 서브 메뉴바 div -->
	<div id= "subMenubar">
		<div class= "subBar" style=background:Orange;>마이페이지</div>
		<div class= "subBar" id = "UserUpdate" onclick="location.href='<%=request.getContextPath()%>/myPage.mp?userId=<%=loginUser.getUserId() %>'">개인정보 수정</div>
		<!-- <div class= "subBar" id = "UserUpdate" onclick="survey();">개인정보 수정</div> -->
		<div class= "subBar" id = "UserUpdate" onclick="location.href='/surveyNow/myPage.mp?userId=<%=mypageUser.getUserId()%>'">개인정보 수정</div>
		 <div class= "subBar" id = "SurveyMg" onclick="location.href='<%=request.getContextPath()%>/list.bo;'">설문 관리</div>
		<div class= "subBar" id = "Pointlink();" onclick="Pointlink();">포인트 관리</div>
	</div> --%>
		
	</div>
	
	<%--  <script>
 	function survey(){
		location.href="<%=request.getContextPath()%>/views/mypage/UserUpdateView.jsp";
		location.href=<%=request.getContextPath()%>/surveyNow/myPage.mp?userId=<%=mypageUser.getUserId()%>";
	} 
	</script>  --%>


</body>
</html>