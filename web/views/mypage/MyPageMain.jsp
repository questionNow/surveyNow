<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.UserInfo" %>
<%    
	UserInfo user = (UserInfo)request.getAttribute("user"); 
	String userId = user.getUserId();
	String phone = user.getPhone();
	String email = user.getEmail();
	String address = user.getAddress();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/timegrid/main.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/interaction/main.min.css" rel="stylesheet" type="text/css" />

<script src="https://code.jquery.com/jquery-1.12.4.js"  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/timegrid/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/interaction/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/moment/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/locales/ko.js"></script>

<style>
	
		#calendar{
			width: 850px;
			height: 500px;
       		 margin-left:550px; 
       		 margin-top:30px;
       		 
       		 }
	
	
	
	/* 마이페이지 정보화면 스타일 */
	#myPageArea{width:300px; height:300px; background:pink; margin-left:550px; margin-top:230px; }
	#mainMyPage{ float:left; margin-left:10px; width:300px; height:300px; background:purple; display:inline-block;}
	
	.userInformation{font-size:12px; padding-top:10px; margin-left:150px; border:1px solid;}
	
	
</style>
<title>Insert title here</title>
</head>
<body>

	
	<%@ include file="../common/menubar2.jsp" %>

<!-- 마이페이지부분 전체 div -->	

		<div id="calendar">
	<h1>FullCalendar 예제 입니다.</h1>
		</div>
<script>
	$(document).ready(function() {
		setCalendar();
	});

	function setCalendar(){

		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			defaultView: 'dayGridMonth',
			locale: 'ko',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			allDaySlot: false,
			eventLimit: true, // allow "more" link when too many events
			minTime: '10:00:00',
			maxTime: '24:00:00',
			/* contentHeight: 'auto', */
			eventSources: [{
				events: function(info, successCallback, failureCallback) {
					$.getJSON( "selectEventList.json", function( data ) {						
						successCallback(data);
					});
				}
			}]
		});
				
		calendar.render();

	}
	
	</script>
	<!-- 마이페이지 개인정보 화면 -->
<div id = "myPageArea" >	
	<div id="mainMyPage">
		<%-- <div class = "userInformation"style=margin-left:400px;><%=loginUser.getUserName() %> 아이디 들어옴</div> --%>
		<div class = "userInformation">
		<input value="<%=userId %>" readonly>
		</div>
		<div class = "userInformation">포인트</div>
 
		<div class = "userInformation">휴대폰
		<input name="phone" value=<%=phone %> readonly>
		</div> 
		<div class = "userInformation">E-Mail
		<input name="email" value=<%=email %> readonly>
		</div> 
		<div class = "userInformation">주소
		<input type="text" maxlength="150" name="address" value=<%=address %> readonly>
		</div> 
		<div class = "userInformation">설문 참여 횟수</div> 
	</div>


</body>
</html>