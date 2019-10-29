 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.vo.UserInfo, java.util.ArrayList, mypage.model.vo.attendence" %>
  
<%    
	String MyMain = (String)request.getAttribute("MyMain");

	UserInfo user = (UserInfo)request.getAttribute("user"); 
	String userId = user.getUserId();
	String phone = user.getPhone();
	String email = user.getEmail();
	String address = user.getAddress();
	
	ArrayList<attendence> calendarSave = (ArrayList<attendence>)request.getAttribute("calendarSave");
	
	
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




<!-- 캘린더 한글 설정 -->
<script src="js/calendar/calmain.js"></script>
<style>
 
  html, body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  
  .demo-topbar +{ /* will get stripped out */
    top: 60px;
  }

  #calendar-container {
    position: relative;
    z-index: 1;
    margin-left: 200px;
  }
 
  #calendar {
    max-width: 700px;
    margin: 0 auto;
  }
  
  /* 마이페이지 정보화면 스타일 */
	#myPageArea{width:300px; height:300px; background:pink; margin-left:550px; margin-top:230px; }
	#mainMyPage{ float:left; margin-left:10px; width:300px; height:300px; background:purple; display:inline-block;}
	
	.userInformation{font-size:12px; padding-top:10px; margin-left:150px; border:1px solid;}
</style>
 
</head>
<body>
  <%@ include file="../common/menubar2.jsp" %>
  
 
<%--   <div class="abc">
  <input <%=calendarSave.get%>>
  </div> --%>
  
<script>
 // 객체?의 변수 설정
  document.addEventListener('DOMContentLoaded', function() {
  var Calendar = FullCalendar.Calendar;
  var calendarEl = document.getElementById('calendar');


  // 캘린더 상단 위치및 캘린더 내부에 설정 가능
  // -----------------------------------------------------------------
 // 캘린더 화면 설정이나 이벤트
 
  var calendar = new Calendar(calendarEl, {
	
	locale: 'ko',
    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
    
    header: {
      left: 'prev,next today',
      center: 'title',
      right: ', dayGridMonth'
    },
    
    
   <%--    customButtons: { 
        custom2: {
          text: '출석체크하기',
          id: 'check',
          
         /*  click: function() {	 */\\
         	  var userId = <%=userId %>
        	  url: "<%=request.getContextPath()%>/caledarsave.cs",
        	  type: "POST",
        	  data : {userId: userId}
        	  dataType: "text",
        	  success: function (date) {  
        	  $(".fc-custom2-button").prop('disabled', true);
        	  $(".fc-custom2-button").html('출석완료');
        	  /*   }   */
         /*  } */
        }
    }, --%>
    
   // 달력 정보 가져오기  
   /*   eventSources:
    	 [ 
    	  {
    	
		/* url: '/users/attendances',
		type: 'GET',
		dataType: "JSON",
		success: function (data) { },
		error: function() { */
		 /* alert('there was an error while fetching events!');  */
	/* 	}, */
		
		/* color: 'purple',   
		textColor: 'white'
    	
     	} 
    ],     */ 
   
    	/* 	info.dayEl.style.backgroundColor = 'red'; */
    
   		<%-- 	 var userId = "<%=loginUser.getUserId()%>";
    	location.href="<%=request.getContextPath()%>/caledarsave.cs?userId=" + userId; --%>
    	
  }); 


 	//캘린더 실행하게함
  calendar.render();
 
}); 
</script>





 
<div id='calendar' ></div>
<input type="button" id="btnAddTest" value="추가">


	<!-- 마이페이지 개인정보 화면 -->
<div id = "myPageArea" >	
	<div id="mainMyPage">
		<div class = "userInformation"style=margin-left:400px;><%=loginUser.getUserName() %> 아이디 들어옴</div>
		<div class = "userInformation">
		<input id="userId" value="<%=userId %>" readonly>
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