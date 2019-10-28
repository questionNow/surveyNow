<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.model.vo.*,java.util.ArrayList"%>

<%
   UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
   // ArrayList<Board> boardList = (ArrayList<Board>)request.getAttribute("blist");
%>
 <!-- /* 작업 */
	/* ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("arr"); */

	/* ArrayList<surveyList> rlist = (ArrayList<surveyList>)request.getAttribute("rlist"); */ -->
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta name="author" content="webstoryboy">
<meta name="description" content="반응형 사이트 따라하기">
<meta name="keywords"
	content="반응형사이트, 웹퍼블리셔, 웹접근성, HTML5, webstoryboy, webs">
<title>반응형 사이트 만들기 : 사이드 이펙트3</title>


<!-- Facebook meta tags -->
<meta property="og:type" content="article" />
<meta property="og:title" content="반응형 사이트 만들기(title)" />
<meta property="og:url"
	content="http://richclub8.dothome.co.kr/responsive/html5/index.html" />
<meta property="og:image"
	content="http://richclub8.dothome.co.kr/assets/ico/icon.png" />
<meta property="og:site_name" content="반응형 사이트 만들기(site_name)" />
<meta property="og:description" content="반응형 사이트 따라하기(description)" />

<!-- twitter meta tags -->
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:site" content="@webstoryboy" />
<meta name="twitter:title" content="반응형 사이트 만들기(title)" />
<meta name="twitter:description" content="반응형 사이트 만들기(description)." />
<meta property="twitter:image"
	content="http://richclub8.dothome.co.kr/assets/ico/icon.png" />

<!-- 파비콘 -->
<link rel="shortcut icon" href="icon/favicon.ico">
<link rel="apple-touch-icon-precomposed" href="icon/favicon-152.png">
<link rel="icon" href="path/to/favicon.png">
<link rel="icon" href="icon/favicon-16.png" sizes="16x16">
<link rel="icon" href="icon/favicon-32.png" sizes="32x32">
<link rel="icon" href="icon/favicon-48.png" sizes="48x48">
<link rel="icon" href="icon/favicon-64.png" sizes="64x64">
<link rel="icon" href="icon/favicon-128.png" sizes="128x128">

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abel"
	rel="stylesheet">


<style>
/* reset */
/* 여백 초기화 */
body, div, ul, li, dl, dd, dt, ol, h1, h2, h3, h4, h5, h6, input,
	fieldset, legend, p, select, table, th, td, tr, textarea, button, form,
	figure, figcaption {
	margin: 0;
	padding: 0;
}

/* a 링크 초기화 */
a {
	color: #222;
	text-decoration: none;
}

a:hover {
	color: #2698cb;
}

/* 폰트 초기화 */
body, input, textarea, select, button, table {
	font-family: 'Nanum Gothic', AppleSDGothicNeo-Regular, 'Malgun Gothic',
		'맑은 고딕', dotum, '돋움', sans-serif;
	color: #222;
	font-size: 13px;
	line-height: 1.6;
}

/* 폰트 스타일 초기화 */
em, address {
	font-style: normal;
}

/* 블릿기호 초기화 */
ul, li, ol {
	list-style: none;
}

/* 제목 태그 초기화 */
h1, h2, h3, h4, h5, h6 {
	font-size: 13px;
	font-weight: normal;
}

/* 버튼 초기화 */
button {
	border: 0;
}

/* 반응형 */
img {
	width: 100%;
}

/* clearfix */
.clearfix {
	*zoom: 1;
}

.clearfix:before, .clearfix:after {
	display: block;
	content: '';
	line-height: 0;
}

.clearfix:after {
	clear: both;
}

/* IR 효과 */
.ir_pm {
	display: block;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
} /* 의미있는 이미지의 대체 텍스트를 제공하는 경우(Phark Method) */
.ir_wa {
	display: block;
	overflow: hidden;
	position: relative;
	z-index: -1;
	width: 100%;
	height: 100%;
} /* 의미있는 이미지의 대체 텍스트로 이미지가 없어도 대체 텍스트를 보여주고자 할 때(WA IR) */
.ir_su {
	overflow: hidden;
	position: absolute;
	width: 0;
	height: 0;
	line-height: 0;
	text-indent: -9999px;
} /* 대체 텍스트가 아닌 접근성을 위한 숨김 텍스트를 제공할 때 */

