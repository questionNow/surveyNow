<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<title> 비밀번호 찾기 </title>
<style>
#register {
   width: 700px;
   margin-left: auto;
   margin-right: auto;
   text-align: center;
}
#register #logo1{
   margin-left:150px;
   display:inline-block;
   float:left;
   text-align:center;
}
#register #logo2{
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
   background-color : #F8EFE6;
}
.findPwd1{
   font-size : 1.5em;
   font-weight : bold;
   letter-spacing : 7px;
   text-align : center; 
}
.findPwd2{
   letter-spacing : 3px;
   text-align : center;
}

.title {
   margin-left : 390px;
}

input[type = text]{
   width: 608px;
   display : inline-block;
   border : 1px solid #ccc;
   border-radius : 10px;
   box-sizing : border-box;
   margin-left : 10px;
   padding : 12px 20px;
}
input[type = button]{
   cursor : pointer;
   padding : 9px 20px;
   width: 344px;
}
#beforeBtn3{
   margin-left: 390px;
   width : 695px;
}
#findPwdEmailBtn, #findPwdPhoneBtn{
	cursor : pointer;
	padding : 9px 20px;
	width: 344px;
}
#name, #name1 {
   margin-left : 50px;
}

#email1{
   margin-left : 33px;
   width : 200px;
}
#email2{
   width : 187px;
}
#email3{
   width : 200px;
   border-radius : 10px;
   border : 1px solid #ccc;
   padding : .7em;
}
#tongsin{
   width: 200px;
   border-radius : 10px;
   border : 1px solid #ccc;
   padding : .7em;
   margin-left : 33px;
}
#phoneNum{
   width: 393px;
}
#id, #id1{
   margin-left : 33px;
}
#findPwdEmail, #findPwdPhone {
   display : none;
}
</style>
</head>
<body>
<div id="register">
   <div id="logo1">
   <img src="<%=request.getContextPath() %>/image/semiLogo.png" class=nowlogo></div>
   <div id="logo2">
   <font size=60 color=#FF8C19> <b>설문 NOW</b> </font></div>
