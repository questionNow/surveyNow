<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.UserInfo"%>
<%
	UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.headerArea {
	width: 100%;
	height: 75px;
}
.loginArea {
	float: right;
}

.loginInput {
	width: 150px;
	height: 28px;
	border: 1px solid yellowgreen;
}

.loginBtn {
	background-color:#b8e356;
	border-radius:25px;
	border:1px solid #83c41a;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Verdana;
	font-size:17px;
	padding:2px 38px;
	text-decoration:none;
	text-shadow:0px 1px 0px #86ae47;
}
.loginBtn:hover {
	background-color:#a5cc52;
}
.loginBtn:active {
	position:relative;
	top:1px;
}

/* CSS for style layout start*/
.nav {
	padding: 0px 50px;
	font-family: sans-serif;
}

.nav .menu-btn {
	display: none;
}

.nav-content {
	padding: 0;
	list-style-type: none;
	display: inline-block;
	margin: 0px;
}

.nav-content li {
	display: inline-block;
}

.nav-content li a {
	text-decoration: none;
	padding: 14px 10px;
	display: flex;
}

.nav-content li a .fa-caret-down {
	padding: 0px 10px;
}

.dropdown .close-dropdown .fa-times {
	padding-right: 10px;
	float: right;
	display: none;
}

.dropdown:hover .dropdown-menu {
	display: block;
}

.dropdown-menu {
	position: absolute;
	z-index: 1;
	min-width: 130px;
	display: none;
}

.search-area {
	float: right;
	list-style-type: none;
	display: inline-block;
	padding: 8px;
}

.search-area input {
	border-radius: 4px;
	padding: 6px;
	transition: all .5s;
}

.search-area input:focus {
	border-radius: 4px;
	outline: none;
}

.btn-search {
	border-radius: 4px;
	padding: 6px;
	cursor: pointer;
	transition: all .5s;
}

svg:not (:root ).svg-inline--fa {
	padding-right: 5px;
}
/*  CSS for style layout end*/

/* CSS Media Query for 768p start */
@media screen and (max-width: 768px) {
	.bottom-border-nav {
		border-bottom: 0.1px solid;
	}
	.nav {
		padding: 0px;
	}
	.nav .menu-btn {
		display: block;
		padding: 10px;
		font-size: 2rem;
	}
	.nav-elements {
		display: none;
	}
	.nav-sky .search-area {
		border-top: 1px solid #fff;
	}
	.nav-content {
		display: block;
	}
	.nav-content li {
		display: block;
	}
	.dropdown-menu {
		position: relative;
		min-width: auto;
	}
	.dropdown-menu a {
		padding-left: 20px !important;
	}
}
/* CSS Media Query for 768p end */

