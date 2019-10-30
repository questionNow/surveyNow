<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "user.model.vo.*, qna.model.vo.*, java.util.ArrayList"%>
    
<%
	QnA q = (QnA)request.getAttribute("qna");
	/* ArrayList<Reply> rlist = (ArrayList<Reply>)request.getAttribute("rlist"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.outer {
	width: 1100px;
	height: 660px;
	margin-left: auto;
	margin-right: auto;
}

.menuTextArea {
	margin-left: 50px;
	margin-right: auto;
}

table {
    width: 900px;
    margin-top: 30px;
    margin-left: auto;
    margin-right: auto;
}

caption{
	text-align: left;
}

.list-table thead th {
	height: 40px;
	text-align: left;
	border-top: 2px solid #BCE55C;
	border-bottom: 1px solid #CCC;
	font-weight: bold;
	font-size: 17px;
}

.list-table tbody td {
	text-align: left;
	padding: 10px 0;
	border-bottom: 1px solid #CCC;
	height: 20px;
	font-size: 14px
}
#container {
	width: 960px;
	margin: 0 auto;
}

#answerTable{
	border-top: 1px solid #CCC;
	border-bottom: 1px solid #CCC;
	border-left: none;
	border-right: none;
}

#answerTable th{
	border-right: 1px solid #CCC;
}

.answerBtn {
	box-shadow:inset 0px 1px 0px 0px #d9fbbe;
	background:linear-gradient(to bottom, #b8e356 5%, #a5cc52 100%);
	background-color:#b8e356;
	border-radius:6px;
	border:1px solid #83c41a;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 20px;
	text-decoration:none;
	text-shadow:0px 1px 0px #86ae47;
}
.answerBtn:hover {
	background:linear-gradient(to bottom, #a5cc52 5%, #b8e356 100%);
	background-color:#a5cc52;
}
.answerBtn:active {
	position:relative;
	top:1px;
}


</style>
</head>
<body>
	<%@ include file="../common/admin_menubar.jsp" %>
	<div class="outer">
		<div class="menuTextArea"> <h3>1:1문의</h3> </div>
		<table class="list-table">
			<caption>문의타입 : <%=q.getQnaType() %></caption>
			<thead>
			<tr>
				<th ><span><%=q.getQnaTitle() %></span></th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td width="120px">작성자 : <%=q.getUserId() %> &nbsp; <%=q.getQnaDate()%></td>
			</tr>
			<tr>
				<td colspan="3" height="500px"><p id="content"><%=q.getQnaConent() %></p></td>
			</tr>
			</tbody>
		</table>
		<div class="replyArea">
		<!-- 댓글 작성하는 부분 -->
		<form action="<%=request.getContextPath() %>/answer.qna" method="post">
		<input name="adminId" type="hidden" value="<%=loginUser.getUserId()%>">
		<input name="qnaNum" type="hidden" value="<%=q.getQnaNum()%>">
			<div class="replyWriterArea">
				<%if(q.getAnswerYN().equals("N")) {%>
				<table align="center">
					<tr>
						<td>답변작성</td>
						<td><textArea rows="3" cols="95" name="acontent" placeholder="답변이 등록되지 않았습니다."></textArea></td>
						<td>
							<button type="submit" class="answerBtn">답변등록</button>
						</td>
					</tr>
				</table>
				<%} else { %>
				<table id="answerTable" align="center">
					<tr>
						<th width="100px"><%=q.getAdminId() %></td>
						<td><%=q.getaContent() %></td>
					</tr>
				</table>
				<%} %>
				<div align="center">
					<button type="reset" onclick="location.href='<%= request.getContextPath() %>/list.qna'">목록으로</button>
				</div>
			</div>
		</form>
	</div>
	</div>
	
</body>
</html>