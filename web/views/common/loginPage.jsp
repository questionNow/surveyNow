<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="user.model.vo.UserInfo1"%>
    <!-- pageEncoding="UTF-8" import="member.model.vo.Member"%> -->
        
    
<%
	/* LoginServlet.java에서 설정한 세션 정보 사용하기 */
	UserInfo1 loginUser = (UserInfo1)session.getAttribute("loginUser");
	// session의 attribute로써 객체를 끄집어 내면 무조건 Object형이므로 다운캐스팅 해주어야 한다.ㅗ
	// Member 에러나는데 import 해주면된다.
	// Type mismatch: cannot convert from Object to Member 에러 : 자료형이 object형이라 다운캐스팅 해줘야한다.
	
	//jsp 출력 함수 out.print();
	// out.print(loginUser);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- < %@ : 페이지 정보, import 할때 -->
<!-- < %= : 자바의대한 값들 -->

<!-- <script>
	$(function(){
		alert("되냐");
	});
</script> -->
<style>
	/* 하단 고정 */
/* 	html {
		height: 100%;
	} */
	
	
	
/* 	* {
		box-sizing: border-box;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
	} */
 
	html{
		height: 100%;
		margin: 0;
		/* background-size:cover; */
/* 		margin-left:auto;
		margin-right:auto; */
		<%-- background:url('<%=request.getContextPath()%>/image/logoinImage.jpg') repeat; --%>

		
		
		/* cover : 화면 전체꽉차게 */  
	}
	
	#loginBtn input, #memberJoinBtn, #logoutBtn, #myPage{
		display:inline-block; 
		vertical-align:middle; 
		text-align:center;
		background:orangered;
		color:white;
		height:25px;
		width:100px;
		border-radius:5px;
	}
	
	#memberJoinBtn{
		background:yellowgreen;
	}
	
	#loginBtn:hover, #changeInfo:hover, #logoutBtn:hover, #memberJoinBtn:hover, #myPage:hover{
		cursor:pointer;
		/* cursor:pointer : 마우스 올리면 커서모양으로 변경 */
	}
	.loginArea, #userInfo{

