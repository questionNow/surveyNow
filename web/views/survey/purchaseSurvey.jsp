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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	background-color: #F8EFE6;
}

#surveyList * {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#delete {
	cursor: pointer;
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
.show{
background : orangered;
color : white;
}
#purchase{
font-size: 1.4em;
font-weight : 900;
}
#purchaseBtn{
	cursor: pointer;
	width : 140px;
    font-size : 18px;
    border-style : groove;
    border-left : 2px solid #F8EFE6;
    border : 2px solid #F8EFE6;
    background : #FBB16F;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar2.jsp" %> 
</head>
<body>
	<div class="row">

		<div class="right">
			<p id = titleSurvey>설문 결제하기</p>
			<p id = secondSurvey>작성해둔 설문을 결제 하세요. 왼쪽에 체크박스로 결제하실 설문을 골라주세요.</p> <br>
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
				
				$("#surveyList").append("<div id = 'purchase'><br>총 "+$(".show").length+"개 설문 총 "+comma(price)+"원 <input id = purchaseBtn type = 'button' onclick = 'doPurchase("+price+");' value = '결제하기' style = 'float : right'></div>");
			}
		}
	function doPurchase(price){
		var sNums = '';
		for(var i = 0 ; i < $(".show input").length ; i++){
			if(i == $(".show input").length-1){
				sNums += $(".show input")[i].value;
			}else{
			sNums += ($(".show input")[i].value + ",");
			}
		}
		console.log(sNums);
		location.href = "<%= request.getContextPath() %>/DoPurchase.sv?sNums="+sNums+"&price="+price+"&userId=<%= loginUser.getUserId() %>";
		
	}
	
	  function comma(price) {

		  	price = String(price);
	        var minus = price.substring(0, 1);

	        price = price.replace(/[^\d]+/g, '');
	        price = price.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');

	        if(minus == "-") price = "-"+price;

	        return price;
	    }
	
	</script>


</body>
</html>