/* margin, padding */
.mt10 {
	margin-top: 10px !important;
}

.mt15 {
	margin-top: 15px !important;
}

.mt20 {
	margin-top: 20px !important;
}

.mt25 {
	margin-top: 25px !important;
}

.mt30 {
	margin-top: 30px !important;
}

.mt35 {
	margin-top: 35px !important;
}

.mt40 {
	margin-top: 40px !important;
}

.mt45 {
	margin-top: 45px !important;
}

.mt50 {
	margin-top: 50px !important;
}

/* style */
/* 레이아웃 */
body {
	background: url(image/mainPageLogo.png) repeat-x center top;
}
#nav {
	background-color: #f6fdff;
	height : 100%;
}
#title {
	background-color: #FACEAB;
}
#contents .container {
	border-right: 1px solid #dbdbdb;
	border-left: 1px solid #dbdbdb;
}
#cont_left {
	float: left;
	width: 250px;
}

#cont_center {
	overflow: hidden;
	margin-right: 250px;
	min-height: 1300px;
	/* border-right: 1px solid #dbdbdb; 
               오른쪽 메뉴는 메인 페이지에만 보여줄거다.
            */
	border-left: 1px solid #dbdbdb;
}

#cont_right {
	position: absolute;
	right: 0;
	top: 0px;
	width: 250px;
}

#footer {
	border-top: 1px solid #dbdbdb;
}

/* 컨테이너 */
.container {
	position: relative;
	width: 1200px;
	margin: 0 auto; /* background: rgba(0,0,0,0.3) */
}

/* 헤더 */
#userHeader {
	display: inline-block;
}

/*         .header {height: 327px;} */
.header {
	height: 327px;
}
.header .header_menu {
	text-align: right;
}
.header .header_menu a {
	color: black;
	padding: 8px 0 6px 10px;
	display: inline-block;
	transition: color 0.3s ease;
	font-family: 'Abel', sans-serif;
	font-size : 1.5em;
}
.header .header_menu a:hover {
	color: #ccc;
}

.header .header_tit {
	text-align: center;
	text-transform: uppercase;
	margin-top: 55px;
	font-family: 'Abel', sans-serif;
}

.header .header_tit h1 {
	font-size: 30px;
	color: #fff;
	background: #51b0dc;
	display: inline-block;
	padding: 5px 30px 5px 30px;
	letter-spacing: 2px;
	font-weight: 900;
	transition: box-shadow 0.25s ease-in-out;
}

.header .header_tit h1:hover {
	box-shadow: inset -12em 0 0 0 #257FAC, inset 12em 0 0 0 #257FAC;
}

.header .header_tit a {
	font-size: 16px;
	color: #fff;
	background: #4a9abf;
	display: inline-block;
	padding: 10px 20px 10px 20px;
	margin-top: -7px;
	transition: box-shadow 0.3s ease-in-out;
}

.header .header_tit a:hover {
	box-shadow: 0 0 0 5px rgba(75, 154, 191, 0.9) inset, 0 0 0 100px
		rgba(0, 0, 0, 0.1) inset;
}

.header .header_icon {
	text-align: center;
	margin-top: 40px;
	padding-bottom: 45px;
}

.header .header_icon li {
	display: inline;
	margin: 0 2px;
}

.header .header_icon li a {
	position: relative;
	background-color: #3192bf;
	border-radius: 50%;
	width: 60px;
	height: 60px;
	color: #fff;
	display: inline-block;
	font-size: 35px;
	line-height: 60px;
	transition: all 0.3s ease;
}

.header .header_icon li a span {
	position: absolute;
	opacity: 0;
	left: 50%;
	top: -40px;
	transform: translateX(-50%);
	font-size: 12px;
	line-height: 1.6;
	background: #3192bf;
	padding: 3px 9px;
	border-radius: 6px 0;
	transition: all 0.3s ease;
}

.header .header_icon li a span:before {
	content: '';
	position: absolute;
	left: 50%;
	bottom: -5px;
	margin-left: -5px;
	border-top: 5px solid #3192bf;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
}