</div> <br clear="both"> <br>
      <div class = findPwd1>
         아이디 / 비밀번호 찾기          
      </div> <br>
      <div class = findPwd2>
         비밀번호 찾기 <br>
         비밀번호를 모르시나요 ? <br>
         비밀번호 찾기 방법 중 편한 방법을 선택해주세요:)
      </div> <br><br>
     
         <div class=title>
         <div class=join>
            <input type=radio id=findMail name=find value=findMail>
            <label for=findMail> 내 정보에 등록된 이메일로 비밀번호 찾기 </label> <br> <br>
            <form id = findPwdEmail action = "<%=request.getContextPath() %>/findPwdEmail.find" method = post>
               <label> 아이디 </label>
               <input type = text id = id name = userId placeholder = "아이디를 입력하세요" maxlength = 12 onkeyup = "this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');" required>
               <br><br>
               <label> 이름 </label> 
               <input type=text id=name name=userName placeholder="이름을 입력하세요" maxlength=5 onkeyup="this.value=this.value.replace(/[^가-힣]/g,'');" required>
               <br><br> 
               <label> 이메일 </label> 
               <input type=text id=email1 name=email1 maxlength=20 placeholder= "이메일을 입력하세요" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');">
               <input type=text id=email2 name=email3 maxlength=15 placeholder="이메일을 선택하세요" disabled> 
               <select id=email3 name=email2>
                  <option value = "">이메일을 선택하세요</option>
                  <option value="@naver.com">@naver.com</option>
                  <option value="@daum.net">@daum.net</option>
                  <option value="@gmail.com">@gmail.com</option>
                  <option value="@nate.com">@nate.com</option>
               </select> <br>
               <br>
               <input type = button value = "이전단계" onclick = "beforeFind1();">
               <input type = button id = findPwdEmailBtn value = "다음단계"> 
            </form>
         </div> <br>
         
         <div class=join>
            <input type=radio id=findPhone name=find value=findPhone> 
            <label for=findPhone> 내 정보에 등록된 핸드폰번호로 아이디 찾기 </label> <br>
            <br>
            <form id= findPwdPhone action = "<%=request.getContextPath() %>/findPwdPhone.find" method = post>
               <label> 아이디 </label>
               <input type = text id = id1 name = userId placeholder = "아이디를 입력하세요" maxlength = 12 onkeyup = "this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');" required>
               <br><br>
               <label> 이름 </label> 
               <input type=text id = name1 name=userName placeholder="이름을 입력하세요" maxlength=5 onkeyup="this.value=this.value.replace(/[^가-힣]/g,'');" required>
               <br><br> 
               <label for=phone> 핸드폰 </label> 
               <select id = tongsin name=phone1>
                  <option value="">통신사</option>
                  <option value=KT>KT</option>
                  <option value=SKT>SKT</option>
                  <option value=LG>LG</option>
               </select> 
               <input type=text id=phoneNum name = phone maxlength=11 placeholder="(-) 빼고 입력해주세요" onKeyup = "this.value=this.value.replace(/[^0-9]/g,'');"> <br>
               <br>
               <input type=button value = "이전단계" onclick="beforeFind2();"> 
               <input type = button id = findPwdPhoneBtn value = "다음단계">
   	     </form>
            </div>
         </div><br><br>
         <input type = button id = beforeBtn3 value = "로그인 하러가기!" onclick = "beforeFind3();">
   
   <script type="text/javascript">
   // 여기서부터 ->
  $("input[type = radio][name = find]").on(
            "click",
            function() {
               var checkValue = $(
                     "input[type = radio][name = find]:checked").val();

               if (checkValue == "findMail") {
                  $("#findPwdEmail").css("display", "block");
                  $("#findPwdPhone").css("display", "none");
                  $("#beforeBtn3").css("display","none");
               }
               if (checkValue == "findPhone") {
                  $("#findPwdEmail").css("display", "none");
                  $("#findPwdPhone").css("display", "block");
                  $("#beforeBtn3").css("display","none");
               }
            });  // <- 여기까지 라디오 버튼 누르면 display 활성화 / 비활성화
            
   	  // ---->> 여기서부터 Pwd 찾을 때 빈칸 검사
   	  $("#findPwdEmailBtn").click(function(){
   		 if($("#id").val() == ""){
   			 alert("아이디를 입력해주세요");
   			 $("#id").focus();
   			 return false;
   		 } else if ($("#name").val() == ""){
   			 alert("이름을 입력해주세요");
   			 $("#name").focus();
   			 return false;
   		 } else if ($("#email1").val() == ""){
   			 alert("이메일을 입력해주세요");
   			 $("#email1").focus();
   			 return false;
   		 } else if ($("#email2").val() == ""){
   			 alert("이메일을 선택해주세요");
   			 $("#email2").focus();
   			 return false;
   		 } else {
   			 $("#findPwdEmail").submit();  // <- /findPwdEmail.find Servlet
   		 }
   	  });   	  
	  $("#findPwdPhoneBtn").click(function(){
	   		 if($("#id1").val() == ""){
	   			 alert("아이디를 입력해주세요");
	   			 $("#id1").focus();
	   			 return false;
	   		 } else if ($("#name1").val() == ""){
	   			 alert("이름을 입력해주세요");
	   			 $("#name1").focus();
	   			 return false;
	   		 } else if ($("#tongsin").val() == ""){
	   			 alert("통신사를 선택해주세요");
	   			 $("#tongsin").focus();
	   			 return false;
	   		 } else if ($("#phoneNum").val() == ""){
	   			 alert("핸드폰 번호를 입력해주세요");
	   			 $("#phoneNum").focus();
	   			 return false;
	   		 } else {
	   			 $("#findPwdPhone").submit();  // <- /findPwdEmail.find Servlet
	   		 }
	  });  // ----> 여기까지 Pwd 찾을 때 빈칸 검사
	  
      function beforeFind1(){
         location = 'findId.jsp';  // <- 이전 단계
      }
      function beforeFind2(){
    	  location = 'findId.jsp';  // <- 이전 단계
      }
      function beforeFind3(){
    	  location = '../common/loginPage.jsp';  // <- 로그인 메인화면
      }
      $(document).ready(function(){
          // 이메일 선택
          $("#email3").change(function(){
             $("#email3 option:selected").each(function(){
             // 직접 입력
               if($(this).val()=="self"){
                   $("#email2").val("");
                   $("#email2").attr("disabled", false);
                } else if($(this).val()=="select") {
                   $("#email2").val("");
                   $("#email2").attr("disabled", false);
                } else {
                   $("#email2").val($(this).text());
                   $("#email2").attr("disabled", true);
                }
                     });
                  });
                });  
   </script>
</body>
</html>