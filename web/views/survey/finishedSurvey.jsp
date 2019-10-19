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
<body>
	<%@ include file="../common/menubar2.jsp" %> 
</head>
<body>
	<div class="row">

		<div class="right" style="background-color: #ddd;">
			<h2>완료된 설문함</h2>
			<p>설문이 완료된 설문과 분석 결과를 확인 해보세요 :)</p>
			<div id="surveyList">
				<table id="surveyListTable" style="text-align: Center"
					cellpadding="0" cellspacing="0">
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
								<td><%=s.getsCount() %></td>
								<td><%=s.getsEndDate() %></td>
								<td><%=s.getaCount() %></td>
								<td><%=s.getaCount() %></td>
								<td>차트 사진</td>
						<%} %>
						<%} %>
					
				</table>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(function(){
			$("#surveyListTable td").mouseenter(function(){
				$(this).parent().css({"background":"orangered","cursor":"pointer"})
			}).mouseout(function(){
				$(this).parent().css({"background":"lightgray"});
			}).click(function(){
				var sNum = $(this).parent().children("input").val();
				location.href="<%=request.getContextPath()%>/surveyDetailView.sv="+sNum;
			
				
			});
		});
	</script>

</body>
</html>