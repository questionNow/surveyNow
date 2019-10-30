<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.model.vo.UserInfo"%>
<%
	UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<style type="text/css">
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
}

p {
	font-family: 'Poppins', sans-serif;
	font-size: 1.1em;
	font-weight: 300;
	line-height: 1.7em;
	color: #999;
}

a, a:hover, a:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

.navbar {
	padding: 15px 10px;
	background: #fff;
	border: none;
	border-radius: 0;
	margin-bottom: 40px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.navbar-btn {
	box-shadow: none;
	outline: none !important;
	border: none;
}

.line {
	width: 100%;
	height: 1px;
	border-bottom: 1px dashed #ddd;
	margin: 40px 0;
}

i, span {
	display: inline-block;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */
.wrapper {
	display: flex;
	align-items: stretch;
}

#sidebar {
	min-width: 250px;
	max-width: 250px;
	background: #7386D5;
	color: #fff;
	transition: all 0.3s;
}

#sidebar.active {
	min-width: 80px;
	max-width: 80px;
	text-align: center;
}

#sidebar.active .sidebar-header h3, #sidebar.active .CTAs {
	display: none;
}

#sidebar.active .sidebar-header strong {
	display: block;
}

#sidebar ul li a {
	text-align: left;
}

#sidebar.active ul li a {
	padding: 20px 10px;
	text-align: center;
	font-size: 0.85em;
}

#sidebar.active ul li a i {
	margin-right: 0;
	display: block;
	font-size: 1.8em;
	margin-bottom: 5px;
}

#sidebar.active ul ul a {
	padding: 10px !important;
}

#sidebar.active .dropdown-toggle::after {
	top: auto;
	bottom: 10px;
	right: 50%;
	-webkit-transform: translateX(50%);
	-ms-transform: translateX(50%);
	transform: translateX(50%);
}

#sidebar .sidebar-header {
	padding: 20px;
	background: #6d7fcc;
}

#sidebar .sidebar-header strong {
	display: none;
	font-size: 1.8em;
}

#sidebar ul.components {
	padding: 20px 0;
	/*  border-bottom: 1px solid #47748b; */
}

#sidebar ul li a {
	padding: 10px;
	font-size: 1.1em;
	display: block;
}

#sidebar ul li a:hover {
	color: #7386D5;
	background: #fff;
}

#sidebar ul li a i {
	margin-right: 10px;
}

#sidebar ul li.active>a, a[aria-expanded="true"] {
	color: #fff;
	background: #6d7fcc;
}=

a[data-toggle="collapse"] {
	position: relative;
}

.dropdown-toggle::after {
	display: block;
	position: absolute;
	top: 50%;
	right: 20px;
	transform: translateY(-50%);
}

ul ul a {
	font-size: 0.9em !important;
	padding-left: 30px !important;
	background: #6d7fcc;
}

ul.CTAs {
	padding: 20px;
}

ul.CTAs a {
	text-align: center;
	font-size: 0.9em !important;
	display: block;
	border-radius: 5px;
	margin-bottom: 5px;
}

a.download {
	background: #fff;
	color: #7386D5;
}

a.article, a.article:hover {
	background: #6d7fcc !important;
	color: #fff !important;
}

/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */
#content {
	width: 100%;
	padding: 20px;
	min-height: 100vh;
	transition: all 0.3s;
}