.header .header_icon li a:hover span {
	opacity: 1;
	top: -33px;
}

.header .header_icon li a:hover {
	box-shadow: 0 0 0 3px rgba(75, 154, 191, 0.9) inset, 0 0 0 100px
		rgba(0, 0, 0, 0.1) inset;
}

/* 전체 메뉴 */
.nav {
	overflow: hidden;
	padding: 25px 0;
	display: none;
}

.nav>div {
	float: left;
	width: 200px; /* width: 40%; */
}

.nav>div:last-child {
	width: 20%;
}

.nav>div ol {
	overflow: hidden;
}

.nav>div li {
	float: left;
	width: 50%;
	position: relative;
	padding-left: 8px; /* box-sizing: border-box; */
}

.nav>div:last-child li {
	width: 100%;
}

.nav>div li a {
	position: relative;
}

.nav>div li:before {
	content: '';
	width: 3px;
	height: 3px;
	background-color: #25a2d0;
	border-radius: 50%;
	position: absolute;
	left: 0;
	top: 8px;
}

.nav>div h3 {
	font-size: 18px;
	color: #25a2d0;
	font-weight: bold;
	margin-bottom: 4px;
}

.nav>div li a:after {
	content: '';
	display: inline-block;
	width: 0;
	height: 1px;
	position: absolute;
	bottom: 0;
	left: 0;
	background: #25a2d0;
	transition: all .2s ease-out;
}

.nav>div li:hover a:after {
	width: 100%;
}

/* 타이틀 */
.title {
	position: relative;
	text-align: center;
}

.title h2 {
	font-family: 'Nanum Brush Script', cursive;
	font-size: 45px;
	padding: 5px 0;
}

.title .btn {
	position: absolute;
	right: 0;
	top: 5px;
	width: 60px;
	height: 60px;
	line-height: 60px;
	background: #933D07;
	color: #fff;
	font-size: 35px;
	border-radius: 50%;
	transition: all 0.3s ease;
}

.btn2 {
	position: absolute;
	/* right: 0; */
	left: 0;
	top: 5px;
	width: 60px;
	height: 60px;
	line-height: 60px;
	background: #933D07;
	color: #fff;
	font-size: 35px;
	border-radius: 50%;
	transition: all 0.3s ease;
	/* display: none; */
}

.title .btn2 :hover {
	box-shadow: 0 0 0 3px rgba(75, 154, 191, 0.9) inset, 0 0 0 600px
		rgba(0, 0, 0, 0.1) inset;
}

.title .btn :hover {
	box-shadow: 0 0 0 3px rgba(75, 154, 191, 0.9) inset, 0 0 0 600px
		rgba(0, 0, 0, 0.1) inset;
}

/* 컨텐츠 영역 */
.column {
	padding: 15px;
	border-bottom: 1px solid #dbdbdb;
}

.column .col_tit {
	font-size: 20px;
	color: orangerd;
	padding-bottom: 5px;
}

.column .col_desc {
	border-bottom: 1px dashed #dbdbdb;
	padding-bottom: 15px;
	margin-bottom: 15px;
	color: #878787;
	line-height: 18px;
}
.column.col3 {border-bottom: 0;}
.column.col6 {border-bottom: 0;}
.column.col9 {border-bottom: 0;}

/* 메뉴 */
.menu li {
	position: relative;
}

.menu li a {
	font-size: 16px;
	text-transform: uppercase;
	color: #878787;
	border-bottom: 1px solid #dbdbdb;
	padding: 10px;
	display: block;
	transition: box-shadow 0.34s ease, background 0.34s ease;
}

.menu li a i {
	position: absolute;
	right: 10px;
	top: 15px;
}

.menu li a:hover {
	box-shadow: inset 180px 0 0 0 darkgray;
	color: red;
	background: orange;
}

/* 게시판1 */
.notice1 {
	position: relative;
}

.notice1 h5 {
	font-size: 14px;
	color: #2f7fa6;
	padding-bottom: 5px;
}

.notice1 li {
	position: relative;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	padding-left: 8px;
}

.notice1 li:before {
	content: '';
	width: 3px;
	height: 3px;
	border-radius: 50%;
	background: #449ce2;
	position: absolute;
	left: 0;
	top: 6px;
}

