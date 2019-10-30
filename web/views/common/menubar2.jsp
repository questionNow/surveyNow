<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="user.model.vo.* ,board.model.vo.*, java.util.ArrayList"%>

<%
	UserInfo loginUser = (UserInfo) session.getAttribute("loginUser");

	ArrayList<Board> boardList = (ArrayList<Board>) request.getAttribute("blist");

	String attcheck = (String) request.getAttribute("attcheck");

	/* 작업 */
	/* ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("arr"); */

	/* ArrayList<surveyList> rlist = (ArrayList<surveyList>)request.getAttribute("rlist"); */
%>

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

<!-- style -->
<!-- <link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/lightgallery.css"> -->

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

<!-- HTLM5shiv ie6~8 -->
<!--[if lt IE 9]> 
        <script src="js/html5shiv.min.js"></script>
        <script type="text/javascript">
            alert("현재 당신이 보는 브라우저는 지원하지 않습니다. 최신 브라우저로 업데이트해주세요!");
        </script>
    <![endif]-->
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
/* a {color: #222; text-decoration: none;} */
a {
	color: #222;
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
/* body {background: url(image/header_bg.jpg) repeat-x center top;} */
body {
	background: url(image/mainPageLogo.png) repeat-x center top;
}

#header {
	
}
/* #nav {background-color: #f6fdff; height:100%;} */
#nav {
	background-color: #ff9e0033;
	height: 100%;
}

/* #title {background-color: #eaf7fd;} */
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
/*         .header .header_menu a {color: #fff; padding: 8px 0 6px 10px; display: inline-block; transition: color 0.3s ease; font-family: 'Abel', sans-serif;} */
.header .header_menu a {
	color: black;
	padding: 8px 0 6px 10px;
	display: inline-block;
	transition: color 0.3s ease;
	font-family: 'Abel', sans-serif;
	font-size: 1.5em;
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
/* .title h2 {font-family: 'Nanum Brush Script', cursive; font-size: 39px; color: #0093bd; padding: 5px 0;} */
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
	/* background: #3192bf; */
	background: #933D07;
	color: #fff;
	/* font-size: 20px; */
	font-size: 20px;
	border-radius: 50%;
	transition: all 0.3s ease;
	cursor: pointer;
}

.title .btn :hover {
	/* 	box-shadow: 0 0 0 3px rgba(75, 154, 191, 0.9) inset, 0 0 0 600px
		rgba(0, 0, 0, 0.1) inset; */
	
}

/* 컨텐츠 영역 */
.column {
	padding: 15px;
	border-bottom: 1px solid #dbdbdb;
}
/* .column .col_tit {font-size: 20px; color: #2f7fa6; padding-bottom: 5px;} */
.column .col_tit {
	font-size: 20px;
	/* color: orangerd; */
	/* color: #25a2d0; */
	color: black;
	padding-bottom: 5px;
}

.column .col_desc {
	border-bottom: 1px dashed #dbdbdb;
	padding-bottom: 15px;
	margin-bottom: 15px;
	color: #878787;
	line-height: 18px;
}

.column.col1 {
	
}

.column.col2 {
	
}

.column.col3 {
	border-bottom: 0;
}

.column.col4 {
	
}

.column.col5 {
	
}

.column.col6 {
	border-bottom: 0;
}

.column.col7 {
	
}

.column.col8 {
	
}

.column.col9 {
	border-bottom: 0;
}

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
	/*             box-shadow: inset 180px 0 0 0 rgba(36,130,174,0.7); 
            color: #fff; 
            background: rgba(36,130,174,0.9); */
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

/* 이미지 슬라이드 */
/*         .slider figure {position: relative;}
        .slider figcaption {position: absolute; bottom: 0; left: 0; width: 100%; padding: 20px;
            box-sizing: border-box;
            background-color: rgba(0,0,0,0.5);
            color: #fff;
            font-size: 18px;
        }
        .slider figcaption em {
            display: block; 
            font-weight: bold; font-size: 28px; text-transform: uppercase; font-family: 'Abel', sans-serif;
            opacity: 0;
            transform: translateX(50px);
            transition: all .84s ease;
        }
        .slider figcaption span {
            display: block;
            overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
            opacity: 0;
            transform: translateX(50px);
            transition: all .84s 0.2s ease;
        }
        .slider .slick-active figcaption em {opacity: 1; transform: translateX(0)}
        .slider .slick-active figcaption span {opacity: 1; transform: translateX(0)}
        
        .slider .slick-dots {display: block; width: 100%; text-align: center;}
        .slider .slick-dots li {display: inline-block; width: 15px; height: 15px; margin: 5px;}
        .slider .slick-dots li button {
            font-size: 0; 
            line-height: 0; 
            display: block; 
            width: 15px; height: 15px;
            cursor: pointer; 
            background: #5dbfeb; 
            border-radius: 50%;
        }
        .slider .slick-dots li.slick-active button {background: #2b91c8;}
        .slider .slick-prev {
            position: absolute; left: 0; bottom: 0; 
            z-index: 1000;
            width: 30px; height: 30px; 
            display: inline-block;
            font: normal normal normal 14px/1 FontAwesome;
            text-indent: -9999px;
        }
        .slider .slick-prev::before {
            content: "\f053";
            color: #5dbfeb;
            text-indent: 0;
            position: absolute; left: 9px; top: 8px;
        }
        .slider .slick-next {
            position: absolute; right: 0; bottom: 0; 
            z-index: 1000;
            width: 30px; height: 30px; 
            display: inline-block;
            font: normal normal normal 14px/1 FontAwesome;
            text-indent: -9999px;
        }
        .slider .slick-next::before {
            content: "\f054";
            color: #5dbfeb;
            text-indent: 0;
            position: absolute; left: 11px; top: 8px;
        } */

