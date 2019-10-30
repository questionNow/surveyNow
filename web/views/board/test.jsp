<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table border="1">
					<tr>
						<td>제목</td>
						<td colspan="3"><input type="text" size="50" name="title" value="" readonly></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							<input type="text" name="writer" value="" readonly>
							<!-- 화면에는 안보이지만 값을 servlet으로 넘겨 줄려고 하면 hidden태그 활용하자! -->
						</td>	
						<td>작성일</td>
						<td><input type="date" name="date" value="" readonly></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none" readonly></textarea>
						</td>
					</tr>
				</table>
				<table align="center" width="800px" boder="1">
				<tr>
					<td>타입</td>
						<td><span>이벤트</span></td>
					<td>제목</td>
					<td colspan="3"><span></span></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><span></span></td>
					<td>조회수</td>
					<td><span></span></td>
					<td>작성일</td>
					<td><span></span></td>
				</tr>
				<tr>
					<td>내용</td>
				</tr>
				<tr>
					<td colspan="6">
					<textarea name="content" cols="60" rows="15" style="resize:none" readonly></textarea>
					</td>
				</tr>
			</table>
</body>
</html>