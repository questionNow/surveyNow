<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 만들기</title>
<style>
/* Create a column layout with Flexbox */

/* Right column (page content) */
.right {
	width: 85%;
	padding: 15px;
	height: auto;
	display: inline-block;
}

#surveyList * {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#surveyListTable, #surveyListTable tr, #surveyListTable th,
	#surveyListTable td {
	border-top: 1px solid orangered;
	border-bottom: 1px solid orangered;
}

th h3:hover {
	cursor: pointer;
}

#survey>div {
	border: 1px solid red;
}
</style>
</head>
<body>
	<%@ include file="surveySideBar.jsp"%>
<body>
	<div class="row">
		<div class="right" style="background-color: #ddd;">
			<h2>설문 만들기</h2>
			<div id="surveyType">
				<button id="pick">+객관식</button>
				<button id="write">+주관식</button>
				<button id="rank">+순위</button>
			</div>
			<form action="<%=request.getContextPath()%>/surveyMake.sv">
				<div id="survey">

					<h2>
						설문 제목<input type="button" id="reset" onclick="resetSurvey();"
							style="float: right" value="초기화">
					</h2>
					<input name="sNum" type="hidden" value="1"> <input
						type="text" name="sTitle" placeholder="설문 제목을 입력하세요">
					<h3>질문을 추가하시려면 위에 질문 타입을 선택해주세요 :)</h3>
					<div id = "question">
						<div id = "answer">
						
						</div>
					</div>
				</div>

				<br>
				<br>
				<br>

			</form>
		</div>
	</div>
	<script type="text/javascript">

	</script>


</body>
</html>