<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Survey</title>
<style>
	body {
	  font-family: Arial, Helvetica, sans-serif;
	}
	
	* {
	  box-sizing: border-box;
	}
	
	/* Create a column layout with Flexbox */

	/* Right column (page content) */
	.right {
	  width : 80%;
	  padding: 15px;
	  display : inline-block;
	}
	
	#surveyList *{
		border-top : 1px solid black;
		border-bottom : 1px solid black;
		
	}
	
</style>
</head>
<body>
	<%@ include file = "surveySideBar.jsp" %>
	

</head>
<body>
<div class="row">

  <div class="right" style="background-color:#ddd;">
    <h2>결제하기</h2>
    <p>경제 가능한 설문을 확인 해보세요.</p>
    <p>결제 하고 싶은 설문을 선택하고 결제하기를 늘러주세요</p>
    	<div id = "surveyList">
    		<table id = "surveyListTable" style = "text-align : Center" cellpadding="0" cellspacing="0">
    			<tr>
					<th width = "500px">제목</th>
    				<th width = "100px">패널 수</th>
    				<th width = "100px">문항 수</th>
    				<th width = "100px">작성일</th>
    				<th width = "100px">응답자 수</th>
    				<th width = "300px">지급 포인트(패널 1명당 지급)</th>
    				<th width = "150px">예상 금액</th>
    			</tr>
    			<tr>

    			</tr>
    			
    		</table>   	
    	</div>       
  </div>
</div>
	
	
	<script type="text/javascript">
	function goSurvey(){
		locaion.href ="survey.jsp";
	}
	
	
	
		
	</script>
	
</body>
</html>