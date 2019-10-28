<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, survey.model.vo.*"%>
<%
	ArrayList<Survey> sList = (ArrayList<Survey>)request.getAttribute("sList");
%>
<!DOCTYPE html>
<html>
<head>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
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
.pop-layer .pop-container {
  padding: 20px 25px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
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
	<div class="row">

		<div class="right">
			<p id = titleSurvey>작성된 설문함</p>
			<p id = secondSurvey>내가 작성한 설문들을 한눈에 확인 해보세요</p>
			<p id = secondSurvey>클릭하여 설문을 수정 해보세요 :)</p> <br>
			<div id="surveyList">
				<table id="surveyListTable" style="text-align: Center"
					cellpadding="0" cellspacing="0">
					<tr>
						<th width="550px">제목</th>
						<th width="200px">패널 수</th>
						<th width="100px">문항 수</th>
						<th width="150px">작성일</th>
						<th width="100px">응답자 수</th>
						<th width="100px">분석</th>
						<th width="100px">수정</th>
						<th width="100px">삭제</th>
					</tr>
					<% if(sList.isEmpty()){ %>
					<tr>
						<td colspan=8>작성한 설문이 없습니다.</td>
						<% } else {%>
						<% for(Survey s : sList){ %>
							<tr>
								<input type = "hidden" value = "<%= s.getsNum() %>">
								<td><%=s.getsTitle() %></td>
								<td><%=s.getsCount() %></td>
								<td><%=s.getqCount() %></td>
								<td><%=s.getsCreateDate() %></td>
								<td><%=s.getaCount() %></td>
								<td id = "chart">분석</td>
								<td id = "modify">수정</td>
								<td id = "delete">삭제</td>
							</tr>
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
	
	$("tr > #delete").mouseenter(function(){
		$(this).css("cursor","pointer");
	}).click(function(){
		
		var snum = $(this).parent().children("input")[0].value;
		var bool = confirm("삭제 하시겠습니까?");
		if(bool){
			location.href = "<%= request.getContextPath()%>/surveyDelete.sv?sNum="+snum+"&userId=<%= loginUser.getUserId()%>";
		}
	});
	
	$("tr > #modify").mouseenter(function(){
		$(this).css("cursor","pointer");
	}).click(function(){
		
		var snum = $(this).parent().children("input")[0].value;
		var bool = confirm("수정 하시겠습니까?");
		if(bool){
			location.href = "<%= request.getContextPath()%>/surveyModify.sv?sNum="+snum+"&userId=<%= loginUser.getUserId()%>";
		}
		
	});
	</script>

</body>
</html>