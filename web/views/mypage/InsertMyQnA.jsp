<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer{
      width:900px;
      height:500px;
      background:black;
      color:white;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
   table {
      border:1px solid white;
   }
   .tableArea {
      width:650px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
   }
</style>
</head>
<body>
	<%@ include file ="../common/menubar2.jsp" %>
	
<div class="outer">
		<br>
	
		<h2 align="center">게시판 작성</h2>
		<div class="tableArea">
			 <form id="MyQnAForm" action="<%=request.getContextPath() %>/insert.bo" method="post">
				<table>
					<tr>
						<td>제목</td>
						<td colsapn="3"><input type="text" size="58" name="qnaTitle"></td>
					</tr>
					
					<tr>
						<td>내용</td>
						<td colspan="3">
							<textarea rows="15" cols="60" name="qnaContent" style="resize:none"></textarea>
						</td>
					</tr>
					
					<tr>
						<td>타입</td>
						<td>
							<select name="qnaType">
							<option value="A">설문결제</option>
							<option value="S">설문조사</option>
							<option value="P">포인트교환</option>
							<option value="R">추천인</option>
							<option value="E">기타</option>
							<option value="L">회원가입/로그인</option>
					
						</td>
					</tr>
					
				</table>
				<br>
				<div align="center">
					<button type="reset">취소하기</button>
					<% if(loginUser != null) {%>
					<button id=insertMyQnAbtn onclick="insertMyQnAbtn();">등록하기</button>
					<%} %>
				</div>
			</form> 
		</div>
	</div>
	<!-- 게시판 작성하기 기능 구현하러 가기 -->
	<!-- InsertBoardServlet 만들러 ㄱㄱ씽 -->
	
	<script>
	
	function insertMyQnAbtn(){
		
		var bool = confirm("등록하시겠습니까?");
		
		if(bool) { 		
		$("#MyQnAForm").submit();
		}
	)};
	
	
	</script>
	
</body>
</html>