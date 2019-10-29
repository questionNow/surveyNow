<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="survey.model.vo.Survey, java.util.ArrayList"%>
<%
	ArrayList<Survey> list = (ArrayList<Survey>) request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.outer{
		width:800px;
		height:500px;
		color:#455F4E;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	table{
		border:1px solid;
				color:#455F4E;
		text-align:center;
		
	}
	.tableArea{
		width:650px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	.buttonArea{
		position:relative;
		top : 200px;
  		left: 50px;
	}

</style>
</head>
<body>
	<%@include file="admin_menubar.jsp"%>
	
	<div class = "outer">
	
	<br>
	<h2 align = "center">완료된 설문</h2>
	<div class = "tableArea">
		<table align = "center" id = "listArea">
			<tr>
				<th width = "100px">번호</th>
				<th width = "300px">제목</th>
			<!-- 	<th width = "100px">문항수</th> -->
				<th width = "100px">완료일</th>
				<th width = "100px">카테고리</th>
				<th width = "100px">패널수</th>
			</tr>
		
			<%
				if(list.isEmpty())	{
			%>
			<tr>
				<td colspan="6">조회된 설문이 없습니다</td>
			</tr> 
			<%	}else{	%>
			<%	
				for (Survey s : list){
			%>
			<tr>
				<td><%=s.getsNum() %></td>
				<td><%=s.getsTitle() %></td>
				<td><%=s.getsEndDate() %></td>
				<td><%=s.getsType() %></td>
				<!-- db수정 후 참여패널수로 수정? -->
				<td><%=s.getsCount() %> / <%=s.getsCount() %></td>
			</tr>	
			<%
			}
			%>
			<%
			} 
			%> 
		</table>
		</div>
		
	

	
	
	</div>	
	
	<script>
	function allSurvey(){
		location.href = "<%=request.getContextPath()%>/all.sv";	
		/* SurveyAdViewServlet ㄱㄱ */
	}

	
	function completeSurvey(){
		location.href = "<%=request.getContextPath()%>/complete.sv";	
		/* CompleteSurveyServlet ㄱㄱ*/ 
	}
	
	function holdSurvey(){
		location.href = "<%=request.getContextPath()%>/hold.sv";
		/*PaySurveyServlet ㄱㄱ*/
	}
	
	function proceedSurvey(){
		location.href = "<%=request.getContextPath()%>/proceed.sv";		
		/* ProceedSurveyServlet ㄱㄱ */
	}
	
	
	$(function(){	
		$("#listArea td").click(function(){
			var num = $(this).parent().children().eq(0).text();
			location.href="<%=request.getContextPath()%>/detail.cp?snum="+num;
		});
	});


	</script>
</body>
</html>