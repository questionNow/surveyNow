<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "notice.model.vo.Notice, java.util.ArrayList"%> --%>
    
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>  
    
<%-- <%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("arr");
%>   --%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:800px;
		height:500px;
		background:black;
		color:white;
		margin-left:620px;
		margin-top:70px;
	}
	table{
	border:1px solid white;
	text-align:center;
	}
	.tableArea{
	width:650px;
	height:350px;
	margin-left:auto;
	margin-right:auto;
	}
	.searchArea{
	width:650px;
	margin-left:auto;
	margin-right:auto;
	}
</style>

</head>
<body>
<%@include file="../common/menubar2.jsp" %>
<div class="outer">
<br>
<h2 align="center">공지사항</h2>
<div class="tableArea">
	<!-- 조회가  잘 되어 출력되는지 확인 -->
	<table align="center" id="listArea">
		<tr>
			<td>글번호</td>
			<th width="300px">글제목</th>
			<th width="100px">작성자</th>
			<th>작성일</th>
			<th width="100px">답변여부</th>
		</tr>
		<%-- <%if(list.isEmpty()){ %>
		<tr>
			<td colspan="5">존재하는 공지사항이 없습니다.</td>
		</tr>
		<%}else{ %>
		<%for(Notice no : list){ %>
		<tr>
			<td><%= list.get(0).getnNo() %></td>
			<td><%= list.get(0).getnTitle() %></td>
			<td><%= list.get(0).getnWriter() %></td>
			<td><%= list.get(0).getnCount() %></td>
			<td><%= list.get(0).getnDate() %></td>
			
				 <td><%= no.getnNo() %></td>
			<td><%= no.getnTitle() %></td>
			<td><%= no.getnWriter() %></td>
			<td><%= no.getnCount() %></td>
			<td><%= no.getnDate() %></td>
		</tr>
			<%} %>
		<%} %>		 --%>	
	</table>
</div>
	<!-- 보통 사이트들에서는 공지사항이나 게시판 아래에 검색하기 기능을 하는 부분이 있다. -->
	<div class="searchArea" align="center">
	<form>	
		<select id="searchCondition" name= "searchCondition">
			<option>----</option>
			<option value="writer">작성자</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="search">
		<button type="submit">검색하기</button>
	</form>
	
	
	<%-- <!-- 공지사항 글쓰기 기능 추가 -->
	<!-- 공지사항은 보통 관리자만 쓸 수 있다. 따라서 관리자만 쓸 수 있도록 조건을 달자! -->
	<%if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
		<button onclick="location.href='views/notice/noticeInsertForm.jsp'">작성하기</button>
	
	<%} %>
	</div>
</div> --%>

<%-- <script>
	/* 공지사항 리스트에 이벤트를 달아주자 */
	$(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background":"darkgray","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"black"});
			 // 15. 상세보기 이벤트
        }).click(function(){
           var num = $(this).parent().children().eq(0).text();  /* 게시글의 글 번호 */
           location.href="<%=request.getContextPath()%>/detail.no?no="+num;
           //이제 NoticeDetailSevlet 만들러 고고씽!
		});	
	});
</script> --%>

	
</body>
</html>