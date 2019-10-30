<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "board.model.vo.*"%>
    
<%
	Board b = (Board)request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<%@include file="../common/admin_menubar.jsp" %>
	<div class="outer">
	<div class="menuTextArea"> <h3>게시글 관리</h3> </div>
		<table class="list-table">
			<%if(b.getbType().equals("n")) {%>
				<caption>공지사항</caption>
			<%} else { %>
				<caption>이벤트</caption>
			<%} %>
			<thead>
			<tr>
				<th ><span><%=b.getbTitle() %></span></th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td width="120px">작성자 : <%=b.getbWName() %> &nbsp; <%=b.getbCreateDt() %> &nbsp; 조회 <%=b.getbCount()%></td>
			</tr>
			<tr>
				<td colspan="3" height="500px"><p id="content"><%=b.getbContent() %></p></td>
			</tr>
			</tbody>
		</table>
	</div>
		
		<div align="center">
			<button type="reset" onclick="location.href='<%= request.getContextPath() %>/list.bo'">목록으로</button>
			<button type="submit" onclick="location.href='<%=request.getContextPath()%>/updateView.bo?bnum=<%=b.getbNum()%>'">수정하기</button>
			<button type="submit" onclick="location.href='<%=request.getContextPath()%>/bDelete.bo?bnum=<%=b.getbNum()%>'">삭제하기</button>
		</div>
	</div>
</body>
</html>