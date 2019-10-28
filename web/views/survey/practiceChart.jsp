<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
div{
width : 1500px;
height : 500px;
border : 1px solid red;
}
div div{
float : right;
width : 400px;
height : 300px
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<div></div>
</div>
	<button onclick = "goChart();">value</button>
	
	<script type="text/javascript">
	
	function goChart(){
		location.href = "<%=request.getContextPath()%>/prac.pr?sNum=21"
	}
	</script>
</body>
</html>