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
	width: 60%;
	padding: 15px;
	display: inline-block;
}

#surveyList * {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#revive:hover{
	box-shadow: inset 180px 0 0 0 rgba(233, 161, 13, 0.8); 
	color: #fff;  
	background: rgba(233, 161, 13, 0.9);
	box-shadow: none;
	cursor:pointer;

	
}
#delete:hover{
	box-shadow: inset 180px 0 0 0 rgba(233, 161, 13, 0.8); 
	color: #fff;  
	background: rgba(233, 161, 13, 0.9);
	box-shadow: none;
	cursor:pointer;
}

#inlineBlock{
	float:left; 
	/* border:1px solid red; */
}
#inlineBlock2{
	float:left;
	/* border:1px solid red;  */
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
				<div id="inlineBlock">
					<table id="surveyListTable" style="text-align: Center"
						cellpadding="0" cellspacing="0">
						<tr>
							<th width="250px">제목</th>
							<th width="150px">작성일</th>
							<th width="100px">복구</th>
							<!-- <th width="100px">영구 삭제</th> -->
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
	 						<td id="revive" >O</td>
							<!-- <td id="delete" >X</td> -->
							<%
								}
							%>
							<%
								}
							%>
						
					</table>
				</div>
				<!-- 삭제를 위해  table 하나더 추가 -->
				<div id="inlineBlock2">	
							
					<table id="surveyListTable2" style="text-align: Center"
						cellpadding="0" cellspacing="0">
						<tr>
							<th width="100px">영구 삭제</th>
						</tr>
						<%
							if (sList.isEmpty()) {
						%>
						<tr>
							<td colspan=7>-</td>
							<%
								} else {
							%>
							<%
								for (Survey s : sList) {
							%>
						
						<tr>
							<input type="hidden" value="<%=s.getsNum()%>">
							<td id="delete" >X</td>
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
	</div>


	<script type="text/javascript">
	
<%-- 	function submit(){
        var bool = confirm("설문을 저장하시겠습니까?\n저장 후 '작성된 설문함'에서 확인 / 수정 가능합니다.");
        if(bool){
           $("#submitSurvey").attr("action","<%=request.getContextPath()%>/surveyMake.sv").submit();
        }
     } --%>
	
	
	
	
	$(function(){
		
		var ud = null;
		var userId = "<%=loginUser.getUserId()%>";
		
		
		
		$("#surveyListTable td").click(function(){
			ud = "u";
			var sNum = $(this).parent().children("input").val();
			var bool = confirm("설문을 복구하시겠습니까?\n저장 후 '작성된 설문함'에서 확인 / 수정 가능합니다.");
			if(bool){
				location.href = "<%=request.getContextPath()%>/surveyRevive.sv?userId=" + userId + "&sNum=" + sNum;
				}
			});
		 
		
		$("#surveyListTable2 td").click(function(){
			ud = "ud";
			var sNum = $(this).parent().children("input").val();
			var bool = confirm("삭제 시키면 복구할수 없습니다. \n 삭제 하시겠습니까?");
			if(bool){
				location.href = "<%=request.getContextPath()%>/surveyRevive.sv?sNum=" + sNum + "&ud=" + ud + "&userId=" + userId;
				}
		});  
		

<%-- 		$("#revive").click(function(){
			ud = "u";
			var sNum = $(this).parent().children("input").val();
			var bool = confirm("설문을 복구하시겠습니까?\n저장 후 '작성된 설문함'에서 확인 / 수정 가능합니다.");
			if(bool){
				location.href = "<%=request.getContextPath()%>/surveyRevive.sv?userId=" + userId + "&sNum=" + sNum;
				}
		}); 
		$("#delete").click(function(){
			ud = "ud";
			var sNum = $(this).parent().children("input").val();
			var bool = confirm("삭제 시키면 복구할수 없습니다. \n 삭제 하시겠습니까?");
			if(bool){
				location.href = "<%=request.getContextPath()%>/surveyRevive.sv?sNum=" + sNum + "&ud=" + ud + "&userId=" + userId;
				}
		});	 --%>	
		

	});
	
	$(function(){
		if(<%=msg%> != null){
			alert(<%=msg%>);
		}
	});
	</script>

</body>
</html>