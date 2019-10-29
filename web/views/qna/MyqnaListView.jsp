<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mypage.model.vo.*, qna.model.vo.*, java.util.ArrayList" %>
    
<%
    	ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
    	/* PageInfo pi = (PageInfo) request.getAttribute("pi");

    	int listCount = pi.getListCount();
    	int currentPage = pi.getCurrentPage();
    	int maxPage = pi.getMaxPage();
    	int startPage = pi.getStartPage();
    	int endPage = pi.getEndPage(); */
    %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer{
      width:800px;
      height:500px;
      background:white;
      color:black;
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
	<%@ include file="../common/menubar2.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">게시판</h2>
<form id="searchForm" action="<%=request.getContextPath() %>/MyQnASearch.qs?userId=<%=loginUser.getUserId()%>" method="post">
		<div class="tableArea">
			<table align="center" id="listArea">
				<tr>
					<th width="100px">문의번호</th>
	 				<th width="100px">카테고리</th>
					<th width="100px">작성자</th>
					<th width="300px">문의제목</th>
					<th width="100px">문의작성일</th>
					<th width="150px">답변여부</th>
				</tr>
				<%if(list.isEmpty()) { %>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<%} else { %>
					<%for(QnA q : list){ %>
						<tr>
							<input name="qnaNum" type="hidden" value="<%=q.getQnaNum()%>">
							<td><%=q.getQnaNum() %></td>
							<td><%=q.getQnaType() %></td>
							<td><%=q.getUserId() %></td>
							<td><%=q.getQnaTitle() %></td>
							<td><%=q.getQnaDate() %></td>
							<td><%=q.getAnswerYN() %></td>
						</tr>
					<%} %>
				<%} %>
			</table>
		</div>
		
		
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option value="qnaNum">문의번호</option>
				<option value="qnaType">카테고리</option>
				<option value="qnaTitle">문의제목</option>
			</select>
			<input type="search">
			<button type="submit">검색하기</button>
			<button onclick="location.href='views/mypage/InsertMyQnA.jsp'">문의하기 </button>
		</div>
		</form>
	</div>

	<script>
	$(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background":"darkgray","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"blue"});
		}).click(function(){
			var qnanum=$(this).parent().children("input").val();
			
			<% if(loginUser != null){%>
				location.href="<%=request.getContextPath()%>/myqnadetailview.qd?qnanum=" + qnanum;
			<%}else{%>
				alert("로그인 해야만 상세보기가 가능합니다!");
			<%}%>
		});
	});
	</script>
</body>
</html>