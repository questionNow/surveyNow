<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mypage.model.vo.Member"%>
    
<%
	Member loginUser = (Member)session.getAttribute("loginUser");  
	// session의 attribute로써 객체를 끄집어 내면 무조건 Object형이므로 다운캐스팅 해주어야 한다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>

	.topBar{margin-left:185px; margin-top:20px; float:left; text-align:center; }
	.topLogo{width:1300px; height:140px;}
	#myPageArea{width:1500px; height:700px; background:pink; margin: 0 auto; margin-top:200px;}
	#mainMyPage{ float:left; margin-left:300px; width:1000px; height:600px; background:purple; display:inline-block;}
	#subMenubar{ width:200px; height:700px; background:yellow; display:inline-block; }
	.subBar{float:left; width:200px; height:40px; background:red; border-bottom:1px solid #ccc; padding-top:20px; text-align:center;}
	.userInformation{ font-size:25px; padding-top:60px; margin-left:100px;}
	
	
		/* 임시용!!!!!!!!! */
		#loginBtn input, #memberjoinBtn, #logoutBtn, #myPage{display:inline-block;vertical-align:middle;text-align:center;background:orangered;color:white;height:25px;width:100px;border-radius:5px;}
		#memberJoinBtn{background:yellowgreen;}	
		#loginBtn:hover, #changeInfo:hover, #logoutBtn:hover, #memberJoinBtn:hover, #myPage:hover{cursor:pointer;}
	    .loginArea > form, #userInfo{float:right;}
	#logout, #myPage{background:orangered;color:white;text-decoration:none;border-radius:5px;}
	#myPage{background:yellowgreen;}
	.wrap{background:black;width:100%;height:50px;}
	.menu{background:black;color:white;text-align:center;vertical-align:middlewidth:150px;height:50px;display:table-cell;	 
	/*<td>속성처럼 만들어 줌 */}
	.nav{width:600px;margin-left:auto;margin-right:auto;}
	.menu:hover{background:darkgray;color:orangered;font-wight:bold;cursor:pointer;}
	
</style>
<title>Insert title here</title>
</head>
<body>

<!-- 임시용!!!!!!!!!!!!! -->
	<h1 align="center">Welcome JSP World!</h1>
	<div class="loginArea">
	<%if(loginUser == null) {%>
		<form id="loginForm" action="<%=request.getContextPath()%>/login.me"
		onsubmit="return validate();" method="post">
			<table>
				<tr>
					<td><label>ID : </label></td>
					<td><input type="text" name="userId" id="userId"></td>
				</tr>
				<tr>
					<td><label>PWD : </label></td>
					<td><input type="password" name="userPwd" id="userPwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="checkbox" name="saveId" id="saveId">&nbsp;
						<label for="saveId">아이디 저장</label>
					</td>
				</tr>
			</table>
			
			<div calss="btns" align="center">
				<div id="memberJoinBtn" onclick = "memberJoin();">회원가입</div>
				<div id="loginBtn"><input type="submit" value="로그인"></div>
			</div>
			
		</form>
	<%} else{%>
		<div id="userInfo">
			<label><%=loginUser.getUserName() %>님의 방문을 환영합니다.</label>
			<div class="btns" align="right">
				<div id="myPage" onclick="location.href='/surveyNow/myPage.me?userId=<%=loginUser.getUserId() %>'">정보수정</div>
				<div id="logoutBtn" onclick="logout();">로그아웃</div>
			</div>
		</div>
	<%} %>
	</div>
	<script>
		// validate() 함수 작성하기(form태그가 submit되었을 때 실행 됨)
		function validate(){
			if($("#userId").val().trim().length==0){
				alert("아이디를 입력하세요");
				$("#userId").focus();
				
				return false;	// return값이 false면 submit이 되지 않는다.
			}
			if($("#userPwd").val().trim().length==0){
				alert("비밀번호를 입력하세요");
				$("#userPwd").focus();
				
				return false;
			}
			
			return true;
		}
		
		// logout() 함수 작성하기
		function logout(){
			location.href = " <%=request.getContextPath()%>/logout.me";
			
			// LogoutServlet 만들러 ㄱㄱ씽!
		}
		
		// 회원가입용 함수 memberJoin() 함수 작성하기
		function memberJoin(){
			location.href="<%=request.getContextPath()%>/views/member/memberJoinForm.jsp";
		}
	</script>

	<!-- 메뉴 만들기 -->
	<br clear="both">	<!-- 이전의 float속성을 제거 해주자(이후 나올 태그들은 float속성이 안먹게) -->
	<br>
	
	<div class="wrap">
		<div class="nav">
			<div class="menu" onclick="goHome();">HOME</div>
			<div class="menu" onclick="goNotice();">공지사항</div>
			<div class="menu" onclick="goBoard();">게시판</div>
			<div class="menu" onclick="goThumbnail();">사진게시판</div>
		</div>
	</div>

	<script>
		function goHome(){
			location.href="<%=request.getContextPath()%>/index.jsp";
		}
		
		//공지사항 작업 시작(회원 관련된 작업이 끝나면)
		function goNotice(){
			location.href="<%=request.getContextPath()%>/list.no";
			//NoticelistServlet 만들러 가기
		}
		//게시판 작업 시작(공지사항 관련된 작업이 끝나면)
		function goBoard(){
			location.href="<%=request.getContextPath()%>/list.bo";
			//BoardListServlet 만들러 가기
		}
		//사진 게시판 작업 시작
		function goThumbnail(){
			location.href="<%=request.getContextPath()%>/list.th";
			//ThumbnailListServlet
		}
	</script>
	

<!-- 마이페이지부분 전체 div -->	
<div id = "myPageArea" >
	<!-- 좌측 서브 메뉴바 div -->
	<div id= "subMenubar">
		<div class= "subBar" style=background:Orange;>마이페이지</div>
		<div class= "subBar" id = "UserUpdate" onclick="Userlink()">개인정보 수정</div>
		<div class= "subBar" id = "SurveyMg" onclick="Surveylink();">설문 관리</div>
		<div class= "subBar" id = "Pointlink();" onclick="Pointlink();">포인트 관리</div>
	</div>
	
	<!-- 마이페이지 개인정보 화면 -->
	<div id="mainMyPage">
		<div class = "userInformation"style=margin-left:400px;>아아디 넣을 곳</div>
		<div class = "userInformation">포인트</div> 
		<div class = "userInformation">출금 등록 계좌</div> 
		<div class = "userInformation">설문작성 횟수</div> 
		<div class = "userInformation">설문참여 횟수</div> 
		<div class = "userInformation">패널 랭킹</div> 
	</div>
	</div>	
	
	<script>
<%-- 	function Userlink(){
		location.href = "<%=request.getContextPath()%>/views/mypage/UserUpdateView.jsp";	
	} --%>
	function Userlink(){
		location.href='<%= request.getContextPath()%>/myPage.me';
	}
	
	function Surveylink(){
		location.href="http://www.naver.com";
	}
	function Pointlink(){
		location.href="http://www.naver.com";
	}
	</script>

	
	

</body>
</html>