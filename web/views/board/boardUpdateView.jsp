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
	.outer{
      width:900px;
      height:500px;
      background:black;
      color:white;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
   table {
      border:1px solid white;
   }
   .tableArea {
      width:650px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
   }
</style>
</head>
<body>
<%@include file="../common/menubarAdmin.jsp" %>

<div class="outer">
		<br>
		<h2 align="center">게시판 작성</h2>
		<div class="tableArea">
			<form id="updateForm" method="post">
			<input name="bnum" type="hidden" value="<%=b.getbNum()%>">
				<table>
					<tr>
						<td>게시판 타입</td>
						<td>
							<select name="bType">
							<%if(b.getbType().equals("n")) {%>
								<option value="n" selected="selected">공지사항</option>
								<option value="e">이벤트</option>
							<%} else { %>
								<option value="n">공지사항</option>
								<option value="e" selected="selected">이벤트</option>
							<%} %>
							</select>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="3"><input type="text" size="58" name="title" value="<%=b.getbTitle()%>"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
							<textarea rows="15" cols="60" name="content" style="resize:none"><%=b.getbContent() %></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="submit" onclick="update();">수정하기</button>
					<button type="reset" onclick="location.href='<%= request.getContextPath() %>/detail.bo?bnum=<%=b.getbNum() %>'">취소하기</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function update(){
			$("#updateForm").attr("action", "<%=request.getContextPath()%>/update.bo");
		}
	</script>
</body>
</html>