/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */
@media ( max-width : 768px) {
	#sidebar {
		min-width: 80px;
		max-width: 80px;
		text-align: center;
		margin-left: -80px !important;
	}
	.dropdown-toggle::after {
		top: auto;
		bottom: 10px;
		right: 50%;
		-webkit-transform: translateX(50%);
		-ms-transform: translateX(50%);
		transform: translateX(50%);
	}
	#sidebar.active {
		margin-left: 0 !important;
	}
	#sidebar .sidebar-header h3, #sidebar .CTAs {
		display: none;
	}
	#sidebar .sidebar-header strong {
		display: block;
	}
	#sidebar ul li a {
		padding: 20px 10px;
	}
	#sidebar ul li a span {
		font-size: 0.85em;
	}
	#sidebar ul li a i {
		margin-right: 0;
		display: block;
	}
	#sidebar ul ul a {
		padding: 10px !important;
	}
	#sidebar ul li a i {
		font-size: 1.3em;
	}
	#sidebar {
		margin-left: 0;
	}
	#sidebarCollapse span {
		display: none;
	}
	
}
</style>
<script type="text/javascript" src="js/modernizr.custom.79639.js"></script>
</head>
<body>
	<div class="wrapper">
		<!-- Sidebar  -->
		<nav id="sidebar">
			<div class="sidebar-header" align="center">
				<h3>
					설문 NOW!<br> 관리자 페이지
				</h3>
			</div>
			<div align="center">
				<%if(loginUser != null) {%>
				<label><%=loginUser.getUserName()%></label> 님 환영합니다.
				<button onclick="logout();">로그아웃</button>
				<%} %>
			</div>
			<ul class="list-unstyled components">
				<li class="active"><a href="#"><i class="fas fa-home"></i>Main</a>
				</li>
				<li><a href="#userSubMenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"> <i class="fas fa-copy"></i>회원관리</a>
					<ul class="collapse list-unstyled" id="userSubMenu">
						<li onclick="userList();">회원정보</li>
						<li><a href="#">패널랭킹</a></li>
					</ul></li>
				<li><a href="#suerveySubMenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"> <i class="fas fa-copy"></i>설문관리 </a>
					<ul class="collapse list-unstyled" id="suerveySubMenu">
						<li><a href="#">작성된 설문</a></li>
						<li><a href="#">진행중인 설문</a></li>
						<li><a href="#">완료된 설문</a></li>
						<li><a href="#">결제 설문</a></li>
					</ul></li>
				<li><a href="#noticeSubMenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"> <i class="fas fa-copy"></i>게시글 관리</a>
					<ul class="collapse list-unstyled" id="noticeSubMenu">
						<li onclick="location.href='views/board/boardInsertView.jsp'">게시글 등록</li>
						<li onclick="boardList();">게시글 관리</li>
					</ul>
				</li>
				<li><a href="#productSubMenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"> <i class="fas fa-copy"></i>상품 관리</a>
					<ul class="collapse list-unstyled" id="productSubMenu">
						<li onclick="location.href='views/product/productInsertView.jsp'">상품 등록</li>
						<li onclick="productList();">상품 관리</li>
						<li onclick="productSaleList();">판매내역</li>
					</ul>
				</li>
				<li><a href="#pointSubMenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"> <i class="fas fa-copy"></i>포인트 관리</a>
					<ul class="collapse list-unstyled" id="pointSubMenu">
						<li onclick="pointList();">포인트 관리</li>
						<li onclick="pointUseList();">포인트 내역</li>
					</ul>
				</li>
				<li onclick="qnaList();"><i class="fas fa-paper-plane"></i>1:1문의</li>
			</ul>
		</nav>

		<!-- Page Content  -->
		<div id="content"></div>
	</div>
	
	<script type="text/javascript">
    	function logout(){
        	location.href = '<%=request.getContextPath()%>/logout.me';
		}
    	
    	function boardList(){
    		location.href='<%=request.getContextPath()%>/list.bo';
    	}
    	
    	function userList(){
    		location.href='<%=request.getContextPath()%>/list.user';
    	}

    	function replyList(){
    		location.href='<%=request.getContextPath()%>/list.re';
    	}
    	
    	function productList(){
    		location.href='<%=request.getContextPath()%>/list.pro';
    	}
    	
    	function productSaleList(){
    		location.href='<%=request.getContextPath()%>/saleList.pro';
    	}
    	
    	function pointList(){
    		location.href='<%=request.getContextPath()%>/list.po';
    	}
    	
    	function pointUseList(){
    		location.href='<%=request.getContextPath()%>/uselist.po';
    	}
    	
    	function qnaList(){
    		location.href='<%=request.getContextPath()%>/list.qna';
    	}
    	
	</script>


	<!-- 메뉴 관련 스크립트 -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<!-- Popper.JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
		integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
		crossorigin="anonymous"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
		integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
    </script>
    
    
    
    
</body>
</html>