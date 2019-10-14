<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 패널 정보 등록 </title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
</head>
<body>
<div id="register">
<div id="logo1">
<img src="<%=request.getContextPath() %>/image/semiLogo.png" class=nowlogo></div>
<div id="logo2">
<font size=60 color=#FF8C19> <b>설문 NOW</b> </font></div>
</div> <br clear="both">

	<form> <br>
	<div class = title>
		<div class = register>
			패널 정보 등록
		</div> <br>
		<div class = question>
			<label for = 1> 최종학력 </label>
			<select id = finalEdu name = finalEdu>
				<option value = "" selected = ""> 최종학력을 선택하세요 </option>
				<option value = "초등학교"> 초등학교 졸업 </option>
				<option value = "중학교"> 중학교 졸업 </option>
				<option value = "고등학교"> 고등학교 졸업 </option>
				<option value = "전문대"> 2·3년제 대학교 졸업 </option>
				<option value = "4년제"> 4년제 대학교 졸업 </option>
				<option value = "석사"> 석사학위 취득 </option>
				<option value = "박사"> 박사학위 취득 </option>
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
			<select id = home1 name = home1>
				<option value = "" selected = ""> 주거 형태를 선택하세요 </option>
				<option value = "월세"> 월세 </option>
				<option value = "전세"> 전세 </option>
				<option value = "자가"> 자가 </option>
				<option value = "기타"> 기타 </option>
			</select>
		</div> <br>
		
		<div class = question>
			<label for = 5> 주택유형 </label>
			<select id = home2 name = home2>
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
			<select id = marry name = marry>
				<option value = "" selected = ""> 혼인여부를 선택하세요 </option>
				<option value = "미혼"> 미혼 </option>
				<option value = "기혼"> 기혼 </option>
			</select>
		</div> <br>
		
		<div class = question>
			<label for = 8> 동거가족 </label>
			<select id = family1 name = family1>
				<option value = "" selected = ""> 동거 가족을 선택하세요 </option>
				<option value = "0"> 0명 </option>
				<option value = "1"> 1명 </option>
				<option value = "2"> 2명 </option>
				<option value = "3"> 3명 </option>
				<option value = "4"> 4명 </option>
				<option value = "5"> 5명 </option>
				<option value = "6"> 6명 이상 </option>
			</select>
		</div> <br>
		
		<div class = question>
			<label for = 9> 병역 </label>
			<select id = soldier name = soldier>
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
			
			<input type = checkbox id = family name = family value = 가족>
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
	
	<script type="text/javascript">
		function complete(){
			alert("회원가입 성공 화면으로 가기");
		}
		
		function beforeBtn(){
			location = 'register1.jsp';
		}
	</script>
	
	
	
	
</body>
</html>