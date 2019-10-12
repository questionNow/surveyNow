<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%

/* 세션에서 attribute로 무언가를 가져오면 Object형으로 가져와짐, 꼭 다운캐스팅을 실행해야 함 */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
<title>메뉴바</title>
<style>
	body{
		background : url('') no-repeat;
		background-size : cover; /* 화면에 꽉차게 해라 */
	}
	#loginBtn input, #memberJoinBtn, #logoutBtn, #myPage{
		display : inline-block;
		vertical-align : middle;
		text-align : center;
		background : orangered;
		color : white;
		width : 100px;
		border-radius : 5px;
	}
	
	#memberJoinBtn{
		background : yellowgreen;}
	
	#loginBtn input:hover, #changeInfo:hover, #logoutBtn:hover, #memberJoinBtn:hover, #myPage:hover{
		cursor : pointer; /* 마우스 커서 올리면 손가락 모양으로 바뀜 */
	}
	.loginArea > form, #userInfo{
		float : right;
	}
	#logout, #mypage{
		background : orangered;
		color : white;
		text-decoration : none;
		border-radius : 5px; 
	}
	#myPage{
		background : yellowgreen;
	}
	.wrap{
		background : black;
		width : 100%;
		height : 50px;
	}
	.menu{
		background : black;
		color : white;
		text-align : center;
		vertical-align: middle;
		width : 150px;
		height : 50px;
		display : table-cell;  /* <td>속성처럼 만들어 줌 */
	}
	.nav{
	width : 600px;
	margin-left : auto;
	margin-right : auto;
	}
	.menu:hover{
		background : darkgray;
		color : orangered;
		font-weight : bold;
		cursor : pointer;
	}
	body > h1{
	cursor : pointer;
	}
</style>
</head>
<body>
		<h1 align = "center" onclick = "goHome();">설문 NOW!</h1>
		<div class = "loginArea">
			
			<form id = "loginForm" action ="<%=request.getContextPath()%>/login.me" onsubmit = "return validate();" method = "post">
				<table>
					<tr>
						<td><label>ID : </label></td>
						<td><input type = "text" name = "userId" id = "userId"></td>
					</tr>
					<tr>
						<td><label>PWD : </label></td>
						<td><input type = "password" name = "userPwd" id = "userPwd"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type = "checkbox" name = "saveId" id = "saveId">&nbsp;
							<label for ="saveId">아이디 저장</label>
						</td>
				</table>
				
				<div class = "btns" align = "center">
					<div id = "memberJoinBtn" onclick = "memberJoin();">회원가입</div>
					<div id ="loginBtn"><input type = "submit" value = "로그인"></div>
				
				</div>
			</form>
			
				<div id = "userInfo">
					<label>님의 방문을 환영합니다.</label>
					<div class = "btns" align = "right">
						<div id = "myPage" onclick = "location.href='/jspProject/myPage.me?userId='">정보 수정</div>
						<!-- ? 뒤가 query String이라고 함.
						jspProject(context root)에있는 myPage.me라는 Class를 찾아가라, 그래서 처음에 classes 폴더를 web/WEB-INF에 만들고 build path를 설정해둠  -->
						<div id = "logoutBtn" onclick = "logout();">로그아웃</div>
					</div>
				</div>
			
		</div>
		
		<script type="text/javascript">
			//	validate() 함수 작성하기(form 태그가 submit 되었을 경우 발동)
			function validate(){
				if($("#userId").val().trim().length==0){
					// trim() = 띄어쓰기 포함 길이가 0일 경우 확인 할 때 사용
					alert("아이디를 입력하세요!");
					$("#userId").focus();
					return false;	// return 값이 false일 경우 submit 실행이 되지 않음.
				}
				if($("#userPwd").val().trim().length==0){
					alert("비밀번호를 입력하세요!");
					$("#userPwd").focus();
					return false;
				}
				return true;
			}
		</script>
		
		<!--	메뉴 만들기	-->
		<br clear = "both">	<!--	이전에 사용한 float 속성을 제거해야 이후에 태그들이 속성 적용이 안됨 -->
		<br>
		
		<div class = "wrap">
			<div class = "nav">
				<div class = "menu" onclick = "goSurvey();">설문</div>
				<div class = "menu" onclick = "goPurchase();">구매하기</div>
				<div class = "menu" onclick = "goNotice();">공지사항 / 이벤트</div>
				<div class = "menu" onclick = "goQna();">고객센터</div>
			</div>
		</div>
	<script>
	
	// 메인 로고 누르면 메인 페이지로 이동하기
		function goHome(){
			location.href= "<%=request.getContextPath()%>/index.jsp";
		}
	
	// 설문 페이지로 이동하기
		function goSurvey(){
			location.href = "../survey/survey.jsp";
		}
	
	// 공지사항 / 이벤트 페이지로 이동하기
		function goNotice(){
		location.href = "<%= request.getContextPath()%>/noticeView.no"
	}
	
		function goPurchase(){
			location.href = "<%= request.getContextPath()%>/purchaseView.purchase";
		}
		function goQna(){
			location.href="<%=request.getContextPath()%>/qnaView.qna";
		
		}
		
	</script>
		
</body>
</html>