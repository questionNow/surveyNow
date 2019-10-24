<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="user.model.vo.UserInfo"%>
<%
   UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
#loginMain {
   width: 700px;
   text-align: center;
   margin-left: auto;
   margin-right: auto;
}
#loginMain #logo1{
   margin-left:150px;
   display:inline-block;
   float:left;
   text-align:center;
}
#loginMain #logo2{
   display:inline-block;
   margin-top:15px;
   float:left;
}
.nowlogo {
   width: 100px;
   margin-left: auto;
   margin-right: auto;
}
body{
   background : url("<%=request.getContextPath() %>/image/loginmainTest6.jpg") no-repeat;
   background-size : 2000px 1100px;
}
.loginPage{
   -webkit-animation: fadein 6s;
   padding-left : 800px;
}
@-webkit-keyframes fadein { 
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
} 
#userId{
   width : 280px;
   height : 35px;
   border : 1px solid red;
   border-radius : 10px;
   box-sizing : border-box;
   padding : 5px 10px;
}
#userPwd{
   width : 280px;
   height : 35px;
   border : 1px solid orange;
   border-radius : 10px;
   box-sizing : border-box;
   padding : 5px 10px;
}
input[type = button]{
   cursor : pointer;
   padding : 3px 20px;
   border-radius : 15px;
   font-size : 13px;
}
input[type = submit]{
   cursor : pointer;
   padding : 3px 20px;
   border-radius : 15px;
   font-size : 13px;
}
#loginBtn{
   background: yellow;
   font-size : 15px;
   width : 280px;
   height : 30px;   
}
#memberJoinBtn{
   background: yellowgreen;
   font-size : 15px;
   width : 280px;
   height : 30px;   
}
#findId{
   background: blue;
   width : 137px;
   font-size : 15px;
}
#findPwd{
   background: purple;
   width : 137px;
   font-size : 15px;
}
#loginBtn:hover{
   box-shadow : 0 12px 16px 0 yellow;
}
#memberJoinBtn:hover{
   box-shadow : 0 12px 16px 0 yellowgreen;
}
#findId:hover{
   box-shadow : 0 12px 16px 0 blue;
}
#findPwd:hover{
   box-shadow : 0 12px 16px 0 purple;
}
input::placeholder {
  color: navy;
}
</style>
<title> 설문 N O W </title>
</head>
<body>   
<div id="loginMain">
   <div id="logo1">
   <img src="<%=request.getContextPath()%>/image/semiLogo.png" class=nowlogo></div>
   <div id="logo2">
   <font size=60 color= white> <b>설문 NOW</b> </font></div>
</div> <br clear="both"> <br>
        <!-- /login.me : Servlet을 찾아감 -->
      <form id ="loginForm" action="<%=request.getContextPath()%>/login.me" onsubmit="return validate()" method="post">
         <div class="loginPage">
            <input type = text name = userId id = userId placeholder = "아이디를 입력하세요"> 
            <br><br>
            <input type = password name = userPwd id = userPwd placeholder = "비밀번호를 입력하세요" onkeypress="caps_lock(event)">
            <label id="capslock" style="position:relative; font-size:1.3em; width:300px; bottom:0px; display:none; color : white;"> 
          &nbsp;<b>CapsLock</b> 키가 눌려있습니다!!!! </label> 
            <br><br><input type = submit value="로그인" id = loginBtn><br><br>
            <input type = button id = memberJoinBtn value = "회원가입" onclick = "memberJoin();"> <br> <br>
            <input type = button id = findId name = findId value = "아이디 찾기" onclick = "location='../user/findId.jsp'">
            <input type = button id = findPwd name = findPwd value = "비밀번호 찾기" onclick = "location='../user/findPw.jsp'">
            <label id = resultPw> </label>
         </div>
      </form>
   <script>
      function validate(){
         if($("#userId").val().trim().length ==0){
            alert("아이디를 입력하세요");
            $("#userId").focus(); 
            return false; // return값이 false이면 submit이 되지 않는다.
         }
         if($("#userPwd").val().trim().length==0){
            alert("비밀번호를 입력하세요");
            $("#userPwd").focus();
         
            return false;
         }
         
         return true;
      }
      
      // logout() 함수 작성하기
      function logout(){
         location.href = '<%=request.getContextPath()%>/logout.me';
      }
      
      // 회원가입용 함수 memberJoin() 함수 작성하기
      function memberJoin(){
         location.href="<%=request.getContextPath()%>/views/user/register1.jsp";
      }    
      
      // 캡스락 이벤트
      function caps_lock(e) {
          var keyCode = 0;
          var shiftKey = false;
          keyCode = e.keyCode;
          shiftKey = e.shiftKey;
          if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
                  || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
              show_caps_lock();
              setTimeout("hide_caps_lock()", 36000);
          } else {
              hide_caps_lock();
          }
      }

      function show_caps_lock() {
         $("#capslock").show();
      }

        function hide_caps_lock() {
          $("#capslock").hide();
       }
   </script>
</body>
</html>