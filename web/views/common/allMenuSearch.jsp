<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, board.model.vo.*,survey.model.vo.* ,qna.model.vo.* "%>
	

<%
	ArrayList<Board> allMenuBoard = (ArrayList<Board>)request.getAttribute("allMenuBoard");
	ArrayList<QnA> allMenuQna = (ArrayList<QnA>)request.getAttribute("allMenuQna");
	ArrayList<Survey> allMenuSurvey = (ArrayList<Survey>)request.getAttribute("allMenuSurvey");
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
 	width: 100%;
	padding: 15px;
	display: inline-block; 
} 

#surveyList * {
	border-top: 1px solid black; 
	border-bottom: 1px solid black;
}

#inlineBlock{
	/* float:left; */ 
	/* border:1px solid red; */
}
#inlineBlock2{ 
	/* float:left; */
	/* border:1px solid red;  */
} 
#inlineBlock3{
	/* float:left; */
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

/* 푸터 --------------------------------------------------------------------------*/
	#footer {border-top: 1px solid #dbdbdb;}
	.footer {text-align: center; padding: 30px 50px; }
	.footer li {position: relative; display: inline; padding: 0 7px 0 10px; white-space: nowrap;}
	.footer li:before {content: ''; width: 1px; height: 12px; background-color: #dbdbdb; position: absolute; left: 0; top: 2px;}
	.footer li:first-child:before {width: 0;}
	.footer address {padding-top: 15px;}
	
	.cont_center {
	    overflow: hidden; 
	    min-height: 1300px; 
	    border-right: 1px solid #dbdbdb;
	    border-left: 1px solid #dbdbdb;
	}
/* 푸터 --------------------------------------------------------------------------*/

/* #surveyListTable td:hover{
	//box-shadow: inset 180px 0 0 0 rgba(233, 161, 13, 0.8); 
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
	<!-- <div class="row"> -->
	<div class="cont_center">

		<div class="right" style="background-color: white;">
			<h2>공지사항</h2>
<!-- 			<p>내가 작성한 설문들을 한눈에 확인 해보세요</p>
			<p>클릭하여 설문을 수정 해보세요 :)</p> -->
			<div id="surveyList">
				<div id="inlineBlock">
					<table id="surveyListTable" style="text-align: Center"
						cellpadding="0" cellspacing="0">
						<tr>
							<!-- <th width="150px">공지사항</th> -->
								<th width="40px" type="hidden">카테고리</th>
								<th width="50%">글제목</th>
								<th width="60px">작성자</th>
								<th width="60px">조회수</th>
	<!-- 						<th width="50px">삭제</th> -->
						</tr>
						<% if(allMenuBoard.isEmpty()){ %>
						<tr>
							<td colspan=7>검색 결과가 없습니다.</td>
							<% } else {%>
						</tr>						
							<% for(Board s : allMenuBoard){ %>
								<tr class="surveyListTableData">
									<input type="hidden" value="<%=s.getbNum()%>">
									<%-- <input type="hidden" value="<%=b.getbType()%>"> --%>
									<td width="70px"><%=s.getbType()%></td>
									<td width="50%"><%=s.getbTitle()%></td>
									<td><%=s.getbWName()%></td>
									<td><%=s.getbCount()%></td>
									<input type="hidden" value="<%=s.getbCreateDt()%>">
									
 									<%-- <input value = "<%= s.getUserName() %>"> --%>
<%--									<td><%=s.getsTitle() %></td>
									<td><%=s.getsCount() %></td>
									<td><%=s.getqCount() %></td>
									<td><%=s.getsCreateDate() %></td>
									<td><%=s.getaCount() %></td> --%>
									<!-- <td>차트 사진</td> -->
	<!-- 								<td id="delete" >X</td> -->
								</tr>
							<%} %>
						<%} %>
						
					</table>
				</div>
				<br>
				<div id="inlineBlock2">
				<h2>설문</h2>
					<table id="surveyListTable2" style="text-align: Center"
						cellpadding="0" cellspacing="0">
						<tr>
							<th width="20%">제목</th>
							<th width="30%">패널 수</th>
							<th width="50px">문항 수</th>
							<th width="80px">작성일</th>
							<th width="80px">응답자 수</th>
						</tr>
						<% if(allMenuSurvey.isEmpty()){ %>
						<tr>
							<td colspan=7>관련된 설문이 없습니다.</td>
							<% } else {%>
						</tr>						
							<% for(Survey s : allMenuSurvey){ %>
								<tr class="surveyListTableData">  
									<input type = "hidden" value = "<%= s.getsNum() %>">
									<td width="20%"><%=s.getsTitle() %></td>
									<td width="30%"><%=s.getsCount() %></td>
									<td width="50px"><%=s.getqCount() %></td>
									<td width="80px"><%=s.getsCreateDate() %></td>
									<td width="80px"><%=s.getaCount() %></td>
								</tr>
							<%} %>
						<%} %>
					</table>
				</div>
				<br>
				<div id="inlineBlock3">
				<h2>QnA</h2>
					<table id="surveyListTable3" style="text-align: Center"
						cellpadding="0" cellspacing="0">
						<tr>
							<th width="20%">제목</th>
							<th width="30%">내용</th>
							<th width="100px">작성자</th>
							<th width="50px">카테고리</th>
							<th width="80px">조회수</th>
						</tr>
						<% if(allMenuQna.isEmpty()){ %>
						<tr>
							<td colspan=7>관련된 QnA가 없습니다.</td>
							<% } else {%>
						</tr>						
							<% for(QnA s : allMenuQna){ %>
								<tr class="surveyListTableData">  
									<input type = "hidden" value = "<%= s.getQnaNum() %>">
									<td width="20%"><%=s.getQnaTitle() %></td>
									<td width="30%px"><%=s.getQnaContent() %></td>
									<td width="100px"><%=s.getUserId() %></td>
									<td width="50px"><%=s.getQnaType() %></td>
									<td width="80px"><%=s.getaContent() %></td>
								</tr>
							<%} %>
						<%} %>
					</table>
				</div>			
				
				
				
				
				
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(function(){
			//공지사항
			$("#surveyListTable td").mouseenter(function(){
				$(this).parent().css({"background":"orangered","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"}); 
			}).click(function(){
				var bnum=$(this).parent().children("input").val();
				<%-- var userId = "<%=loginUser.getUserId()%>"; --%>
				location.href="<%=request.getContextPath()%>/detail.bo?bnum=" + bnum;
			});
			//설문
			$("#surveyListTable2 td").mouseenter(function(){
				$(this).parent().css({"background":"orangered","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"}); 
			}).click(function(){
				var sNum = $(this).parent().children("input").val();
				<%-- var userId = "<%=loginUser.getUserId()%>"; --%>
				location.href = "<%=request.getContextPath()%>/surveyListView.sv?userId=<%=loginUser.getUserId()%>"; 
			});
			//QnA
			$("#surveyListTable3 td").mouseenter(function(){
				$(this).parent().css({"background":"orangered","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"}); 
			}).click(function(){
				var qnaNum = $(this).parent().children("input").val();
				<%-- var userId = "<%=loginUser.getUserId()%>"; --%>
				alert("qnaNum : " + qnaNum);
				<%-- location.href="<%=request.getContextPath()%>/surveyDetailView.sv=" + qnaNum; --%>
			});
		});
	</script>
	
<%-- 	<script type="text/javascript">
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

					
					var sNum = $(this).parent().children("input").val();
		            var userId = "<%=loginUser.getUserId()%>";
	
		            location.href="<%=request.getContextPath()%>/surveyHoldList.sv?userId=" + userId+"&sNum="+sNum;
				}
			});
			
			$(document).on('click', '#surveyListTable2 td', function(){
			/* $("#surveyListTable2 td").click(function(){ */
				var sNum = $(this).parent().children("input").val(); 
				/* var sNum = $("#inlinesNum").val(); */
				var userId = "<%=loginUser.getUserId()%>";
				
				var bool = confirm("설문을 삭제 하시겠습니까?\n저장 후 '삭제한 설문함'에서 확인 / 복구 가능합니다.");
				if(bool){
	location.href="<%=request.getContextPath()%>/surveyHoldList.sv?userId=" + userId+"&sNum="+sNum;
     
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
					 						"<td style='width:100px'> 차트 사진" +
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
   </script> --%>



     <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="footer">
                    <ul>
                        <li><a href="#">사이트 도움말</a></li>
                        <li><a href="#">사이트 이용약관</a></li>
                        <li><a href="#">사이트 운영원칙</a></li>
                        <li><a href="#"><strong>개인정보취급방침</strong></a></li>
                        <li><a href="#">책임의 한계와 법적고지</a></li>
                        <li><a href="#">게시중단요청서비스</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                    <address>
                        Copyright &copy;
                        <a href="http://webstoryboy.co.kr"><strong>webstoryboy</strong></a>
                        All Rights Reserved.
                    </address>
                </div>
            </div>
        </div>
    </footer>


</body>
</html>