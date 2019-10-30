<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,product.model.vo.*"%>
<%
	Product p = (Product)request.getAttribute("product");
	ProductPhoto pp = (ProductPhoto)request.getAttribute("proPhoto");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	width: 1000px;
	height: 650px;
	background: black;
	color: white;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

table {
	border: 1px solid white;
}

.insertArea {
	width: 500px;
	height: 450px;
	margin-left: auto;
	margin-right: auto;
}

.btnArea {
	width: 150px;
	margin-left: auto;
	margin-right: auto;
}

#titleImgArea {
	width: 350px;
	height: 200px;
	border: 2px dashed darkgray;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

#titleImgArea:hover, #contentImgArea1:hover, #contentImgArea2:hover,
	#contentImgArea3:hover {
	cursor: pointer;
}

#contentImgArea1, #contentImgArea2, #contentImgArea3 {
	width: 150px;
	height: 100px;
	border: 2px dashed darkgray;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}
</style>
</head>
<body>
	<%@include file="../common/menubarAdmin.jsp" %>

	<div class="outer">
		<br>
		<h2 align="center">상품등록</h2>
			<form id="updateForm" method="post" encType="multipart/form-data">
			<input name="pronum" type="hidden" value="<%=p.getProNum()%>">
			<div class="insertArea">
				<table align="center">
					<tr>
						<td width="100px">상품카테고리</td>
						<td colspan="3">
						<select id="pCategory" name="pCategory" onchange="categoryChange(this)">
							<option>카테고리를 선택하세요</option>
							<option value="p01">프랜차이즈</option>
							<option value="p02">>편의점</option>
							<option value="p03">외식</option>
							<option value="p04">상품권</option>
							<option value="p05">현금</option>
						</select> 
						<select id="category01" name="category01" style="display: none">
							<option>세부 카테고리를 선택하세요</option>
							<option value="c01">패스트푸드</option>
							<option value="c02">베이커리</option>
							<option value="c03" >카페</option>
						</select>
						<select id="category02" name="category02" style="display: none">
							<option>세부 카테고리를 선택하세요</option>
							<option value="c04">GS</option>
							<option value="c05">CU</option>
							<option value="c06">세븐일레븐</option>
							<option value="c07">미니스톱</option>
						</select>
						<select id="category03" name="category03" style="display: none">
							<option>세부 카테고리를 선택하세요</option>
							<option value="c08">문화상품권</option>
							<option value="c09">백화점상품권</option>
							<option value="c010">영화상품권</option>
						</select>
						</td>
					</tr>
					<tr>
						<td width="100px">상품명</td>
						<td colspan="3"><input type="text" name="proName" value="<%=p.getProName()%>"></td>
					</tr>
					<tr>
						<td>상품이미지</td>
						<td colspan="3">
							<div id="titleImgArea">
								<img src="<%=request.getContextPath() %>/ProductImg/<%=pp.getPhotoChangeName()%>" id="proImg" width="350" height="200">
							</div>
						</td>
					</tr>
					<tr>
						<td width="100px">상품가격</td>
						<td colspan="3"><input type="text" name="price" value="<%=p.getpPrice()%>"></td>
					</tr>
					<tr>
						<td width="100px">상품수량</td>
						<td colspan="3"><input type="text" name="pCount" value="<%=p.getProCount()%>"></td>
					</tr>
					<tr>
						<td width="100px">상품설명</td>
						<td colspan="3"><textarea name="content" rows="5" cols="50" size="resize:none"><%=p.getProText() %></textarea></td>
					</tr>
				</table>
				<div id="fileArea">
					<input type="file" id="img" multiple="multiple" name="proPhoto" onchange="LoadImg(this,1)">
				</div>

				<script>
					$(function() {
						$("#fileArea").hide();

						$("#titleImgArea").click(function() {
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
			<br>
			<div class="btnArea">
				<button type="reset">취소하기</button>
				<button type="submit" onclick="proUpdate();">수정하기</button>
				<button type="submit" onclick="proDelete();">삭제하기</button>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function categoryChange(e) {
			$("#pCategory").click(function(){
				if(e.value == 'p01'){
					$("#category01").css("display" ,"");
					$("#category02").css("display" ,"none");
					$("#category03").css("display" ,"none");
				}
				
				if(e.value == 'p02'){
					$("#category02").css("display" ,"");
					$("#category01").css("display" ,"none");
					$("#category03").css("display" ,"none");
				}
				
				if(e.value == 'p04'){
					$("#category03").css("display" ,"");
					$("#category01").css("display" ,"none");
					$("#category02").css("display" ,"none");
				}
			});
		}
		
		function proUpdate(){
			$("#updateForm").attr("action", "<%=request.getContextPath()%>/update.pro");
		}
		
		function proDelete(){
			$("#updateForm").attr("action", "<%=request.getContextPath()%>/pDelete.pro");
		}
	</script>
</body>
</html>