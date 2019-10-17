<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
/* Create a column layout with Flexbox */

/* Right column (page content) */
.right {
	width: 85%;
	padding: 15px;
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
	<%-- <%@ include file="surveySideBar.jsp"%> --%>
	<div class="row">
		<div class="right" style="background-color: #ddd;">
			<h2>설문 만들기</h2>
			<div id="surveyType">
				<button id="pick" onclick="addQuestion()" >+객관식</button>
				<button id="write" onclick = "check()">+주관식</button>
				<button id="rank">+순위</button>
			</div>
			<form action = "<%=request.getContextPath()%>/surveyMake.sv">
				<div id="survey">

					<h2>
						설문 제목<input type="button" id="reset" onclick="resetSurvey();"
							style="float: right" value="초기화">
					</h2>
					<input name = "sNum" type="hidden" value="1">
					<input type="text" name = "sTitle" placeholder="설문 제목을 입력하세요">
					<h3>질문을 추가하시려면 위에 질문 타입을 선택해주세요 :)</h3>
				</div>

				<br><br><br>
				<button>저장</button>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		var qCount = 0;
		function addQuestion() {
			qCount++;
			$("#survey")
					.append(
							"<div id='question"+qCount+"'><input type = hidden value = '객관식'>객관식 질문<input type='button' value='질문 삭제' onclick='deleteQuestion("+qCount+");' style='float: right'></h3><h3>질문 제목<input type='button' value='항목 추가' onclick='addAnswer("+qCount+");' style='float: right'></h3><input id='qTitle' type='text' placeholder='질문 제목을 입력하세요'></div>")

		}
		var aCount = 0;
		function addAnswer(num) {
			aCount++;
			$("#question"+num)
					.append(
							"<div id='answer"+aCount+"'><h4>항목 <input class = 'answer' id= 'answer' name = 'aContent' type='text' placeholder='항목을 입력하세요'><input type='button' value='삭제' onclick='removeAnswer("+aCount+");' style='float: right'></h4></div>");
		}
		function resetSurvey() {
			qCount =0;
			aCount =0;
			$("#survey div").remove();
		}
		
		function deleteQuestion(num){
			$("#question" + num).remove();
		}
		function removeAnswer(num){
			$("#answer"+num).remove();
		}
		
		function check(){
			var list = $(".answer");
			console.log(list);
			console.log(list[0].text);
		}
	</script>

	
</body>
</html>