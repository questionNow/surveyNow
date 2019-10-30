<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <div class="outer">
		<br>
		<h2 align="center">사진 게시판</h2>
		<div class="thumbnailArea">
			<% for(int i=0; i<prolist.size();i++) {
				 Product p = (Product)prolist.get(i);
			%>
			<div class="thumb-list" align="center">
				<div>
					<input type="hidden" value ="<%=p.getProNum()%>">
					<% for(int j=0;j<photolist.size();j++){
						ProductPhoto pp = (ProductPhoto)photolist.get(j);%>
						
						<% if(p.getProNum() == pp.getProNum()) {%>
							<img src="<%=request.getContextPath() %>/ProductImg/<%=pp.getPhotoChangeName()%>"
								width="200px" height="150px">
						<%} %>
					<%} %>
				</div>
				<p> 
					상품번호 : <%= p.getProNum() %> <br>
					상품명 : <%= p.getProName() %><br>
					포인트 : <%= p.getpPrice() %> <br>
					상품설명 : <%= p.getProText() %>
				</p>
			</div>
			<%} %>
		</div> --%>
</body>
</html>