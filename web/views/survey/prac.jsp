<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/detail.cp">
		<input type=hidden value=1 name=sNum>
		<button>고고</button>
	</form>
	<button onclick="move();">버튼</button>

	<script type="text/javascript">
		function move(){
		location.href = "makeSurvey.jsp";
		}
		</script>


</body>
</html>