/* 라이트 박스 */
/*         .square a {float: left; width: 19%; margin: 0.5%; position: relative; overflow: hidden;  }
        .square a img {width: 100%; display: block;}
        .square a em {background: rgba(0,0,0,0.77); color: #fff; width: 100%; text-align: center; position: absolute; left:0; bottom: -30px; opacity: 1; transition: all .3s ease;}
        .square a:hover em {bottom: 0; background: rgba(0,0,0,0.57); }
        .square a:nth-child(1):hover img {filter: blur(2px);}
        .square a:nth-child(2):hover img {filter: brightness(50%);}
        .square a:nth-child(3):hover img {filter: contrast(10%);}
        .square a:nth-child(4):hover img {filter: grayscale(100%);}
        .square a:nth-child(5):hover img {filter: hue-rotate(120deg);}
        .square a:nth-child(6):hover img {filter: invert(100%);}
        .square a:nth-child(7):hover img {filter: opacity(10%);}
        .square a:nth-child(8):hover img {filter: saturate(10%);}
        .square a:nth-child(9):hover img {filter: sepia(120%);}
        .square a:nth-child(10):hover img {filter: sepia(120%) hue-rotate(120deg);} */

/* 비디오 */
/*         .video {position: relative; width: 100%; padding-bottom: 56.25%;}
        .video iframe {position: absolute; width: 100%; height: 100%;} */

/* 푸터 */
#footer {
	border-top: 1px solid #dbdbdb;
	background-color: #ff9e0033;
}

.footer {
	text-align: center;
	padding: 30px 50px;
}

.footer li {
	position: relative;
	display: inline;
	padding: 0 7px 0 10px;
	white-space: nowrap;
}

.footer li:before {
	content: '';
	width: 1px;
	height: 12px;
	background-color: #dbdbdb;
	position: absolute;
	left: 0;
	top: 2px;
}

.footer li:first-child:before {
	width: 0;
}

.footer address {
	padding-top: 15px;
}

/* 사이드 이펙트1 */
/*         .side1 {position: relative; display: block; perspective: 600px;}
        .side1 .front {
            transform-style: preserve-3d;
            transform: rotateY(0deg);
            transition: all 0.5s ease-in-out;
            backface-visibility: hidden;
        }
        .side1 .back {
            position: absolute; top: 0; left: 0; 
            width: 100%; height: 100%; z-index: -1;
            transform-style: preserve-3d;
            color: #fff;
            background: #4038DC;
            text-align: center;
            transform: rotateY(-180deg);
            transition: all 0.5s ease-in-out;
            backface-visibility: hidden;
        }
        .side1 .back i {position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);}
        .side1:hover .front {transform: rotateY(180deg);}
        .side1:hover .back {transform: rotateY(0deg); z-index: 1;} */

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

/* 사이드 이펙트3 */
/*         .side3 {position: relative; overflow: hidden; background: #000;}
        .side3 figcaption {
            position: absolute;
	        top: 50%; left: 50%;
            color: #fff;
            text-align: center;
            opacity: 0;
            text-transform: uppercase;
            transition: all 0.3s ease;
	        transform: translate(350%, -50%) rotate(180deg);
        }
        .side3 figcaption:after {
            content: '';
            width: 100px; height: 100px; 
            background: #000; 
            border-radius: 50%;
            position: absolute; left: 50%; top: 50%; z-index: -1;
            transform: translate(-50%, -50%);
        }
        .side3 figcaption h3 {font-size: 16px;}
        .side3 figcaption em {display: block; font-weight: bold;}
        .side3 img {display: block; transition: all 0.3s ease;}
        .side3:hover img {opacity: 0.4;}
        .side3:hover figcaption {transform: translate(-50%, -50%) rotate(0deg); opacity: 1;} */

/* mediaquery */
/* 화면 너비 0~1220px */
/*         @media (max-width: 1220px){
            .container {width: 100%;}
            .row {padding: 0 15px; }
            #cont_center {min-height: 1350px;}
	        #contents .container {border: 0;}
            
            .title .btn {right: 15px;}
            .square a {width: 24%}
	        .square a:nth-child(5n) {display: none;}
        } */

/* 화면 너비 0~1024px */
/*         @media (max-width: 1024px){
            .square a {width: 32.33333%}
	        .square a:nth-child(5) {display: block;}
        } */

/* 화면 너비 0~960px */
/*         @media (max-width: 960px){
            #cont_right {position: static; width: 100%; border-top: 1px solid #dbdbdb;}
	        #cont_center {margin-right: 0; border-right: 0;}
            
            .nav > div {float: none; width: 100%;}
            .nav > div:last-child {width: 100%;}
            .nav > div li {width: 33.333%;}
            .nav > div:last-child li {width: 33.333%;}
            .nav > div ol {margin-bottom: 10px;}
            
            #cont_right {overflow: hidden;}
            #cont_right .column {float: left; width: 33.333%; box-sizing: border-box;}
            #cont_right .column.col7 {border-right: 1px solid #dbdbdb; border-bottom: 0;}
            #cont_right .column.col8 {border-right: 1px solid #dbdbdb; border-bottom: 0;}
        } */

/* 화면 너비 0~768px */
/*         @media (max-width: 768px){
            #cont_left {float: none; width: 100%;}
	        #cont_center {border-left: 0;}
        } */

/* 화면 너비 0~600px */
/*         @media (max-width: 600px){
            .header {height: auto;}
            .nav > div li {width: 50%;}
	        .nav > div:last-child li {width: 50%;}
            
            .header .header_tit {display: none;}
            .header .header_icon {display: none;}
            .title .btn {display: none;}
            .column.col1 .col_tit {display: none;}
            .column.col1 .col_desc {display: none;}
            .column.col1 .menu li a i {display: none;}
            .column.col1 {padding: 0; border-bottom: 0;}
            .column.col1 .menu ul {overflow: hidden;}
            .column.col1 .menu li {float: left; width: 33.33333%; text-align: center; border-right: 1px solid #dbdbdb; box-sizing: border-box;}
            .column.col1 .menu li:nth-child(3n) {border-right: 0;}
            .column.col1 .menu li a {color: #fff; text-shadow: 0 0 5px rgba(0,0,0,0.7);}
            .column.col1 .menu li a:hover {box-shadow: none; background: rgba(36,130,174,0.3);}
            .column.col2 {background: #fff;}
	        .column.col4 {border-top: 1px solid #dbdbdb;}
            
            #cont_right .column {width:50%;}
            #cont_right .column.col8 {border-right: 0;}
            #cont_right .column.col9 {display: none;}
            
            .slider figcaption {padding: 10px;}
            .slider figcaption em {font-size: 18px;}
            .sflider figcaption span {font-size: 14px;}
            
            .square a {width: 49%}
	        .square a:nth-child(5) {display: none;}
        } */

