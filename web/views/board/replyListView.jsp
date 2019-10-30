<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import=" board.model.vo.*, java.util.ArrayList" %>
    
<%
    	ArrayList<Reply> list = (ArrayList<Reply>)request.getAttribute("list");
    	PageInfo pi = (PageInfo) request.getAttribute("pi");

    	int listCount = pi.getListCount();
    	int currentPage = pi.getCurrentPage();
    	int maxPage = pi.getMaxPage();
    	int startPage = pi.getStartPage();
    	int endPage = pi.getEndPage();
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
      text-align:center;
   }
   .tableArea {
      width:650px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
   }
   .searchArea {
      width:650px;
      margin-left:auto;
      margin-right:auto;
   }
</style>
</head>
<body>
	<%@include file="../common/menubarAdmin.jsp" %>
	<div class="outer">
		<br>
		<form action="<%=request.getContextPath() %>/delete.re" method="post">
		<h2 align="center">게시판</h2>
		<div class="tableArea">
			<table align="center" id="listArea">
				<tr>
					<th width="50px">댓글번호</th>
	 				<th width="100px">작성자</th>
					<th width="150px">내용</th>
					<th width="150px">작성일</th>
					<th width="100px">경고/삭제</th>
				</tr>
				<%if(list.isEmpty()) { %>
				<tr>
					<td colspan="4">조회된 리스트가 없습니다.</td>
				</tr>
				<%} else { %>
					<%for(Reply r : list){ %>
						<tr>
							<input name="replyNum" type="hidden" value="<%=r.getReplyNum()%>">
							<input name="userId" type="hidden" value="<%=r.getReplyId()%>">
							<td><%=r.getReplyNum() %></td>
							<td><%=r.getReplyId() %></td>
							<td><%=r.getReplytext() %></td>
							<td><%=r.getReplyDate() %></td>
							<td>
								<button onclick="deleteReply();">삭제</button>
							</td>
						</tr>
					<%} %>
				<%} %>
			</table>
		</div>
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath() %>/list.re?currentPage=1'"> << </button>
			
			<%if(currentPage <= 1) {%>
				<button disabled> < </button>
			<%} else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/list.re?currentPage=<%=currentPage-1 %>'"> < </button>
			<%} %>
			
			<%for(int p = startPage; p<=endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button disabled><%=p %></button>
				<%} else{%>
					<button onclick="location.href='<%=request.getContextPath() %>/list.re?currentPage=<%=p %>'"><%=p %></button>
				<%} %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<button disabled> > </button>
			<%}else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/list.re?currentPage=<%=currentPage+1 %>'"> > </button>
			<%} %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%=request.getContextPath() %>/list.re?currentPage=<%=maxPage %>'"> >> </button>
			
		</div>
		</form>
	</div>
	
	<script>
	function deleteReply(){
		location.href='<%=request.getContextPath()%>/delete.re';
	}
	</script>
</body>
</html>