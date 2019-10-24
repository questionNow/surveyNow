<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/prac.pr">
		<input type=hidden value=1 name=sNum>
		<button>고고</button>
		<label onclick = "able();">살리기</label>
		<label onclick = "disable();">죽이기</label>
	</form>
	<button onclick="move();">버튼</button>

		<script type="text/javascript">
		console.log($("button"));
		function move(){
		location.href = "<%= request.getContextPath()%>/prac.pr";
		}
		
		function able(){
			$("button").attr("disabled",false);
		}
		function disable(){
			$("button").attr("disabled",true);
		}
		</script>


</body>
</html>