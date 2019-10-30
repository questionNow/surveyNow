<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="survey.model.vo.Survey, java.util.ArrayList"%>
    
<%
	ArrayList<Survey> list = (ArrayList<Survey>) request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>surveyManage</title>
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
		text-align:center;

	}
	.tableArea{
		width:800x;
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
	<h2 align = "center">작성된 설문</h2>
	<div class = "tableArea">
		<table align = "center" id = "listArea">
			<tr>
				<th width ="100px">번호</th>
				<th width = "300px">제목</th>
			<!-- 	<th width = "100px">문항수</th> -->
				<th width = "300px">작성일</th>
				<th width = "100px">카테고리</th>
				<th width = "100px">패널수</th>
				<th width = "100px">삭제</th>
				<th width = "100px">수정</th>
			</tr>
		
			<%
				if(list.isEmpty())	{
			%>
			<tr>
				<td colspan="8">조회된 설문이 없습니다</td>
			</tr> 
			<%	}else{	%>
			<%
				for (Survey s : list){
			%>
			<tr> 
				<td><%=s.getsNum()%></td>
				<td><%=s.getsTitle() %></td>
				<td><%=s.getsStartDate() %></td>
				<td><%=s.getsType() %></td>
				<td><%=s.getsCount() %></td>
				<td id = delete>X</td>
				<td id = modify>수정</td>
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
		
		var snum = $(this).parent().children().eq(0)[0].innerHTML;
		console.log(snum);
		var bool = confirm("수정 하시겠습니까?");
		if(bool){
			location.href = "<%= request.getContextPath()%>/Admin_surveyModify.sv?sNum="+snum+"&userId=<%= loginUser.getUserId()%>";
		}
		
	});
	</script>
</body>

</html>