/* 		float:right;
		position:fixed;
		text-align:center;
		height:100%; 
		width:100%; */
		/* from 태그가 오른쪽으로 나와라*/
	}
	
	#logout, #myPage{
		background:orangered;
		color:white;
		text-decoration:none;
		border-radius:5px;
	}
	.wrap{
		background:black;
		width:100%;
		
	}
	.menu{
		background:black;
		color:white;
		text-align:center;
		vertical-align:middle;
		width:300px;
		height:50px;
		
		/* display:table-cell : <td>속성처럼 만들어 줌 */
	}
	.menu2{
		display:black;
		width:100%;
		height:100%;
	}
	
	.nav{
		width:600px;
		margin-left:auto;
		margin-right:auto;
	}
	.menu:hover{
		background:darkgray;
		color:orangered;
		font-wight:bold; 
		cursor:pointer;
	}
	
	/* == 10. Horizontal menu Background == */
	
	/*====================
		Color Scheme Begin
	=====================================================================
	====================================================================*/
	
	/* Menu bar background color */
	#navigation, 
	#nav li ul li, 
	#nav li ul li a{
	background: #000; 
	}
	
	/* Menu Item text color */
	#nav li a, 
	#nav li a:hover, 
	#nav li ul li,
	#nav li ul li a,
	#nav li ul li a:hover  {
	color: #fff; 
	}
	
	/* Menu Item background color on hover */
	#nav li a:hover, 
	#nav li ul li a:hover  {
	background: #FF8C00; 
	}
	
	/* Text Shadow */
	#nav li a, 
	#nav li a:hover, 
	#nav li ul li a:hover  {
	text-shadow: 0 1px 1px #333; 
	}
	
	/* Search form colors */
	.searchform input, .searchform input:not(:focus){
	color:#B1B1B1; /*search form text color default*/
	background: #fff; /*search form background color default*/
	}
	.searchfield:focus{
	color: #000; /* search form text color after click */
	}
	
	/*=====================================================================
	=======================================================================
		Color Scheme End
	====================*/
	
	#menu_div{  
	clear: both;
	/* position: relative; 
	메뉴바 상단 고정을 위해 주석처리함          
	*/
	top: 0; 
	left: 0;
	} /* Free space to top specialy for menu */
	
	#navigation {
	/* position: fixed;
	position:absolute; */
	position: absolute;
	}
	
	#navigation, #menu_div {
	width: 100%;
	margin: 0 !important;
	padding: 0 !important;
	}
	
	#menu_div, #navigation, #menu, #nav{
	height: 45px; /* menu height */
	}
	
	#menu_div:hover,
	#navigation:hover,
	#nav li a:hover, #nav li ul a 
	{
	opacity: 0.95;/* Menu transparency on mouse hover*/
	} 
	
	#menu_div,
	#navigation, 
	#nav li a, 
	#menu_div:not(:hover), 
	#navigation:not(:hover)
	{
	opacity: 0.8;/* Menu transparency on mouse out */
	}
	
	
	#menu {
	width: 960px;
	margin:0 auto; /*center the menu*/
	padding:0;
	position: relative;
	}
	
	#nav{
	width: 960px;
	margin:0;
	padding:0;
	position: relative;
	font-family: 'Arial', Helvetica, sans-serif;
	}
	
	#nav li a,#nav li {
	float:left;
	}
	
	#nav li {
	list-style:none;
	position:relative;
	}
	
	#nav li a {
	line-height: 45px;
	padding:0 15px;
	text-decoration:none;
	margin:0;
	font-size:12px;
	font-weight:700; 
	text-transform:uppercase;
	}
	
	/*====================
		Submenu 
	=====================*/
	#nav li ul {
	display:none;
	position:absolute;
	left:0;
	top:100%;
	padding:0;
	margin:0;
	} /* hide submenu */
	
	#nav li:hover > ul {
	display:block;
	} /* show submenu on hover */
	
	#nav li ul li,#nav li ul li a {
	float:none;
	height: 35px; /* submenu item height */
	min-width: 150px; /* submenu item minimal width */
	line-height: 35px;
	border-right: 0;
	text-shadow: none;
	display:block;
	font-size:13px;
	font-weight:400;
	text-transform:inherit;
	} /* Submenu item */
	
	#nav li ul li {
	_display:inline; /* for IE */
	}
	
	/* == 12. Sub-Sub Menu == */
	#nav li ul li ul {
	display:none;
	}
	
	#nav li ul li:hover ul {
	left:100%;
	top:0;
	}
	
	/*====================
		Search form 
	====================*/
	
	.searchform {
	position: absolute;
	right: 15px;
	top: 6px;
	display: inline-block;
	zoom: 1;
	*display: inline;
	border: 0;
	padding: 0;
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
	border: 2px solid #333;
	outline: none;
	-webkit-border-radius: 2em;
	-moz-border-radius: 2em;
	border-radius: 2em;
	-moz-box-shadow: inset 1px 1px 2px #A1A1A1;
	-webkit-box-shadow: inset 1px 1px 2px #A1A1A1;
	box-shadow: inner 1px 1px 2px #A1A1A1;
	}
	
	.searchfield:focus{
	font-weight: 700;
	width: 220px;
	}
	
	.searchfield:not(:focus){
	width: 150px;
	}
	
	
	/*========================
			Transitions
	========================*/
	
	#nav li a:hover,
	#nav li ul li a:hover  {
	-webkit-transition-property:color, background; 
	-webkit-transition-duration: 0.5s, 0.5s; 
	-webkit-transition-timing-function: linear, ease-out;
	}
	
	.searchfield:focus,
	.searchfield:not(:focus){
	-webkit-transition-property:width; 
	-webkit-transition-duration: 0.5s, 0.5s; 
	-webkit-transition-timing-function: linear, ease-out;
	}
	
	#menu_div:hover,
	#navigation:hover,
	#nav li ul a, 
	#menu_div,
	#navigation, 
	#nav li a, 
	#menu_div:not(:hover), 
	#navigation:not(:hover)
	{
	-webkit-transition-property:opacity; 
	-webkit-transition-duration: 0.5s, 0.5s; /* duration in seconds */
	-webkit-transition-timing-function: linear, ease-out;
	} /* Menu transparency animation */

	 /* 사이드바 */
		/* # {
			width:100%;
			height:100px;
			background:white;
		} */
		#sidebar {
			background: #333;
			width: 300px;
			height: 100%;
			top: 0;
			/* left: -300px; */
			right: -300px;
			position: fixed; 
		}
		#sidebar > ul {
			margin:0;
			padding: 0;
			top:50px; 
			left:70px;
			position: absolute;
		}
		#sidebar li {
			margin: 0 0 20px;
			list-style: none;
		}  
		#sidebar > button {
			background:#333; 
			position: absolute;
			top: 199px; 
			right: 300px; 
			width: 52px;
			height: 52px;  
			border: none; 
			color: white;
			cursor:pointer;
		}
