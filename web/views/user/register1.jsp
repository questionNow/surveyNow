<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 창 </title>
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

.register {
   font-size : 2em;
   font-weight : bold;
   letter-spacing : 22px;
   text-align : center; 
}

.join {
   margin-left: 650px;
   
}

input[type = button]{
   cursor : pointer;
   padding : 9px 20px;
}
input[type = reset]{
   cursor : pointer;
   padding : 9px 20px;
   width : 266.5px;
}
input[type = text]{
   width : 540px;
   display : inline-block;
   border : 1px solid #ccc;
   border-radius : 10px;
   box-sizing : border-box;
   padding : 12px 20px;
}
input[type = password]{
   width : 540px;
   display : inline-block;
   border : 1px solid #ccc;
   border-radius : 10px;
   box-sizing : border-box;
   padding : 12px 20px;
}

#id {
   width : 405px;
}
#idChk{
   width : 130px;
}
#gender{
   width : 540px;
   border-radius : 10px;
   border : 1px solid #ccc;
   padding : .7em;
}
#email1, #email2{
   width : 179.5px;
}
#email3{
   width : 170px;
   border-radius : 10px;
   border : 1px solid #ccc;
   padding : .7em;
}
#emailNum{
   width : 280px;
}
#tongsin{
   width : 180px;
   border-radius : 10px;
   border : 1px solid #ccc;
   padding : .7em;
}
#phoneNum{
   width : 355px;
}
#postCode{
   width : 150px;   
}
#address1{
   width : 278px;
}
#seAddress{
   cursor : pointer;
   padding : 9px 20px;
   width : 100px;
}
#detailAddress{
   width : 295px;
}
#extraAddress{
   width : 240px;
}
#recommendId{
    width : 405px;   
}
#reIdChk{
   width : 128px;
}
#nextMain{
   width : 268.5px;
}
#nextRegister, #checkForm{
   cursor : pointer;
   padding : 9px 20px;
   width : 540px;
}
.question {
   margin-left : 630px;
   font-size : larger;
}
#finalEdu{
   width : 493px;
   border-radius : 10px;
   border : 1px solid #ccc;
   padding : .7em;
}
#job{
   width : 492px;
   border-radius : 10px;
   border : 1px solid #ccc;
   margin-left : 39.5px;
   padding : .7em;
}
#income{
   width : 493px;
   border-radius : 10px;
   border : 1px solid #ccc;
   margin-left : 12.5px;
   padding : .7em;
}
#home1, #home2, #family1{
   width : 493px;
   border-radius : 10px;
   border : 1px solid #ccc;
   padding : .7em;
}
#religion, #marry, #soldier{
   width : 493px;
   border-radius : 10px;
   border : 1px solid #ccc;
   margin-left : 39px;
   padding : .7em;
}
.interest{
   margin-left : 80px;
}
#successRegister, #backBtn{
   cursor : pointer;
   padding : 9px 20px;
   width : 285px;
}
 
</style>
<script language = "javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
</head>
<body>
<%-- <%@ include file = "../common/footer.jsp" %> --%>
<div id="register">
   <div id="logo1">
   <img src="<%=request.getContextPath() %>/image/semiLogo.png" class=nowlogo></div>
   <div id="logo2">
   <font size=60 color=#FF8C19> <b>설문 NOW</b> </font></div>
