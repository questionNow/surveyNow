<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button onclick = "goChart();"></button>
	
	<script type="text/javascript">
	
	function goChart(){
		location.href = "<%=request.getContextPath()%>/prac.pr?sNum=88"
	}
	</script>
</body>
</html>