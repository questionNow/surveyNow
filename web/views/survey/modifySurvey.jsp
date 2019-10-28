
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, survey.model.vo.*"%>
<%
	ArrayList<DoSurvey> dsList = (ArrayList<DoSurvey>)request.getAttribute("dsList");
	String userId = (String)request.getAttribute("userId");	
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Survey</title>
<link href="http://fonts.googleapis.com/earlyaccess/jejuhallasan.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css" rel="stylesheet">
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);
@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);
.right {
	width: 55%;
	padding: 15px;
	display: inline-block;
	background-color: #F8EFE6;
}

#surveyList * {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#targetDiv {
	display: none;
}
#titleSurvey{
	font-size : 1.8em;
	font-weight: bold;
	font-family: 'Jeju Hallasan', cursive;
}
#pick, #write, #rank{
	background-color: #F8EFE6;
	margin-right : 15px;
	font-size : 1.4em;
	font-family: 돋음;
}
#title1Survey{
	font-size : 1.5em;
	font-weight: bold;
}
input[type = text]{
	border-radius: 10px;
	padding: 7px 15px;
}
::placeholder{
	font-size : 1.2em;
	color : #554D4A;
}
#reset{
	cursor: pointer;
    padding: 4px 10px;
    border-radius : 15px;
    font-size : 18px;
    border : 1px solid #F8EFE6;
    background : #FBB16F;
}
input[type = button]{
	cursor: pointer;
    padding: 4px 10px;
    border-radius : 15px;
    font-size : 18px;
    border : 1px solid #F8EFE6;
    background : #FBB16F;
}
#pstyle{
	font-size : 1.5em;
}
#sCategory{
	padding : .3em;
	margin-left : 43px;
	width : 150px;
}
#sCount{
	margin-left : 13px;
}
#sPoint{
	margin-left : 61px;
}
#qTITLE, #content{
	font-size : 1.3em;
	font-weight: bold;
}
#qTitle{
	width : 498px;
}
#save, #target{
	cursor: pointer;
    padding: 4px 10px;
    border-radius : 15px;
    font-size : 23px;
    border : 1px solid #F8EFE6;
    background : #89562A;
    color : white;
}
#pick, #write{
	font-family: 'KoPub Batang', serif;
	font-size : 2em;
}
#selectTarget{
	width : 210px;
	height : 28px;
}
#clear{
	cursor : pointer;
	font-size : 15px;
	font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar2.jsp"%>
	<div class="rightPage">

		<div class="right">
			<p id = titleSurvey>설문 수정하기</p>  <hr>
			
			<form id="submitSurvey">

				<input name="userId" type="hidden"	value="<%=userId%>">
				<div id="survey">
					<p id = title1Survey>
						설문 제목<input type="reset" id="reset" onclick="resetSurvey();"
							style="float: right" value="초기화">
					</p>
					<input type="text" name="sTitle" size="70%" value ="<%=dsList.get(0).getS().getsTitle()%>">
					<p id  = pstyle>카테고리 <select id = sCategory name="sCategory">
							<option value=--->--------</option>
							<option value=스포츠>스포츠</option>
							<option value=음식>음식</option>
							<option value=여행>여행</option>
							<option value=게임>게임</option>
							<option value=과학>과학</option>
							<option value=패션>패션</option>
							<option value=IT>IT</option>
							<option value=자동차>자동차</option>
							<option value=사회이슈>사회이슈</option>
							<option value=연예인>연예인</option>
							<option value=육아>육아</option>
							<option value=취업>취업</option>
							<option value=교육>교육</option>
							<option value=가족>가족</option>
							<option value=문화생활>문화생활</option>
							<option value=애견>애견</option>
						</select>
						<script type="text/javascript">
						$("#sCategory option[value='<%=dsList.get(0).getS().getsType()%>']").prop("selected", true);
						</script>
						
					</p>
					<p id = pstyle>
						요청 패널 수 <input value = <%=dsList.get(0).getS().getsCount() %> name=sCount type=number min="5" step="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						포인트 <input value = "<%=dsList.get(0).getS().getsPoint() %>" name=sPoint type=number min="50" step="50"><br>
						설문 대상 설정 (특정 대상을 상대로만 설문을 진행하고 싶으시면 체크해주세요) <input type="button"
							value="재설정" style="float: right" onclick="deleteTarget();"><input
							type="button" value="설문 대상 설정하기" style="float: right"
							onclick="setTarget();">
					<br><br></p>
					<div id="targetDiv">
						<% if(dsList.get(0).getS().getsTarget() != null){ %>
							<% for(int i  = 0 ; i < dsList.get(0).getSt().getTargetType().length ; i++) { %>	
								<div id = "target<%= i %>">
									<input type = hidden name = tnums value = <%= i %>>
									<select class = 'target<%= i %> target' name = targetType onchange = 'checkTarget(<%= i %>);'>
										<option>-------</option>
										<option value = finalEducation>최종학력</option>
										<option value = job>직업</option>
										<option value = income>소득</option>
										<option value = livingType>주거형태</option>
										<option value = houseType>주택유형</option>
										<option value = religion>종교</option>
										<option value = maritalStatus>혼인</option>									 
										<option value = livingWith>동거가족</option>														 
										<option value = armyGo>병역</option>
									</select><label style = 'float:right' onclick = 'removeTarget(<%= i %>);'>지우기</label>
										
										<script type="text/javascript">
										$(document).ready(function(){
										    $(".target<%= i%> option[value='<%= dsList.get(0).getSt().getTargetType()[i] %>']").attr("selected", true);
										});
										
										$(function(){ 
										if($(".target<%= i %> option:selected").val()== "finalEducation"){
										 $("#target<%= i %>").append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '초등학교 졸업' name = 'finalEducation' value = '초등학교 졸업'><label for = '초등학교 졸업'>초등학교 졸업</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '중학교 졸업' name = 'finalEducation' value = '중학교 졸업'><label for = '중학교 졸업'>중학교 졸업</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '고등학교 졸업' name = 'finalEducation' value = '고등학교 졸업'><label for = '고등학교 졸업'>고등학교 졸업</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '대학(2~3년) 졸업' name = 'finalEducation' value = '대학(2~3년) 졸업'><label for = '대학(2~3년) 졸업'>대학(2~3년) 졸업</label>"
																+"<br>&nbsp;&nbsp;"
																+"<input type ='checkbox' id = '대학교(4년) 졸업' name = finalEducation value = '대학교(4년) 졸업'><label for = '대학교(4년) 졸업'>대학교(4년) 졸업</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '석사 학위 취득' name = finalEducation value = '석사 학위 취득'><label for = '석사 학위 취득'>석사 학위 취득</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '박사 학위 취득' name = finalEducation value = '박사 학위 취득'><label for = '박사 학위 취득'>박사 학위 취득</label></div>");
									} else if($(".target<%= i %> option:selected").val()== "job"){
										 $("#target<%= i %>").append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '무직' name = job value = '무직'><label for = '무직'>무직</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '학생' name = job value = '학생'><label for = '학생'>학생</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '자영업' name = job value = '자영업'><label for = '자영업'>자영업</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '사무직' name = job value = '사무직'><label for = '사무직'>사무직</label>"
																+"<input type ='checkbox' id = '판매/서비스직' name = job value = '판매/서비스직'><label for = '판매/서비스직'>판매/서비스직</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '생산/기술직' name = job value = '생산/기술직'><label for = '생산/기술직'>생산/기술직</label>"
																+"<br>&nbsp;&nbsp;<input type ='checkbox' id = '전문/예술직' name = job value = '전문/예술직'><label for = '전문/예술직'>전문/예술직</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '경영/관리직' name = job value = '경영/관리직'><label for = '경영/관리직'>경영/관리직</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '농/어/축산업' name = job value = '농/어/축산업'><label for = '농/어/축산업'>농/어/축산업</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '기타' name = job value = '기타'><label for = '기타'>기타</label></div>");
									} else if($(".target<%= i %> option:selected").val()== "income"){
										 $("#target<%= i %>").append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '200만원 이하' name = income value = '200만원 이하'><label for = '200만원 이하'>200만원 이하</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '400만원 이하' name = income value = '400만원 이하'><label for = '400만원 이하'>400만원 이하</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '600만원 이하' name = income value = '600만원 이하'><label for = '600만원 이하'>600만원 이하</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '600만원 초과' name = income value = '600만원 초과'><label for = '600만원 초과'>600만원 초과</label></div>");
									} else if($(".target<%= i %> option:selected").val()== "livingType"){
										 $("#target<%= i %>").append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '월세' name = livingType value = '월세'><label for = '월세'>월세</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '전세' name = livingType value = '전세'><label for = '전세'>전세</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '반전세' name = livingType value = '반전세'><label for = '반전세'>반전세</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '자가' name = livingType value = '자가'><label for = '자가'>자가</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '기타' name = livingType value = '기타'><label for = '기타'>기타</label></div>");
									} else if($(".target<%= i %> option:selected").val()== "houseType"){
										 $("#target<%= i %>").append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '단독 주택' name = houseType value = '단독 주택'><label for = '단독 주택'>단독 주택</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '다세대 주택' name = houseType value = '다세대 주택'><label for = '다세대 주택'>다세대 주택</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '아파트' name = houseType value = '아파트'><label for = '아파트'>아파트</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '기타' name = houseType value = '기타'><label for = '기타'>기타</label></div>");
									} else if($(".target<%= i %> option:selected").val()== "religion"){
										 $("#target<%= i %>").append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '무교' name = religion value = '무교'><label for = '무교'>무교</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '기독교' name = religion value = '기독교'><label for = '기독교'>기독교</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '불교' name = religion value = '불교'><label for = '불교'>불교</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '천주교' name = religion value = '천주교'><label for = '천주교'>천주교</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '기타' name = religion value = '기타'><label for = '기타'>기타</label></div>");
									} else if($(".target<%= i %> option:selected").val()== "maritalStatus"){
										 $("#target<%= i %>").append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '미혼' name = maritalStatus value = '미혼'><label for = '미혼'>미혼</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '기혼' name = maritalStatus value = '기혼'><label for = '기혼'>기혼</label></div>");
									} else if($(".target<%= i %> option:selected").val()== "livingWith"){
										 $("#target<%= i %>").append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '혼자' name = livingWith value = '혼자'><label for = '혼자'>혼자</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '1명' name = livingWith value = '1명'><label for = '1명'>1명</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '2명' name = livingWith value = '2명'><label for = '2명'>2명</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '3명' name = livingWith value = '3명'><label for = '3명'>3명</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '4명' name = livingWith value = '4명'><label for = '4명'>4명</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '5명' name = livingWith value = '5명'><label for = '5명'>5명</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '6명 이상' name = livingWith value = '6명 이상'><label for = '6명 이상'>6명 이상</label></div>");
									} else if($(".target<%= i %> option:selected").val()== "armyGo"){
										 $("#target<%= i %>").append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '미필' name = armyGo value = '미필'><label for = '미필'>미필</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '군필' name = armyGo value = '군필'><label for = '군필'>군필</label>"
																+"&nbsp;&nbsp;<input type ='checkbox' id = '면제' name = armyGo value = '면제'><label for = '면제'>면제</label></div>");									
									}
										<% if(dsList.get(0).getSt().getTargetType() != null){ %>
											<% for(int j  = 0 ; j< dsList.get(0).getSt().getTargetDetail().size() ; j++) {%>
											document.getElementById("<%= dsList.get(0).getSt().getTargetDetail().get(i)[j] %>").checked = true;							
											<% } %>
										<% } %>
								});
									</script>
								</div>
							<%} %>	
						<%} %>
					</div>
					<div id="surveyType">
						<label type = button id="pick" onclick="addQuestion()">+객관식</label>
						<label type = button id="write" onclick="addWriteQuestion()">+주관식</label>
					</div>
					
					<p id = content>질문을 추가하시려면 위에 질문 타입을 선택해주세요 :)</p>
					<% for(int i = 0 ; i < dsList.size() ; i++){ %>
						<% if (dsList.get(i).getQ().getqType().equals("객관식")){ %>
						<div class = "question pick" id="question<%=dsList.get(i).getQ().getqNum()%>">
						<input type = hidden value = '<%=dsList.get(i).getQ().getqType()%>' name = Qtype>
						<input type = hidden value = Q<%= dsList.get(i).getQ().getqNum() %> name = Qnum>
						<input type='button' value='질문 삭제' onclick='deleteQuestion(<%=dsList.get(i).getQ().getqNum()%>);' style='float: right'>
						<p id = content>질문 제목(객관식) <input type='button' value='항목 추가' onclick = 'addAnswer(<%=dsList.get(i).getQ().getqNum()%>);' style='float: right'></p>
						<input id='qTitle' type='text' value = "<%= dsList.get(i).getQ().getqTitle() %>" name = Qtitle>
						
							<% for(int j = 0 ; j < dsList.get(i).getA().size() ; j++){ %>
									<div id= "answer<%= dsList.get(i).getA().get(j).getaNum()%>">
									<h4>항목 <input class = 'answer' name = "Q<%= dsList.get(i).getA().get(j).getqNum()%>" type='text' value = "<%=dsList.get(i).getA().get(j).getaContent()%>">
									<input type='button' value='삭제' onclick='removeAnswer(<%= dsList.get(i).getA().get(j).getaNum()%>);' style='float: right'></h4>
									</div>				
							<%} %>
						<%} else{ %>
							<div class = "question pick" id="question<%=dsList.get(i).getQ().getqNum()%>">
							<input type = hidden value = '<%=dsList.get(i).getQ().getqType()%>' name = Qtype>
							<input type = hidden value = Q<%= dsList.get(i).getQ().getqNum() %> name = Qnum>
							<input type='button' value='질문 삭제' onclick='deleteQuestion(<%=dsList.get(i).getQ().getqNum()%>);' style='float: right'>
							<p id = content>질문 제목(주관식) </p>
							<input id='qTitle' type='text' value = "<%= dsList.get(i).getQ().getqTitle() %>" name = Qtitle>
						<%} %>	
					<%} %>
					</div>
				</div>
				
			<% for(int i = 0 ; i < dsList.size() ; i++) {%>
			<div><input type = hidden value ="<%=dsList.get(i).getS().getsNum() %>" name = delSnum>
			<input type = hidden value ="<%=dsList.get(i).getQ().getqNum() %>" name = delQnum>
			
				<% for (int j = 0 ; j< dsList.get(i).getA().size(); j++){ %>
				<input type = hidden value ="<%=dsList.get(i).getA().get(j).getaNum() %>" name ="A<%=dsList.get(i).getQ().getqNum() %>">
				<%} %>
			</div>
			<%} %>
				<br> <label id = save onclick="blankCheck();" style="cursor: pointer">저장하기</label>
			</form>
		</div>
	</div>

	<!-- 질문 / 보기 추가하기 & 질문 / 보기 삭제하기 & 초기화 시작 -->
	<script type="text/javascript">
		snum = 0;
		
		qCount = $(".question > input[type=hidden]:last")[0].value.slice(1);
		
		function addWriteQuestion(){
			qCount++;
			$("#survey")
					.append(
							"<div class = 'question write' id='question"+qCount+"'><br><input type = hidden value = '주관식' name = Qtype><input type = hidden value =Q"+qCount+" name = Qnum><input type='button' value='질문 삭제' onclick='deleteQuestion("+qCount+");' style='float: right'><p>질문 제목(주관식)</p><input id='qTitle' type='text' placeholder='질문 제목을 입력하세요' name = Qtitle><br></div>")
							aCount++;
			}
		
		
		
		
		function addQuestion() {
			qCount++;
			$("#survey")
					.append(
							"<div class = 'question pick' id='question"+qCount+"'><br><input type = hidden value = '객관식' name = Qtype><input type = hidden value =Q"+qCount+" name = Qnum><input type='button' value='질문 삭제' onclick='deleteQuestion("+qCount+");' style='float: right'><p>질문 제목(객관식) - 보기를 추가해주세요 :) <input type='button' value='항목 추가' onclick = 'addAnswer("+qCount+");' style='float: right'></p><input id='qTitle' type='text' placeholder='질문 제목을 입력하세요' name = Qtitle><br></div>")

		}
		var aCount = 0;
		function addAnswer(num) {
			aCount++;
			$("#question"+num)
					.append(
							"<div id= answer"+aCount+"><h4>항목 <input class = 'answer' name = Q"+num+" type='text' placeholder='항목을 입력하세요'><input type='button' value='삭제' onclick='removeAnswer("+aCount+");' style='float: right'></h4></div>");
		}
		function resetSurvey() {
			$("#survey #targetDiv div").remove();
			$(".question").remove();
		}
		
		function deleteQuestion(num){
			$("#question" + num).remove();
		}
		function removeAnswer(num){
			$("#answer"+num).remove();
		}			
		
		function check(){
			var qs = "";
			for(var i = 0 ; i < $(".question").length ; i ++){
				qs += $(".question")[i].id;				
			}
			var qNumbers = qs.split("question");
			for(var s in qNumbers){
				if(s != 0){
					console.log(qNumbers[s]);
				}
				
			}
		}
	</script>
	<!-- 질문 / 보기 추가하기 & 질문 / 보기 삭제하기 & 초기화 끝 -->

	<script type="text/javascript">
	tnum = 0;
		function setTarget(){
			if($(".target").length == 1 && $(".target")[0].value =="-------" ){
				alert("대상 타입을 선택해주세요.");
				$(".target")[0].focus();
				return false;
			}else{
				$("#targetDiv").css("display","block").append("<div id = 'target"+tnum+"'><input type = hidden name = tnums value = "+tnum+">"
															 +"<select class = 'target"+tnum+" target' name = targetType onchange = 'checkTarget("+tnum+");'>"
															 +"<option>-------</option>"
															 +"<option value = finalEducation>최종학력</option>"
															 +"<option value = job>직업</option>"
															 +"<option value = income>소득</option>"
															 +"<option value = livingType>주거형태</option>"
															 +"<option value = houseType>주택유형</option>"
															 +"<option value = religion>종교</option>"
															 +"<option value = maritalStatus>혼인</option>"
															 +"<option value = livingWith>동거가족</option>"
															 +"<option value = armyGo>병역</option>"
															 +"</select><label style = 'float:right' onclick = 'removeTarget("+tnum+");'>지우기</label></div>");
				tnum++;
			
			}
		}
		function deleteTarget(){
			$("#targetDiv *").remove();
			$("#targetDiv").css("display", "none");
			
		}
		function removeTarget(num){
			$("#target"+num).remove();
		}
		
		function checkTarget(num){
			for(var i =0; i<$(".target").length ; i++){
				if($(".target").length>1){
					for(var j = i+1 ; j<$(".target").length ; j++){						
						if($(".target")[i].value === $(".target")[j].value){
							alert("기존에 입력한 것과 다른 대상 타입을 선택해주세요.");
							$(".target")[j].value = "-------";
							$("#target"+num+" div").remove();
							return false;
						}
					}
				}else{
					continue;
				}
			}
			$("#target"+num+" div").remove();
			if($(".target"+num+" option:selected").val()== "finalEducation"){
				 $("#target"+num).append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '초등학교 졸업' name = 'finalEducation' value = '초등학교 졸업'><label for = '초등학교 졸업'>초등학교 졸업</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '중학교 졸업' name = 'finalEducation' value = '중학교 졸업'><label for = '중학교 졸업'>중학교 졸업</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '고등학교 졸업' name = 'finalEducation' value = '고등학교 졸업'><label for = '고등학교 졸업'>고등학교 졸업</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '대학(2~3년) 졸업' name = 'finalEducation' value = '대학(2~3년) 졸업'><label for = '대학(2~3년) 졸업'>대학(2~3년) 졸업</label>"
										+"<br>&nbsp;&nbsp;"
										+"<input type ='checkbox' id = '대학교(4년) 졸업' name = finalEducation value = '대학교(4년) 졸업'><label for = '대학교(4년) 졸업'>대학교(4년) 졸업</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '석사 학위 취득' name = finalEducation value = '석사 학위 취득'><label for = '석사 학위 취득'>석사 학위 취득</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '박사 학위 취득' name = finalEducation value = '박사 학위 취득'><label for = '박사 학위 취득'>박사 학위 취득</label></div>");
			} else if($(".target"+num+" option:selected").val()== "job"){
				 $("#target"+num).append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '무직' name = job value = '무직'><label for = '무직'>무직</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '학생' name = job value = '학생'><label for = '학생'>학생</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '자영업' name = job value = '자영업'><label for = '자영업'>자영업</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '사무직' name = job value = '사무직'><label for = '사무직'>사무직</label>"
										+"<input type ='checkbox' id = '판매/서비스직' name = job value = '판매/서비스직'><label for = '판매/서비스직'>판매/서비스직</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '생산/기술직' name = job value = '생산/기술직'><label for = '생산/기술직'>생산/기술직</label>"
										+"<br>&nbsp;&nbsp;<input type ='checkbox' id = '전문/예술직' name = job value = '전문/예술직'><label for = '전문/예술직'>전문/예술직</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '경영/관리직' name = job value = '경영/관리직'><label for = '경영/관리직'>경영/관리직</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '농/어/축산업' name = job value = '농/어/축산업'><label for = '농/어/축산업'>농/어/축산업</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '기타' name = job value = '기타'><label for = '기타'>기타</label></div>");
			} else if($(".target"+num+" option:selected").val()== "income"){
				 $("#target"+num).append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '200만원 이하' name = income value = '200만원 이하'><label for = '200만원 이하'>200만원 이하</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '400만원 이하' name = income value = '400만원 이하'><label for = '400만원 이하'>400만원 이하</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '600만원 이하' name = income value = '600만원 이하'><label for = '600만원 이하'>600만원 이하</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '600만원 초과' name = income value = '600만원 초과'><label for = '600만원 초과'>600만원 초과</label></div>");
			} else if($(".target"+num+" option:selected").val()== "livingType"){
				 $("#target"+num).append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '월세' name = livingType value = '월세'><label for = '월세'>월세</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '전세' name = livingType value = '전세'><label for = '전세'>전세</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '반전세' name = livingType value = '반전세'><label for = '반전세'>반전세</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '자가' name = livingType value = '자가'><label for = '자가'>자가</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '기타' name = livingType value = '기타'><label for = '기타'>기타</label></div>");
			} else if($(".target"+num+" option:selected").val()== "houseType"){
				 $("#target"+num).append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '단독 주택' name = houseType value = '단독 주택'><label for = '단독 주택'>단독 주택</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '다세대 주택' name = houseType value = '다세대 주택'><label for = '다세대 주택'>다세대 주택</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '아파트' name = houseType value = '아파트'><label for = '아파트'>아파트</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '기타' name = houseType value = '기타'><label for = '기타'>기타</label></div>");
			} else if($(".target"+num+" option:selected").val()== "religion"){
				 $("#target"+num).append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '무교' name = religion value = '무교'><label for = '무교'>무교</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '기독교' name = religion value = '기독교'><label for = '기독교'>기독교</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '불교' name = religion value = '불교'><label for = '불교'>불교</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '천주교' name = religion value = '천주교'><label for = '천주교'>천주교</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '기타' name = religion value = '기타'><label for = '기타'>기타</label></div>");
			} else if($(".target"+num+" option:selected").val()== "maritalStatus"){
				 $("#target"+num).append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '미혼' name = maritalStatus value = '미혼'><label for = '미혼'>미혼</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '기혼' name = maritalStatus value = '기혼'><label for = '기혼'>기혼</label></div>");
			} else if($(".target"+num+" option:selected").val()== "livingWith"){
				 $("#target"+num).append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '혼자' name = livingWith value = '혼자'><label for = '혼자'>혼자</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '1명' name = livingWith value = '1명'><label for = '1명'>1명</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '2명' name = livingWith value = '2명'><label for = '2명'>2명</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '3명' name = livingWith value = '3명'><label for = '3명'>3명</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '4명' name = livingWith value = '4명'><label for = '4명'>4명</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '5명' name = livingWith value = '5명'><label for = '5명'>5명</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '6명 이상' name = livingWith value = '6명 이상'><label for = '6명 이상'>6명 이상</label></div>");
			} else if($(".target"+num+" option:selected").val()== "armyGo"){
				 $("#target"+num).append("<div>&nbsp;&nbsp;<input type ='checkbox' id = '미필' name = armyGo value = '미필'><label for = '미필'>미필</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '군필' name = armyGo value = '군필'><label for = '군필'>군필</label>"
										+"&nbsp;&nbsp;<input type ='checkbox' id = '면제' name = armyGo value = '면제'><label for = '면제'>면제</label></div>");
			}			
		}
		
		
	</script>

	<!-- 빈칸 검사  / submit-->
	<script type="text/javascript">
	function blankCheck(){
		
		
		if($("#survey > input")[0].value ==""){
	            alert("설문 제목을 입력해주세요.");
	            $("#survey > input")[0].focus();
	            return false;
		}
		// 카테고리 선택
		if($("#survey > p > select")[0].value ==="---"){
			alert("카테고리를 선택해주세요.");
            $("#survey > p > select")[0].focus();
            return false;
		}
		if($("#survey > p > input")[1].value <5){
			if($("#survey > p > input")[1].value === ""){
				alert("요청 패널 수를 입력해주세요.");
			}else
				alert("요청 패널은 최소 5명 이상 입력해야 합니다.");
            $("#survey > p > input")[1].focus();
            return false;
		}
		if($("#survey > p > input")[2].value <50){
			if($("#survey > p > input")[2].value === ""){
				alert("포인트를 입력해주세요.");
			}else
				alert("포인트는 최소 50이상 입력해야 합니다.");
            $("#survey > p > input")[2].focus();
            return false;
		}
		
		var ts = "";
		for(var i = 0 ; i < $("#survey > #targetDiv > div").length ; i++){
			ts += $("#survey > div > div")[i].id;
		}
		var tNumbers = ts.split("target").slice(1);
		
		for(var t in tNumbers){
			if($(".target")[t].value==="-------"){
				alert("설문 대상 타입을 선택 해주세요.");
				$(".target"+tNumbers[t]).focus();
	            return false;
			}
			if($("#target"+tNumbers[t]+" > div > input:checked").length < 1){
				alert("설문 대상을 체크해주세요.");
				return false;
			}
		}
		if($("#qTitle").length===0){
			alert("질문을 추가해주세요.");
			$("#surveyType").focus();
			return false;
		}
		
		var annswer = "";
		for(var i ; i< $(".question #qTitle").length ; i++){
			if($(".question #qTitle")[i].value ==""){
				alert("질문을 입력해주세요.");
				$(".question #qTitle")[i].focus();
				return false;
			}
		}
		
		var qs = "";
		for(var i = 0 ; i < $(".question").length ; i ++){
			qs += $(".question")[i].id;				
		}
		var qNumbers = qs.split("question").slice(1);
		
		for(var s in qNumbers){
			if(s != 0){
				console.log(qNumbers[s]);
			}
			
		}
		
		for(var s in qNumbers){
			if($("#question"+qNumbers[s]+" > input")[1].value === "객관식"){
				if($("#question"+qNumbers[s]+" .answer").length >= 2){
					for(var j = 0 ; j < $("#question"+qNumbers[s]+" .answer").length ; j++){
						if($("#question"+qNumbers[s]+" .answer")[j].value === ""){
							alert("보기를 입력 해주세요.");
							$("#question"+qNumbers[s]+" .answer")[j].focus();
							return false;
						}
					}
				
				}else{
					alert("보기는 2개 이상 등록 해주세요.");
					return false;
				}
			}
		}

		var bool = confirm("설문을 저장하시겠습니까?\n저장 후 '작성된 설문함'에서 확인 / 수정 가능합니다.");
		if(bool){
			$("#submitSurvey").attr("action","<%=request.getContextPath()%>/surveyUpdate.sv").submit();
		}		
	}
		
	
	</script>
	<!-- 빈칸 검사 -->

</body>
</html>