<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
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
	margin-left: 500px;
	
}

input[type = button]{
	cursor : pointer;
	padding : 9px 20px;
}
input[type = reset]{
	cursor : pointer;
	padding : 9px 20px;
	width : 26.6%;
}
input[type = text]{
	width : 53.8%;
	display : inline-block;
	border : 1px solid #ccc;
	border-radius : 10px;
	box-sizing : border-box;
	padding : 12px 20px;
}
input[type = password]{
	width : 53.8%;
	display : inline-block;
	border : 1px solid #ccc;
	border-radius : 10px;
	box-sizing : border-box;
	padding : 12px 20px;
}

#id {
	width : 43.5%;
}
#birty {
	width : 17.6%;
}
#birty1 {
	width : 17.7%;
	border-radius : 10px;
	border : 1px solid #ccc;
	padding : .7em;
}
#gender{
	width : 53.8%;
	border-radius : 10px;
	border : 1px solid #ccc;
	padding : .7em;
}
.golbang{
	font-size : 1.7em; 
}
#email1, #email2{
	width : 17.1%;
}
#email3{
	width : 15%;
	border-radius : 10px;
	border : 1px solid #ccc;
	padding : .7em;
}
#confirmNum{
	width : 28%;
}
#tongsin{
	width : 17%;
	border-radius : 10px;
	border : 1px solid #ccc;
	padding : .7em;
}
#phoneNum{
	width : 36.5%;
}
#postCode{
	width : 18%;	
}
#address1{
	width : 25%;
}
#seAddress{
	cursor : pointer;
	padding : 9px 20px;
}
#detailAddress{
width : 30%;
}
#extraAddress{
width : 23.5%;
}
#nextMain{
	width : 26.7%;
}
#nextRegister{
	cursor : pointer;
	padding : 9px 20px;
	width : 53.8%;
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
	
	<form action = "register2.jsp" method = post> <br>
	<div class = title>
		<div class = register>
			회원가입
		</div> <br>
		<div class = join>
			<label for = id> 아이디 </label> <br>
			<input type = text id = id name = id placeholder = "아이디를 입력하세요" maxlength = 8>
			<input type = button value = 중복확인 onclick = "overlap();">  
		</div> <br>
		<div class = join>
			<label for = pw1> 비밀번호 </label> <br>
			<input type = password id = pw1 name = pw1 placeholder = "비밀번호를 입력하세요" maxlength = 8>
		</div> <br>
		<div class = join>
			<label for = pw2> 비밀번호 확인 </label> <br>
			<input type = password id = pw2 name = pw2 placeholder = "비밀번호를 일치시켜주세요" maxlength = 8>
		</div> <br>
		<div class = join>
			<label for = name> 이름 </label> <br>
			<input type = text id = name name = name placeholder = "이름을 입력하세요" maxlength = 5> 
		</div> <br>
		<div class = join>
			<label for = birty> 생년월일 </label> <br>
			<input type = text id = birty name = "birth_yy" maxlength = 4 placeholder = "년 (4글자)">
			<select id = birty1 name = "birth_mm">
				<option value = ""> 월 </option>
				<option value = 01> 01 </option>
				<option value = 02> 02 </option>
				<option value = 03> 03 </option>
				<option value = 04> 04 </option>
				<option value = 05> 05 </option>
				<option value = 06> 06 </option>
				<option value = 07> 07 </option>
				<option value = 08> 08 </option>
				<option value = 09> 09 </option>
				<option value = 10> 10 </option>
				<option value = 11> 11 </option>
				<option value = 12> 12 </option>
			</select> 
			<select id = birty1 name = "birth_dd">
				<option value = ""> 일 </option>
				<option value = 01> 01 </option>
				<option value = 02> 02 </option>
				<option value = 03> 03 </option>
				<option value = 04> 04 </option>
				<option value = 05> 05 </option>
				<option value = 06> 06 </option>
				<option value = 07> 07 </option>
				<option value = 08> 08 </option>
				<option value = 09> 09 </option>
				<option value = 10> 10 </option>
				<option value = 11> 11 </option>
				<option value = 12> 12 </option>
				<option value = 13> 13 </option>
				<option value = 14> 14 </option>
				<option value = 15> 15 </option>
				<option value = 16> 16 </option>
				<option value = 17> 17 </option>
				<option value = 18> 18 </option>
				<option value = 19> 19 </option>
				<option value = 20> 20 </option>
				<option value = 21> 21 </option>
				<option value = 22> 22 </option>
				<option value = 23> 23 </option>
				<option value = 24> 24 </option>
				<option value = 25> 25 </option>
				<option value = 26> 26 </option>
				<option value = 27> 27 </option>
				<option value = 28> 28 </option>
				<option value = 29> 29 </option>
				<option value = 30> 30 </option>
				<option value = 31> 31 </option>
			</select>
		</div> <br>
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
			<input type = text id = email1 name = email1 maxlength = 20> 
			<label class = golbang> @ </label>
			<input type = text id = email2 name = email2 maxlength = 15>
			<select	id = email3 name = email3 >
				<option> 이메일을 선택하세요 </option>
				<option value = "naver.com"> naver.com </option>
				<option value = "daum.net"> daum.net </option>
				<option value = "gmail.com"> gmail.com </option>
				<option value = "nate.com"> nate.com </option>
				<option value = self> 직접 입력 </option>
			</select> <br><br>
			<input type = text id = confirmNum maxlength = 5 placeholder = "인증번호 입력">
			<input type = button value = "인증번호받기" onclick = "receive();">
			<input type = button value = "인증번호확인" onclick = "confirm();">
		</div> <br>
		<div class = join>
			<label> 핸드폰번호 </label> <br>
			<select id = tongsin name = tongsin>
				<option> 통신사를 선택하세요 </option>
				<option value = "KT"> KT </option>
				<option value = "SKT"> SKT </option>
				<option value = "LG"> LG </option>
			</select>
			<input type = text id = phoneNum name = phoneNum maxlength = 11 placeholder = "(-) 빼고 입력해주세요">
		</div> <br>
		<div class = join>
			<label> 주소 </label> <br>
			<input type = text id = postCode name = postCode placeholder = "우편번호">
			<input type = text id = address1 name = address1 placeholder = "도로명 주소">
			<input type = button id = seAddress value = 주소검색 onclick = "searchAddress()"> <br><br>
			<span id= guide style = "color:#999; display:none"> </span>
			<!-- <input type = text id = jibunAddress name = jibunAddress placeholder = "지번주소"> -->
			<input type = text id = detailAddress name = detailAddress placeholder = "상세 주소를 입력하세요">
			<input type = text id = extraAddress name = extraAddress placeholder = "참고주소">
		</div> <br><br>
		<div class = join>
			<button id = nextRegister value = "가입 2단계 진행" onclick = "nextRegister();"> 가입 2단계 진행 </button><br><br>
			<input type = reset value = "다시쓰기" id = clear1>
			<input type = button id = nextMain value = "메인화면" onclick = "location='../common/menubar.jsp'">
		</div>
		
	</div>
	</form>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function overlap(){
			alert("중복확인 기능 넣기");
		}		
		function receive(){
			alert("인증번호 받기 기능 넣기");
		}
		function confirm(){
			alert("인증번호 확인 기능 넣기");
		}
		/* function nextRegister(){
			location = '../register/register2.jsp';
		} */
		
		// 이메일 선택
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
	       	}); 
	
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
        }).open();
    }
	</script>
	<!-- 여기까지 주소 찾기 기능 -->
	
</body>
</html>