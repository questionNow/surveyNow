<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Create a column layout with Flexbox */

/* Right column (page content) */
.right {
	  width : 80%;
	  padding: 15px;
	  display : inline-block;
}

#surveyList * {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#surveyListTable, #surveyListTable tr, #surveyListTable th,
	#surveyListTable td {
	border-top: 1px solid orangered;
	border-bottom: 1px solid orangered;
}

th h3:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="surveySideBar.jsp"%>
	<div class="row">
		<div class="right" style="background-color: #ddd;">
			<h2>설문 만들기</h2>
			<button id = "pick">+객관식</button>
			<button id = "write">+주관식</button>
			<button id = "rank">+순위</button>
			<br>
			<div id="surveyCreate">			
				<table id="surveyListTable" style="text-align: Center" width=85%
					cellpadding="0" cellspacing="0">
						
					<tr>
						<td colspan="7"><br>
						<br></td>
					</tr>
					<tr>
						<td colspan ="2"><h2>설문 제목</h2></td>
						<td colspan="5"><input type="text" size="80"
							placeholder="설문 제목을 입력하세요"></td>
					</tr>
					<tr>
						<td colspan="7">설문에 질문을 추가하시려면 상단의 질문 종류를 클릭 해주세요.</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$count = 1;
		
		// 객관식 버튼 - 객관식 문제 추가
		$("#pick").click(function(){
			$.ajax({
				success : function(){
					$tableBody = $("#surveyListTable");
					
					
					var $tr = $("<tr id="+ $count +">");
					var $noTd = $("<td>").text($count);
					var $titleTd = $("<td>").text("제목");
					var $subjectTd = $("<td><input type = 'text' colspan = '4' size = '50' placeholder ='질문을 입력하세요.'></td>")
					var $deleteTr = $("<td><button onclick = 'deleteTr();'>X</button>");
					
					
					$tr.append($noTd);
					$tr.append($titleTd);
					$tr.append($subjectTd);
					$tr.append($deleteTr);
					
					$tableBody.append($tr);
					
					$count += 1;
				}
			})
		});
		
		// 주관식 버튼 - 주관식 문제 추가
		$("#write").click(function(){
			$.ajax({
				success : function(){					
					$tableBody = $("#surveyListTable");
					var $tr = $("<tr id="+ $count +">");
					var $noTd = $("<td>").text($count);
					var $titleTd = $("<td>").text("제목");
					var $subjectTd = $("<td><input type = 'text' colspan = '4' size = '50' placeholder ='질문을 입력하세요.'></td>")
					var $deleteTr = $("<td><button onclick = 'deleteTr();'>X</button>");
					
					var $select = $("<td colspan = 4>).text('객관식 문항 추가')");
					
					
					$tr.append($noTd);
					$tr.append($titleTd);
					$tr.append($subjectTd);
					$tr.append($deleteTr);
					
					$tableBody.append($tr);
					
					$count += 1;
				}
			})
		});
		
		
			function deleteTr(){
				$.ajax({
					
				})
			}
	</script>

</body>
</html>