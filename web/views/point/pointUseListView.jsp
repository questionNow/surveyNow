<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="point.model.vo.*, board.model.vo.*, java.util.ArrayList" %>
    
<%
    	ArrayList<Point> list = (ArrayList<Point>)request.getAttribute("list");
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

.list-table thead th {
	height: 40px;
	border-top: 2px solid #BCE55C;
	border-bottom: 1px solid #CCC;
	font-weight: bold;
	font-size: 17px;
}

.list-table tbody td {
	text-align: center;
	padding: 10px 0;
	border-bottom: 1px solid #CCC;
	height: 20px;
	font-size: 14px
}
</style>
</head>
<body>
	<%@include file="../common/admin_menubar.jsp" %>
	<div class="outer">
			<div class="menuTextArea"> <h3>포인트 사용 내역</h3> </div>
			<table align="center" class="list-table">
			<thead>
				<tr>
					<th width="100px">아이디</th>
	 				<th width="100px">보유포인트</th>
					<th width="300px">포인트 내역</th>
					<th width="100px">날짜</th>
				</tr>
			</thead>
				<%if(list.isEmpty()) { %>
			<tbody>
				<tr>
					<td colspan="4">조회된 리스트가 없습니다.</td>
				</tr>
				<%} else { %>
					<%for(Point point : list){ %>
						<input name="pointList" type="hidden" value="1">
						<tr>
							<td><%=point.getUserId()%></td>
							<td><%=point.getPoint()%></td>
							<td><%=point.getpContent() %></td>
							<td><%=point.getpDate() %></td>
						</tr>
					<%} %>
				<%} %>
			</tbody>
			</table>
			<br><br><br>
			<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath() %>/list.po?currentPage=1'"> << </button>
			
			<%if(currentPage <= 1) {%>
				<button disabled> < </button>
			<%} else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/list.po?currentPage=<%=currentPage-1 %>'"> < </button>
			<%} %>
			
			<%for(int p = startPage; p<=endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button disabled><%=p %></button>
				<%} else{%>
					<button onclick="location.href='<%=request.getContextPath() %>/list.po?currentPage=<%=p %>'"><%=p %></button>
				<%} %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<button disabled> > </button>
			<%}else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/list.po?currentPage=<%=currentPage+1 %>'"> > </button>
			<%} %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%=request.getContextPath() %>/list.po?currentPage=<%=maxPage %>'"> >> </button>
			
		</div>
		</div>
		
		
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option value="category">카테고리</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search">
			<button type="submit">검색하기</button>
		</div>
</body>
</html>