/* 화면 너비 0~480px */
/*         @media (max-width: 480px){

        } */

/* 화면 너비 0~320px */
/*         @media (max-width: 320px){
            #cont_right .column {width:100%;}
	        #cont_right .column.col7 {border-right: 0; border-bottom: 1px solid #dbdbdb;}
            .square a {width: 100%; margin-left:0; margin-right: 0;}
        } */

/* 작업중 */

/*====================
		Search form 
	====================*/
.searchform {
	position: absolute;
	right: 15px;
	top: 5px;
	width: 360px;
	line-height: 60px;
	display: inline-block;
	zoom: 1;
	*display: inline;
	border: 0;
	padding: 0;
}

#loginForm {
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

.goHome {
	display: inline-block;
	position: absolute;
	/* right: 0; */
	left: 0;
	top: 0px;
	width: 60px;
	height: 60px;
	line-height: 60px;
	/* background: #3192bf; */
	background: #933D07;
	color: #fff;
	font-size: 20px;
	border-radius: 50%;
	transition: all 0.3s ease;
	cursor: pointer;
}

.goHome:hover {
	box-shadow: 0 0 0 3px rgba(75, 154, 191, 0.9) inset, 0 0 0 600px
		rgba(0, 0, 0, 0.1) inset;
}

.btns {
	position: absolute;
	display: inline-block;
}

.searchform input {
	font: normal 12px/100% Arial, Helvetica, sans-serif;
}

.searchform .searchfield {
	height: 27px;
	line-height: 27px;
	padding-left: 10px;
	padding-right: 10px;
	width: 150px;
	border: 2px solid #933D07;
	outline: none;
	-webkit-border-radius: 2em;
	-moz-border-radius: 2em;
	border-radius: 2em;
	-moz-box-shadow: inset 1px 1px 2px #A1A1A1;
	-webkit-box-shadow: inset 1px 1px 2px #A1A1A1;
	box-shadow: inner 1px 1px 2px #A1A1A1;
}

.searchfield:focus {
	font-weight: 700;
	width: 220px;
}

.searchfield
:not
 
(
:focus
 
){
width
:
 
150
px
;


}

/*====================
		설문 Now 메뉴
	====================*/
.btn2 {
	display: inline-block;
	position: absolute;
	/* right: 0; */
	left: 0;
	top: 5px;
	width: 60px;
	height: 60px;
	line-height: 60px;
	/* background: #3192bf; */
	background: #933D07;
	color: #fff;
	/* font-size: 20px; */
	font-size: 35px;
	border-radius: 50%;
	transition: all 0.3s ease;
	cursor: pointer;
	/* display: none; */
}

.btn2:hover {
	box-shadow: 0 0 0 3px rgba(75, 154, 191, 0.9) inset, 0 0 0 600px
		rgba(0, 0, 0, 0.1) inset;
}

/* 메뉴 상단 고정  */
.jbFixed {
	width: 100%;
	position: fixed;
	z-index: 1000;
	top: 0px;
}

.menuHeader:hover {
	box-shadow: inset 180px 0 0 0 rgba(36, 130, 174, 0.7);
	color: #fff;
	background: rgba(36, 130, 174, 0.9);
	box-shadow: none;
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

.sideMenu {
	display: none;
}

.menuTest {
	/* 			background:black;
			color:white;
			text-align:center; */
	vertical-align: middle;
}
/* <a href="#"> 
		버튼 처럼 만들기위해 이렇게 a 태그가 먹어있으면 겉으로 파란색의 테두리가 생긴다.
		 href="#" 를 뺀 이유는 클리시 최상단으로 올라가게 되어있어서
		 */
a {
	cursor: pointer;
}

.menuTest:hover {
	/* 			background:darkgray;
			color:orangered;
			font-wight:bold; */
	cursor: pointer;
}

.contentsTest {
	/* border:1px solid lightgray; */
	width: 300px;
	height: 100%;
	/* display:none; */
	/* display:blick; */
	display: none;
	color: orangered;
}

.serchMenu {
	display: blick;
	vertical-align: middle;
}

.tableArea {
	position: relative;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

/* .tableArea:before {
	content: '';
	width: 3px;
	height: 3px;
	border-radius: 50%;
	background: #449ce2;
	position: absolute;
	left: 0;
	top: 6px;
} */
.menuTest:hover {
	background: #449ce2;
}

/* 공지사항 */
.boardTitle:hover {
	background: orangered;
}

/* .blinking{
	-webkit-animation:blink 0.1s ease-in-out infinite alternate;
    -moz-animation:blink 0.1s ease-in-out infinite alternate;
    animation:blink 0.1s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
} */

/* background-color:black;  */
/* .rainbow {position:absolute; top:100px; width:300px;
     text-align:center;
  animation:myani 5s linear infinite alternate;
  animation-play-state:running;

  -webkit-animation:myani 5s linear infinite alternate;
  -webkit-animation-play-state:running;
  -moz-animation:myani 5s linear infinite alternate;
  -moz-animation-play-state:running;}

 @keyframes myani{
 
0% {top:0px;  color:red;}
15% {top:50px; color:orange;}
30% {top:100px;  color:yellow; }
45% {top:150px;  color:green; }
60% {top:200px;  color:blue;}
75% {top:250px;  color:navy; }
100% {top:300px;  color:purple;}}

@-webkit-keyframes myani{
 
0% {top:0px;  color:red;}
15% {top:50px; color:orange;}
30% {top:100px;  color:yellow; }
45% {top:150px;  color:green; }
60% {top:200px;  color:blue;}
75% {top:250px;  color:navy; }
100% {top:300px;  color:purple;}}

@-moz-keyframes myani{
 
0% {top:0px;  color:red;}
15% {top:50px; color:orange;}
30% {top:100px;  color:yellow; }
45% {top:150px;  color:green; }
60% {top:200px;  color:blue;}
75% {top:250px;  color:navy; }
100% {top:300px;  color:purple;}} */



#loginChack{
cursor: pointer;
}




@font-face {
  font-family: neon;
  src: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/707108/neon.ttf);
}

