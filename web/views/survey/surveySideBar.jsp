<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

/* Left column (menu) */
.left {
	float: left;
	width: 9%;
	padding: 15px 0;
	text-align: center;
	
}

.left h2 {
	padding-left: 8px;
}
/* Style the navigation menu inside the left column */
#myMenu {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

#myMenu li a {
	padding: 12px;
	text-decoration: none;
	color: black;
	display: block
}

#myMenu li a:hover {
	background-color: #eee;
}

#surveyList * {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#surveyListTable {
	
}
</style>
</head>
<body>
	<%@ include file = "../common/menubar.jsp" %>

<h2>설문!!!</h2>
<p>설문을 작성하고 배포 해보세요 :)</p>


	<div class="row">
		<div class="left" style="background-color: #bbb;">
			<h2>설문</h2>

			<ul id="myMenu">
				<li><a href="survey.jsp">내 설문함</a></li>
				<li><a href="makeSurvey.jsp">설문 만들기</a></li>
				<li><a href="deletedSurvey.jsp">휴지통</a></li>
				<li><a href="purchaseSurvey.jsp">결제하기</a></li>
				<li></li>
				<li></li>
				<li style="text-align: center"><button>사용설명서</button></li>
			</ul>
		</div>
	</div>

</body>
</html>