</div> <br clear="both">
   
   <form  onsubmit = "return checkCondition();" id = registerForm name = registerForm action = "<%=request.getContextPath()%>/register.user" method = post> <br>
   <!-- <form onsubmit = "return checkCondition1();" id = registerForm1 name = registerForm1 action = "#registerForm2" method = post> <br> --> 
   <div class = title1 >
      <div class = register>
            회원가입
      </div> <br>
      <div class = join>
         <label for = id> 아이디 </label> <br>
         <input type = text id = id name = userId placeholder = "아이디를 입력하세요" maxlength = 12 onkeyup = "this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');" check_result = "fail" required>
         <input type = button value = 중복확인 id = idChk> <br>
         <label id = resultId> </label>
      </div> <br>
      <div class = join>
         <label for = pw1> 비밀번호 </label> <br>
         <input type = password id = pw1 name = userPwd placeholder = "비밀번호를 입력하세요" maxlength = 20 style = "ime-mode:inactive" required><br>
         <label id = resultPw1> </label>
      </div> <br>
      <div class = join>
         <label for = pw2> 비밀번호 확인 </label> <br>
         <input type = password id = pw2 name = userPwd2 placeholder = "비밀번호를 일치시켜주세요" maxlength = 20 style = "ime-mode:inactive" required> <br>
         <label id = resultPw2> </label>
      </div> <br>
      <div class = join>
         <label for = name> 이름 </label> <br>
         <input type = text id = name name = userName placeholder = "이름을 입력하세요" maxlength = 5 onkeyup = "this.value=this.value.replace(/[^가-힣]/g,'');" required> 
      </div> <br>
      <div class = join>
         <label> 나이 </label> <br>
         <input type = text id = age name = age maxlength = 3 placeholder = "나이를 입력하세요" onKeyup = "this.value=this.value.replace(/[^0-9]/g,'');" required>
      </div><br>
      <div class = join>
         <label> 성별 </label> <br>
         <select id = gender name = gender>
            <option value = ""> 성별을 선택하세요 </option>
            <option value = 남자> 남자 </option>
            <option value = 여자> 여자 </option>
         </select>
      </div> <br>
      <div class = join>
         <label> 이메일 </label> <br>
         <input type = text id = email1 name = email1 maxlength = 20 placeholder = "이메일을 입력하세요" onkeyup = "this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');"> 
         <input type = text id = email2 name = email3 maxlength = 15 placeholder = "이메일을 선택하세요" disabled>
         <select   id = email3 name = email2>
            <option> 이메일을 선택하세요 </option>
            <option value = "@naver.com"> @naver.com </option>
            <option value = "@daum.net"> @daum.net </option>
            <option value = "@gmail.com"> @gmail.com </option>
            <option value = "@nate.com"> @nate.com </option>
         </select> <br>
         <!-- 이메일 인증번호 입력 칸 
         <input type = text id = emailNum name = emailNum placeholder = "인증번호 입력">
         <input type = button id = receiveNum value = "인증번호전송">
         <input type = button id = confirmNum value = "인증번호확인" onclick = "confirm();"> 
         -->
      </div> <br>
      <div class = join>
         <label> 핸드폰번호 </label> <br>
         <select id = tongsin name = tongsin>
            <option value = ""> 통신사를 선택하세요 </option>
            <option value = "KT"> KT </option>
            <option value = "SKT"> SKT </option>
            <option value = "LG"> LG </option>
         </select>
         <input type = text id = phoneNum name = phone maxlength = 11 placeholder = "(-) 빼고 입력해주세요" onKeyup = "this.value=this.value.replace(/[^0-9]/g,'');">
      </div> <br>
      <div class = join>
         <label> 주소 </label> <br>
         <input type = text id = postCode name = postCode placeholder = "우편번호" disabled>
         <input type = text id = address1 name = address1 placeholder = "도로명 주소">
         <input type = button id = seAddress value = 주소검색 onclick = "searchAddress()"> <br><br>
         <span id= guide style = "color:#999; display:none"> </span>
         <input type = text id = detailAddress name = address2 placeholder = "상세 주소를 입력하세요">
         <input type = text id = extraAddress name = extraAddress placeholder = "참고주소" disabled>
      </div> <br>
      <div class = join>
         <label> 추천인 </label> <br>
         <input type = text id = recommendId name = recommendId placeholder = "추천인이 있으면 입력하세요">
         <input type = button value = "추천인 확인" id = reIdChk>
      </div> <br>
      <div class = join>
         <div id = firstClick> <input type = button id = checkForm value = "가입 2단계 진행"></div>
         <div id = secondClick> <input type = button id = nextRegister value = "가입 2단계 진행"></div> <br>
         <input type = reset value = "다시쓰기" id = clear1>
         <input type = button id = nextMain value = "메인화면" onclick = "location='../common/menubar.jsp'">
      </div> </div> 

   <div class = title2>
      <div class = register>
         패널 정보 등록
      </div> <br>
      <div class = question>
         <label for = 1> 최종학력 </label>
         <select id = finalEdu name = finalEducation>
            <option value = ""> 최종학력을 선택하세요 </option>
            <option value = "초등학교 졸업"> 초등학교 졸업 </option>
            <option value = "중학교 졸업"> 중학교 졸업 </option>
            <option value = "고등학교 졸업"> 고등학교 졸업 </option>
            <option value = "2·3년제 대학교 졸업"> 2·3년제 대학교 졸업 </option>
            <option value = "4년제 대학교 졸업"> 4년제 대학교 졸업 </option>
            <option value = "석사학위 취득"> 석사학위 취득 </option>
            <option value = "박사학위 취득"> 박사학위 취득 </option>
         </select>
      </div> <br>

      
      <div class = question>
         <label for = 2> 직업 </label>
         <select id = job name = job>
            <option value = ""> 직업을 선택하세요 </option>
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
      </div> <br>
      
      <div class = question>
         <label for = 3> 월 소득 </label>
         <select id = income name = income>
            <option value = ""> 월 평균 개인 소득을 선택하세요 </option>
            <option value = "200만원 이하"> 200만원 이하 </option>
            <option value = "400만원 이하"> 400만원 이하 </option>
            <option value = "600만원 이하"> 600만원 이하 </option>
            <option value = "600만원 이상"> 600만원 이상 </option>
         </select>
      </div> <br>
      
      <div class = question>
         <label for = 4> 주거형태 </label>
         <select id = home1 name = livingType>
            <option value = ""> 주거 형태를 선택하세요 </option>
            <option value = "월세"> 월세 </option>
            <option value = "전세"> 전세 </option>
            <option value = "자가"> 자가 </option>
            <option value = "기타"> 기타 </option>
         </select>
      </div> <br>
      
      <div class = question>
         <label for = 5> 주택유형 </label>
         <select id = home2 name = houseType>
            <option value = ""> 주택 유형을 선택하세요 </option>
            <option value = "단독 주택"> 단독 주택 </option>
            <option value = "다세대 주택"> 다세대 주택 </option>
            <option value = "아파트"> 아파트 </option>
            <option value = "기타"> 기타 </option>
         </select>
      </div> <br>
      
      <div class = question>
         <label for = 6> 종교 </label>
         <select id = religion name = religion>
            <option value = ""> 종교를 선택하세요 </option>
            <option value = "무교"> 무교 </option>
            <option value = "기독교"> 기독교 </option>
            <option value = "불교"> 불교 </option>
            <option value = "천주교"> 천주교 </option>
            <option value = "기타"> 기타 </option>
         </select>
      </div> <br>
      
      <div class = question>
         <label for = 7> 혼인 </label>
         <select id = marry name = maritalStatus>
            <option value = ""> 혼인여부를 선택하세요 </option>
            <option value = "미혼"> 미혼 </option>
            <option value = "기혼"> 기혼 </option>
         </select>
      </div> <br>
      
      <div class = question>
         <label for = 8> 동거가족 </label>
         <select id = family1 name = livingWith>
            <option value = ""> 동거 가족을 선택하세요 </option>
            <option value = "0명"> 0명 </option>
            <option value = "1명"> 1명 </option>
            <option value = "2명"> 2명 </option>
            <option value = "3명"> 3명 </option>
            <option value = "4명"> 4명 </option>
            <option value = "5명"> 5명 </option>
            <option value = "6명 이상"> 6명 이상 </option>
         </select>
      </div> <br>
      
      <div class = question>
         <label for = 9> 병역 </label>
         <select id = soldier name = armyGo>
            <option value = ""> 병역여부를 선택하세요 </option>
            <option value = "미필"> 미필 </option>
            <option value = "군필"> 군필 </option>
            <option value = "면제"> 면제 </option>
         </select>
      </div> <br>
      
      <div class = question>
         <label for = 9> 관심분야 </label> <br>
         <div class = interest>
         <input type = checkbox id = sports name = interest value = 스포츠>
         <label for = sports style = "letter-spacing:6.7px"> 스포츠 </label>
         
         <input type = checkbox id = food name = interest value = 음식>
         <label for = food> 음식 </label>
         
         <input type = checkbox id = trip name = interest value = 여행>
         <label for = trip style = "letter-spacing:6.5px"> 여행 </label>
         
         <input type = checkbox id = game name = interest value = 게임>
         <label for = game style = "letter-spacing:12.8px"> 게임 </label>
         
         <input type = checkbox id = science name = interest value = 과학>
         <label for = science> 과학 </label>
         <br>
         <input type = checkbox id = fashion name = interest value = 패션>
         <label for = fashion> 패션/쇼핑 </label>         
                  
         <input type = checkbox id = it name = interest value = IT>
         <label for = it style = "letter-spacing:7.7px"> IT </label>

         <input type = checkbox id = car name = interest value = 자동차>
         <label for = car > 자동차 </label>
         
         <input type = checkbox id = society name = interest value = 사회이슈>
         <label for = society> 사회이슈 </label>
         
         <input type = checkbox id = celebrity name = interest value = 연예인>
         <label for = celebrity> 연예인 </label>
         <br>
         <input type = checkbox id = childrenEdu name = interest value = 육아>
         <label for = childrenEdu style = "letter-spacing:15.4px"> 육아 </label>
         
         <input type = checkbox id = hire name = interest value = 취업>
         <label for = hire> 취업 </label>
         
         <input type = checkbox id = education name = interest value = 교육>
         <label for = education style = "letter-spacing:6.3px"> 교육 </label>
         
         <input type = checkbox id = family name = interest value = 가족>
         <label for = family style = "letter-spacing:12.8px"> 가족 </label>
         
         <input type = checkbox id = cultural name = interest value = 문화생활>
         <label for = cultural> 문화생활 </label>
         <br>
         <input type = checkbox id = pet name = interest value = 애견>
         <label for = pet> 애완동물 </label>         
         </div><br><br>
      <div class = complete>
         <input type = button value = "뒤로가기" id = backBtn onclick = "beforeBtn();">
         <input type = submit value = "패널 정보 등록 완료" id = successRegister> 
      </div>
      </div> <br><br>
   </div>
   </form>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script language = "javascript">
   
      // 여기서부터 아이디 중복체크
      $(function(){
         var isUsable = false;
         $("#idChk").click(function(){
           // ---> 여기서부터 아이디 중복체크 안눌렀을때 가입 버튼 누르면 중복체크 하라는 이벤트
           $(".id").change(function(){
              $(".id").attr("check_result", "fail");
           }); // ---> 여기서까지 아이디 중복체크 안눌렀을때 가입 버튼 누르면 중복체크 하라는 이벤트
           
            var userId = $("input[name = 'userId']");
         
            if(!userId || userId.val().length < 4){
               alert("아이디는 최소 4자리 이상 입력해주세요");
               userId.focus();
            } else {
               $.ajax({
                  url:"<%=request.getContextPath()%>/idCheck.ck",
                  type:"post",
                  data:{userId:userId.val()},
                  success:function(data){
                     if(data == "fail"){
                        alert("사용 불가능 아이디 입니다.");
                        userId.focus();
                     } else {
                        alert("사용 가능 아이디 입니다.");
                        $("#id").attr("check_result", "success");  // <- 아이디 중복체크 확인이벤트
                        isUsable = true;
                     }
                  },
                  error:function(data){
                     console.log("코드 다시 확인해봐야함ㅠㅠ");
                  }
               });
            } 
         });
      });
      // 여기까지 아이디 중복체크
     $(function(){
       var isUsable = false;
       $("#reIdChk").click(function(){
          var recommendId = $("input[name = 'recommendId']");
          
          $.ajax({
             url:"<%=request.getContextPath()%>/reIdCheck.ck",
             type:"post",
             data:{recommendId:recommendId.val()},
             success:function(data){
                if(data == "fail"){
                   alert("추천 불가능 아이디 입니다.");
                   $("#recommendId").val("");
                } else {
                   alert("추천 가능한 아이디 입니다.");
                   isUsable = true;
                }
             },
             error:function(data){
                console.log("코드 다시 확인해야함ㅠㅠ");
             }
             
          });
       });
     });
      
      // ------->> 여기서부터 이메일 인증번호 보내기 
     <%--  function receive(){
         $("#registerForm").attr("action","<%=request.getContextPath()%>/sendMail.user");
      } --%>
      <%-- $("#receiveNum").click(function(){
        $("#registerForm").attr("atcion","<%=request.getContextPath()%>/sendMail.user").submit(); 
      }); --%>  
      
      // -> 여기서부터 비밀번호 유효성 검사 및 일치 확인         
      $(function(){
       
         var checkId = RegExp(/^[a-zA-Z0-9]{4,12}$/);
         var checkPwd = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
         $("#pw1").change(function(){
            if(!checkPwd.test($("#pw1").val())){
               $("#resultPw1").html("비밀번호는 8자 이상이며, 숫자/영어/특수문자를 모두 포함해야합니다.").css("color", "red");
               $("#pw1").val("");
               $("#pw1").focus();
            } else {
               $("#resultPw1").css("display", "none");
            }
            if($("#pw1").val() != ($("#pw2").val())){
               $("#resultPw2").html("비밀번호가 일치하지 않습니다.").css("color","red");
               $("#pw2").val("");
               $("#pw2").focus();
            }
         });
         
         $("#pw2").change(function(){
          if($('#pw1').val() != $(this).val()){
            $("#resultPw2").html("비밀번호가 일치하지 않습니다.").css("color", "red");
            $("#pw2").val("");
            $(this).focus();
           
          } else {
             $("#resultPw2").html("비밀번호가 일치 합니다.").css("color", "navy");
          }
         
         });
         
         $("#id").change(function(){
            if(!checkId.test($("#id").val())){
               $("#resultId").html("아이디는 4글자 이상입니다.").css("color", "red");
               $("#id").val("");
               $("#id").focus();
            }
         });
      });
      // <- 여기까지 비밀번호 유효성 검사 및 일치 확인     
      
   //   ----------->  여기서부터 가입 1단계 유효성 검사 (input 태그에 기본적으로 안써지게 그냥 막아놈)
      //                     ex) 아이디 input 태그에 특수문자 안들어가게 강제적으로 막았음 
       $(document).ready(function(){
         $("#secondClick").hide();
      $("#checkForm").click(function(){
         
      var checkId = RegExp(/^[a-zA-Z0-9]{4,12}$/);
      var checkPwd = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
      var checkPhone = /^(?=.*?[0-9]).{11,}$/;
         
         if($("#id").val() == ""){
            alert("아이디를 입력해주세요");
            $("#id").focus();
            return false;
         }
         if(!checkId.test($("#id").val())){
            alert("아이디는 4글자 이상입니다.");
            $("#id").val("");
            $("#id").focus();
            return false;
         }
         if($("#id").attr("check_result") == "fail"){
             alert("아이디 중복 확인을 해주세요");
             $("#id").focus();
             return false;   // <- 아이디 중복확인 버튼 안누르면 경고창
          }
         if($("#pw1").val() == ""){
            alert("비밀번호를 입력해주세요");
            $("#pw1").focus();
            return false;
         }
         if ($("#id").val() == ($("#pw1").val())) {
               alert("비밀번호가 ID와 똑같습니다!");
               $("#pw1").val("");
               $("#pw1").focus();
               return false;
          }
         if(!checkPwd.test($("#pw1").val())){
            alert("비밀번호는 8자 이상이며, 숫자/영어/특수문자를 모두 포함해야합니다.");
            $("#pw1").val("");
            $("#pw1").focus();
            return false;
         }   
         if($("#pw1").val() != ($("#pw2").val())){
            alert("비밀번호가 일치하지 않습니다.");
            $("#pw1").focus();
            return false;
         }
          if($("#name").val() == ""){
            alert("이름 입력해주세요");
            $("#name").focus();
            return false;
         }
         if($("#age").val() == ""){
            alert("나이 입력해주세요");
            $("#age").focus();
            return false;
         }
         if($("#gender").val() == ""){
            alert("성별을 선택해주세요");
            $("#gender").focus();
            return false;
         }
         if($("#email1").val() == ""){
            alert("이메일을 입력해주세요");
            $("#email1").focus();
            return false;
         }
         if($("#email2").val() == ""){
            alert("이메일을 선택해주세요");
            $("#email3").focus();
            return false;
         }
         if($("#tongsin").val() == ""){
            alert("통신사를 선택해주세요");
            $("#tongsin").focus();
            return false;
         }
         if($("#phoneNum").val() == ""){
            alert("핸드폰번호를 입력해주세요");
            $("#phoneNum").focus();
            return false;
         }
         if(!checkPhone.test($("#phoneNum").val())){
            alert("핸드폰번호를 제대로 써주세요.");
            $("#phoneNum").val("");
            $("#phoneNum").focus();
            return false;
         }
         if($("#postCode").val() == "" || $("#address1").val() == "" || $("#extraAddress").val() == ""){
            alert("주소검색을 해주세요");
            $("#postCode").focus();
            return false;
         }
         if($("#detailAddress").val() == ""){
            alert("상세주소를 입력해주세요");
            $("#detailAddress").focus();
            return false;
         }
         $("#firstClick").hide();
         $("#secondClick").show();
         return true; 
         });
      });      // <---------  여기까지 가입1단계 유효성 검사 
      
      // --------------> 여기서부터 패널등록 빈칸 검사
      function checkCondition(){
         var interestCheck = false;
         
         if($("#finalEdu").val() == ""){
            alert("최종학력을 선택해주세요");
            $("#finalEdu").focus();
            return false;
         }
         if($("#job").val() == ""){
            alert("직업을 선택해주세요");
            $("#job").focus();
            return false;
         }
         if($("#income").val() == ""){
            alert("월 소득을 선택해주세요");
            $("#income").focus();
            return false;
         }
         if($("#home1").val() == ""){
            alert("주거형태를 선택해주세요");
            $("#home1").focus();
            return false;
         }
         if($("#home2").val() == ""){
            alert("주택유형을 선택해주세요");
            $("#home2").focus();
            return false;
         }
         if($("#religion").val() == ""){
            alert("종교를 선택해주세요");
            $("#religion").focus();
            return false;
         }
         if($("#marry").val() == ""){
            alert("혼인여부를 선택해주세요");
            $("#marry").focus();
            return false;
         }
         if($("#family1").val() == ""){
            alert("동거가족 수를 선택해주세요");
            $("#family1").focus();
            return false;
         }
         if($("#soldier").val() == ""){
            alert("병역여부를 선택해주세요");
            $("#soldier").focus();
            return false;
         }
          for(var i = 0; i < $("[name='interest']").length;i++){
              if($("input:checkbox[name='interest']").eq(i).is(":checked") == true) {
                  interestCheck = true;
                    break;
                  }
              }
             if(!interestCheck){
                  alert("하나이상 관심분야를 체크해 주세요");
                  return false;
              }
          return true;
      }   // <----------------------------여기까지 패널 등록 빈칸 검사 끝
   
     
      
      $(document).ready(function(){
         $(".title2").hide();  // <- 회원가입 두번째 창 숨기기          
      $("#nextRegister").click(function(){
      //   alert("test");
         $(".title1").hide();  // <- 클릭 시 회원가입 첫번째 창 숨기기
         $(".title2").show();  // <- 클릭 시 회원가입 두번째 창 보여주기
         });
      });
   
      // 여기서부터 ->
      $(document).ready(function(){
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
             });    // <- 여기까지 이메일 선택
   
   // 여기서부터 -> 
   function searchAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("postCode").value = data.zonecode;
                document.getElementById("address1").value = roadAddr;
        
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();   // <- 여기까지 주소넣기 
    }  
   

   
   // 여기서부터 register2 함수들
   function beforeBtn(){
      location = 'register1.jsp';
   }
   </script>
   
</body>
</html>