/* 		#btn_t{ 
			background:#333; 
			position: absolute;
			top: 150px;
			right: 300px;
			width: 52px;
			height: 52px; 
			border: none; 
			color: white;
			cursor:pointer;		
		} */
		
		
	  
/* 		.sideMenu{ 
			width:300px;
			heigth:30px;
			background:yellowgreen;
			color:orangered;
			border-radius:10px; 
			text-align:center;
			border:1px solid green;
			cursor:pointer;
		} */
		p{
			border:1px solid lightgray;
			width:300px;
			height:200px;
			/* display:none; */
			/* display:blick; */	/* 처음 다열려있음 */
			display:none;
		}
		 .contents{
			/* border:1px solid lightgray; */
			width:300px; 
			height:200px;  	
			/* display:none; */ 
			/* display:blick; */
			display:none;
			color:orangered;
		}
		 .lowMenu:hover{	
			color:white;
			font-wight:bold; 
			cursor:pointer;
		}
	 
		#wrap:hover,
		#sidebar:hover{
			opacity: 0.95;
			cursor:pointer;
		}
		#wrap,
		#sidebar{
			opacity: 0.8;
			cursor:pointer;
		}	
		 
	/* 메뉴 상단 고정  */
		.jbFixed { 
			position: fixed;
			top: 0px;
		}


	/* 사이드 메뉴 에 내정보/로그아웃  */
	
	.mySideMenu2{ 
		height:50px;
		width:300px;
 
		margin-left:80px;
		margin-right:auto;
	}
	
	.mySideMenu{ 
		display: inline;
		background:orangered;
		color:white; 
		height:100%;
		width:100%;
		/* border-style:outset; */
		/* border-radius:5px; */

	}
	 
</style>
<title>Insert title here</title>
</head>
<body>
	<h1 align = "center">로그인 화면 CSS는 나중에</h1>
															<%-- action="<%=request.getContextPath()%>/login.me" 
																: 입력 정보를 @WebServlet("/login.me") 으로 보냄
																: method="post" 방식으로
															--%>
	<div class = "loginArea">								<!-- /login.me : Servlet을 찾아감 -->
	
