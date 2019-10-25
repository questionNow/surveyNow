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
.show{
background : orangered
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
					
					<tr id = tableRow onclick = "checkSurvey(this);">
						<input type="hidden" value="<%=s.getsNum()%>">
						<td><%=s.getsTitle()%></td>
						<td><%=s.getsCreateDate()%></td>
						<td><%=s.getqCount()%></td>
						<td><%=s.getsCount()%></td>
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
		$("#surveyListTable td").mouseenter(function(){
			$(this).parent().css("cursor","pointer")
		})
	});
	
	
	function checkSurvey(obj) {
		obj.classList.toggle("show");
		$("#purchase").remove();
		if($(".show").length != 0){
			var price = 0;
			for(var i = 0 ; i< $(".show").length ; i++){
				if((($(".show").children()[4+(8*i)].innerHTML*1)*($(".show").children()[5+(8*i)].innerHTML*1)) < 1000){
					price += 1000;
				}else{
					price += (($(".show").children()[4+(8*i)].innerHTML*1)*($(".show").children()[5+(8*i)].innerHTML*1))
				}
			}
			
			$("#surveyList").append("<div id = 'purchase'><br>총 "+$(".show").length+"개 설문 총 "+price+"원 <input type = 'button' onclick = 'doPurchase();' value = '결제하기' style = 'float : right'></div>");
		}
		}
	
	</script>


</body>
</html>