.container9 {
  display: table-cell;
  text-align: center;
  vertical-align: middle;
}

.neon {
display: inline-block;
  font-family: neon;
  color: #FB4264;
  font-size: 3vw;
  line-height: 3vw;
  text-shadow: 0 0 3vw #F40A35;
}

.flux {
display: inline-block;
  font-family: neon;
  color: #426DFB;
  font-size: 3vw;
  line-height: 3vw;
  text-shadow: 0 0 3vw #2356FF;
}

.neon {
  animation: neon 1s ease infinite;
  -moz-animation: neon 1s ease infinite;
  -webkit-animation: neon 1s ease infinite;
}

@keyframes neon {
  0%,
  100% {
    text-shadow: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128, .5vw .5vw .1vw #806914;
    color: #FED128;
  }
  50% {
    text-shadow: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B, .5vw .5vw .1vw #40340A;
    color: #806914;
  }
}

.flux {
  animation: flux 2s linear infinite;
  -moz-animation: flux 2s linear infinite;
  -webkit-animation: flux 2s linear infinite;
  -o-animation: flux 2s linear infinite;
}

@keyframes flux {
  0%,
  100% {
    text-shadow: 0 0 1vw #1041FF, 0 0 3vw #1041FF, 0 0 10vw #1041FF, 0 0 10vw #1041FF, 0 0 .4vw #8BFDFE, .5vw .5vw .1vw #147280;
    color: #28D7FE;
  }
  50% {
    text-shadow: 0 0 .5vw #082180, 0 0 1.5vw #082180, 0 0 5vw #082180, 0 0 5vw #082180, 0 0 .2vw #082180, .5vw .5vw .1vw #0A3940;
    color: #146C80;
  }
}

