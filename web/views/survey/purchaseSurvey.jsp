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

#delete {
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar2.jsp" %> 
</head>
<body>
	<div class="row">

		<div class="right" style="background-color: #ddd;">
			<h2>설문 결제하기</h2>
			<p>작성해둔 설문을 결제 하세요. 왼쪽에 체크박스로 결제하실 설문을 골라주세요.</p>
			<div id="surveyList">
				<table id="surveyListTable" style="text-align: Center"
					cellpadding="0" cellspacing="0">
					<tr>
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
						<td colspan=7>작성한 설문이 없습니다.</td>
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
						<td><%=s.getsCount()%></td>
						<td><%=s.getaCount()%></td>
						<td><%=s.getsPoint()%></td>
						<%
							if (s.getsPoint() * s.getsCount() < 1000) {
						%>
						<td id = <%=s.getsNum() %>><%=df.format(1000)%></td>
						<%
							} else {
						%>
						<td id = <%=s.getsNum() %>><%=df.format((s.getsPoint() * s.getsCount()))%></td>
						<%	}	%>
						<td id="delete" onclick="del()">X</td>
						<%	}	%>
						<%	}	%>
					</tr>



				</table>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	$(function(){
		$("#surveyListTable td").click(function(){
			$(this).parent().css({"background":"orangered","cursor":"pointer"});
		}).click(function(){
			$(this).parent().css({"background":"lightgray","cursor":"pointer"});
		});
	});
	$(function(){
		if($("#check:checked").length === 0){
			$("#surveyList").append("<h3>결제할 설문을 체크해주세요</h3>");
		}
	});
	
	function purchaseSurvey(num){
		$("#serveyList").append("<h3>결제할 설문을 체크해주세요</h3>");
	}
	
	</script>


</body>
</html>