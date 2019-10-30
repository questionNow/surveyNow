<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %> 
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
			<caption>공지사항</caption>
			<thead>
			<tr>
				<th colspan="3"><span>제목임</span></th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td width="130px">작성자 &nbsp; 작성자</td>
				<td width="200px">작성일</td>
				<td>조회 </td>
			</tr>
			<tr>
				<td colspan="3" height="500px"><p id="content"></p></td>
			</tr>
			</tbody>
		</table>
	</div>
</body>
</html>