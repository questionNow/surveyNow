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
.findId1{
   font-size : 1.5em;
   font-weight : bold;
   letter-spacing : 7px;
   text-align : center; 
}
.findId2{
   letter-spacing : 3px;
   text-align : center;
}

.title {
   margin-left : 390px;
}

input[type = text]{
   width : 53.8%;
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
   width : 30.5%;
}
#name1, #name2, #name3{
   margin-left : 50px;
}
.golbang{
   font-size : 1.7em; 
}
#email1{
   margin-left : 33px;
   width : 17.1%;
}
#email2{
   width : 16.5%;
}
#email3{
   width : 15%;
   border-radius : 10px;
   border : 1px solid #ccc;
   padding : .7em;
}
#birty1 {
   margin-left : 17px;
   width : 17.6%;
}
#birty2 {
   width : 17.7%;
   border-radius : 10px;
   border : 1px solid #ccc;
   padding : .7em;
}
#phone1{
   width : 17.7%;
   border-radius : 10px;
   border : 1px solid #ccc;
   padding : .7em;
   margin-left : 33px;
}
#phone2{
   width : 34.9%;
}
#id1{
   margin-left : 33px;
}
#see1, #see2 {
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
</div> <br clear="both">

   <form><br>
      <div class = findId1>
         아이디 / 비밀번호 찾기          
      </div> <br>
      <div class = findId2>
         비밀번호 찾기 <br>
         비밀번호를 모르시나요 ? <br>
         비밀번호 찾기 방법 중 편한 방법을 선택해주세요:)
      </div> <br><br>
      <div class = title>
      <div class = join>
         <input type = radio id = findMailId name = find value = findMailId>
         <label for = findMailId> 내 정보에 등록된 이메일로 아이디 찾기 </label>
         <br><br>
         <div id = see1>
         <label> 아이디 </label> 
         <input type = text id = id1 maxlength = 20 placeholder = "아이디를 입력하세요">
         <br><br>
         <label> 이름 </label> 
         <input type = text id = name1 maxlength = 5 placeholder = "이름을 입력하세요">
         <br><br>
         <label> 이메일 </label>
         <input type = text id = email1 name = email1 maxlength = 20 placeholder = "이메일을 입력하세요" onkeyup = "this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');"> 
         <input type = text id = email2 name = email3 maxlength = 15 placeholder = "이메일을 선택하세요" disabled>
         <select   id = email3 name = email2>
            <option> 이메일을 선택하세요 </option>
            <option value = "@naver.com"> @naver.com </option>
            <option value = "@daum.net"> @daum.net </option>
            <option value = "@gmail.com"> @gmail.com </option>
            <option value = "@nate.com"> @nate.com </option>
         </select>
      <br><br></div></div>
      
      <div class = join>
         <input type = radio id = findPhone name = find value = findPhone>
         <label for = findPhone> 내 정보에 등록된 핸드폰번호로 비밀번호 찾기 </label>
         <br><br>
         <div id = see2>
         <label> 아이디 </label> 
         <input type = text id = id1 maxlength = 20 placeholder = "아이디를 입력하세요">
         <br><br>
         <label> 이름 </label> 
         <input type = text id = name3 maxlength = 5 placeholder = "이름을 입력하세요"> 
         <br><br>
         <label for = phone> 핸드폰 </label>
         <select id = phone1 name = phone1>
            <option value = ""> 통신사 </option>
            <option value = KT> KT </option>
            <option value = SKT> SKT </option>
            <option value = LG> LG </option>
         </select> 
         <input type = text id = phone2 name = phone2 maxlength = 11 placeholder = "(-) 빼고 입력해주세요">
         <br><br>
      </div></div>
      <input type = button value = 이전으로 onclick = "beforeFind();">
      <input type = button value = 다음단계 onclick = "nextFind();">
   </div>
   </form>
   
   <script type="text/javascript">
   // 여기서부터 ->
   $("input[type = radio][name = find]").on("click", function(){
      var checkValue = $("input[type = radio][name = find]:checked").val();
      
      if(checkValue == "findMailId"){
         $("#see1").css("display", "block");
         $("#see2").css("display", "none");
      }
      if(checkValue == "findPhone"){
         $("#see1").css("display", "none");
         $("#see2").css("display", "block");
      }
   }); // <- 여기까지 라디오 버튼 누르면 display 활성화 / 비활성화
   
      function nextFind(){
         alert("회원 정보를 다시 입력해주세요");   // <- 나중에 if 문으로 기능 추가  성공 or 실패 
      }
      function beforeFind(){
         location = 'findId.jsp';  // <- 이전 단계
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