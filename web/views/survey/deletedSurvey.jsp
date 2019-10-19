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
			<h2>삭제한 설문함</h2>
			<p>삭제한 설문들을 확인 해보세요ㄴ</p>
			<p>영구 삭제하고 싶으시면 X버튼을 눌러주세요.</p>
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
	
	$(function(){
		$("#revive").click(function(){
			var sNum = $(this).parent().children("input").val();
			var bool = confirm("정말 복구 시키겠습니까?");
			
			if(bool){
				location.href = "<%=request.getContextPath()%>/surveyRevive.sv?sNum="+sNum;
				}
		});
		
	});
	$(function(){
		if(<%=msg%> != null){
			alert(<%=msg%>);
		}
	});
	</script>

</body>
</html>