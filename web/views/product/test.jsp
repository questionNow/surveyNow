<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.outer {
	width: 1100px;
	height: 660px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
	<%@ include file="../common/admin_menubar.jsp" %>
	<div class="outer">
		<form action="<%=request.getContextPath()%>/insert.pro" method="post" encType="multipart/form-data">
		<table class="table table-bordered">
    	<thead>
        	<caption>상품등록</caption>
    	</thead>
    	<tbody>
        	<tr>
                <th>상품카테고리 </th>
                <td>
					<select name="category">
						<option value="p01">베이커리</option>
						<option value="p02">카페</option>
						<option value="p03">패스트푸드</option>
						<option value="p04">편의점</option>
						<option value="p05">외식</option>
						<option value="p06">상품권</option>
						<option value="p07">현금</option>
					</select>
                </td>
            </tr>
            <tr>
                <th width="150px">상품명</th>
                <td><input type="text" name="proName" class="form-control"/></td>
            </tr>
            <tr>
                <th>상품이미지</th>
                <td>
                	<div id="proImgArea"><img id="proImg" width="350" height="200"></div>
                </td>
            </tr>
            <tr>
                <th>포인트</th>
                <td><input type="text" name="price" class="form-control"/></td>
            </tr>
            <tr>
                <th>상품재고량</th>
                <td><input width="50px" type="text" name="pCount" class="form-control"/></td>
            </tr>
            <tr>
                <th>상품설명</th>
                <td><textarea cols="10" name="content" class="form-control"></textarea></td>
            </tr>
            <tr>
                <td colspan="2">
					<button type="reset">취소하기</button>
					<button type="submit">작성완료</button>
                </td>
            </tr>
       
    </tbody>
	</table>
	 </form>
	<div id="fileArea"><input type="file" id="img" multiple="multiple" name="proPhoto" onchange="LoadImg(this,1)"></div>
	<script>
		$(function() {
			$("#fileArea").hide();

			$("#proImgArea").click(function() {
				$("#img").click();
			});
		});

		function LoadImg(value, num) {
			if (value.files[0] != undefined) {
				var reader = new FileReader();

			reader.onload = function(e) {
				switch (num) {
					case 1:
						$("#proImg").attr("src", e.target.result);
						break;
				}
			}
						reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
	</div>
</body>
</html>