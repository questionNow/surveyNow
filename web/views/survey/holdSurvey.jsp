<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, survey.model.vo.*"%>
<%
	ArrayList<Survey> sList = (ArrayList<Survey>)request.getAttribute("sList");

	ArrayList<Survey> sList2 = (ArrayList<Survey>)request.getAttribute("sList2");
 
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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

#inlineBlock{
	float:left; 
	/* border:1px solid red; */
}
#inlineBlock2{
	float:left;
	/* border:1px solid red;  */
} 

/* #surveyList{ 
	width: 100%;
	display: inline-block; 
	position: relative;
	
} */

#delete:hover{
	box-shadow: inset 180px 0 0 0 rgba(233, 161, 13, 0.8); 
	color: #fff;  
	background: rgba(233, 161, 13, 0.9);
	box-shadow: none;
	cursor:pointer;
}


/* #surveyListTable td:hover{
	/* //box-shadow: inset 180px 0 0 0 rgba(233, 161, 13, 0.8); */ 
	color: #fff;  
	background: orangered;
	box-shadow: none;
	cursor:pointer;
}
 */

</style>
</head>

</head>
<body>
	<%@ include file="../common/menubar2.jsp" %>
	<div class="row">

		<div class="right" style="background-color: #ddd;">
			<h2>작성된 설문함</h2>
			<p>내가 작성한 설문들을 한눈에 확인 해보세요</p>
			<p>클릭하여 설문을 수정 해보세요 :)</p>
			<div id="surveyList">
				<div id="inlineBlock">
					<table id="surveyListTable" style="text-align: Center"
						cellpadding="0" cellspacing="0">
						<tr>
							<th width="150px">제목</th>
							<th width="50px">패널 수</th>
							<th width="50px">문항 수</th>
							<th width="80px">작성일</th>
							<th width="80px">응답자 수</th>
							<th width="150px">분석</th>
	<!-- 						<th width="50px">삭제</th> -->
						</tr>
						<% if(sList.isEmpty()){ %>
						<tr>
							<td colspan=7>작성한 설문이 없습니다.</td>
							<% } else {%>
						</tr>						
							<% for(Survey s : sList){ %>
								<tr class="surveyListTableData">
									<input type = "hidden" value = "<%= s.getsNum() %>">
									<td><%=s.getsTitle() %></td>
									<td><%=s.getsCount() %></td>
									<td><%=s.getqCount() %></td>
									<td><%=s.getsCreateDate() %></td>
									<td><%=s.getaCount() %></td>
									<td>차트 사진</td>
	<!-- 								<td id="delete" >X</td> -->
								</tr>
							<%} %>
							<%} %>
						
					</table>
				</div>
				<!-- 삭제를 위해  table 하나더 추가 -->
				<div id="inlineBlock2">
				
					<table id="surveyListTable2" style="text-align: Center"
						cellpadding="0" cellspacing="0">
						<tr>
							<th width="100px">삭제</th>
						</tr>
						<% if(sList.isEmpty()){ %>
						<tr>
							<td colspan=7>-</td>
							<% } else {%>
						</tr>						
							<% for(Survey s : sList){ %>
								<tr class="surveyListTableData">  
									<input id="inlinesNum" type = "hidden" value = "<%= s.getsNum() %>">
									<td id="delete" >X</td>
								</tr>
							<%} %>
							<%} %>
					</table>
				</div>
			</div>
		</div>
	</div>


<%-- 	<script type="text/javascript">
		$(function(){
			$("#surveyListTable td").mouseenter(function(){
				$(this).parent().css({"background":"orangered","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"lightgray"});
			}).click(function(){
				var sNum = $(this).parent().children("input").val();
				var userId = "<%=loginUser.getUserId()%>";
				location.href="<%=request.getContextPath()%>/surveyDetailView.sv=" + sNum;
				location.href="<%=request.getContextPath()%>/surveyHoldList.sv?sNum=" + sNum;
				
			
				
			});
		});
	</script> --%>
	
	<script type="text/javascript">
      $(function(){
 
/*ajax 처리후 "클릭 이벤트"도 날아가서 변경  */
    	  	$(document).on('mouseenter', '#surveyListTable td', function(){
/* $("#surveyListTable td").mouseenter(function(){ */
			$(this).parent().css({"background":"orangered","cursor":"pointer"});
/* }).mouseout(function(){ */ 
				}).on('mouseout', '#surveyListTable td', function(){
			$(this).parent().css({"background":"lightgray"}); 
/* }).click(function(){ */
				}).on('click', '#surveyListTable td', function(){
					var bool = confirm("설문을 수정 하시겠습니까?"); 
				if(bool){
					
/* 여기는 수정 되게 하는 작업이라고 영욱이가 말함 */

					
	<%-- 				var sNum = $(this).parent().children("input").val();
		            var userId = "<%=loginUser.getUserId()%>";
	
		            location.href="<%=request.getContextPath()%>/surveyHoldList.sv?userId=" + userId+"&sNum="+sNum; --%>
				}
			});
			
			$(document).on('click', '#surveyListTable2 td', function(){
			/* $("#surveyListTable2 td").click(function(){ */
				var sNum = $(this).parent().children("input").val(); 
				/* var sNum = $("#inlinesNum").val(); */
				var userId = "<%=loginUser.getUserId()%>";
				
				var bool = confirm("설문을 삭제 하시겠습니까?\n저장 후 '삭제한 설문함'에서 확인 / 복구 가능합니다.");
				if(bool){
<%--	location.href="<%=request.getContextPath()%>/surveyHoldList.sv?userId=" + userId+"&sNum="+sNum; --%>
     
					$.ajax({
						url:"/surveyNow/surveyHoldList.sv",
						type:"post",
						data:{sNum:sNum, userId:userId}, //InsertReplyServlet 만들러 ㄱㄱ씽
						success:function(data){
							console.log("data 나오나? : " + data);
		
							$replyTable = $("#surveyListTable");
							$replyTable2 = $("#surveyListTable2");
							$replyTable3 = $(".surveyListTableData");
							
							// 기존꺼 지우기
							$replyTable3.remove();
							
				 			for(var key in data){ 
				 				var tr= 
				 						"<tr class=surveyListTableData>"+
					 						"<input style='type:hidden'>"+ data[key].sNum +
					 						"<td style='width:150px'>" + data[key].sTitle + 
					 						"</td>"+
					 						"<td style='width:50px'>" + data[key].sCount +
					 						"</td>"+
					 						"<td style='width:50px'>" + data[key].qCount +
					 						"</td>"+
					 						/* "<td style='width:100px'>" + data[key].sCreateDate + */
					 						/* ajax 로 처리후 날짜 받아오니 포맷이 변경됨 SurveyDao에 작업함 */
					 						"<td style='width:80px'>" + data[key].utilD + 
					 						"</td>"+
					 						"<td style='width:80px'>" + data[key].aCount +
					 						"</td>"+
					 						"<td style='width:150px'> 차트 사진" +
					 						"</td>"+
					 					"</tr>";
				 				
					 			$replyTable.append(tr);
							}
				 			for(var key in data){ 
				 				 
				 				var tr= "<tr class=surveyListTableData>"+ 
					 						"<input id=inlinesNum type=hidden value=" + data[key].sNum + ">"+ data[key].sNum +
					 						"<td id=delete> X" +  
					 						"</td>"+
					 						"</tr>";  
				 				 
					 			$replyTable2.append(tr);
							}				 			
						},
						error:function(data){
							console.log("서버 통신 안됨");			
						}	 
							
					});			           
	 
				}
			});  
      });
   </script>

</body>
</html>