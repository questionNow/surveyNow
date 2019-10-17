<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mypage.model.vo.Member"%>
    
<%
	Member m = (Member)request.getAttribute("member"); 
	/* Member m = (Member)session.getAttribute("loginUser"); */

	String userId = m.getUserId();


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<style>   
   div {box-sizing:border-box; font-size:15px;}
   h1 {text-align:center;}
   #userUpdateArea {width:900px; height:800px; background:pink; margin:0 auto; margin-top:200px;}
   #userUpdateArea div {height:50px; padding:15px; }
   .div-top {width:900px; background:red; border-bottom:1px solid #ccc; text-align:left;}
   .div-lavel {width:200px; background:orange; float:left; border-bottom:1px solid #ccc; text-align:center;}
   .div-type {width:700px; background:blue; float:left; border-bottom:1px solid #ccc; text-align:left;}
   hr {margin:0;}

</style>



<title>Insert title here</title>
</head>
<body>
 
	  
	
		
        <h1>정보 수정</h1>
<div id="userUpdateArea">
   
   <div class="div-top"><i class="fas fa-user"></i> 개인정보입력</div>

   <div class="div-lavel">이름</div>
   <div class="div-type">
   <input type="text" maxlength="13" name="userId" value="<%=userId %>" readonly>
   </div>

   <div class="div-lavel">아이디</div>
   <div class="div-type"></div>

   <div class="div-lavel">비밀번호</div>
   <div class="div-type">
   <form>
            <input type="button" onclick="passwordUpdate" value="비밀번호 변경">
   </form>
   </div>

   <div class="div-lavel">이메일</div>
   <div class="div-type">
   <form>
   		<input type="text">
   </form>
   </div>
  
   <div class="div-lavel">전화번호</div>
   <div class="div-type"></div>

   <div class="div-lavel">지급 계좌번호</div>
   <div class="div-type"></div>
<p style=color:red;>계좌번호 입력 실수, 계좌주 오류 등으로 인한 사고는 설문 now가 책임지지 않습니다.<br>
보통예금계좌만 등록해주세요. (CMA, 가상계좌, 적금 등은 이체 불가)
</p>

   <div class="div-lavel">주소</div>
   <div class="div-type"></div>
   
   <div class="div-lavel">결혼여부</div>
   <div class="div-type">
   		<input type="radio" name="marriage">미혼
   		<input type="radio" name="marriage">기혼
   		<input type="radio" name="marriage">이별/사별
   </div>
   
   <div class="div-lavel">직업</div>
   <div class="div-type">
   		<select name="job">
   			<option value=1>전문직</option>
   			<option value=2>경영직</option>
   			<option value=3>사무직</option>
   			<option value=4>서비스/영업/판매직</option>
   			<option value=5>생산/기술직/노무직</option>
   			<option value=6>교사/학원강사</option>
   			<option value=7>학생</option>
   			<option value=8>전업주부</option>
   			<option value=9>공무원(공기업 포함)</option>
   			<option value=10>프리랜서</option>
   			<option value=11>자영업</option>
   			<option value=12>농/임/어업</option>
   			<option value=13>무직</option>
   		</select>
   </div>
   

      </div>            
   		<hr>
            
		
</body>
</html>