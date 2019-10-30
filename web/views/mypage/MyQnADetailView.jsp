<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "user.model.vo.*, qna.model.vo.*, java.util.ArrayList"%>
    
<%
	QnA q = (QnA)request.getAttribute("qna");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
   .outer{
      width:800px;
      height:1000px;
      background:black;
      color:white;
      margin-left:600px;
      margin-top:50px;
   }
   td {
      border:1px solid white;
      color:white;
   }

   .tableArea {
      border:1px solid white;
      width:800px;
      height:350px;
	
		
   }
   #content {
      height:230px;
   }
</style>
</head>
<body>
	<%@ include file="../common/menubar2.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">1:1 문의</h2>
		<div class="tableArea">
			<table align="center" width="800px">
				<tr>
					<td>문의번호</td>
					<td><span><%=q.getQnaNum() %></span></td>
					<td>카테고리</td>
					<td><span><%=q.getQnaType() %></span></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><span><%=q.getQnaTitle() %></span></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><span><%=q.getUserId() %></span></td>
					<td>작성일</td>
					<td><span><%=q.getQnaDate() %></span></td>
				</tr>
				<tr>
					<td colspan="6">내용</td>
				</tr>
				<tr>
					<td colspan="6"><p id="content"><%=q.getQnaConent() %></p></td>
				</tr>
			</table>
		</div>
		
		<div align="center">
			<button onclick="location.href='<%=request.getContextPath() %>/myqnalist.qna?userId=<%=loginUser.getUserId()%>'">목록으로</button>
			
		</div>
	<div class="replyArea">
		<!-- 댓글 작성하는 부분 -->
		
		<div id="replySelectArea">
			<table id="answerTable" border="1" align="center">
			<%if(q.getAnswerYN().equals("N")) {%>
				<tr><td colspan="3">답변이 등록되지 않았습니다.</td></tr>
			<%}else if(q.getAnswerYN().equals("Y")){ %>
				<tr>
					<td width="100px"><%=q.getAdminId() %></td>
					<td width="400px"><%=q.getaContent() %></td>
				</tr>
			<%} %>
			</table>
		</div>
	</div>
	</div>
</body>
</html>