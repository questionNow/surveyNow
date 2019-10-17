<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.UserInfo" %>
    
<%
	UserInfo m = (UserInfo)request.getAttribute("user");

	// Member m = (Member)session.getAttribute("loginUser");
	// session 값으로 로그인 정보 가져와도 된다.
	// update,delete 시에는 request로 사용해야한다. 수정 이전값을 불러와서 오류가 난다.
	
	String userId 	= m.getUserId();
	String userPwd 	= m.getUserPwd();
	String userName = m.getUserName();
	int	   userAge	= m.getAge();
	String address	= m.getAddress();
	String    phone	= m.getPhone();
	String email	= m.getEmail();
	int    userType	= m.getUserType();
	
	
/* 	user = new UserInfo(rs.getString("USER_ID"),
            rs.getString("USER_PWD"),
            rs.getString("USER_NAME"),
            rs.getInt("AGE"),
            rs.getString("ADDRESS"),
            
            rs.getInt("PHONE"),
            rs.getString("EMAIL"),
            rs.getInt("USER_TYPE"),
            rs.getString("STATUS") */
	
	
	
	
	/* 회원가입 할때 전화번호, 이메일, 주소는 필수입력사항이 아니라면 */
//	String phone 	= m.getPhone() != null ? m.getPhone() : "";
//	String email 	= m.getEmail() != null ? m.getEmail() : ""; 
//	String address 	= m.getAddress() != null ? m.getAddress() : "";
	
//	String[] checkedInterest = new String[6];
	
/*  	if(m.getInterest() != null){	// 사용자가 회원가입시 흥미버튼을 체크했다면 
		String[] interests = m.getInterest().split(",");
	
		for(int i=0; i<interests.length; i++){
			switch(interests[i]){
				case "운동" : checkedInterest[0] = "checked"; break;
				case "등산" : checkedInterest[1] = "checked"; break;
				case "낚시" : checkedInterest[2] = "checked"; break;
				case "요리" : checkedInterest[3] = "checked"; break;
				case "게임" : checkedInterest[4] = "checked"; break;
				case "기타" : checkedInterest[5] = "checked"; break;
				// checked : input태그에 속성값 주기
			} 
		}
	} */
 
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.outer{
		width:600px;
		/* height:500px; */
		height:500px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
		
	}
	.outer label, .outer td{
		color:white;
	}
	input{
		margin-top:2px;
	}
	#idCheck, #goMaion, #updateBtn, #deleteBtn{
		background:orangered;
		border-radius:5px;
		width:80px;
		height:25px;
		text-align:center;
	}
	#idCheck:hover, #updateBtn:hover, #goMain:hover, #deleteBtn:hover{
		cursor:pointer;
	}
	td{
		text-align:right;
	}
	#updateBtn, #deleteBtn{
		background:yellowgreen;
	}
	#updateBtn, #goMain, #deleteBtn{
		display:inline-block;
	}

	/* body { min-height:100vh; } */

	/* body {background: url(image/logoinImage.jpg) repeat-x center top;} */

	/* body{background-image: url(../image/logoinImage.jpg);} */

</style>

</head>
<body>

<!-- 메인화면에 보이게 -->
<%@ include file="../common/menubar.jsp" %> 

	<section class="outer" id="contents">
<%-- 	잘 나오뉘?
	<%= m.getUserName() %> --%>
	
	<!-- memberJoinForm.jsp에 있는 table을 복사해서 쓰자 -->
	<form id="updateForm" action="<%=request.getContextPath()%>/update.me" method="post">
		<table>
			<tr>
				<td width="200px">* 아이디</td>				<!-- readonly : 수정불가 -->
				<td><input type="text" maxlength="13" name="userId" value="<%=m.getUserId() %>" readonly></td>
				<!-- <td width="200px"><div id="idCheck">중복확인</div></td> -->
				<td width="200px"></td>
				<%-- <td style="width:200px></tr> --%>
			</tr>
			<tr>
				<td>* 비밀번호</td>
				<%-- <td><input type="password" maxlength="13" name="userPwd" value="<%=m.getUserPwd() %>"></td> --%>
																				<!-- userPwd : 위에 변수값으로 변수명 변경함 -->
				<td><input type="password" maxlength="13" name="userPwd" value="<%=userPwd %>" readonly></td>
				
			</tr>
