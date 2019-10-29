<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.UserInfo" %>


 <%
	UserInfo user = (UserInfo)request.getAttribute("user"); 
 
	String userId = user.getUserId();
	/* String userPwd = user.getUserPwd(); */
	String userName = user.getUserName();
	int age = user.getAge();
	String[] emailArr = user.getEmail().split("@"); 
	String email = emailArr[0]+emailArr[1];
	
	String phone = user.getPhone();
	/* String address = user.getAddress(); */
	
    String[] address = new String[4];
    
    String[] addressArr = user.getAddress().split("@");
    
    for(int i=0; i<addressArr.length; i++) {
    	address[i] = addressArr[i];
    };
   
	
	 
	String finalEducation = user.getFinalEducation();
	String job = user.getJob();
	String income = user.getIncome();
	String livingType = user.getLivingType();
	String houseType = user.getHouseType();
	String religion = user.getReligion();
	String maritalStatus = user.getMaritalStatus();
    String livingWith = user.getLivingWith();
    String armyGo = user.getArmyGo();
    
	String[] checkedInterest = new String[16];
	 
	
	if(user.getInterest() != null){	
		String[] interestArr = user.getInterest().split(",");
	
		for(int i=0; i<interestArr.length; i++){
			switch(interestArr[i]){
				case "스포츠" : checkedInterest[0] = "checked"; break;
				case "음식" : checkedInterest[1] = "checked"; break;
				case "여행" : checkedInterest[2] = "checked"; break;
				case "게임" : checkedInterest[3] = "checked"; break;
				case "과학" : checkedInterest[4] = "checked"; break;
				case "패션" : checkedInterest[5] = "checked"; break;
				case "IT" : checkedInterest[6] = "checked"; break;
				case "자동차" : checkedInterest[7] = "checked"; break;
				case "사회이슈" : checkedInterest[8] = "checked"; break;
				case "연예인" : checkedInterest[9] = "checked"; break;
				case "육아" : checkedInterest[10] = "checked"; break;
				case "취업" : checkedInterest[11] = "checked"; break;
				case "교육" : checkedInterest[12] = "checked"; break;
				case "가족" : checkedInterest[13] = "checked"; break;
				case "문화생활" : checkedInterest[14] = "checked"; break;
				case "애완동물" : checkedInterest[15] = "checked"; break;
			}
		}
	} 
	/* 캡차 */	
	String ctx = request.getContextPath();	//콘텍스트명 얻어오기.

	response.setHeader("Pragma-directive", "no-cache");
	response.setHeader("Cache-directive", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires",0); 	
	
%>    
<%-- 호출 되는지 테스트~~ 
<% Member m = new Member();
m.setUserId("id호출합니다");%> 
--%>


<!DOCTYPE html>
<html>
<head>
<!-- 캡차 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Imagetoolbar" content="no" />
<!-- 캡차 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">


<style>   
   * {box-sizing:border-box; font-size:15px; }
   h1 {text-align:center;}
   /* 개인정보 수정 화면 */
   #userUpdateArea {width:800px; height:2000px;   margin-left:600px; margin-top:20px; }
   #userUpdateArea div {height:60px; padding:18px; }
   .div-top {width:800px; background:#fff; border-bottom:1px solid #ccc; text-align:left; font-weight:bold;}
   .div-lavel {width:200px; background:#fff; float:left; border-bottom:1px dotted #ccc; text-align:center; font-weight:bold;}
   .div-type {width:600px; background:#fff; float:left; border-bottom:1px dotted #ccc; text-align:left; }
   
   .twoline{width:200px;}
   .passcheck1{width:150px;}
   .passcheck2{width:250px;}
   
  /*  .interest label {margin-left:20px;}  */
   #userUpdateArea div:nth-child(38){height:100px; background:red;}

   hr {margin:0;}
   
  
   .div-type input {height:35px; padding:8px;  margin-top:-10px;}
   .div-type select {height:35px; padding:8px;  margin-top:-10px; width:150px; align:center;}
   
	
	#seAddress{background:#E98235; border:none; color:white;}
	#seAddress:hover{background:#E96F18;}
	
   #resultPw{font-size:12px;}
   
 
</style>



<title>Insert title here</title>
</head>
<body>
	
		<%@ include file="../common/menubar2.jsp" %>
<div id="userUpdateArea">

 	<form id="updateForm" action="<%=request.getContextPath() %>/infochange.ic" method="post">
   <div class="div-top"><i class="fas fa-user"></i> 개인정보입력</div>
	
	<hr width = "100%" height = "10%" color = "#E98235">
	
 	<div class="div-lavel">아이디</div>
   	<div class="div-type">
    <input type=text id=id name="userId"  value=<%=userId %> readonly>   
   </div>

   <div class="div-lavel">이름</div>
   <div class="div-type">
   <input type="text" name="userName" value=<%=userName %> readonly>
   </div>

   <div class="div-lavel twoline" style="height:108px;">비밀번호</div>
   <div class="div-type twoline" style="height:108px;">
           <input type = password id = pw1 name = userPwd placeholder = "비밀번호를 입력하세요" maxlength = 20 style = "ime-mode:inactive" required> 
   </div>
  	<div class="div-lavel passcheck1" style="height:108px;">비밀번호 확인</div>
	 <div class="div-type passcheck2" style="height:108px;">
		<input type = password id = pw2 name = userPwd2 placeholder = "비밀번호를 일치시켜주세요" maxlength = 20 style = "ime-mode:inactive; width:170px;" required>
		<br>
		 <label id = resultPw> </label>
	</div>

	
	
	
	
	  <div class="div-lavel">나이</div>
  	 <div class="div-type">
     <input type=text id=age name=age maxlength = 3 placeholder = "나이를 입력하세요" onKeyup = "this.value=this.value.replace(/[^0-9]/g,'');" required value=<%=age%>>
  	 </div>
	
   <div class="div-lavel">이메일</div>
   <div class="div-type" >
   		 <input type = text id = email1 name = email1 maxlength = 20 placeholder = "이메일을 입력하세요"  onkeyup = "this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');" value="<%=emailArr[0] %>"> 
     	 <input type = text id = email2 name = email3 maxlength = 15 placeholder = "이메일을 선택하세요" value= "@<%= emailArr[1] %>" disabled>
         <select   id = email3 name = email2 value= "<%= emailArr[1] %>" >
            <option value = "@naver.com">@naver.com</option>
            <option value = "@daum.net">@daum.net</option>
            <option value = "@gmail.com">@gmail.com</option>
            <option value = "@nate.com">@nate.com</option>
         </select>
   </div>
  
   <div class="div-lavel">핸드폰 번호</div>
   <div class="div-type"  >
<!--   <select id = tongsin name = phone>
            <option value = ""> 통신사를 선택하세요 </option>
            <option value = "KT"> KT </option>
            <option value = "SKT"> SKT </option>
            <option value = "LG"> LG </option>
         </select> -->        
   <input type=text id=phoneNum name=phone maxlength=11  placeholder="(-) 빼고 입력해주세요" onKeyup = "this.value=this.value.replace(/[^0-9]/g,'');" value=<%=phone%>>
   </div>
	

   <div id="postdiv1" class="div-lavel" style="height:120px;">주소</div>
   <div id="postdiv2" class="div-type" style="height:120px;">
  <input type = text id = postCode name = postCode  placeholder = "우편번호" value="<%=address[0]%>"  >
         <input type = text id = address1 name = address1  placeholder = "도로명 주소" value="<%=address[1]%>" style="width:275px"> 
         <input type = button id = seAddress value = 주소검색 onclick = "searchAddress()"> <br><br>
         <span id= guide style = "color:#999; display:none"> </span>
         <input type = text id = detailAddress name = address2 placeholder = "상세 주소를 입력하세요" value="<%=address[3]%>" style="width:280px" >
         <input type = text id = extraAddress name = extraAddress placeholder = "참고주소" value="<%=address[2]%>" style="width:150px" >
   </div>

    <div class="div-lavel">최종학력</div>
   <div class="div-type twoline">
   		  <select id = finalEdu name = finalEducation value=<%=finalEducation %>>
            <option value = "초등학교 졸업"> 초등학교 졸업 </option>
            <option value = "중학교 졸업"> 중학교 졸업 </option>
            <option value = "고등학교 졸업"> 고등학교 졸업 </option>
            <option value = "2·3년제 대학교 졸업"> 2·3년제 대학교 졸업 </option>
            <option value = "4년제 대학교 졸업"> 4년제 대학교 졸업 </option>
            <option value = "석사학위 취득"> 석사학위 취득 </option>
            <option value = "박사학위 취득"> 박사학위 취득 </option>
         </select>
   </div>
    
       <div class="div-lavel" value="직업">직업</div>
   <div class="div-type twoline">
   		<select id = job name="job" value=<%=job %>>
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
    <div class="div-lavel">월 소득</div>
   <div class="div-type twoline">
    <select id = income name = income value=<%=income %>>
            <option value = "200만원 이하"> 200만원 이하 </option>
            <option value = "400만원 이하"> 400만원 이하 </option>
            <option value = "600만원 이하"> 600만원 이하 </option>
            <option value = "600만원 이상"> 600만원 이상 </option>
         </select>
   </div>
    
    <div class="div-lavel">주거 형태</div>
   <div class="div-type twoline">
     <select id = home1 name = livingType value=<%=livingType%>>
            <option value = "월세"> 월세 </option>
            <option value = "전세"> 전세 </option>
            <option value = "자가"> 자가 </option>
            <option value = "기타"> 기타 </option>
         </select>
    </div>
    
    <div class="div-lavel">주택 유형</div>
   <div class="div-type twoline">
   <select id = home2 name = houseType value=<%=houseType%>>
            <option value = "단독 주택"> 단독 주택 </option>
            <option value = "다세대 주택"> 다세대 주택 </option>
            <option value = "아파트"> 아파트 </option>
            <option value = "기타"> 기타 </option>
         </select>
   </div>
    
   <div class="div-lavel">종교</div>
   <div class="div-type twoline">
    <select id = religion name = religion value=<%=religion%>>
            <option value = "무교"> 무교 </option>
            <option value = "기독교"> 기독교 </option>
            <option value = "불교"> 불교 </option>
            <option value = "천주교"> 천주교 </option>
            <option value = "기타"> 기타 </option>
         </select>
   </div>
    

   <div class="div-lavel">결혼여부</div>
   <div class="div-type twoline">
   	<select id = marry name="maritalStatus" value=<%=maritalStatus%> >
        <option value = "미혼"> 미혼 </option>
       	<option value = "기혼"> 기혼 </option> 
    </select>
   </div>
   
    <div class="div-lavel">동거가족</div>
   <div class="div-type twoline">
    <select id = family1 name = livingWith value=<%=livingWith%>>
            <option value = "0명"> 0명 </option>
            <option value = "1명"> 1명 </option>
            <option value = "2명"> 2명 </option>
            <option value = "3명"> 3명 </option>
            <option value = "4명"> 4명 </option>
            <option value = "5명"> 5명 </option>
            <option value = "6명 이상"> 6명 이상 </option>
         </select>
    </div>
    
     <div class="div-lavel">동거가족</div>
   <div class="div-type">
     <select id = soldier name = armyGo value=<%=armyGo %>>
            <option value = "미필"> 미필 </option>
            <option value = "군필"> 군필 </option>
            <option value = "면제"> 면제 </option>
         </select>
    </div>
    
     <div class="div-lavel" id="interestId" style="height:200px">관심분야</div>
   <div class="div-type interestdiv">
   			<input type = checkbox id = sports name = interest value = 스포츠 <%=checkedInterest[0] %>>
         	<label for = sports style = "letter-spacing:6.7px"> 스포츠 </label>
         	
         	<input type = checkbox id = food name = interest value = 음식 <%=checkedInterest[1] %>>
         	<label for = food > 음식 </label>
         	
         	<input type = checkbox id = trip name = interest value = 여행 <%=checkedInterest[2] %>>
         	<label for = trip style = "letter-spacing:6.5px"> 여행 </label>
         	
         	 <input type = checkbox id = game name = interest value = 게임 <%=checkedInterest[3] %>>
        	<label for = game style = "letter-spacing:12.8px" > 게임 </label>
         	
         	 <input type = checkbox id = science name = interest value = 과학 <%=checkedInterest[4] %>>
         	<label for = science> 과학 </label>
         	
         	<input type = checkbox id = fashion name = interest value = 패션 <%=checkedInterest[5] %>>
        	<label for = fashion > 패션/쇼핑 </label> 
				
			<input type = checkbox id = it name = interest value = IT <%=checkedInterest[6] %>>
        	<label for = it style = "letter-spacing:7.7px"> IT </label>	
        	
        	<input type = checkbox id = car name = interest value = 자동차 <%=checkedInterest[7] %>>
         	<label for = car  > 자동차 </label>
         
         	<input type = checkbox id = society name = interest value = 사회이슈 <%=checkedInterest[8] %>>
         	<label for = society > 사회이슈 </label>
				        	
			<input type = checkbox id = celebrity name = interest value = 연예인 <%=checkedInterest[9] %>>
         	<label for = celebrity> 연예인 </label>		        	
				        	
        	<input type = checkbox id = childrenEdu name = interest value = 육아 <%=checkedInterest[10] %>>
         	<label for = childrenEdu style = "letter-spacing:15.4px"> 육아 </label>
         	
         	 <input type = checkbox id = hire name = interest value = 취업 <%=checkedInterest[11] %>>
        	 <label for = hire> 취업 </label>
         	
         	 <input type = checkbox id = education name = interest value = 교육 <%=checkedInterest[12] %>>
         	<label for = education style = "letter-spacing:6.3px" > 교육 </label>
         	
         	<input type = checkbox id = family name = interest value = 가족 <%=checkedInterest[13] %>>
        		 <label for = family style = "letter-spacing:12.8px"> 가족 </label>
        		
        	  
         <input type = checkbox id = cultural name = interest value = 문화생활 <%=checkedInterest[14] %>>
         <label for = cultural > 문화생활 </label>	 	
         	
         	<input type = checkbox id = pet name = interest value = 애견 <%=checkedInterest[15] %>>
         	<label for = pet> 애완동물 </label>
        	 
    </div>

    <div id="catpcha"></div>
	<div id="audiocatpch"></div>
	
	<input id="reLoad" type="button" value="새로고침" />
	<input id="soundOn" type="button" value="음성듣기" />
	<input id="soundOnKor" type="button" value="한글음성" />
	
	<input type="text" id="answer" name="answer" value="" />
	<input type="button" id="frmSubmit" value="확인" />
	
		
   			<div class="btns" align="center">
				<div id="updateBtn" onclick="updateMember();">수정하기</div>
			</div>	
		</form>
		
		      </div>            
		
	 

<script>

 // -> 여기서부터 비밀번호 유효성 검사 및 일치 확인         
 $(function(){
    var checkId = RegExp(/^[a-zA-Z0-9]{4,12}$/);
    var checkPwd = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    
    $("#pw1").change(function(){
       if(!checkPwd.test($("#pw1").val())){
          $("#resultPw").html("비밀번호는 8자 이상이며, 숫자/영어/특수문자를 모두 포함해야합니다.").css("color", "red");
          $("#pw1").val("");
          $("#pw1").focus();
       }   
    });
    
    $("#pw2").change(function(){
     if($('#pw1').val() != $(this).val()){
       $("#resultPw").html("비밀번호가 일치하지 않습니다.").css("color", "red");
       $("#pw2").val("");
       $(this).focus();
     } else {
        $("#resultPw").html("비밀번호가 일치 합니다.").css("color", "navy");
     }
    });
    
 });
 // <- 여기까지 비밀번호 유효성 검사 및 일치 확인
 
      function updateMember(){
    	  var checkId = RegExp(/^[a-zA-Z0-9]{4,12}$/);
          var checkPwd = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
          var checkPhone = /^(?=.*?[0-9]).{11,}$/;

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
            $("#updateForm").submit();
          return true; 
 }



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
// 캡차 기능 시작
var rand;
//캡차 오디오 요청
function audioCaptcha(type) {
	var kor = (type > 0) ? "lan=kor&":""; 
	$.ajax({
		url: 'views/captcha/CaptChaAudio.jsp',
		type: 'POST',
		dataType: 'text',
		data: 'rand=' + rand + '&ans=y',
		async: false,		
		success: function(resp) {
			var uAgent = navigator.userAgent;
			var soundUrl = 'views/captcha/CaptChaAudio.jsp?' + kor + 'rand=' + rand + '&ans=' + resp;
			//console.log(soundUrl);
			if (uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
				winPlayer(soundUrl+'&agent=msie');
			} else if (!!document.createElement('audio').canPlayType) {
				try { new Audio(soundUrl).play(); } catch(e) { winPlayer(soundUrl); }
			} else window.open(soundUrl, '', 'width=1,height=1');
		}
	});
}
function winPlayer(objUrl) {
	$('#audiocatpch').html(' <bgsound src="' + objUrl + '">');
}

//캡차 이미지 요청 (캐쉬문제로 인해 이미지가 변경되지 않을수있으므로 요청시마다 랜덤숫자를 생성하여 요청)
function changeCaptcha() {
	rand = Math.random();
	$('#catpcha').html('<img src="<%=ctx%>/views/captcha/CaptChaImg.jsp?rand=' + rand + '"/>');
}

$(document).ready(function() {
	
	changeCaptcha(); //캡차 이미지 요청
	
	$('#reLoad').click(function(){ changeCaptcha(); }); //새로고침버튼에 클릭이벤트 등록
	$('#soundOn').click(function(){ audioCaptcha(0); });	//음성듣기버튼에 클릭이벤트 등록
	$('#soundOnKor').click(function(){ audioCaptcha(1); }); //한글음성듣기 버튼에 클릭이벤트 등록
	
	//확인 버튼 클릭시
	$('#frmSubmit').click(function(){
		if ( !$('#answer').val() ) {
			alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
		} else {
			$.ajax({
				url: 'views/captcha/captchaSubmit.jsp',
				type: 'POST',
				dataType: 'text',
				data: 'answer=' + $('#answer').val(),
				async: false,		
				success: function(resp) {
					alert(resp);
					$('#reLoad').click();
					$('#answer').val('');
				}
			});
		}
	});
});

</script>
            
		
</body>
</html>