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
#gender{
	width : 53.8%;
	border-radius : 10px;
	border : 1px solid #ccc;
	padding : .7em;
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
.question {
	margin-left : 450px;
	font-size : larger;
}
#finalEdu{
	width : 46.7%;
	border-radius : 10px;
	border : 1px solid #ccc;
	padding : .7em;
}
#job{
	width : 46.7%;
	border-radius : 10px;
	border : 1px solid #ccc;
	margin-left : 39.5px;
	padding : .7em;
}
#income{
	width : 46.6%;
	border-radius : 10px;
	border : 1px solid #ccc;
	margin-left : 12.5px;
	padding : .7em;
}
#home1, #home2, #family1{
	width : 46.7%;
	border-radius : 10px;
	border : 1px solid #ccc;
	padding : .7em;
}
#religion, #marry, #soldier{
	width : 46.7%;
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
	width : 27%;
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
	
	<form action = "<%=request.getContextPath()%>/register.user" method = post> <br>
	<div class = title1>
		<div class = register>
			회원가입
		</div> <br>
			<div class = join>
			<label for = id> 아이디 </label> <br>
			<input type = text id = id name = userId placeholder = "아이디를 입력하세요" maxlength = 8>
			<input type = button value = 중복확인 onclick = "overlap();">  
		</div> <br>
		<div class = join>
			<label for = pw1> 비밀번호 </label> <br>
			<input type = password id = pw1 name = userPwd placeholder = "비밀번호를 입력하세요" maxlength = 8>
		</div> <br>
		<div class = join>
			<label for = pw2> 비밀번호 확인 </label> <br>
			<input type = password id = pw2 name = userPwd2 placeholder = "비밀번호를 일치시켜주세요" maxlength = 8>
		</div> <br>
		<div class = join>
			<label for = name> 이름 </label> <br>
			<input type = text id = name name = userName placeholder = "이름을 입력하세요" maxlength = 5> 
		</div> <br>
		<div class = join>
			<label> 나이 </label> <br>
			<input type = text id = age name = age maxlength = 4 placeholder = "나이를 입력하세요">
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
			<input type = text id = email1 name = email1 maxlength = 20> 
			<input type = text id = email2 name = email3 maxlength = 15>
			<select	id = email3 name = email2>
				<option> 이메일을 선택하세요 </option>
				<option value = "@naver.com"> @naver.com </option>
				<option value = "@daum.net"> @daum.net </option>
				<option value = "@gmail.com"> @gmail.com </option>
				<option value = "@nate.com"> @nate.com </option>
				<option value = self> 직접 입력 </option>
			</select> <br><br>
			<input type = text id = confirmNum maxlength = 10 placeholder = "인증번호 입력">
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
			<input type = text id = phoneNum name = phone maxlength = 11 placeholder = "(-) 빼고 입력해주세요">
		</div> <br>
		<div class = join>
			<label> 주소 </label> <br>
			<input type = text id = postCode name = postCode placeholder = "우편번호">
			<input type = text id = address1 name = address1 placeholder = "도로명 주소">
			<input type = button id = seAddress value = 주소검색 onclick = "searchAddress()"> <br><br>
			<span id= guide style = "color:#999; display:none"> </span>
			<!-- <input type = text id = jibunAddress name = jibunAddress placeholder = "지번주소"> -->
			<input type = text id = detailAddress name = address2 placeholder = "상세 주소를 입력하세요">
			<input type = text id = extraAddress name = extraAddress placeholder = "참고주소">
		</div> <br>
		<div class = join>
			<label> 추천인 </label> <br>
			<input type = text id = recommend name = recommendId placeholder = "추천인이 있으면 입력하세요">
		</div> <br>
		<div class = join>
			<button id = nextRegister value = "hide/show" onclick = "nextRegister();"> 가입 2단계 진행 </button><br><br>
			<input type = reset value = "다시쓰기" id = clear1>
			<input type = button id = nextMain value = "메인화면" onclick = "location='../common/menubar.jsp'">
		</div>
	</div>
	<div class = title2>
		<div class = register>
			패널 정보 등록
		</div> <br>
		<div class = question>
			<label for = 1> 최종학력 </label>
			<select id = finalEdu name = finalEducation>
				<option value = "" selected = ""> 최종학력을 선택하세요 </option>
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
				<option value = "" selected = ""> 직업을 선택하세요 </option>
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
				<option value = "" selected = ""> 월 평균 개인 소득을 선택하세요 </option>
				<option value = "200만원 이하"> 200만원 이하 </option>
				<option value = "400만원 이하"> 400만원 이하 </option>
				<option value = "600만원 이하"> 600만원 이하 </option>
				<option value = "600만원 이상"> 600만원 이상 </option>
			</select>
		</div> <br>
		
		<div class = question>
			<label for = 4> 주거형태 </label>
			<select id = home1 name = livingType>
				<option value = "" selected = ""> 주거 형태를 선택하세요 </option>
				<option value = "월세"> 월세 </option>
				<option value = "전세"> 전세 </option>
				<option value = "자가"> 자가 </option>
				<option value = "기타"> 기타 </option>
			</select>
		</div> <br>
		
		<div class = question>
			<label for = 5> 주택유형 </label>
			<select id = home2 name = houseType>
				<option value = "" selected = ""> 주택 유형을 선택하세요 </option>
				<option value = "단독 주택"> 단독 주택 </option>
				<option value = "다세대 주택"> 다세대 주택 </option>
				<option value = "아파트"> 아파트 </option>
				<option value = "기타"> 기타 </option>
			</select>
		</div> <br>
		
		<div class = question>
			<label for = 6> 종교 </label>
			<select id = religion name = religion>
				<option value = "" selected = ""> 종교를 선택하세요 </option>
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
				<option value = "" selected = ""> 혼인여부를 선택하세요 </option>
				<option value = "미혼"> 미혼 </option>
				<option value = "기혼"> 기혼 </option>
			</select>
		</div> <br>
		
		<div class = question>
			<label for = 8> 동거가족 </label>
			<select id = family1 name = livingWith>
				<option value = "" selected = ""> 동거 가족을 선택하세요 </option>
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
				<option value = "" selected = ""> 병역여부를 선택하세요 </option>
				<option value = "미필"> 미필 </option>
				<option value = "군필"> 군필 </option>
				<option value = "면제"> 면제 </option>
			</select>
		</div> <br>
		
		<div class = question>
			<label for = 9> 관심분야 </label> <br>
			<div class = interest>
			<input type = checkbox id = sports name = interest value = 스포츠>
			<label for = sports> 스포츠 </label>
			
			<input type = checkbox id = food name = interest value = 음식>
			<label for = food> 음식 </label>
			
			<input type = checkbox id = trip name = interest value = 여행>
			<label for = trip> 여행 </label>
			
			<input type = checkbox id = game name = interest value = 게임>
			<label for = game> 게임 </label>
			
			<input type = checkbox id = science name = interest value = 과학>
			<label for = science> 과학 </label>

			<input type = checkbox id = fashion name = interest value = 패션>
			<label for = fashion> 패션/쇼핑 </label>			
			<br>			
			<input type = checkbox id = it name = interest value = IT>
			<label for = it> IT </label>

			<input type = checkbox id = car name = interest value = 자동차>
			<label for = car> 자동차 </label>
			
			<input type = checkbox id = society name = interest value = 사회이슈>
			<label for = society> 사회이슈 </label>
			
			<input type = checkbox id = celebrity name = interest value = 연예인>
			<label for = celebrity> 연예인 </label>

			<input type = checkbox id = childrenEdu name = interest value = 육아>
			<label for = childrenEdu> 육아 </label>
			
			<input type = checkbox id = hire name = interest value = 취업>
			<label for = hire> 취업 </label>
			<br>
			<input type = checkbox id = education name = interest value = 교육>
			<label for = education> 교육 </label>
			
			<input type = checkbox id = family name = interest value = 가족>
			<label for = family> 가족 </label>
			
			<input type = checkbox id = cultural name = interest value = 문화생활>
			<label for = cultural> 문화생활 </label>

			<input type = checkbox id = pet name = interest value = 애견>
			<label for = pet> 애완동물 </label>			
			</div><br><br>
		<div class = complete>
			<input type = button value = "뒤로가기" id = backBtn onclick = "beforeBtn();">
			<input type = submit value = "패널 정보 등록 완료" id = successRegister onclick = "complete();"> 
		</div>
		</div> <br><br>
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
		
		// 여기서부터 ->
		$(document).ready(function(){
			$(".title1").show();  // <- 회원가입 첫번째 창 보여주기
			$(".title2").hide();  // <- 회원가입 두번째 창 숨기기
			$("#nextRegister").click(function(){  // <- nextRegister 버튼 클릭 시
				$(".title1").hide();  // <- 클릭 시 회원가입 첫번째 창 숨기기
				$(".title2").show();  // <- 클릭 시 회원가입 두번째 창 보여주기
				return false;
			});
		}); // <- 여기까지 div  show/hide
		
		
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
	       	});   // <- 여기까지 이메일 선택
	
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
	function complete(){   // <- RegisterServlet 으로 
		alert("회원가입 성공 화면으로 만들고, 홈 버튼 눌러서 로그인 메인화면으로 가게 하기");
	}
	
	function beforeBtn(){
		location = 'register1.jsp';
	}
	</script>
</body>
</html>