.notice1 .more {
	position: absolute;
	right: 0;
	top: 3px;
	color: #878787;
	text-transform: uppercase;
	font-size: 10px;
}

/* 게시판2 */
.notice2 {
	position: relative;
}

.notice2 h5 {
	font-size: 14px;
	color: #2f7fa6;
	padding-bottom: 5px;
}

.notice2 li {
	position: relative;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
	padding-left: 8px;
	padding-bottom: 5px;
	max-height: 40px; /* ie */
}

.notice2 li:before {
	content: '';
	width: 3px;
	height: 3px;
	border-radius: 50%;
	background: #449ce2;
	position: absolute;
	left: 0;
	top: 6px;
}

.notice2 .more {
	position: absolute;
	right: 0;
	top: 3px;
	color: #878787;
	text-transform: uppercase;
	font-size: 10px;
}

/* 블로그1 */
.blog1 img {
	width: 100%;
}

.blog1 .img-retina {
	display: none;
}

@media only screen and (-webkit-min-device-pixel-ratio: 1.5) , only screen and
		(min-device-pixel-ratio: 1.5) , only screen and (min-resolution:
	1.5dppx) {
	.blog1 .img-retina {
		display: initial;
	}
	.blog1 .img-normal {
		display: none;
	}
}

/* 블로그2 */
.blog2 h5 {
	color: #fff;
	text-align: center;
	padding: 30px 30px;
	text-transform: uppercase;
}

.blog2 p {
	padding-top: 5px;
}

.blog2 .img-retina {
	background-image: url(image/blog3_@1.jpg);
	background-size: cover;
}

@media only screen and (-webkit-min-device-pixel-ratio: 1.5) , only screen and
		(min-device-pixel-ratio: 1.5) , only screen and (min-resolution:
	1.5dppx) {
	.blog2 .img-retina {
		background-image: url(image/blog3_@2.jpg);
	}
}


/* 사이드 이펙트2 */
.side2 {
	position: relative;
	display: block;
	perspective: 600px;
}

.side2 .front {
	transform-style: preserve-3d;
	transform: rotateY(0deg);
	transition: all 0.5s ease-in-out;
	backface-visibility: hidden;
}

.side2 .back {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1;
	transform-style: preserve-3d;
	transform: rotateY(-180deg);
	transition: all 0.5s ease-in-out;
	backface-visibility: hidden;
}

.side2 .front figcaption {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%) translateZ(100px);
	display: block;
	text-align: center;
}

.side2 .back figcaption {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%) translateZ(100px);
	color: #fff;
	font-size: 20px;
	display: block;
	text-align: center;
}

.side2 figcaption {
	width: 60%;
}

.side2 figcaption h3 {
	color: #fff;
	font-size: 20px;
	font-family: 'Abel', sans-serif;
	font-weight: bold;
	background: rgba(0, 0, 0, 0.4);
	padding: 3px 10px;
}

.side2 figcaption p {
	font-size: 14px;
}

.side2:hover .front {
	transform: rotateY(180deg);
}

.side2:hover .back {
	transform: rotateY(0deg);
	z-index: 1;
}



/* 메뉴 상단 고정  */
.jbFixed {
	width: 100%;
	position: fixed;
	z-index: 1000;
	top: 0px;
}
.lowMenu {
	font-size: 13px;
	text-transform: uppercase;
	color: #878787;
	right: -20px;
	padding: 5px;
	display: block;
	transition: box-shadow 0.34s ease, background 0.34s ease;
	width: 190px;
}
.lowMenu:hover {
	box-shadow: inset 180px 0 0 0 rgba(233, 161, 13, 0.8);
	color: #fff;
	/* background: rgba(36,130,174,0.9); */
	background: rgba(233, 161, 13, 0.9);
	cursor: pointer;
}
.menuTest {
	vertical-align: middle;
}

.menuTest:hover {
	cursor: pointer;
}

