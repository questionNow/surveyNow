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
				<div id="survey">
					<h2>
						<%=dsList.get(0).getS().getsTitle()%><button type=reset id="reset"
							style="float: right">초기화</button>
					</h2>
					<br>
					<br>
					<%
						for (int i = 0; i < dsList.size(); i++) {
					%>
					<div id="question">
						<h3><%=dsList.get(i).getQ().getqTitle()%></h3>

						<% if(dsList.get(i).getQ().getqType().equals("객관식")){ %>
						<%	for (int j = 0; j < dsList.get(i).getA().size(); j++) {%>
						<div id="answer">
							<h4>
								<input type=radio
									value=<%=dsList.get(i).getA().get(j).getaContent()%>
									id="<%=dsList.get(i).getQ().getqNum()%><%=dsList.get(i).getA().get(j).getaNum()%>"
									name=<%=dsList.get(i).getQ().getqNum()%>><label
									for="<%=dsList.get(i).getQ().getqNum()%><%=dsList.get(i).getA().get(j).getaNum()%>"><%=dsList.get(i).getA().get(j).getaContent()%></label>
							</h4>
							<%}%>
							<input type=radio value="기타"
								name=<%=dsList.get(i).getQ().getqNum()%>
								id=<%= dsList.get(i).getQ().getqNum()%>><label
								for=<%=dsList.get(i).getQ().getqNum()%>>기타 <input
								type=type size=30px></label> <br>
							<br>
						</div>
						<%} else if(dsList.get(i).getQ().getqType().equals("주관식")){%>
						<%	for (int j = 0; j < dsList.get(i).getA().size(); j++) {%>
						<div id="answer">
							<h4>
								<input type= text
									value=<%=dsList.get(i).getA().get(j).getaContent()%>
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
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function resetSurvey() {

		}
	</script>

</body>
</html>