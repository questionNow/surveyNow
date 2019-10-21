<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.Point, mypage.model.vo.PageInfo, java.util.ArrayList"%>
    
<%
	 ArrayList<Point> pointlist = (ArrayList<Point>)request.getAttribute("pointlist");


 	PageInfo pointpi = (PageInfo)request.getAttribute("pointpi");	 
	int ListCount = pointpi.getListCount();
	int currentPage = pointpi.getCurrentPage();
	int maxPage = pointpi.getMaxPage();
	int startPage=pointpi.getStartPage();
	int endPage = pointpi.getEndPage(); 
%>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 #boardArea{
      width:800px;
      height:800px;
      background:black;
      color:white;
      margin-left:auto;
      margin-right:auto;
      margin-top:220px;
   }
  #boardTop{
  	background:red;
  	width:800px;
  	height:80px;
  	
  }
  
  #boardBottom{
  	background:blue;
  	width:800px;
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
	
	<%@ include file="../common/menubar2.jsp" %>
	
	<div id="boardArea">
	
		<br>
		<h2 align="center">참여한 설문</h2>
			<table align="center" id="listArea">
			<tr>
				<th width="200px">적립일</th>
				<th width="200px">내용</th>
				<th width="200px">포인트</th>
			</tr>
		
		 	 <% if(pointlist.isEmpty()){%>
			<tr>
				<td colspan="3">검색 결과가 없습니다.</td>
			</tr>
			<%}else{%> 
			<%for(Point p : pointlist){%>
			<tr>
				  <input type="hidden" value="<%=p.getpNum() %>">
				<td><%=p.getPoint()%></td>
				<td><%=p.getpDate()%></td>
				<td><%=p.getpContent()%></td>
			</tr>
			<%} %>
		 <%} %>	 
			</table>
			<!-- 페이징 처리 시작 -->	
	 	<div id="boardBottom">
			<div class="pagingArea" align="center">
				<!-- 맨 처음으로 -->
				<button onclick="location.href='<%=request.getContextPath() %>/mypoint.mp?currentPage=1'"> << </button>
				<!-- 이전 페이지로(<) -->
				<%if(currentPage <=1) {%>
				<button disabled> < </button>	
				<%} else{%>
				<button onclick="location.href='<%=request.getContextPath() %>/mypoint.mp?currentPage=<%=currentPage-1 %>'"> < </button>
				<%} %>
				
				<!-- 10개의 페이지 목록 -->
				<%for(int p = startPage; p<=endPage; p++){ %>
					<% if(p == currentPage){ %>
						<button disabled><%=p %></button>
					<%} else {%>	
						<button onclick="location.href='<%=request.getContextPath() %>/mypoint.mp?currentPage=<%=p %>'"><%=p %></button>
					<%} %>
					<%} %>
					
				<!-- 다음 페이지로(>) -->
				<%if(currentPage >= maxPage){ %>
				<button disabled> > </button>
				<%}else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/mypoint.mp?currentPage=<%=currentPage+1%>'"> > </button>
				<%} %>
			
				<!-- 맨 끝으로(>>) -->
				<button onclick="location.href='<%=request.getContextPath()%>mypoint.mp?currentPage=<%=maxPage%>'"> >> </button>
			</div>
			
		</div> 
		
	
	</div>

</body>
</html>