<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, survey.model.vo.*"%>
<%
	ArrayList<Survey> sList = (ArrayList<Survey>)request.getAttribute("sList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Survey</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

.right {
	width: 55%;
	padding: 15px;
	display: inline-block;
}

#surveyList * {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}
</style>
</head>

</head>
<body>
	<%@ include file="../common/menubar2.jsp" %>
	
	<div class="row">
		<div class="right" style="background-color: #ddd;">
			<h2>설문 만들기</h2>
			<div id="surveyType">
				<button id="pick" onclick="addQuestion()">+객관식</button>
				<button id="write" onclick="check()">+주관식</button>
				<button id="rank">+순위</button>
			</div>
			<form action="<%=request.getContextPath()%>/surveyMake.sv">
				<div id="survey">

					<h2>
						설문 제목<input type="button" id="reset" onclick="resetSurvey();"
							style="float: right" value="초기화">
					</h2>
					<input type="text" name="sTitle" placeholder="설문 제목을 입력하세요" size = "100px">
					<h3>요청 패널 수 <input name = sCount type=number min="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 포인트 / 패널 <input name = sPoint type=number min="50" step = "50"></h3>
					<input name="userId" type="hidden" value="<%= loginUser.getUserId() %>">
					
					 <div>
						<label>패널 조건</label><br>
						<input type=checkbox id=sports name=sInterest value=스포츠> <label
							for=sports style="letter-spacing: 6.7px"> 스포츠 </label> <input
							type=checkbox id=food name=sInterest value=음식> <label
							for=food> 음식 </label> <input type=checkbox id=trip name=sInterest
							value=여행> <label for=trip style="letter-spacing: 6.5px">
							여행 </label> <input type=checkbox id=game name=sInterest value=게임>
						<label for=game style="letter-spacing: 12.8px"> 게임 </label> <input
							type=checkbox id=science name=sInterest value=과학> <label
							for=science> 과학 </label> <br> <input type=checkbox
							id=fashion name=sInterest value=패션> <label for=fashion>
							패션/쇼핑 </label> <input type=checkbox id=it name=sInterest value=IT>
						<label for=it style="letter-spacing: 7.7px"> IT </label> <input
							type=checkbox id=car name=sInterest value=자동차> <label
							for=car> 자동차 </label> <input type=checkbox id=society
							name=sInterest value=사회이슈> <label for=society>
							사회이슈 </label> <input type=checkbox id=celebrity name=sInterest value=연예인>
						<label for=celebrity> 연예인 </label> <br> <input type=checkbox
							id=childrenEdu name=sInterest value=육아> <label
							for=childrenEdu style="letter-spacing: 15.4px"> 육아 </label> <input
							type=checkbox id=hire name=sInterest value=취업> <label
							for=hire> 취업 </label> <input type=checkbox id=education
							name=sInterest value=교육> <label for=education
							style="letter-spacing: 6.3px"> 교육 </label> <input type=checkbox
							id=family name=sInterest value=가족> <label for=family
							style="letter-spacing: 12.8px"> 가족 </label> <input type=checkbox
							id=cultural name=sInterest value=문화생활> <label for=cultural>
							문화생활 </label> <br> <input type=checkbox id=pet name=sInterest
							value=애견> <label for=pet> 애완동물 </label>
						</div><br><br>
						<h3>질문을 추가하시려면 위에 질문 타입을 선택해주세요 :)</h3>
					</div>

					<br>
					<br>
					<br>
					<button>저장</button>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		snum = 0;
		var qCount = 0;
		function addQuestion() {
			qCount++;
			$("#survey")
					.append(
							"<div class = question id='question"+qCount+"'><input type = hidden value =Q"+qCount+" name = Qnum><input type = hidden value = '객관식' name = Qtype>객관식 질문<input type='button' value='질문 삭제' onclick='deleteQuestion("+qCount+");' style='float: right'></h3><h3>질문 제목<input type='button' value='항목 추가' onclick = 'addAnswer("+qCount+");' style='float: right'></h3><input id='qTitle' type='text' placeholder='질문 제목을 입력하세요' name = Qtitle></div>")

		}
		var aCount = 0;
		function addAnswer(num) {
			aCount++;
			$("#question"+num)
					.append(
							"<div id= answer"+aCount+"><h4>항목 <input class = 'answer' name = Q"+num+" type='text' placeholder='항목을 입력하세요'><input type='button' value='삭제' onclick='removeAnswer("+aCount+");' style='float: right'></h4></div>");
		}
		function resetSurvey() {
			qCount =0;
			aCount =0;
			/* $("#survey div").remove(); */
			$(".question").remove();
		}
		
		function deleteQuestion(num){
			$("#question" + num).remove();
		}
		function removeAnswer(num){
			$("#answer"+num).remove();
		}			
		
	</script>


</body>
</html>