</style>
</head>
<body>

	<header id="header">
		<div class="container">
			<div class="row">
				<div class="header">
					<div class="header_menu">

						<!--                         <a href="http://websedu.tistory.com/">Blog</a>
                        <a href="https://www.facebook.com/webstoryboys">facebook</a>
                        <a href="http://richclub8.dothome.co.kr/webstandard/web/index.html">Webstandard</a> -->

						<%
							if (loginUser != null) {
						%>
						<div class="userHeader">
							<br>
							<%if (attcheck == "Y") {%>
								<label style="font-size: 1.5em"><%=loginUser.getUserName()%>님 환영합니다 :) </label>
								<a id="myPage" onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'">정보수정</a>
								<a id="logoutBtn" onclick="logout()">로그아웃</a>
							
 								  <!--<div class="neon" id="loginChack" style="visibility: hidden;">출석 </div>
								  <div class="flux" id="loginChack" style="visibility: hidden;">체크 </div> -->
							<%} else {%>
								<label style="font-size: 1.5em"><%=loginUser.getUserName()%>님 환영합니다 :) </label>
								<a id="myPage" onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'">정보수정</a>
								<a id="logoutBtn" onclick="logout()">로그아웃</a>
								
								  <div class="neon" id="loginChack">출석 </div>
								  <div class="flux" id="loginChack">체크 </div>
							<%}%>							
							
						</div>
						<%
							} else {
						%>
						<%-- 							  	<form id ="loginForm" action="<%=request.getContextPath()%>/login.me" onsubmit="return validate()" method="post">                       --%>
						<!-- <div class="userHeader"> -->
						<label> 로그인 이름 </label> <a id="myPage"
							onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'">정보수정</a>
						<a id="logoutBtn" onclick="logout()">로그아웃</a>
						<%if (attcheck == "Y") {%>
							<button id="loginChack" type="button" style="visibility: hidden;">출석체크3</button>
						<!-- style="visibility:hidden;" -->
						<% } else { %>
							<button id="loginChack" type="button">출석체크4</button>
						<%}%>
						<!-- </div> -->
						<!-- 								</form> -->
						<%}%>

						<%-- 	<%if(loginUser == null) {%>
		<form id ="loginForm" action="<%=request.getContextPath()%>/login.me" 
		onsubmit="return validate()" method="post"> <!-- validate() 을 실행하고 난뒤의 반환값(return) -->
			<table>
				<tr>
					<td><label>ID : </label></td>
					<td><input type="text" name="userId" id = "userId"></td>
				</tr>
				<tr>
					<td><label>PWD : </label></td>
					<td><input type="password" name="userPwd" id = "userPwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="checkbox" name="saveId" id = "saveId">&nbsp;
						<label for="saveId">아이디 저장</label>
					</td>
				</tr>
			</table>
			
			<div class="btns" align="center">
				<div id="memberJoinBtn" onclick = "memberJoin();">회원가입</div>
				<div id="loginBtn"><input type="submit" value="로그인"></div>
			</div>
			
		</form>
	<%} else{%> --%>
						<!-- <div id ="userInfo"> -->
						<%-- <label><%=loginUser.getUserName() %>님의 방문을 환영합니다.</label> --%>
						<!-- <div class="btns" align="right"> -->
						<!-- request.getContextPath() 동일한 의미 : /jspProject/
												/jspProject/ : Context루트명 -->
						<!-- 쿼리스트링 방식 : /jspProject/mypage.me?userId=loginUser.getUserId() 
												- ? 이후를 쿼리스트링 이라 한다.
												- 어떤이름?어떤값
												- mypage.me : 클래스파일을 의미 classes 밑에 MyPageServlet.class 자동으로 찾아감
											-->
						<!-- @조사필요 쿼리스트림 방식-->
						<%--<div id="myPage"  onclick="location.href='/jspProject/mypage.me?userId=<%=loginUser.getUserId()%>'" >정보수정</div>--%>
						<!-- <div id="logoutBtn" onclick="logout()">로그아웃</div> -->
						<!-- </div> -->
						<!-- </div> -->
						<%-- 	<%} %> --%>























					</div>

					<!-- 헤더 부분 이벤트 음.. 일단 주석 -->
					<!--                     //header_menu
                    <div class="header_tit">
                        <h1>여기에 이미지 슬라이드를 넣어야 될거같은데</h1><br>
                        <a href="http://www.iei.or.kr">kh 정보 교육원</a>
                    </div>
                    //header_tit 
                    <div class="header_icon">
                        <ul>
                        	<a href="#"> 클릭시 최상단으로 이동되서 빼버림
                            <li><a ><i class="fa fa-html5" aria-hidden="true"></i><span>HTML5</span></a></li>
                            <li><a ><i class="fa fa-github" aria-hidden="true"></i><span>GitHub</span></a></li>
                            <li><a class="facebook"><i class="fa fa-facebook-square" aria-hidden="true"></i><span>Fackbook</span></a></li>
                            <li><a class="twitter"><i class="fa fa-twitter" aria-hidden="true"></i><span>twitter</span></a></li>
                        </ul>
                    </div> -->



					<!-- //header_icon -->
				</div>
			</div>
		</div>
	</header>
	<!-- //nav -->

	<article id="title" class="jbMenu">
		<a href="#"></a>
		<div class="container">
			<div class="title">

				<%-- <a href="#" class="btn2"  onclick="location.href='/surveyNow/login.me?userId=<%=loginUser.getUserId()%>'"><i class="fa fa-angle-down" aria-hidden="true"></i><span class="ir_su">전체메뉴 보기</span></a> --%>
				<!-- <div href="#" class="btn2" onclick="goHome()" -->
				<%-- <a href="#" ><h3 class="menuHeader" onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'">마이메뉴</h3> </a> --%>







				<!-- 				<div href="#" class="btn2" onMouseOver="this.innerHTML='GoGo'" onMouseOut="this.innerHTML='Home'">
					<i class="fa fa-angle-down" aria-hidden="true"></i><span>Home</span></div> -->

				<form id="loginForm" action="<%=request.getContextPath()%>/login.me"
      onsubmit="return validate()" method="get" onsubmit="return false;">
      <div class="btns" align="center">
         <input type="submit" value="Home" class="goHome"> 
         <input type="hidden" name="userId" id="userId" value="<%=loginUser.getUserId()%>">
         <input type="hidden" name="userPwd" id="userPwd" value="<%=loginUser.getUserPwd()%>">
         
         <input type="hidden" name="userPwdType" id="userPwdType" value="<%="userPwdType"%>">
         <input type="hidden" name="userPwdV" id="userPwdV" value="<%=loginUser.getPwdVisible()%>"> 
      </div>
   </form>


				<!-- <h2>"설문 NOW"</h2> -->
				<h2 style="color: #F46105">설문 NOW</h2>


				<!-- Search Form -->
				<form class="searchform" onsubmit="return false;">
					<input class="searchfield" type="text" value="Search..."
						onfocus="if (this.value == 'Search...') {this.value = '';}"
						onblur="if (this.value == '') {this.value = 'Search...';}"
						id="alpreah_input" />

				</form>
				<!-- / Search Form -->

				<div href="#" class="btn" onMouseOver="this.innerHTML='Click'"
					onMouseOut="this.innerHTML='Menu'">
					<i class="fa fa-angle-down" aria-hidden="true"></i><span>Menu</span>
				</div>
			</div>
		</div>



		<nav id="nav">
			<!-- class="jbMenu" -->
			<div class="container">
				<div class="row">
					<div class="nav">
						<h2 class="ir_su">전체 메뉴</h2>
						<div>
							<!-- <h3>마이메뉴</h3> -->
							<a href="#"><h3 class="menuHeader"
									onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'">마이메뉴</h3>
							</a>

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
							<a href="#"><h3 class="menuHeader">설문</h3> </a>
							<ol>
								<li><a href="#">가나다</a></li>
								<li><a href="#">라마바</a></li>
								<li><a href="#">사아자</a></li>
								<li><a href="#">차카타</a></li>
								<li><a href="#">파하</a></li>
							</ol>
						</div>
						<div>
							<a href="#"><h3 class="menuHeader">공지사항</h3> </a>
							<ol>
								<li><a href="#">가나다</a></li>
								<li><a href="#">라마바</a></li>
								<li><a href="#">사아자</a></li>
								<li><a href="#">차카타</a></li>
								<li><a href="#">파하</a></li>
							</ol>
						</div>
						<div>
							<a href="#"><h3 class="menuHeader">추가 1</h3> </a>
							<ol>
								<li><a href="#">가나다</a></li>
								<li><a href="#">라마바</a></li>
								<li><a href="#">사아자</a></li>
								<li><a href="#">차카타</a></li>
								<li><a href="#">파하</a></li>
							</ol>
						</div>

						<div>
							<a href="#"><h3 class="menuHeader">추가 2</h3> </a>
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
	<!-- //nav -->
	<!--    
    <article id="title" class="jbMenu">
		<div class="container">
			<div class="title">
				<h2>"설문 NOW"</h2>
				<a href="#" class="btn"><i class="fa fa-angle-down" aria-hidden="true"></i><span class="ir_su">전체메뉴 보기</span></a>
			</div>
		</div>
	</article> -->
	<!-- //title -->

	<main>
	<section id="contents">
		<div class="container">
			<h2 class="ir_su">반응형 사이트 컨텐츠</h2>
			<section id="cont_left">
				<h3 class="ir_su">메뉴 및 게시판 컨텐츠 영역</h3>
				<article class="column col1">
					<h4 class="col_tit">Menu</h4>
					<!-- .col_desc : 메뉴 설명 모두 주석 -->
					<!-- <p class="col_desc">Box-shadow를 이용한 마우스 오버 효과 메뉴입니다.</p> -->
					<!-- 메뉴 -->

					<%--  				<div class="menu">
						<ul>
							<li><a href="#" onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'">마이메뉴 <i class="fa fa-angle-double-right" aria-hidden="true" ></i></a></li>
							<li><a href="#">Tutorial <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
							<li><a href="#">WebSite <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
							<li><a href="#">Reference <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
							<li><a href="#">CSS3 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
							<li><a href="#">HTML5 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						</ul>
					</div>	 --%>


					<%-- 					<div class="menu">
						<li class="menuTest" value="3"><a>마이메뉴 <i
								class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						<ul class="contentsTest">
							<li id="asd" class="lowMenu"
								onclick="location.href='/surveyNow/mypage.me?userId=<%=loginUser.getUserId()%>'">
								개인정보 수정</li>
							<li id="asd1" class="lowMenu">설문 관리</li>
						</ul> --%>

					<div class="menu">
						<li class="menuTest" value="3"><a href="#">마이메뉴 <i
								class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						<ul class="contentsTest">
							<li id="asd1" class="lowMenu"
								onclick="location.href='/surveyNow//mypage.me?userId=<%=loginUser.getUserId()%>'">
								마이 메뉴</li>
							<li id="asd" class="lowMenu"
								onclick="location.href='/surveyNow/myinfo.mi?userId=<%=loginUser.getUserId()%>'">
								개인정보 수정</li>

							<li id="asd2" class="lowMenu"
								onclick="location.href='/surveyNow/mypoint.mp?userId=<%=loginUser.getUserId()%>'">
								포인트</li>
							<li id="asd3" class="lowMenu"
								onclick="location.href='views/mypage/MyQnABoard.jsp'">1대1
								문의</li>
							</li>
							<li id="asd4" class="lowMenu"
								onclick="location.href='/surveyNow/userdeleteform.df?userId=<%=loginUser.getUserId()%>'">
								회원 탈퇴</li>

						</ul>















						<li class="menuTest" value="0"><a>Tutorial <i
								class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
						<ul class="contentsTest">
							<li id="asd" class="lowMenu" onclick="doSurvey();">설문 참여하기</li>
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

				<%-- 				<article class="column col2">

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
								<%
									if (boardList.isEmpty()) {
								%>
								<tr>
									<td colspan="6">공지사항이 없습니다.</td>
								</tr>
								<%
									} else {
								%>
								<%
									for (Board b : boardList) {
								%>
								<tr>
									<input type="hidden" value="<%=b.getbNum()%>">
									<input type="hidden" value="<%=b.getbType()%>">
									<td width="70px"><%=b.getbType()%></td>
									<td class="boardTitle"><%=b.getbTitle()%></td>
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
								<%
									}
								%>
								<%
									}
								%>
							</table>
						</div>
						<a href="#" class="more" title="더 보기">More <i
							class="fa fa-plus-circle" aria-hidden="true"></i></a>
					</div>
					
					
					<!--//게시판 -->
					<!-- 게시판2 -->
					<!-- 						<div class="notice2 mt15">
							<h5>게시판 제목2</h5>
							<ul>
								<li><a href="#">두 줄 씩 만 나 온 다!</a></li>
								<li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~</a></li>
								<li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~</a></li>
								<li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~</a></li>
								<li><a href="#">배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~배고파 너의 오빠 ~</a></li>
							</ul>
							<a href="#" class="more" title="더 보기">More <i class="fa fa-plus-circle" aria-hidden="true"></i></a>
						</div> -->
					<!--//게시판2 -->
				</article> --%>
				<!-- //col2 -->

				<article class="column col3">
					<h4 class="col_tit">설문 사이트</h4>
					<br>
					<!-- <p class="col_desc">해상도에 따라 이미지를 다르게 표현하는 방법입니다.</p> -->
					<!-- blog -->
					<!-- 					<div class="blog1">
						<h5 class="ir_su">Image1</h5>
						<figure>
							<img src="image/blog4_@1.jpg" class="img-normal"
								alt="normal image">
							<img src="image/blog4_@2.jpg" class="img-retina"
								alt="retina image">
							<figcaption>위의 이미지에 대한 주석 들어가면됨1</figcaption>
						</figure>
					</div> -->
					<!--//blog -->
					<!-- blog2 -->
					<!-- 					<div class="blog2 mt15">
						<div class="img-retina">
							<h5>Image2</h5>
						</div>
						<p>위의 이미지에 대한 주석 들어가면됨2
					</div> -->

					<!-- 작업중 사이트 이동되게 하면됨  -->

					<!--//blog2 -->

					<div class="pull-left hidden-xs">
						<!-- 연계 사이트 목록 연결 -->
						<a href="http://www.panelnow.co.kr" target="_blank"> <img
							src="image/panelNow.png" alt="이미지3">
						</a> <br>
						<p class="col_desc"></p>
						<a href="https://kr.ipanelonline.com/panel/index" target="_blank">
							<img src="image/iPanelonline.PNG" alt="이미지3">
						</a> <br>
						<p class="col_desc"></p>
						<a href="http://embrain.com" target="_blank"> <img
							src="image/embrain.PNG" alt="이미지3">
						</a> <br>
						<p class="col_desc"></p>
						<a href="https://www.nownsurvey.com" target="_blank"> <img
							src="image/nowNsurbey.PNG" alt="이미지3">
						</a> <br>
						<p class="col_desc"></p>
						<a href="https://renewal.smartpanel.kr" target="_blank"> <img
							src="image/smartpanel.PNG" alt="이미지3">
						</a> <br>
						<p class="col_desc"></p>
						<a href="https://wizpanel.co.kr" target="_blank"> <img
							src="image/WizPanel.PNG" alt="이미지3">
						</a>



					</div>



				</article>
				<!-- //col3 -->
			</section>



			<!-- //cont_left -->

			<!--                 <section id="cont_center"> -->


			<!--
                    <h3 class="ir_su">반응형 사이트 가운데 컨텐츠</h3>
                    
                     <article class="column col4">
                        <h4 class="col_tit">Slick Slider</h4>
						<p class="col_desc">slick.js를 이용한 이미지 슬라이드 효과입니다.</p>
						이미지 슬라이드
						<div class="slider">
							<div>
                                <figure>
                                    <img src="image/slider001.jpg" alt="이미지1">
                                    <figcaption><em>Responsive Site</em><span>슬라이드 플러그인을 이용한 반응형 이미지 슬라이드 입니다.</span></figcaption>
                                </figure>
				            </div>
							<div>
                                <figure>
                                    <img src="image/slider001.jpg" alt="이미지2">
                                    <figcaption><em>Responsive Site</em><span>슬라이드 플러그인을 이용한 반응형 이미지 슬라이드 입니다.</span></figcaption>
                                </figure>
				            </div>
				            <div>
                                <figure>
                                    <img src="image/slider001.jpg" alt="이미지3">
                                    <figcaption><em>Responsive Site</em><span>슬라이드 플러그인을 이용한 반응형 이미지 슬라이드 입니다.</span></figcaption>
                                </figure>
				            </div>
						</div>
						//이미지 슬라이드
                    </article> -->


			<!-- //col4 -->

			<!-- <article class="column col5"> -->
			<!--                         <h4 class="col_tit">Filter Effect</h4>
						<p class="col_desc">CSS3에서는 Background-blend-mode, mix-blend-mode, filter와 같이 포토샵에 다루는 효과들이 있습니다.</p>
						lightbox
						<div class="lightbox square clearfix">
							<a href="image/light01_s.jpg"><img src="image/light01.jpg" alt="이미지"><em>blur</em></a>
							<a href="image/light02_s.jpg"><img src="image/light02.jpg" alt="이미지"><em>brightness</em></a>
							<a href="image/light03_s.jpg"><img src="image/light03.jpg" alt="이미지"><em>contrast</em></a>
							<a href="image/light04_s.jpg"><img src="image/light04.jpg" alt="이미지"><em>grayscale</em></a>
							<a href="image/light05_s.jpg"><img src="image/light05.jpg" alt="이미지"><em>hue-rotate</em></a>
							<a href="image/light06_s.jpg"><img src="image/light06.jpg" alt="이미지"><em>invert</em></a>
							<a href="image/light07_s.jpg"><img src="image/light07.jpg" alt="이미지"><em>opacity</em></a>
							<a href="image/light08_s.jpg"><img src="image/light08.jpg" alt="이미지"><em>saturate</em></a>
							<a href="image/light09_s.jpg"><img src="image/light09.jpg" alt="이미지"><em>sepia</em></a>
							<a href="image/light10_s.jpg"><img src="image/light10.jpg" alt="이미지"><em>Mix</em></a>
						</div> -->
			<!--//lightbox -->
			<!-- </article> -->
			<!-- //col5 -->

			<!--             <article class="column col6">
 						<h4 class="col_tit">Video</h4>
						<p class="col_desc">영상을 보여주는 영역입니다.</p>
						video
						<video autoplay="autoplay" controls="controls" loop="loop">
							<source src="img/video.mp4" type="video/mp4">
						</video>
						<div class="video">
							<iframe src="https://www.youtube.com/embed/tHy498wdPaA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div> 
					</article> -->
			<!-- //col6 -->
			<!--                 </section> -->
			<!-- //cont_center -->
			<!-- <section id="cont_right">
                    <h3 class="ir_su">반응형 사이트 오른쪽 컨텐츠</h3>
                    <article class="column col7">
                        <h4 class="col_tit">Effect1</h4>
						<p class="col_desc">CSS3의 transform을 이용한 마우스 오버효과입니다.</p>
						side1
						<div class="side1">
                            <figure class="front">
                                <img src="image/side1.jpg" alt="이미지2">
                            </figure>
                            <div class="back">
                                <i class="fa fa-heart fa-4x" aria-hidden="true"></i>
                            </div>
                        </div>
                        side1//
                    </article>
                    //col7
                    
                    <article class="column col8">
                        <h4 class="col_tit">Effect2</h4>
						<p class="col_desc">CSS3의 transform을 이용한 마우스 오버효과입니다.</p>
						side2
						<div class="side2">
                            <figure class="front">
                                <img src="image/side2.jpg" alt="이미지2">
                                <figcaption>
                                    <h3>Hover Effect</h3>
                                </figcaption>
                            </figure >
                            <figure class="back">
                                <img src="image/side4.jpg" alt="이미지2">
                                <figcaption>
                                    <h3>Hover Effect</h3>
                                </figcaption>
                            </figure>
                        </div>
                        side2//
                    </article>
                    //col8
                    
                    <article class="column col9">
                        <h4 class="col_tit">Effect3</h4>
						<p class="col_desc">CSS3의 transform을 이용한 마우스 오버효과입니다.</p>
						side3
						<div class="side3">
                            <figure>
                                <img src="image/side3.jpg" alt="이미지3">
                                <figcaption>
                                    <h3>Hover<em>Effect</em></h3>
                                </figcaption>
                            </figure>
                        </div>
                        side3//
                    </article>
                    //col9
                </section> -->
			<!-- //cont_right -->
		</div>
	</section>
	<!-- //contents --> </main>

	<!--       <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="footer">
                    <ul>
                        <li><a href="#">사이트 도움말</a></li>
                        <li><a href="#">사이트 이용약관</a></li>
                        <li><a href="#">사이트 운영원칙</a></li>
                        <li><a href="#"><strong>개인정보취급방침</strong></a></li>
                        <li><a href="#">책임의 한계와 법적고지</a></li>
                        <li><a href="#">게시중단요청서비스</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                    <address>
                        Copyright &copy;
                        <a href="http://webstoryboy.co.kr"><strong>webstoryboy</strong></a>
                        All Rights Reserved.
                    </address>
                </div>
            </div>
        </div>
    </footer> -->


	<!-- //footer -->

	<!-- JavaScript Libraries -->
	<!--     <script src="js/jquery.min_1.12.4.js"></script>
    <script src="js/modernizr-custom.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/lightgallery.min.js"></script> -->


	<!--SDB_20191018_사이드 메뉴 .. IF문이 너무 많다 더럽다. 가독성최악이네...  
	이렇게 if문을 많이 한 이유가. 
		contentsTest 태그가 첫번째 태그만 잡힌다.. (밑에 태그들 클릭시 출력값은 contentsTest태그 처음것만 나오네.? : 이유는 모름)
	코드 줄여주면 감사합니다.
