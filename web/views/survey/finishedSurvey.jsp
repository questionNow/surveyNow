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
	background-color: #F8EFE6;
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
			<p id = titleSurvey>완료된 설문함</p>
			<p id = secondSurvey>설문이 완료된 설문과 분석 결과를 확인 해보세요 :) </p> <br>
			<div id="surveyList">
				<table id="surveyListTable" style="text-align: Center" cellpadding="0" cellspacing="0">
					<tr>
						<th width="550px">제목</th>
						<th width="100px">문항 수</th>
						<th width="150px">종료일</th>
						<th width="100px">응답자 수</th>
						<th width="200px">패널 수</th>
						<th width="100px">분석</th>
					</tr>
					<% if(sList.isEmpty()){ %>
					<tr>
						<td colspan=7>작성한 설문이 없습니다.</td>
						<% } else {%>
						<% for(Survey s : sList){ %>
							<tr>
								<input type = "hidden" value = "<%= s.getsNum() %>">
								<td><%=s.getsTitle() %></td>
								<td><%=s.getqCount() %></td>
								<td><%=s.getsEndDate() %></td>
								<td><%=s.getaCount() %></td>
								<td><%=s.getsCount() %></td>
								<td id = chart>차트 사진</td>
						<%} %>
						<%} %>
					
				</table>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	$("tr > #chart").mouseenter(function(){
		$(this).css("cursor","pointer");
	}).click(function(){
		var snum = $(this).parent().children("input")[0].value;
		var bool = confirm("분석 페이지로 넘어가시겠습니까?");
		if(bool){
			location.href = "<%= request.getContextPath()%>/chart.sv?sNum="+snum+"&userId=<%= loginUser.getUserId()%>";
		}		
	});
	</script>

</body>
</html>