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
.right {
	width: 55%;
	padding: 15px;
	display: inline-block;
}

#surveyList * {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#targetDiv {
	display: none;
}
</style>
</head>

</head>
<body>
	<%@ include file="../common/menubar2.jsp"%>

	<div class="rightPage">

		<div class="right" style="background-color: #ddd;">
			<h2>설문 만들기</h2>
			<div id="surveyType">
				<button id="pick" onclick="addQuestion()">+객관식</button>
				<button id="write" onclick="check()">+주관식</button>
				<button id="rank">+순위</button>
			</div>
			<form id="submitSurvey">
				<input name="userId" type="hidden"
					value="<%=loginUser.getUserId()%>">
				<div id="survey">
					<h2>
						설문 제목<input type="reset" id="reset" onclick="resetSurvey();"
							style="float: right" value="초기화">
					</h2>
					<input type="text" name="sTitle" placeholder="설문 제목을 입력하세요"
						size="70%">
					<h3>
						요청 패널 수 <input name=sCount type=number min="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						포인트 <input name=sPoint type=number min="50" step="50"><br>
						설문 대상 설정 (특정 대상을 상대로만 설문을 진행하고 싶으시면 체크해주세요)  <input type="button"
							value="재설정" style="float: right" onclick="deleteTarget();"><input type="button"
							value="설문 대상 설정하기"  style="float: right" onclick="setTarget();">	
					</h3>
					<div id = "targetDiv">					
					</div>

					<h3>질문을 추가하시려면 위에 질문 타입을 선택해주세요 :)</h3>
				</div>

				<br> <label onclick="submit();">저장하기</label> <label
					onclick="checkTarget();">타겟</label>
			</form>
		</div>
	</div>

	<!-- 질문 / 보기 추가하기 & 질문 / 보기 삭제하기 & 초기화 시작 -->
	<script type="text/javascript">
		snum = 0;
		var qCount = 0;
		function addQuestion() {
			qCount++;
			$("#survey")
					.append(
							"<div class = question id='question"+qCount+"'><input type = hidden value =Q"+qCount+" name = Qnum><input type = hidden value = '객관식' name = Qtype><input type='button' value='질문 삭제' onclick='deleteQuestion("+qCount+");' style='float: right'></h3><h3>질문 제목<input type='button' value='항목 추가' onclick = 'addAnswer("+qCount+");' style='float: right'></h3><input id='qTitle' type='text' placeholder='질문 제목을 입력하세요' name = Qtitle></div>")

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
		function submit(){
			var bool = confirm("설문을 저장하시겠습니까?\n저장 후 '작성된 설문함'에서 확인 / 수정 가능합니다.");
			if(bool){
				$("#submitSurvey").attr("action","<%=request.getContextPath()%>/surveyTargetSetting.sv");
			}
			
		}
		
	</script>
	<!-- 질문 / 보기 추가하기 & 질문 / 보기 삭제하기 & 초기화 끝 -->

	<script type="text/javascript">
	tnum = 1;
		function setTarget(){
			$("#targetDiv").css("display","block").append("<div id = target"+tnum+"><select name = targetType><option value = >최종학력</option><option value = >직업</option></select><label style = 'float:right' onclick = 'removeTarget("+tnum+");'>지우기</label>");
			tnum++;
		}
		function deleteTarget(){
			$("#targetDiv *").remove();
			$("#targetDiv").css("display", "none");
			
		}
		function removeTarget(num){
			$("#target"+num).remove();
		}
		
	</script>


</body>
</html>