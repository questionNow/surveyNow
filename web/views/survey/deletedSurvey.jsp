<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, survey.model.vo.*"%>
<%
	ArrayList<Survey> sList = (ArrayList<Survey>) request.getAttribute("sList");
	
	String msg = (String)request.getAttribute("msg");

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
	background-color : #F8EFE6;
}

#surveyList * {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
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
	font-size: 1.5em;
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
			<p id = titleSurvey>삭제한 설문함</p>
			<p id = secondSurvey>삭제한 설문들을 확인 해보세요</p>
			<p id = secondSurvey>영구 삭제하고 싶으시면 X버튼을 눌러주세요.</p> <br>
			<div id="surveyList">
				<table id="surveyListTable" style="text-align: Center"
					cellpadding="0" cellspacing="0">
					<tr>
						<th width="550px">제목</th>
						<th width="150px">작성일</th>
						<th width="100px">복구</th>
						<th width="100px">영구 삭제</th>
					</tr>
					<%
						if (sList.isEmpty()) {
					%>
					<tr>
						<td colspan=7>삭제한 설문이 없습니다.</td>
						<%
							} else {
						%>
						<%
							for (Survey s : sList) {
						%>
					
					<tr>
						<input type="hidden" value="<%=s.getsNum()%>">
						<td><%=s.getsTitle()%></td>
						<td><%=s.getsCreateDate()%></td>
						<td id="revive" style="cursor: pointer">O</td>
						<td id="delete" style="cursor: pointer">X</td>
						<%
							}
						%>
						<%
							}
						%>
					
				</table>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	$("tr > #revive").mouseenter(function(){
		$(this).css("cursor","pointer");
	}).click(function(){
		var snum = $(this).parent().children("input")[0].value;
		var bool = confirm("복구 시키시겠습니까?");
		if(bool){
			location.href = "<%=request.getContextPath()%>/surveyRevive.sv?sNum="+snum+"&userId=<%= loginUser.getUserId()%>";
		}		
	});
	
	$("tr > #delete").mouseenter(function(){
		$(this).css("cursor","pointer");
	}).click(function(){
		var snum = $(this).parent().children("input")[0].value;
		var bool = confirm("정말 삭제하시겠습니까?\n확인을 누르시면 영구히 사라집니다.");
		if(bool){
			location.href = "<%=request.getContextPath()%>/surveyPowerDelete.sv?sNum="+snum+"&userId=<%= loginUser.getUserId()%>";
		}		
	});
	</script>

</body>
</html>