/* CSS for sky theme start*/
.nav-sky {
	color: #fff;
	background-image: linear-gradient(#99E000, #BDFF12);
}

.nav-sky .nav-content li a {
	color: #fff;
}

.nav-sky .nav-content li a:hover, .nav-sky .dropdown:hover .dropdown-link
	{
	background-image: linear-gradient(#99E000, #ABF200);
}

.nav-sky .dropdown-menu {
	background-color: #ABF200;
	box-shadow: 0px 5px 10px #abdaff;
}

.nav-sky .active {
	background-image: linear-gradient(#99E000, #CFFF24);
}

/* CSS for sky theme end*/
</style>
</head>
<body bgcolor="#EAF9E7">
<%-- <%if(loginUser != null) {%>
				<label><%=loginUser.getUserName()%></label> 님 환영합니다.
				<button onclick="logout();">로그아웃</button>
				<%} %> --%>
				
	<div class="headerArea">
		<div class="loginArea" align="center">
			<%if(loginUser != null) {%>
				
				<label><%=loginUser.getUserName() %></label> 님 환영합니다.
				<button onclick="logout();" class="loginBtn">logout</button>
			<%} else { %>
				<form id ="loginForm" action="<%=request.getContextPath()%>/login.me" onsubmit="return validate()" method="post">
				<input class="loginInput" type="text" name="userId" placeholder="id"> &nbsp; 
				<input class="loginInput" type="password" name="userPwd" placeholder="password">  &nbsp; 
				<button class="loginBtn" type="submit" value="로그인">login</button> 
				</form>
			<%} %>
		</div> 
	</div>
	<div class="nav nav-sky" align="center">
		<div class="menu-btn"><i class="fas fa-bars"></i></div>
		<div class="nav-elements">
			<ul class="nav-content">
				<li><a href="#" title="Home" class="active"> <i class="fas fa-home"></i> Main </a></li>
				<li>
					<div class="dropdown"> 
					<a href="#" class="dropdown-link">회원관리<i class="fas fa-caret-down"></i> </a>
						<div class="dropdown-menu">
							<a onclick="UserList();"> 회원정보 </a> 
							<a href="#"> 패널랭킹 </a> 
						</div>
					</div>
				</li>
				<li>
					<div class="dropdown"> 
					<a href="#" class="dropdown-link">설문관리<i class="fas fa-caret-down"></i> </a>
						<div class="dropdown-menu">
							<a onclick = "allSurvey();" href="#"> 작성된 설문 </a> 
							<a onclick = "proceedSurvey();" href="#"> 진행중인 설문 </a>
							<a onclick="completeSurvey();" href="#"> 완료된 설문 </a> 
							<a onclick="holdSurvey();" href="#"> 결제 설문 </a>  
						</div>
					</div>
				</li>
				<li>
					<div class="dropdown"> 
					<a href="#" class="dropdown-link">게시글관리<i class="fas fa-caret-down"></i> </a>
						<div class="dropdown-menu">
							<a onclick="location.href='views/board/boardInsertView.jsp'"> 게시글 등록 </a> 
							<a onclick="boardList();"> 게시글 관리 </a> 
						</div>
					</div>
				</li>
				<li>
				<li>
					<div class="dropdown"> 
					<a href="#" class="dropdown-link">상품관리<i class="fas fa-caret-down"></i> </a>
						<div class="dropdown-menu">
							<a onclick="location.href='views/product/productInsertView.jsp'"> 상품등록 </a> 
							<a onclick="productList();"> 상품관리 </a>
							<a onclick="productSaleList();"> 판매내역 </a> 
						</div>
					</div>
				</li>
				<li>
				<li>
					<div class="dropdown"> 
					<a href="#" class="dropdown-link">포인트관리<i class="fas fa-caret-down"></i> </a>
						<div class="dropdown-menu">
							<a onclick="pointList();"> 포인트관리 </a> 
							<a onclick="pointUseList();"> 포인트내역 </a>
						</div>
					</div>
				</li>
				<li><a href="#"> 고객센터 </a></li>
			</ul>
		</div>

	</div>
	<script data-src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script defer data-src="https://use.fontawesome.com/releases/v5.8.2/js/all.js" 
	integrity="sha384-DJ25uNYET2XCl5ZF++U8eNxPWqcKohUUBUpKGlNLMchM7q4Wjg2CUpjHLaL8yYPH" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function() {
			$(".menu-btn").click(function() {
				$(this).toggleClass("bottom-border");
				$(this).next(".nav-elements").slideToggle("slow");
			});
		});
	     
		// 로그아웃
		function logout(){
        	location.href = '<%=request.getContextPath()%>/logout.me';
		}
		
		// 회원목록 리스트 조회
		function userList(){
    		location.href='<%=request.getContextPath()%>/list.user';
    	}
		
		// 게시글 리스트 조회
		function boardList(){
    		location.href='<%=request.getContextPath()%>/list.bo';
    	}
		
		// 상품목록 조회
		function productList(){
    		location.href='<%=request.getContextPath()%>/list.pro';
    	}
    	
		// 상품 판매 내역 조회
    	function productSaleList(){
    		location.href='<%=request.getContextPath()%>/saleList.pro';
    	}
		
		// 회원들의 포인트 목록 조회
    	function pointList(){
    		location.href='<%=request.getContextPath()%>/list.po';
    	}
		
		// 포인트 사용내역 조회
    	function pointUseList(){
    		location.href='<%=request.getContextPath()%>/uselist.po';
    	}
    	
		// 1:1 문의 리스트 조회
    	function qnaList(){
    		location.href='<%=request.getContextPath()%>/list.qna';
    	}
    	
    	function allSurvey(){
    		location.href = "<%=request.getContextPath()%>/all.sv";	
    		/* SurveyAdViewServlet ㄱㄱ */
    	}

    	
    	function completeSurvey(){
    		location.href = "<%=request.getContextPath()%>/complete.sv";	
    		/* CompleteSurveyServlet ㄱㄱ*/ 
    	}
    	
    	function holdSurvey(){
    		location.href = "<%=request.getContextPath()%>/hold.sv";
    		/*PaySurveyServlet ㄱㄱ*/
    	}
    	
    	function proceedSurvey(){
    		location.href = "<%=request.getContextPath()%>/proceed.sv";		
    		/* ProceedSurveyServlet ㄱㄱ */
    	}
	</script>
</body>
<script>

function allSurvey(){
	location.href = "<%=request.getContextPath()%>/all.sv";	
	
}
</script>
</body>
</html>