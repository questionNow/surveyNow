<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.UserInfo" %>


 <%
	UserInfo user = (UserInfo)request.getAttribute("user"); 
	String userId = user.getUserId();
	String userName = user.getUserName();
	String email = user.getEmail();
	String phone = user.getPhone();
	String 	address = user.getAddress();
	String maritalStatus = user.getMaritalStatus();
	String job = user.getJob();
	
%>    
<%-- 호출 되는지 테스트~~ 
<% Member m = new Member();
m.setUserId("id호출합니다");%> 
--%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<style>   
   div {box-sizing:border-box; font-size:15px;}
   h1 {text-align:center;}
   /* 개인정보 수정 화면 */
   #userUpdateArea {width:800px; height:800px; background:pink; margin: 0 auto; margin-left:500px; margin-top:60px;}
   #userUpdateArea div {height:50px; padding:15px; }
   .div-top {width:800px; background:red; border-bottom:1px solid #ccc; text-align:left;}
   .div-lavel {width:200px; background:orange; float:left; border-bottom:1px solid #ccc; text-align:center;}
   .div-type {width:600px; background:blue; float:left; border-bottom:1px solid #ccc; text-align:left;}
   hr {margin:0;}

</style>



<title>Insert title here</title>
</head>
<body>
	
		<%@ include file="../common/menubar2.jsp" %>
		
        <h1>정보 수정</h1>
<div id="userUpdateArea">
   
   <div class="div-top"><i class="fas fa-user"></i> 개인정보입력</div>

   <div class="div-lavel">이름</div>
   <div class="div-type">
   <input type="text" name="userName" value="<%= userName %>" readonly>
   </div>

   <div class="div-lavel">아이디</div>
   <div class="div-type">
     <input type="text" name="userId" value="<%= userId %>" readonly>
   </div>

   <div class="div-lavel">비밀번호</div>
   <div class="div-type">
   <form>
            <input type="button" onclick="passwordUpdate" value="비밀번호 변경">
   </form>
   </div>

   <div class="div-lavel">이메일</div>
   <div class="div-type">
   <form>
   		<input type="text" name="Email" value="<%=email %>" >
   </form>
   </div>
  
   <div class="div-lavel">전화번호</div>
   <div class="div-type">
   <input type="text" name="Phone" value= "<%=phone %>" >
   
   </div>
	<p style=color:red;>ㅎㅇㅎㅇ해봄</p>

   <div class="div-lavel">주소</div>
   <div class="div-type">
   <input type="text"  name="Address"  value= "<%=address %>" >
   </div>
    
   <div class="div-lavel">결혼여부</div>
   <div class="div-type">
   	<select id = marry name="marry" value="결혼여부" "<%=maritalStatus%>" >
        <option value = "미혼"> 미혼 </option>
       	<option value = "기혼"> 기혼 </option> 
       	 
    </select>
   </div>
   
   <div class="div-lavel" value="직업">직업</div>
   
   <div class="div-type">
   		<select id = job name="job" value="직업여부" "<%=job %>">
            <option value = "무직"> 무직 </option>
            <option value = "학생"> 학생 </option>
            <option value = "자영업"> 자영업 </option>
            <option value = "사무직"> 사무직 </option>
            <option value = "판매/서비스직"> 판매/서비스직 </option>
            <option value = "생산/기술직"> 생산/기술직 </option>
            <option value = "전문/예술직"> 전문/예술직 </option>
            <option value = "경영/관리직"> 경영/관리직 </option>
            <option value = "농/어/축산업"> 농/어/축산업 </option>
            <option value = "기타"> 기타 </option>
   		</select>
   </div>
    
   <div class="div-lavel">자동 등록방지api 생각</div>

   <div class="div-type"></div>


      </div>            
   	
            
		
</body>
</html>