<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
	type="text/javascript"></script>
<title>관리자 페이지</title>
<style>
body {
	background: url('') no-repeat;
	background-size: cover; /* 화면에 꽉차게 해라 */
}

#loginBtn input, #memberJoinBtn, #logoutBtn, #myPage {
	display: inline-block;
	vertical-align: middle;
	text-align: center;
	background: orangered;
	color: white;
	width: 100px;
	border-radius: 5px;
}

#memberJoinBtn {
	background: yellowgreen;
}

#loginBtn input:hover, #changeInfo:hover, #logoutBtn:hover,
	#memberJoinBtn:hover, #myPage:hover {
	cursor: pointer; /* 마우스 커서 올리면 손가락 모양으로 바뀜 */
}

.loginArea>form, #userInfo {
	float: right;
}

#logout, #mypage {
	background: orangered;
	color: white;
	text-decoration: none;
	border-radius: 5px;
}

#myPage {
	background: yellowgreen;
}

.wrap {
	background: black;
	width: 100%;
	height: 50px;
}

.menu {
	background: black;
	color: white;
	text-align: center;
	vertical-align: middle;
	width: 150px;
	height: 50px;
	display: table-cell; /* <td>속성처럼 만들어 줌 */
}

.nav {
	width: 600px;
	margin-left: auto;
	margin-right: auto;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: black;
  min-width: 100px;
/*  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); */
/*   z-index: 1; */
}

.dropdown-content a {
  color: white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
	color : orangered;}

.menu:hover .dropdown-content {
	display: block;
	background-color: darkgray;}

.menu:hover .dropbtn {
	background-color: orange;}

.menu:hover {
	background: darkgray;
	color: orangered;
	font-weight: bold;
	cursor: pointer;
}

body>h1 {
	cursor: pointer;
}
</style>
</head>
<body>
	<h1 align="center" onclick="goHome();">나는 관리자ㅇㅅㅇ</h1>
	
	
	<div class="loginArea">
		<div id="userInfo">
			<label>님의 방문을 환영합니다.</label>
			<div class="btns" align="right">
				<div id="myPage"
					onclick="location.href='/jspProject/myPage.me?userId='">정보 수정</div>
				<!-- ? 뒤가 query String이라고 함.
					jspProject(context root)에있는 myPage.me라는 Class를 찾아가라, 그래서 처음에 classes 폴더를 web/WEB-INF에 만들고 build path를 설정해둠  -->
				<div id="logoutBtn" onclick="logout();">로그아웃</div>
			</div>
		</div>

	</div>
	
	<br clear="both">
	<br>
	
	
	
	<div class="wrap">
		<div class="nav">
			<div class="menu" onclick="memberManage();">회원관리
			<div class="dropdown-content">
				<a href="#">1번</a>
				<a href="#">2번</a>
				<a href="#">3번</a>
				</div>
			</div>
			<div class="menu" onclick="allSurvey();">설문관리
				<div class="dropdown-content">
				<a href="#" >작성된 설문</a> 
				<a href="#">진행중인 설문</a>
				<a href="#" >완료된 설문</a>
				<a href="#">결제 설문</a>
				</div>
			</div>
			<div class="menu" onclick="noticeManage();">게시물 관리
				<div class="dropdown-content">
				<a href="#">1번</a>
				<a href="#">2번</a>
				<a href="#">3번</a>
				</div>
			</div>
			<div class="menu" onclick="productManage();">상품관리
				<div class="dropdown-content">
				<a href="#">1번</a>
				<a href="#">2번</a>
				<a href="#">3번</a>
				</div>
			</div>
			<div class="menu" onclick="pointManage();">포인트 관리
				<div class="dropdown-content">
				<a href="#">1번</a>
				<a href="#">2번</a>
				<a href="#">3번</a>
				</div>
			</div>
			<div class="menu" onclick="serviceCenter();">고객센터
				<div class="dropdown-content">
				<a href="#">1번</a>
				<a href="#">2번</a>
				<a href="#">3번</a>
				</div>
			</div>

		</div>
	</div>
	<!-------------------------------여기는 SurveyAdviewServlet이랑 query만 다르니까 곰방해유  -->
	<script>
		function allSurvey(){
			location.href = "<%=request.getContextPath()%>/all.sv";	
			/* SurveyAdViewServlet ㄱㄱ */
		}

		
		
	</script>
	<script>
	
	</script>
</body>
</html>