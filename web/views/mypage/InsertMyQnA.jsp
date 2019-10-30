<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
  .outer{
      width:900px;
      height:900px;
      background:#F8EFE6;
      color:black;
      margin-left:700px;
      margin-top:50px;
   }
   table {
      
	  margin:0 auto;
	  padding:10px;
	  border-collapse: collapse;
	  border-top:2px solid orange;
	  
   }
   .tableArea {
      width:650px;
      height:400px;
      margin:0 auto;
	  padding:30px;
	  border:none;
	  
   }
   td{border-bottom:1px dotted #999; padding:10px;}
   hr {width:650px; }
   span{font-size:18px; margin-right:15px;}
   input {background:; padding:3px; }
   textarea{padding:3px;}
   select{font-size:18px; padding:3px;}
   button {background:orange; border:none; padding:5px; font-size:18px; border-radius:2px;}
   button:hover{background:yellow;}
   i {color:orange; font-size:5px; margin-right:8px;}
   p {text-align:center; font-size:11px; margin-bottom:25px;}
   p em{color:orange; font-style:normal;}
</style>
</head>
<body>
	<%@ include file ="../common/menubar2.jsp" %>
	
<div class="outer">
		<br>
	
		<h2 align="center">게시판 작성</h2>
		<div class="tableArea">
			 <form id="MyQnAForm" method="post">
				<table>
					<tr >
						<td><span><i class="fas fa-play"></i>제목</span></td>
						<td colsapn="3" ><input type="text" size="58" id="qnaTitle" name="qnaTitle"></td>
					</tr>
					
					<tr>
						<td><span><i class="fas fa-play"></i>내용</span></td>
						<td colspan="3" >
							<textarea rows="15" cols="60" id="qnaContent" name="qnaContent" style="resize:none"></textarea>
						</td>
					</tr>
					
					<tr>
						<td><span><i class="fas fa-play"></i>카테고리</span></td>
						<td>
							<select name="qnaType" id="qnaType">
							<option value = ""> 카테고리를 선택하세요 </option>
							<option value="A">설문결제</option>
							<option value="S">설문조사</option>
							<option value="P">포인트교환</option>
							<option value="R">추천인</option>
							<option value="E">기타</option>
							<option value="L">회원가입/로그인</option>
					</select>
						</td>
					</tr>
					
				</table>
				<br>
				<p>관련 <em>문의/의견</em> 등을 등록하시면 빠른 시일내에 답변 드리겠습니다</p>
				<div align="center">
					<% if(loginUser != null) {%>
					<div id="insertMyQnAbtn" onclick="insertMyQnAbtn();">등록하기</div>
					<%} %>
					<div type="reset" id=turnMyQnAbtn onclick="location.href='<%=request.getContextPath() %>/myqnalist.qna?userId=<%=loginUser.getUserId()%>'">취소하기</div>
				</div>
			</form> 
		</div>
	</div>
	<!-- 게시판 작성하기 기능 구현하러 가기 -->
	<!-- InsertBoardServlet 만들러 ㄱㄱ씽 -->
	
	<script>
	
	function insertMyQnAbtn(){
		
		var bool = confirm("등록하시겠습니까?");
		
		if($("#qnaTitle").val() == ""){
            alert("제목을 입력해주세요");
            $("#qnaTitle").focus();
            return false;
         }
		if($("#qnaContent").val() == ""){
            alert("내용를 입력해주세요");
            $("#qnaContent").focus();
            return false;
         }
		if($("#qnaType").val() == ""){
            alert("카테고리를 선택해주세요");
            $("#qnaType").focus();
            return false;
         }
		if(bool) { 		
		$("#turnMyQnAbtn").attr("action","location.href='<%=request.getContextPath()%>/insert.bo'");
		$("#MyQnAForm").submit();
		return true;
		}
		
	}	
	

	
	</script>
	
</body>
</html>