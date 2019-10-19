<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 등록 완료!</title>
</head>
<body>
	<script type="text/javascript">
		$(function(){
			alert("<%=msg%>"");
		})
	</script>
</body>
</html>