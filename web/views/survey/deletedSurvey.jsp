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
    <h2>진행중인 설문</h2>
    <p>진행중인 설문을 확인 해보세요</p>
    	<div id = "surveyList">
    		<table id = "surveyListTable" style = "text-align : center" cellpadding="0" cellspacing="0">
    			<tr>
    				<th width = "550px">제목</th>
    				<th width = "100px">문항 수</th>
    				<th width = "150px">작성일</th>
    				<th width = "100px">삭제일</th>
    				<th width = "100px">삭제 예정일</th>
    			</tr>
    			<tr>

    			</tr>
    			
    		</table>   	
    	</div>       
  </div>
</div>
	

</body>
</html>