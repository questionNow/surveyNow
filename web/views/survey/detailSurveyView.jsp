<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, survey.model.vo.*"%>
<%
	ArrayList<DoSurvey> dsList = (ArrayList<DoSurvey>) request.getAttribute("dsList");

	int sNum = (Integer) request.getAttribute("sNum");
	
%>

<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar2.jsp"%>
	<div class="row">
		<div class="right" style="background-color: #ddd;">
			<h2>설문에 답해보세요 :)</h2>
			<form action="<%=request.getContextPath()%>/surveyAnswer.sv">
			<input type = hidden value = "<%= loginUser.getUserId() %>" name = userId>
				<div id="survey">
					<h2>
						<%=dsList.get(0).getS().getsTitle()%><button type=reset id="reset"
							style="float: right">초기화</button>
					</h2>
					<input type = hidden value = "<%= dsList.get(0).getS().getsNum() %>" name = sNum>
					<br>
					<br>
					<%
						for (int i = 0; i < dsList.size(); i++) {
					%>
					<br>
					<div id="question">
						<h3><%=dsList.get(i).getQ().getqTitle()%></h3>
						<input type = hidden value = "<%=dsList.get(i).getQ().getqNum() %>" name = answerQnum>
						<input type = hidden value = "<%=dsList.get(i).getQ().getqType() %>" name = answerQtype>
						<% if(dsList.get(i).getQ().getqType().equals("객관식")){ %>
						<%	for (int j = 0; j < dsList.get(i).getA().size(); j++) {%>
						<div id="answer">
							<h4>
								<input type = radio value = "<%=dsList.get(i).getA().get(j).getaNum() %>,<%=dsList.get(i).getA().get(j).getaContent()%>" name="<%=dsList.get(i).getQ().getqNum()%>" id="<%=dsList.get(i).getQ().getqNum()%><%=dsList.get(i).getA().get(j).getaNum()%>">
								<label for="<%=dsList.get(i).getQ().getqNum()%><%=dsList.get(i).getA().get(j).getaNum()%>"><%=dsList.get(i).getA().get(j).getaContent()%></label>
							</h4>
						</div>
							<%}%>
						<%} else if(dsList.get(i).getQ().getqType().equals("주관식")){%>
						<%	for (int j = 0; j < dsList.get(i).getA().size(); j++) {%>
						<div id="answer">
							<h4>
								<input type = hidden value = "<%=dsList.get(i).getA().get(j).getaNum() %>" name="<%=dsList.get(i).getQ().getqNum()%>">
								<input type= text
									placeholder = "답변을 입력하세요:)"
									id="<%=dsList.get(i).getQ().getqNum()%><%=dsList.get(i).getA().get(j).getaNum()%>"
									name=<%=dsList.get(i).getQ().getqNum()%>>
							</h4>
							<%}%>
							<br>
						</div>
						<%}%>
					</div>
					<%}%>
				</div>
			<button>제출하기</button>
			</form>
		</div>
	</div>

</body>
</html>