<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList" %>
    
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int ListCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage=pi.getStartPage();
	int endPage = pi.getEndPage();
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 #boardArea{
      width:1200px;
      height:1000px;
      background:black;
      color:white;
      margin-left:auto;
      margin-right:auto;
      margin-top:220px;
   }
  #boardTop{
  	background:red;
  	width:1200px;
  	height:80px;
  	
  }
  
  #boardBottom{
  	background:blue;
  	width:1200px;
  	height:150px;
  	margin-top:400px;
  	float:left;
  }
  
   table {
      border:1px solid white;
      text-align:center;
  }
  .pagingArea{
  	margin-top:60px;
  }
 

</style>

<title>Insert title here</title>
</head>
<body>
	
	<%@include file="../common/menubar.jsp" %>
	<div id="boardArea">
		<div id="boardTop">
		
		</div>
		<br>
		<h2 align="center">참여한 설문</h2>
			<table align="center" id="listArea">
			<tr>
				<th width="400px">제목</th>
				<th width="100px">문항수</th>
				<th width="200px">참여일</th>
				<th width="200px">카테고리</th>
				<th width="200px">포인트</th>
			</tr>
			<tr>
			<% if(list.isEmpty()){ %>
			<tr>
				<td colspan="5">검색 결과가 없습니다.</td>
			</tr>
			<%}else{ %>
			<% for(Board b : list){ %>
			<tr>
				<input type="hidden" value="<%=b.getbId() %>">
				<td><%=b.getbId() %></td>
				<td><%=b.getcId() %></td>
				<td><%=b.getbTitle() %></td>
				<td><%=b.getbWriter() %></td>
				<td><%=b.getbCount() %></td>
			</tr>
			<%} %>
		<%} %>	
			</table>
			<!-- 페이징 처리 시작 -->	
		<div id="boardBottom">
			<div class="pagingArea" align="center">
				<!-- 맨 처음으로 -->
				<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=1'"> << </button>
				<!-- 이전 페이지로(<) -->
				<%if(currentPage <=1) {%>
				<button disabled> < </button>	
				<%} else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=currentPage-1 %>'"> < </button>
				<%} %>
				
				<!-- 10개의 페이지 목록 -->
				<%for(int p = startPage; p<=endPage; p++){ %>
					<% if(p == currentPage){ %>
						<button disabled><%=p %></button>
					<%} else {%>	
						<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=p %>'"><%=p %></button>
					<%} %>
					<%} %>
					
				<!-- 다음 페이지로(>) -->
				<%if(currentPage >= maxPage){ %>
				<button disabled> > </button>
				<%}else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/list.bo?currentPage=<%=currentPage+1%>'"> > </button>
				<%} %>
			
				<!-- 맨 끝으로(>>) -->
				<button onclick="location.href='<%=request.getContextPath()%>/list.bo?currentPage=<%=maxPage%>'"> >> </button>
			</div>
			
			<div class="searchArea" align="center">
				<select id="searchCondition" name="searchCondition">
				<option>(구분)</option>
				<option value="title">제목</option>
				<option value="category">카테고리</option>
				</select>
				<input type="search">
				<button type="submit">검색하기</button>
				
			</div>
		</div>
		
	
	</div>



</body>
</html>