<!-- 			<tr>
				<td>* 비밀번호 확인</td>
				<td><input type="password" maxlength="13" name="userPwd2" required></td>
			</tr> -->
			<tr>
				<td>* 이름</td>
				<td><input type="text" maxlength="5" name="userName" value="<%=userName %>"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<input type="tel" maxlength="11" name="phone" placeholder="(-없이)01012345678" value="<%=phone %>">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" value="<%= email %>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" value="<%= address %>"></td> 
			</tr>
<%-- 			<tr>
				<td>관심분야</td>
				<td>
					<input type="checkbox" id="sports" name="interest" value="운동" <%=checkedInterest[0] %>>
					<label for="sports">운동</label>
					<input type="checkbox" id="climbing" name="interest" value="등산" <%=checkedInterest[1] %>>
					<label for="climbing">등산</label>
					<input type="checkbox" id="fishing" name="interest" value="낚시" <%=checkedInterest[2] %>>
					<label for="fishing">낚시</label>
					<input type="checkbox" id="cooking" name="interest" value="요리" <%=checkedInterest[3] %>>
					<label for="cooking">요리</label>
					<input type="checkbox" id="game" name="interest" value="게임" <%=checkedInterest[4] %>>
					<label for="game">게임</label>  
					<input type="checkbox" id="etc" name="interest" value="기타" <%=checkedInterest[5] %>>
					<label for="etc">기타</label>
				</td>
			</tr> --%>
		</table>
		<br>
		<div class="btns" align="center">
			<div id="goMain" onclick="goMain();">메인으로</div>
			<div id="updateBtn" onclick="updateMember();">수정하기</div>
			<div id="deleteBtn" onclick="deleteMember();">탈퇴하기</div>
		</div>
	</form>
	
<!--      <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="footer">
                    <ul>
                        <li><a href="#">사이트 도움말</a></li>
                        <li><a href="#">사이트 이용약관</a></li>
                        <li><a href="#">사이트 운영원칙</a></li>
                        <li><a href="#"><strong>개인정보취급방침</strong></a></li>
                        <li><a href="#">책임의 한계와 법적고지</a></li>
                        <li><a href="#">게시중단요청서비스</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                    <address>
                        Copyright &copy;
                        <a href="http://webstoryboy.co.kr"><strong>webstoryboy</strong></a>
                        All Rights Reserved.
                    </address>
                </div>
            </div>
        </div>
    </footer> -->
	
<!-- 화면 맨아래 보이게 -->
<%-- <%@ include file="../common/footer.jsp" %> --%>
	
	</section>
	
	<script>
		function goMin(){
			location.herf="/jspProject/index.jsp"; // 아래와 동일하다. 
			<%-- location.herf="<%=request.getContextPath()%>/index.jsp"; --%>
		}
		
		// 회원 정보 수정하기
		function updateMember(){
			$("#updateForm").submit();
				// UpdateMemberServlet 만들러 ㄱㄱ씽!!
		}
		
		// 회원 탈퇴하기
		function deleteMember(){
			var bool = confirm("정말로 탈퇴 할꼬얌??"); // confirm yes/no 팝업창
			
			if(bool){
				// update가 있어서 form태그의 경로를 변경해줘야한다. : .attr
				$("#updateForm").attr("action", "<%=request.getContextPath()%>/delete.me");
				$("#updateForm").submit();
				
				// DeleteMemberServlet 만들러 꼬꼬쓍~!!
			}
		}
	</script>
	
	
	
	
	
	
<%-- 	<!-- 화면 맨아래 보이게 -->
<%@ include file="../common/footer.jsp" %>
	
	 --%>
	
	
	
	
	
	
	
</body>


</html>