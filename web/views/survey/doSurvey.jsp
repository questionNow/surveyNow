<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, survey.model.vo.*"%>
<%
	ArrayList<Survey> sList = (ArrayList<Survey>) request.getAttribute("sList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#S {
	border: 1px solid red;
	display: inline-block;
	text-align: center;
}

#S * {
	padding: 5px;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar2.jsp"%>
	<div id="doSurvey">
		<%
			if (sList.isEmpty()) {
		%>
		<div>
			<h1>참여할 수 있는 설문이 없습니다.</h1>
		</div>
		<%
			} else {
		%>
		<%
			for (Survey s : sList) {
		%>
		<div id=S <%=s.getsNum()%>>
		<input type = "hidden" value = <%=s.getsNum()%> name = sNum>
			<h3>
				설문 제목 :
				<%=s.getsTitle()%></h3>
			<h2>
				설문 주제 :
				<%=s.getsType()%></h2>
			<h2>
				패널 수 :
				<%=s.getaCount()%>명 / <%=s.getsCount()%>명
			</h2>
			<h2>
				문항 수 : <%= s.getqCount()%> 문항
			</h2>
			<h2>
				참여시 획득 가능 포인트 :
				<%=s.getsPoint()%></h2>
			<%
				if (s.getqCount() < 2) {
			%>
			<h2>예상 소요시간 : 1분</h2>
			<%
				} else {
			%>
			<h2>
				예상 소요시간 :
				<%=s.getqCount() / 2%>분
			</h2>
			<%
				}
			%>
		</div>
		<%
			}
		%>
		<%
			}
		%>
	</div>

	<script type="text/javascript">
$(function(){
	$(function(){
		$("body > div > div").mouseenter(function(){
			$(this).css("cursor","pointer");
		}).mouseout(function(){
			$(this).css({"background":"white"});
		}).click(function(){
			var sNum = $(this).children("input").val();
			location.href="<%=request.getContextPath()%>/doSurveyDetailView.sv?sNum="+sNum;
				});
			});
		});
	</script>
</body>
</html>