<%-- 	<%if(loginUser == null) {%> --%>
		<form id ="loginForm" action="<%=request.getContextPath()%>/login.me" 
		onsubmit="return validate()" method="post"> <!-- validate() 을 실행하고 난뒤의 반환값(return) -->
			<div class="btns" align="center">
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
							<label for="saveId">아이디 저장(...안되~)</label>
						</td>
					</tr>
				</table>
			
				<div id="memberJoinBtn" onclick = "memberJoin();">회원가입</div>
				<div id="loginBtn"><input type="submit" value="로그인"></div>
			</div>
			
		</form>
<%-- 	<%} else{%>
		<div id ="userInfo">
			<label><%=loginUser.getUserName() %>님의 방문을 환영합니다.</label>
			<div class="btns" align="right">
											<!-- request.getContextPath() 동일한 의미 : /jspProject/
												/jspProject/ : Context루트명 -->
											<!-- 쿼리스트링 방식 : /jspProject/mypage.me?userId=loginUser.getUserId() 
												- ? 이후를 쿼리스트링 이라 한다.
												- 어떤이름?어떤값
												- mypage.me : 클래스파일을 의미 classes 밑에 MyPageServlet.class 자동으로 찾아감
											-->
											<!-- @조사필요 쿼리스트림 방식-->
				<div id="myPage" onclick="location.href='/jspProject/mypage.me?userId=<%=loginUser.getUserId()%>'">정보수정</div>
				<div id="logoutBtn" onclick="logout()">로그아웃</div>
			</div>
		</div>
	<%} %> --%>
	</div>
	
	
	<!-- 메뉴 만들기 -->
	<br clear="both"> <!-- 이전 float:right; float속성을 제거해주자(이후 나올 태그들은 float속성이 안먹게 -->
	<br>
<!-- 	<div class="wrap">
		<div class="nav">
			<div class="menu" onclick="goHome();">HOME</div>
			<div class="menu" onclick="goNotice();">공지사항</div>
			<div class="menu" onclick="goBoard();">게시판</div>
			<div class="menu" onclick="goThumbnail();">사진게시판</div>
		</div>
	</div> -->
	
<!--STR 입력 조건 script -------------------------------------------------------------------------->	
	<script>
		// validate() 함수 작성하기(form태그가 submit되었을 때 실행됨)
		function validate(){
			if($("#userId").val().trim().length ==0){
				alert("아이디를 입력하세요");
				$("#userId").focus();
				
				return false; // return값이 false이면 submit이 되지 않는다.
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
			location.href = '<%=request.getContextPath()%>/logout.me';
			
			// LogoutServlet 만들기~ 꼬꼬씽~
		}
		
		// 회원가입용 함수 memberJoin() 함수 작성하기
		function memberJoin(){
			location.href="<%=request.getContextPath()%>/views/member/memberJoinForm.jsp";
		}
		
	</script>
<!--END 입력 조건 script -------------------------------------------------------------------------->

<!--STR 화면 onclick 이벤트 ------------------------------------------------------------------------>
	<script>
		function goHome(){
			location.href="<%=request.getContextPath()%>/index.jsp";
		}
		
		// 공지사항 작업 시작!(회원 관련된 작업이 끝나면)
		function goNotice(){
			location.href="<%=request.getContextPath()%>/list.no";
			// NoticeListServlet 만들기
		}
		
		// 게시판 작업 시작(공지사항 관련된 작업이 끝나면)
		function goBoard(){
			location.href="<%=request.getContextPath()%>/list.bo"
			//BoardListServlet.java 만들기
		}
		
		//사직 게시판 작업 시작
		function goThumbnail(){
			location.href="<%=request.getContextPath()%>/list.th";
			//ThumbnailListServlet
		}

	</script>
<!--END 화면 onclick 이벤트 ------------------------------------------------------------------------>

<!--STR 사이드 메뉴 슬라이드 이벤트 --------------------------------------------------------------------->
<!-- 	<script type="text/javascript">
		$(function(){
			var duration = 300;
	
			var $side = $('#sidebar');
			var $sidebt = $side.find('button').on('click', function(){
				$side.toggleClass('open');
	
				if($side.hasClass('open')) {
					$side.stop(true).animate({right:'0px'}, duration);
					$sidebt.find('span').text('CLOSE');
				}else{
					$side.stop(true).animate({right:'-300px'}, duration);
					$sidebt.find('span').text('OPEN');
				};
			});
		});
	</script> -->
<!--END 사이드 메뉴 슬라이드 이벤트 --------------------------------------------------------------------->

<!--STR 사이드 메뉴 안의 핸들러 ------------------------------------------------------------------------><%-- 
	<script>
	// https://easings.net/ 사이트에서 api 가져와서 사용 가능 (여러가지 이벤트핸들러 제공)
		$(function(){
			$('.menu').click(function(){
				
				
				$(this).next().slideDown();
				/* $(this).next("p").slideToggle(1000,function(){
				console.log('토글완료!');
			}); */
			/* $(this).next("p").slideToggle(1000,'easeInOutBounce'); */
				 
		 		<%if(  != null) {%>
					<div id="myPage2" class="mySideMenu" onclick="location.href='/jspProject/mypage.me?userId=<%=loginUser.getUserId()%>'">정보수정</div>
				<%}else{ %>
					<div id="myPage2" class="mySideMenu" >정보수정</div>
				<%} %>
				
/* 				$(this).next(".contents").slideDown(function(){			
					$(this).next().siblings(".contents").slideUp();	
				}); */
				
								
				$(this).next().siblings(".contents").slideUp();	// 하나씩만 열림 - */ 

				
				
				
				//1. 클래스 추가 및 제거
/*  				$(this).next().slideDown(function(){
					$(this).addClass("contents");
				});
				
				$(this).next(".contents").slideUp(function(){			
					$(this).removeClass('contents');
				}); */

				
				
				
				
				
			});
		});
	</script> --%>
<!--END 사이드 메뉴 안의 핸들러 ------------------------------------------------------------------------>

<!--STR  메뉴상단 고정  script ----------------------------------------------------------------------->
<!-- 	<script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
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
    </script> -->
<!--END  메뉴상단 고정  script ----------------------------------------------------------------------->

<!--=====================================
				Top Fixed Navigation Menu BEGIN
		======================================-->
<!-- 		<div id="menu_div" class="jbMenu">
			<div id="navigation">
				<div id="menu">
					<ul id="nav">
						<li><a href="#" onclick="goHome();">Home</a>
							<ul>
								<li><a href="#">이런식으로</a></li>
								<li><a href="#">상단메뉴 구성</a></li>
								<li><a href="#">하면되려나?</a></li>
								<li><a href="#">일단 이렇게 하고 더좋은건 나중에찾자..</a></li>
								<li><a href="#">예제 - Item - Level 2</a>
									<ul>
										<li><a href="#">Sub item 1</a></li>
										<li><a href="#">Sub item 2</a></li>
										<li><a href="#">Item - Level 3</a>
											<ul>
												<li><a href="#">Sub sub item 1</a></li>
												<li><a href="#">Sub sub item 2</a></li>
												<li><a href="#">Item - Level 4</a>
													<ul>
														<li><a href="#">Sub sub sub item 1</a></li>
														<li><a href="#">Sub sub sub item 2</a></li>
														<li><a href="#">Sub sub sub item 3</a></li>						
													</ul>
												</li>	Level 4 END					
											</ul>
										</li>	Level 3 END					
									</ul>
								</li>	Level 2 END					
							</ul> 
						</li> Level 1 END
						END Home Item
						
						<li><a href="#" onclick="goNotice();">공지사항</a></li>
						
						END Portfolio Item
						
						<li><a href="#" onclick="goBoard();">게시판</a></li>

						END Blog Item
						
						<li><a href="#" onclick="goThumbnail();">사진게시판</a></li>
						<li><a href="#">마이페이지</a>
							<ul>
								<li><a href="#">개인정보 수정</a></li>
								<li><a href="#">설문 관리</a></li>
								<li><a href="#">포인트 관리</a></li>
							</ul>
						</li>
						<li><a href="#">설문관리</a>
							<ul>
								<li><a href="#">설문 만들기</a></li>
								<li><a href="#">작성된 설문</a></li>
								<li><a href="#">진행중인 설문</a></li>
								<li><a href="#">완료된 설문</a></li>
								<li><a href="#">결제 설문</a></li>
							</ul>						
						</li>
						<li><a href="#">회원관리</a>
							<ul>
								<li><a href="#">회원 조회</a></li>
								<li><a href="#">패널 랭킹</a></li>
								<li><a href="#">경고 회원 관리</a></li>
							</ul>						
						</li>	
						<li><a href="#">상품관리</a>
							<ul>
								<li><a href="#">상품 등록</a></li>
								<li><a href="#">상품 관리</a></li>
							</ul>						
						</li>	
						<li><a href="#">고객센터</a></li>	
						
					</ul>#nav END
					
					Search Form
					<form class="searchform" action="#"> 
						<input class="searchfield" type="text" value="Search..." onfocus="if (this.value == 'Search...') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Search...';}" />
					</form>
					/ Search Form
					 
				</div>#menu END
			</div>#navigation END
		</div>#menu_div END
		=====================================
				/Top Fixed Navigation Menu END 
		====================================== -->



	<!-- 사이드 메뉴 구성 -->
	
<%-- 		<div id ="userInfo">
			<label><%=loginUser.getUserName() %>님의 방문을 환영합니다.</label>
			<div class="btns" align="right">
											<!-- request.getContextPath() 동일한 의미 : /jspProject/
												/jspProject/ : Context루트명 -->
											<!-- 쿼리스트링 방식 : /jspProject/mypage.me?userId=loginUser.getUserId() 
												- ? 이후를 쿼리스트링 이라 한다.
												- 어떤이름?어떤값
												- mypage.me : 클래스파일을 의미 classes 밑에 MyPageServlet.class 자동으로 찾아감
											-->
											<!-- @조사필요 쿼리스트림 방식-->
				<div id="myPage" onclick="location.href='/jspProject/mypage.me?userId=<%=loginUser.getUserId()%>'">정보수정</div>
				<div id="logoutBtn" onclick="logout()">로그아웃</div>
			</div>  
		</div>	 --%>
<%-- 	<div id="wrap">
		<aside id="sidebar">
			<button><span class="btn_t" id="btn_t">OPEN</span></button>
				<div class="wrap">
					<div class="nav">
						<div class="mySideMenu2">
							<%if(loginUser != null) {%>
								<div id="myPage2" class="mySideMenu" onclick="location.href='/jspProject/mypage.me?userId=<%=loginUser.getUserId()%>'">정보수정</div>
							<%}else{ %>
								<div id="myPage2" class="mySideMenu" >정보수정</div>
							<%} %>
							
							<div id="logoutBtn2" class="mySideMenu" onclick="logout()">로그아웃</div>
						</div>
					</div>	
					
					<div class="menu2">
					<div class="menu">마이페이지</div>
						<ul class="contents">
							<li id="asd" class="lowMenu">
								개인정보 수정
							</li>
							<li id="asd1" class="lowMenu">
								설문 관리
							</li>
							<li id="asd2" class="lowMenu">
								포인트 관리
							</li>
						</ul>
					
						<div class="menu" >설문관리</div>
							<ul class="contents">
								<li id="asd" class="lowMenu">
									설문 만들기
								</li>
								<li id="asd1" class="lowMenu">
									작성된 설문
								</li>
								<li id="asd2" class="lowMenu">
									진행중인 설문
								</li>
								<li id="asd3" class="lowMenu">
									완료된 설문
								</li>
								<li id="asd4" class="lowMenu">
									결제 설문
								</li>
							</ul>
						<div class="menu" >회원관리</div>
							<ul class="contents">
								<li id="asd" class="lowMenu">
									회원 조회
								</li>
								<li id="asd1" class="lowMenu">
									패널 랭킹
								</li>
								<li id="asd2" class="lowMenu">
									경고 회원 관리
								</li>
							</ul>
						<div class="menu">상품관리</div>
							<ul class="contents">
								<li id="asd" class="lowMenu">
									상품 등록
								</li>
								<li id="asd1" class="lowMenu">
									상품관리
								</li>
							</ul>
							
						</div>
						
						
					</div> --%>

		<!-- 		<div class="sideMenu">첫 번째 메뉴</div>
					<ul class="contents">
						<li id="asd">
							하위메뉴
						</li>
						<li id="asd1">
							하위메뉴1
						</li>
						<li id="asd2">
							하위메뉴2
						</li>
					</ul>
				<div class="sideMenu">두 번째 메뉴</div>
					<ul class="contents">
						<li id="asd">
							하위메뉴
						</li>
						<li id="asd1">
							하위메뉴1
						</li>
						<li id="asd2">
							하위메뉴2
						</li>
					</ul>
				<div class="sideMenu">세 번째 메뉴</div>
				<p class="contents">내용</p>
				<div class="sideMenu">네 번째 메뉴</div>
				<p class="contents">내용</p>
				<div class="sideMenu">다섯 번째 메뉴</div>
				<p class="contents">내용</p> -->
				
				
		</aside>
		
	</div>



	<!-- footer 하단 고정 -->	
<!-- 	<div>	
		<h3>	회사 소개 및 지도 API 끌어오기	</h3>
	</div> -->





























</body>
</html>