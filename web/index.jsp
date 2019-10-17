<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
	<%-- <%@ include file = "views/common/menubar.js %> --%>
	
	<!-- 페이지 이동 -->
	<%-- <%=request.getContextPath()%> : 기본 디폴드 폴더 --%>
	<script>	
		<%-- location.href="<%=request.getContextPath()%>/views/common/menubar.jsp"; --%>
		<%-- location.href="<%=request.getContextPath()%>/mainNow(n).jsp"; --%>
		location.href="<%=request.getContextPath()%>/views/common/loginPage.jsp";

	</script>
	
</body>
</html>