.contentsTest {
	width: 300px;
	height: 100%;
	display: none;
	color: orangered;
}
  #loginForm{
      position: absolute;
      right: 15px;
      top: 5px;
      width: 2350px;
      line-height: 60px;
      display: inline-block;
      zoom: 1;
      *display: inline;
      border: 0;
      padding: 0;   
   }
      .goHome{
      display: inline-block;
      position: absolute; 
      /* right: 0; */ 
      left:0;
      top: 0px;  
      width: 60px; 
      height: 60px; 
      line-height: 60px; 
      background: #933D07; 
      color: #fff; 
      font-size: 20px; 
      border-radius: 50%;
      transition: all 0.3s ease;
      cursor:pointer;   
   }
   
   .goHome:hover {
      box-shadow: 
          0 0 0 3px rgba(75,154,191,0.9) inset,
          0 0 0 600px rgba(0,0,0,0.1) inset;
   }
      .btns{
      position: absolute;
      display: inline-block;
   }
</style>
</head>
<body>

	<header id="header">
		<div class="container">
			<div class="row">
				<div class="header">
					<div class="header_menu">
						<%if(loginUser != null) {%>
						<div class="userHeader">
							<label style ="font-size : 1.5em"><%=loginUser.getUserName() %> 님 환영합니다 :) </label>
							<!-- 작업중 -->
							<a id="myPage"
								onclick="location.href='/surveyNow//myinfo.mi?userId=<%=loginUser.getUserId()%>'">정보수정</a>
							<a id="logoutBtn" onclick="logout()">로그아웃</a>
						</div>
						<%} else{%>
					
						<label> 로그인 이름 </label> <a id="myPage"
							onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'">정보수정</a>
						<a id="logoutBtn" onclick="logout()">로그아웃</a>
						<!-- </div> -->
						<!--                         </form> -->
						<%} %>

					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- //nav -->

	<article id="title" class="jbMenu">
		<a href="#" class="btn"></a>
		<div class="container">
			<div class="title">
			<%-- 	<a href="#" class="btn2"
					onclick="location.href='/surveyNow/login.me?userId=<%=loginUser.getUserId()%>'"><i
					class="fa fa-angle-down" aria-hidden="true"></i><span class="ir_su">전체메뉴
						보기</span></a> --%>
			<form id ="loginForm" action="<%=request.getContextPath()%>/login.me" onsubmit="return validate()" method="get">
                     <div class="btns" align="center">
                     <input type="submit" value="홈" class="goHome">
                     <input type="hidden" name="userId" id = "userId" value="<%=loginUser.getUserId() %>">
                     <input type="hidden" name="userPwd" id = "userPwd" value="<%=loginUser.getUserPwd() %>">
                     </div>
               </form>   
				<h2 style = "color : #F46105">설문 NOW</h2>
			
				<!-- 
				설문now 바 있는 곳 기능 추가 
				<form class="searchform" action="#"> 
						<input class="searchfield" type="text" value="Search..." onfocus="if (this.value == 'Search...') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Search...';}" />
					</form>
					
					/ Search Form
				<div href="#" class="btn" onMouseOver="this.innerHTML='Click'" onMouseOut="this.innerHTML='Menu'">
				<i class="fa fa-angle-down" aria-hidden="true">
				</i><span>Menu</span></div> 
				-->
				<a href="#" class="btn"><i class="fa fa-angle-down"
					aria-hidden="true"></i><span class="ir_su">전체메뉴 보기</span></a>
			</div>
		</div>
		<!-- <nav id="nav">
			class="jbMenu"
			<div class="container">
				<div class="row"></div>
			</div>
		</nav>
	</article> -->
	   <nav id="nav" ><!-- class="jbMenu" --> 
		<div class="container">
			<div class="row">
				<div class="nav">
					<h2 class="ir_su">전체 메뉴</h2>
					<div>
			            <!-- <h3>마이메뉴</h3> -->
			            <a href="#" ><h3 class="menuHeader" onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'">마이메뉴</h3> </a>
			            
			            <ol>
			                <li><a href="#">HTML 태그(Tag)</a></li>
			                <li><a href="#">블록 요소/인라인 요소</a></li>
			                <li><a href="#">DTD 선언</a></li>
			                <li><a href="#">언어 속성 설정</a></li>
			                <li><a href="#">HTML &lt;title&gt;</a></li>
			                <li><a href="#">HTML &lt;meta&gt;</a></li>
			            </ol>
			        </div>
			        <div>
			            <a href="#" ><h3 class="menuHeader">설문</h3> </a>
			            <ol>
			                <li><a href="#">가나다</a></li>
			                <li><a href="#">라마바</a></li>
			                <li><a href="#">사아자</a></li>
			                <li><a href="#">차카타</a></li>
			                <li><a href="#">파하</a></li>
			            </ol>
			        </div> 
			        <div>
			            <a href="#" ><h3 class="menuHeader">공지사항</h3> </a>
			            <ol>
			                <li><a href="#">가나다</a></li>
			                <li><a href="#">라마바</a></li>
			                <li><a href="#">사아자</a></li>
			                <li><a href="#">차카타</a></li>
			                <li><a href="#">파하</a></li>
			            </ol>
			        </div>
			        <div>
			            <a href="#" ><h3 class="menuHeader">추가 1</h3> </a>
			            <ol>
			                <li><a href="#">가나다</a></li>
			                <li><a href="#">라마바</a></li>
			                <li><a href="#">사아자</a></li>
			                <li><a href="#">차카타</a></li>
			                <li><a href="#">파하</a></li>
			            </ol>
			        </div>
			        
			        <div>
			            <a href="#" ><h3 class="menuHeader">추가 2</h3> </a>
			            <ol>
			                <li><a href="#">가나다</a></li>
			                <li><a href="#">라마바</a></li>
			                <li><a href="#">사아자</a></li>
			                <li><a href="#">차카타</a></li>
			                <li><a href="#">파하</a></li>
			            </ol>
			        </div>
			        
				</div>
			</div>
		</div>
	</nav>
	</article>
	
	<main>
	<section id="contents">
		<div class="container">
			<h2 class="ir_su">반응형 사이트 컨텐츠</h2>
			<section id="cont_left">
				<h3 class="ir_su">메뉴 및 게시판 컨텐츠 영역</h3>
				<article class="column col1">
					<h4 class="col_tit">Menu</h4>


					<div class="menu">
						<li class="menuTest" value="3"><a>마이메뉴 <i
								class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						<ul class="contentsTest">
							<li id="asd" class="lowMenu"
								onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'">
								개인정보 수정</li>
							<li id="asd1" class="lowMenu">설문 관리</li>
						</ul>

						<li class="menuTest" value="0"><a>설문 <i	class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						<ul class="contentsTest">
							<li id="asd" class="lowMenu" onclick = "doSurvey();">설문 참여하기</li>
							<li id="asd" class="lowMenu" onclick="makeSurvey();">설문 만들기</li>
							<li id="asd1" class="lowMenu" onclick="holdSurvey();">작성된 설문</li>
							<li id="asd1" class="lowMenu" onclick="ingSurvey();">진행중인 설문</li>
							<li id="asd1" class="lowMenu" onclick="finishedSurvey();">완료된
								설문</li>
							<li id="asd1" class="lowMenu" onclick="deletedSurvey();">삭제한
								설문</li>
							<li id="asd1" class="lowMenu" onclick="purchaseSurvey();">설문
								결제하기</li>
						</ul>


						<li class="menuTest" value="0"><a>WebSite <i
								class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						<ul class="contentsTest">
							<li id="asd" class="lowMenu">회원 조회</li>
							<li id="asd1" class="lowMenu">패널 랭킹</li>
						</ul>
						<li class="menuTest"><a>Reference <i
								class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						<ul class="contentsTest">
							<li id="asd" class="lowMenu">상품 등록</li>
							<li id="asd1" class="lowMenu">상품관리</li>
						</ul>

						<li class="menuTest" value="0"><a>CSS3 <i
								class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						<ul class="contentsTest">
							<li id="asd" class="lowMenu">상품 등록</li>
							<li id="asd1" class="lowMenu">상품관리</li>
						</ul>

						<li class="menuTest" value="0"><a>HTML5 <i
								class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						<ul class="contentsTest">
							<li id="asd" class="lowMenu">상품 등록</li>
							<li id="asd1" class="lowMenu">상품관리</li>
						</ul>
					</div>


					<!--//메뉴 -->
				</article>
				<!-- //col1 -->

