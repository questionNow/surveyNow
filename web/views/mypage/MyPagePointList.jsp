<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.*, java.util.ArrayList"%>
    
<%
	 ArrayList<Point> pointlist = (ArrayList<Point>)request.getAttribute("pointlist");
	 UserInfo user = (UserInfo)request.getAttribute("user");
	
%>    

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 *{box-sizing:border-box; font-size:15px;}
 #boardArea{
      width:900px;
      height:1000px;
      background:transparent;
      color:black;
      margin-left:800px;
      margin-top:100px;
   }


   table {
   	  background:white;
   	  width:900px;
       
      text-align:center; 
      }
 	 table tr{height:50px; border:1px solid}
  
  	.point_title{font-weight:bold; height:50px;  font-size:10px;  }
  
 	 hr {margin:0;}
 	.point_content_wrap{width:400px; background:white;  }
 	.point_content{text-overflow:ellipsis; overflow:hidden; white-space:nowrap; width:100px; word-wrap:normal; background:white;}

	.div-top{font-size:18px; font-weight:bold; }
	.div-lavel{width:400px; height:30px; float:left; border-bottom:1px dotted #ccc; text-align:center; font-weight:bold; border:1px solid}
	.div-type{width:500px; height:30px; float:left; border-bottom:1px dotted #ccc; text-align:right; border:1px solid}
</style>

<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="../common/menubar2.jsp" %>
	<div id="boardArea">
	<div class="div-top"><i class="fas fa-user"></i>포인트 이력</div>	
	<br>
	<hr width = "100%" height = "10%" color = "#E98235">
		<br>
		<h2 align="center"></h2>
		
			<table align="center" id="listArea">
			<tr class="point_title">
			<td> 번호 </td>
			<td width="400px">내용 </td>
			<td width="100px">적립일</td>
			<td>사용자</td>
			<td width="100px">포인트</td>
		</tr>
		<%if(pointlist.isEmpty()){ %>
		<tr>
			<td colspan="5">존재하는 공지사항이 없습니다.</td>
		</tr>
		<%}else{ %>
		<%for(Point p : pointlist){ %>
		<tr class="point_content_wrap">
			<%-- <td><%= list.get(0).getnNo() %></td>
			<td><%= list.get(0).getnTitle() %></td>
			<td><%= list.get(0).getnWriter() %></td>
			<td><%= list.get(0).getnCount() %></td>
			<td><%= list.get(0).getnDate() %></td> --%>
			
				 <td><%= p.getpNum() %></td>
			<td class="point_content"><%= p.getpContent() %></td>
			<td><%= p.getpDate() %></td>
			<td><%= p.getUserId() %></td>
			<td><%= p.getPoint() %></td>
		</tr>	
			<%} %>
		<%} %>			
	</table>
	<br>
	<div class="div-lavel">포인트 합계</div>
	<div class=div-type>
	<%=loginUser.getPoint() %>
	</div>
		
</div>

<%-- <script>
	$(function () {
	var sum = 0;
<%for(Point p : pointlist){ %>
	console.log(<%=p.getPoint() %>);
	sum = sum + <%=p.getPoint() %>
<%} %>
	$(".abc").val(sum);
});
</script> --%>

</body>
</html>