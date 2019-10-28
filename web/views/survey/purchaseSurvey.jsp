<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, survey.model.vo.*, java.text.DecimalFormat, user.model.vo.*"%>
<%
	ArrayList<Survey> sList = (ArrayList<Survey>) request.getAttribute("sList");
	DecimalFormat df = new DecimalFormat("#,###,###원");
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
	background-color: #F8EFE6;
}

#surveyList * {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#delete {
	cursor: pointer;
}
#titleSurvey{
	font-size : 1.8em;
	font-weight: bold;
	font-family: 'Jeju Hallasan', cursive;
}
#secondSurvey{
	font-size : 1.4em;
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight : bold;
}
#surveyListTable tr th {
	height : 40px;
	font-size: 1.4em;
	font-weight : 900;
}
#surveyListTable tr td {
	height : 30px;
	font-size : 1.3em;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar2.jsp" %> 
</head>
<body>
	<div class="row">

		<div class="right">
			<p id = titleSurvey>설문 결제하기</p>
			<p id = secondSurvey>작성해둔 설문을 결제 하세요. 왼쪽에 체크박스로 결제하실 설문을 골라주세요.</p> <br>
			<div id="surveyList">
				<table id="surveyListTable" style="text-align: Center"
					cellpadding="0" cellspacing="0">
					<tr>
						<th width="50px">선택</th>
						<th width="550px">제목</th>
						<th width="150px">작성일</th>
						<th width="100px">문항 수</th>
						<th width="200px">패널 수</th>
						<th width="100px">포인트</th>
						<th width="100px">예상 비용</th>
						<th width="100px">삭제</th>
					</tr>
					<%
						if (sList.isEmpty()) {
					%>
					<tr>
						<td colspan=8>작성한 설문이 없습니다.</td>
						<%
							} else {
						%>
						<%
							for (Survey s : sList) {
						%>
					
					<tr>
						<input type="hidden" value="<%=s.getsNum()%>">
						<td><input type="checkbox" id="check"></td>
						<td><%=s.getsTitle()%></td>
						<td><%=s.getsCreateDate()%></td>
						<td><%=s.getsCount()%></td>
						<td><%=s.getaCount()%></td>
						<td onclick="check();"><%=s.getsPoint()%></td>
						<%
							if (s.getsPoint() * s.getsCount() < 1000) {
						%>
						<td><%=df.format(1000)%></td>
						<%
							} else {
						%>
						<td><%=df.format((s.getsPoint() * s.getsCount()))%></td>
						<%
							}
						%>
						<td id="delete" onclick="del()">X</td>
						<%
							}
						%>
						<%
							}
						%>
					</tr>



				</table>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	$(function(){
			$("#delete").mouseenter(function(){
				$(this).parent().css({"background":"orangered","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"lightgray"});
			}).click(function(){
				var sNum = $(this).parent().children("input").val();
				location.href="<%=request.getContextPath()%>/surveyDelete.sv="+sNum;
			});
		});

		
		$("td > input").click(function(){
			console.log($("td > input"));
			if($(this) == "checked"){
				alert(" ");
			}
		});
		
	</script>


</body>
</html>