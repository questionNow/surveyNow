<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,product.model.vo.*"%>
    
<%
	ArrayList prolist = (ArrayList)request.getAttribute("prolist");
	ArrayList photolist = (ArrayList)request.getAttribute("photolist");
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

.proImg{
	width: 150px;
	height: 150px;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<%@include file="../common/admin_menubar.jsp" %>
	<div class="outer">
	<div class="menuTextArea"> <h3>상품 관리</h3> </div>
		<div id="container">
		<ul class="tab">
			<li class="current" data-tab="tab1"><a href="#">베이커리</a></li>
			<li data-tab="tab2"><a href="#">카페</a></li>
		</ul>
		<div id="tab1" class="tabcontent current">
			<table align="center" class="list-table">
			<thead>
				<tr>
					<th width="50px">no</th>
	 				<th width="200px">상품명</th>
					<th width="100px">포인트</th>
					<th width="300px">상품설명</th>
					<th width="50px">재고량</th>
				</tr>
			</thead>
			<tbody>
			<% for(int i=0; i<prolist.size();i++) {
				 Product p = (Product)prolist.get(i); %>
				<tr>
					<input type="hidden" value ="<%=p.getProNum()%>">
					<td width="50px"><%=p.getProNum() %></td>
	 				<td width="200px">
	 				<div class="proImg">
	 					<% for(int j=0;j<photolist.size();j++){
							ProductPhoto pp = (ProductPhoto)photolist.get(j);%>
								<% if(p.getProNum() == pp.getProNum()) {%>
	 								<img src="<%=request.getContextPath() %>/ProductImg/<%=pp.getPhotoChangeName()%>" width="200px" height="150px">
								<%} %>
						<%} %>
					</div>
	 				<%=p.getProName() %></td>
					<td width="100px"><%=p.getpPrice() %></td>
					<td width="300px"><%=p.getProText() %></td>
					<td width="50px"><%=p.getProCount() %></td>
				</tr>
			<%} %>
			</tbody>
			</table>
		</div>
		</div>
		<div id="tab2" class="tabcontent">
			ddfjdklfjdsfsdssdsd
		</div>
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
			var pronum=$(this).parent().children("input").val();
			
			<% if(loginUser != null){%>
				location.href="<%=request.getContextPath()%>/updateView.pro?pronum=" +pronum;
			<%}else{%>
				alert("관리자만 조회 할 수 있습니다!");
			<%}%>
		});
	});
	
	 	<%-- $(".thumb-list").click(function(){
			var pronum = $(this).children().children().eq(0).val();
			location.href="<%=request.getContextPath()%>/updateView.pro?pronum=" +pronum;
		});  --%>
	</script>
</body>
</html>