<%-- 				게시판 없애고 공지사항 (지금은 주석) 들어가기 
						 <article class="column col2">
						<!-- <h4 class="col_tit">공지사항</h4> -->
						<!-- <p class="col_desc">게시판 영역의 한줄 효과와 두줄 효과 게시판입니다.</p> -->
						<!-- 게시판 -->
						<div class="notice1">
							<h4 class="col_tit">공지사항</h4>
<!-- 작업 -->			
								<div class="tableArea">
									<table align="center" id="listArea">
										<tr>
										<th width="40px" type="hidden">카테고리</th>
										<th width="60px">글제목</th>
										
											<!-- <th width="100px" type="hidden">글번호</th>
							 				<th width="100px" type="hidden">카테고리</th> -->
											<!-- <th width="300px">글제목</th> -->
											<!-- <th width="100px" type="hidden">작성자</th>
											<th width="100px" type="hidden">조회수</th>
											<th width="150px" type="hidden">작성일</th> -->
										</tr>
										<%if(boardList.isEmpty()) { %>
										<tr>
											<td colspan="6">공지사항이 없습니다.</td>
										</tr>
										<%} else { %>
 											<%for(Board b : boardList){ %>
												<tr>
													<input type="hidden" value="<%=b.getbNum()%>">
													<input type="hidden" value="<%=b.getbType()%>">
													<td width="70px"><%=b.getbType() %></td>
													<td><%=b.getbTitle() %></td>
													<input type="hidden" value="<%=b.getbWName()%>">
													<input type="hidden" value="<%=b.getbCount()%>"> 
													<input type="hidden" value="<%=b.getbCreateDt()%>">
													 
													<td><%=b.getbNum() %></td>
													<td><%=b.getbType() %></td>
													<td><%=b.getbTitle() %></td>
													<td><%=b.getbWName() %></td>
													<td><%=b.getbCount() %></td>
													<td><%=b.getbCreateDt()%></td> 
												</tr>
											<%} %>
										<%} %>
									</table>
								</div> 
							<a href="#" class="more" title="더 보기">More <i class="fa fa-plus-circle" aria-hidden="true"></i></a>
						</div> --%>

				<article class="column col2">
					<h4 class="col_tit">게시판</h4>
					<!-- <p class="col_desc">게시판 영역의 한줄 효과와 두줄 효과 게시판입니다.</p> -->
					<!-- 게시판 -->
					<div class="notice1">
						<h5>게시판 제목1</h5>
						<ul>
							<li><a href="#">한 줄 씩 만 나 온 다!</a></li>
							<li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의
									오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파
									너의 오빠 ~</a></li>
							<li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의
									오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파
									너의 오빠 ~</a></li>
							<li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의
									오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파
									너의 오빠 ~</a></li>
							<li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의
									오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파
									너의 오빠 ~</a></li>
						</ul>
						<a href="#" class="more" title="더 보기">More <i
							class="fa fa-plus-circle" aria-hidden="true"></i></a>
					</div>
					<!--//게시판 -->
					<!-- 게시판2 -->
					<div class="notice2 mt15">
						<h5>게시판 제목2</h5>
						<ul>
							<li><a href="#">두 줄 씩 만 나 온 다!</a></li>
							<li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의
									오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파
									너의 오빠 ~</a></li>
							<li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의
									오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파
									너의 오빠 ~</a></li>
							<li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의
									오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파
									너의 오빠 ~</a></li>
							<li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의
									오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파
									너의 오빠 ~</a></li>
						</ul>
						<a href="#" class="more" title="더 보기">More <i
							class="fa fa-plus-circle" aria-hidden="true"></i></a>
					</div>
					<!--//게시판2 -->
				</article>
				<!-- //col2 -->

				<article class="column col3">
					<h4 class="col_tit">Blog</h4>
					<!-- <p class="col_desc">해상도에 따라 이미지를 다르게 표현하는 방법입니다.</p> -->
					<!-- blog -->
					<div class="blog1">
						<h5 class="ir_su">Image1</h5>
						<figure>
							<img src="image/blog4_@1.jpg" class="img-normal"
								alt="normal image">
							<img src="image/blog4_@2.jpg" class="img-retina"
								alt="retina image">
							<figcaption>위의 이미지에 대한 주석 들어가면됨</figcaption>
						</figure>
					</div>
					<!--//blog -->
					<!-- blog2 -->
					<div class="blog2 mt15">
						<div class="img-retina">
							<h5>Image2</h5>
						</div>
						<p>위의 이미지에 대한 주석 들어가면됨
					</div>
					<!--//blog2 -->
				</article>
				<!-- //col3 -->
			</section>



		</div>
	</section>
	</main>

	<!--SDB_20191018_사이드 메뉴 .. IF문이 너무 많다 더럽다. 가독성최악이네...  -->
	<script type="text/javascript"> 
	
   $(function(){
       $('.menuTest').click(function(){ 


         if($(this).next(".contents").css("display")=="block"){
            $(this).next().siblings(".contentsTest").slideUp();
//alert("1");
            if($(this).next(".contents").css("display")=="block"){
               $(this).addClass("contents");
//alert("2");
               if($(this).next(".contents").css("display")=="block"){
                  $(this).next(".contents").slideUp();
                  $(this).removeClass('contents');
//alert("3");
               }
            }
            
         } else {
            $(this).next().slideDown(function(){
               $(this).addClass("contents");
//alert("0");
            });
//alert("4");
            if($(this).next(".contents").css("display")=="block"){
               $(this).addClass("contents");
               $(this).next().siblings(".contentsTest").slideUp();
//alert("5");
            }else{
//alert("6");               
               $(this).next().siblings(".contentsTest").slideUp();
            }
         }
      });
   }); 
    </script>

	<!--STR  메뉴상단 고정  script ----------------------------------------------------------------------->
	<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
      $( document ).ready( function() {
        var jbOffset = $( '.jbMenu' ).offset();
        
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.jbMenu' ).addClass( 'jbFixed' );
          }
          else {
            $( '.jbMenu' ).removeClass( 'jbFixed' );
          }
        });
      } );
    </script>
	<!--END  메뉴상단 고정  script ----------------------------------------------------------------------->

	<!--STR 화면 onclick 이벤트 ------------------------------------------------------------------------>
	<script>
      // logout() 함수 작성하기
      function logout(){
         location.href = '<%=request.getContextPath()%>/logout.me';
         
         // LogoutServlet 만들기~ 꼬꼬씽~
      }
   </script>

	<script>
        //접기/펼치기
        $(".btn").click(function(e){
            e.preventDefault();
            $(".nav").slideToggle();
            $(".btn").toggleClass("open");
            //var btn = $(".btn").find(">i").attr("class");
            //alert(btn);

            if($(".btn").hasClass("open")){
                //open이 있을 때
                $(".btn").find(">i").attr("class","fa fa-angle-up");
            } else {
                //open이 없을 때
                $(".btn").find(">i").attr("class","fa fa-angle-down");
            }
        });
        
  
   
    </script>

	<script type="text/javascript">
    	function makeSurvey(){
    		location.href = "views/survey/makeSurvey.jsp"; 
    		// location.href = "<%=request.getContextPath()%>/surveyMake.sv?userId=<%=loginUser.getUserId()%>";
    	}
    	function holdSurvey(){
    		location.href = "<%=request.getContextPath()%>/surveyHoldList.sv?userId=<%=loginUser.getUserId()%>";
    	}
    	function ingSurvey(){
    		location.href = "<%=request.getContextPath()%>/surveyIngList.sv?userId=<%=loginUser.getUserId()%>";
    	}
    	function finishedSurvey(){
    		location.href = "<%=request.getContextPath()%>/surveyFinishedList.sv?userId=<%=loginUser.getUserId()%>";
    	}
    	function deletedSurvey(){
    		location.href = "<%=request.getContextPath()%>/surveyDeletedList.sv?userId=<%=loginUser.getUserId()%>";
    	}
    	function purchaseSurvey(){
    		location.href = "<%=request.getContextPath()%>/surveyPurchaseList.sv?userId=<%=loginUser.getUserId()%>";
    	}
    	function doSurvey(){
    		location.href = "<%=request.getContextPath()%>/surveyListView.sv?userId=<%=loginUser.getUserId()%>";
    	}
    </script>


</body>
</html>