-->
	<script> 
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
//alert("4");
				});
//alert("5");
				if($(this).next(".contents").css("display")=="block"){
					$(this).addClass("contents");
					$(this).next().siblings(".contentsTest").slideUp();
//alert("6");
				}else{
//alert("7");					
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
		// 게시판 작업 시작(공지사항 관련된 작업이 끝나면)
		function goBoard(){
			location.href="<%=request.getContextPath()%>/list.bo"
			//BoardListServlet.java 만들기
		}
		
		// logout() 함수 작성하기
		function logout(){
			location.href = '<%=request.getContextPath()%>/logout.me';
		}
		
/* 		// 출석체크
		function loginClickChack(){


			
			
			
			 
		}	*/
		
		$(function(){
			$("#loginChack").click(function(){ 
				document.getElementById("loginChack").style.visibility='hidden';
				var isPerformed = document.getElementById("loginChack").value;
			     if(isPerformed == 'performed')
			     {
			        return false;
			     }
	 			var userId = "<%=loginUser.getUserId()%>";
				var userPwd = "<%=loginUser.getUserPwd()%>";
				location.href = "<%=request.getContextPath()%>/attendance.ck?userId=" + userId + "&userPwd=" + userPwd;
			});
		});
		
		
		
		
 		/* function goHome(){ */
			<%-- //location.href="<%=request.getContextPath()%>/views/common/mainLoing.jsp"; --%>
			<%-- location.href='<%=request.getContextPath()%>/login.me?userId=<% userId %>'; --%>
			
			
			
			<%-- <form id ="loginForm" action="<%=request.getContextPath()%>/login.me" onsubmit="return validate()" method="post"> --%>
		/* } */		 
		
		
	</script>
	<!--END 화면 onclick 이벤트 ------------------------------------------------------------------------>



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
        
        
<%--         $(".btn2").click(function(e){
            e.preventDefault();
            location.href="<%=request.getContextPath()%>/views/common/mainLoing.jsp";
        }); --%>
        
/*         $(window).resize(function(){
            var wWidth = $(window).width();
            if(wWidth > 600){
                $(".nav").removeAttr("style");
            }
        }); */
        
/*         //라이트 박스
        $(".lightbox").lightGallery({
            thumbnail: true,
            autoplay: true,
            pause: 3000,
            progressBar: true
        }); 

        //이미지 슬라이더
        $(".slider").slick({
			dots: true,
			autoplay: true,
			autoplaySpeed: 3000,
			arrows: true,
			responsive: [
			    {
				    breakpoint: 768,
				    settings: {
				        autoplay: false,
			      	}
			    }
			]
		}); */
         
        //sns 공유하기
        $(".facebook").click(function(e){
            e.preventDefault();
            window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no, toolbar=no, resizable=yes, scrollbars=yes, height=300, width=600'); 
        });
        $(".twitter").click(function(e){
            e.preventDefault();
            window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no, toolbar=no, resizable=yes, scrollbars=yes, height=300, width=600');
        });
    </script>

	<script type="text/javascript">
       function makeSurvey(){
          location.href = "views/survey/makeSurvey.jsp";
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
       
       
       
       
       
/* 20191028 */       
/* 작업중 - search 가능하게 */       
       
       $(document).ready(function() {
           $("#alpreah_input").keydown(function(key) {
        	   
        	   var serachText = document.getElementById("alpreah_input").value;
        	   
               if (key.keyCode == 13) {
                   //alert("엔터키를 눌렀습니다." + serachText);
                   location.href = "<%=request.getContextPath()%>/searchList.sv?serachText=" + serachText; 
               } 
  
           });
           
   
           
       });

    </script>


	<script type="text/javascript">
$(document).keydown(function(e) {
    key = (e) ? e.keyCode : event.keyCode;
//alert(key);
    var t = document.activeElement;
     
    /* if (key == 8 || key == 116 || key == 17 || key == 82) { */
   	// 116 : Enter Key 막기
    if (key == 116) {
        if (key == 8) {
            if (t.tagName != "INPUT") {
                if (e) {
                    e.preventDefault();
                } else {
                    event.keyCode = 0;
                    event.returnValue = false;
                }
            }
        } else {
            if (e) {
                e.preventDefault();
            } else {
                event.keyCode = 0;
                event.returnValue = false;
            }
        }
    }
});

</script>



















	<%-- 	<script>
	$(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background":"orangered","cursor":"pointer"});
		}).mouseout(function(){ 
			$(this).parent().css({"background":"white"}); 
		}).click(function(){
			var bnum=$(this).parent().children("input").val();
			
			location.href="<%=request.getContextPath()%>/detail.bo?bnum=" + bnum;			

		});
	});
	</script> --%>

	<%-- 	<script>
	$(function(){
		$("#listArea td").mouseenter(function(){
		}).click(function(){
			var bnum=$(this).parent().children("input").val();
			
			location.href="<%=request.getContextPath()%>/detail.bo?bnum=" + bnum;			
			
			$(this).parent().css({"background":"darkgray","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"black"});
		}).click(function(){
			var bnum=$(this).parent().children("input").val();
			
			location.href="<%=request.getContextPath()%>/detail.bo?bnum=" + bnum;

		});
	});
	</script> --%>



















	<!-- 화면 맨아래 보이게 -->
	<%-- <%@ include file="../common/footer.jsp" %> 
.. ... 일단 나중에... 흘

--%>






















</body>




</html>