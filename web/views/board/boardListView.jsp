<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList" %>
    
<%
    	ArrayList<Board> nlist = (ArrayList<Board>)request.getAttribute("nlist");
		ArrayList<Board> elist = (ArrayList<Board>)request.getAttribute("elist");
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
#container {
	width: 960px;
	margin: 0 auto;
	text-align: center;
}

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
.tab li {
	float: left;
}
/* Style the links inside the list items */
.tab li a {
	display: inline-block;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
}

ul.tab li.current {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	border-bottom: none;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-weight:bold;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
	
		/* border: 1px solid #476600;
	border-bottom: none; */
}

.tabcontent.current {
	display: block;
}
</style>
</head>
<body>
	<%@include file="../common/admin_menubar.jsp" %>
	<div class="outer">
	<div class="menuTextArea"> <h3>게시글 관리</h3> </div>
		<div id="container">
		<ul class="tab">
			<li id="notice" class="current" data-tab="tab1"><a href="#">공지사항</a></li>
			<li id="event" data-tab="tab2"><a href="#">이벤트</a></li>
		</ul>
		<div id="tab1" class="tabcontent current">
			<table align="center" class="list-table">
			<thead>
				<tr>
					<th width="100px">글번호</th>
	 				<th width="100px">카테고리</th>
					<th width="300px">글제목</th>
					<th width="100px">작성자</th>
					<th width="100px">조회수</th>
					<th width="150px">작성일</th>
				</tr>
			</thead>
				<%if(nlist.isEmpty()) { %>
			<tbody>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<%} else { %>
					<%for(Board b : nlist){ %>
						<tr>
							<input type="hidden" value="<%=b.getbNum()%>">
							<td><%=b.getbNum() %></td>
							<td><%=b.getbType() %></td>
							<td><%=b.getbTitle() %></td>
							<td><%=b.getbWName() %></td>
							<td><%=b.getbCount() %></td>
							<td><%=b.getbCreateDt()%></td> 
						</tr>
					<%} %>
				<%} %>
			</tbody>
			</table>
			<br><br><br>
			<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=1'"> << </button>
			
			<%if(currentPage <= 1) {%>
				<button disabled> < </button>
			<%} else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=currentPage-1 %>'"> < </button>
			<%} %>
			
			<%for(int p = startPage; p<=endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button disabled><%=p %></button>
				<%} else{%>
					<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=p %>'"><%=p %></button>
				<%} %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<button disabled> > </button>
			<%}else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=currentPage+1 %>'"> > </button>
			<%} %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=maxPage %>'"> >> </button>
		</div>
		</div>

		<div id="tab2" class="tabcontent">
			<table align="center" class="list-table">
			<thead>
				<tr>
					<th width="100px">글번호</th>
	 				<th width="100px">카테고리</th>
					<th width="300px">글제목</th>
					<th width="100px">작성자</th>
					<th width="100px">조회수</th>
					<th width="150px">작성일</th>
				</tr>
			</thead>
				<%if(elist.isEmpty()) { %>
			<tbody>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<%} else { %>
					<%for(Board b : elist){ %>
						<tr>
							<input type="hidden" value="<%=b.getbNum()%>">
							<td><%=b.getbNum() %></td>
							<td><%=b.getbType() %></td>
							<td><%=b.getbTitle() %></td>
							<td><%=b.getbWName() %></td>
							<td><%=b.getbCount() %></td>
							<td><%=b.getbCreateDt()%></td> 
						</tr>
					<%} %>
				<%} %>
			</tbody>
			</table>
			<br><br><br>
			<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=1'"> << </button>
			
			<%if(currentPage <= 1) {%>
				<button disabled> < </button>
			<%} else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=currentPage-1 %>'"> < </button>
			<%} %>
			
			<%for(int p = startPage; p<=endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button disabled><%=p %></button>
				<%} else{%>
					<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=p %>'"><%=p %></button>
				<%} %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<button disabled> > </button>
			<%}else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=currentPage+1 %>'"> > </button>
			<%} %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%=request.getContextPath() %>/list.bo?currentPage=<%=maxPage %>'"> >> </button>
		</div>
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

	<script>
	$(function() {
		$('ul.tab li').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('ul.tab li').removeClass('current');
			$('.tabcontent').removeClass('current');
			$(this).addClass('current');
			$('#' + activeTab).addClass('current');
		});
	});

	$(function(){
		$(".list-table td").mouseenter(function(){
			$(this).parent().css({"background":"#F2FFED","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"white"});
		}).click(function(){
			var bnum=$(this).parent().children("input").val();
			
			<% if(loginUser != null){%>
				location.href="<%=request.getContextPath()%>/detail.bo?bnum=" + bnum;
			<%}else{%>
				alert("관리자만 조회 할 수 있습니다!");
			<%}%>
		});
	});
	</script>
</body>
</html>