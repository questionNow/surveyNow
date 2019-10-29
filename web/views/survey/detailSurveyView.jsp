<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, survey.model.vo.*"%>
<%
	ArrayList<DoSurvey> dsList = (ArrayList<DoSurvey>) request.getAttribute("dsList");

	int sNum = (Integer) request.getAttribute("sNum");
	
%>

<!DOCTYPE html>
<html>
<head>
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
button{
	width : 100px;
	height : 40px;	
	cursor: pointer;
    padding: 4px 10px;
    border-radius : 15px;
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar2.jsp"%>
	<div class="row">
		<div class="right">
			<p id = titleSurvey>설문에 답해보세요 :)</p>
			<form action="<%=request.getContextPath()%>/surveyAnswer.sv">
			<input type = hidden value = "<%= loginUser.getUserId() %>" name = userId>
			<input type = hidden value = "<%= dsList.get(0).getS().getsPoint() %>" name = sPoint>
				<div id="survey">
					<p id = title1Survey>
						<%=dsList.get(0).getS().getsTitle()%><button type=reset id="reset"
							style="float: right">초기화</button>
					</p>
					<input type = hidden value = "<%= dsList.get(0).getS().getsNum() %>" name = sNum>
					<br>
					<br>
					<%
						for (int i = 0; i < dsList.size(); i++) {
					%>
					<br>
					<div id="question">
						<p id = pstyle><%=dsList.get(i).getQ().getqTitle()%></p>
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