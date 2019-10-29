<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, survey.model.vo.*"%>
<%
	ArrayList<DoSurvey> dsList =(ArrayList<DoSurvey>)request.getAttribute("dsList"); 
%>    

<html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <head>
  <style>
  * {
	box-sizing: border-box;
}

.right {
	width: 55%;
	padding: 15px;
	display: inline-block;
}
  #add{
  position: relative;
  bottom : 100%;
  left : 80%;
  }
  </style>
  </head>
  <body>
  <%@ include file="../common/menubar2.jsp" %>
	<div class="row">
		<div class="right">
  			<div id = "chartArea" border = "1px solid red"></div>
  		</div>
  	</div>
  
  <script type="text/javascript">
	 
  
// ***** 여기는 문제 갯수만큼 돌아가야 하는 부분**********
  <%for(int i = 0 ; i < dsList.size() ; i++){ %>
// ** 문제 갯수마다 piechart"넘버" 로 DIV를 추가해줌
  $("#chartArea").append("<br><br><br><br><div id='piechart<%=i%>' style='width: 100%; height: 300px;'></div><br><br><br><br>");  
 
 
  	google.charts.load("current", {packages:["corechart"]});
	
 // ** drawChart 함수를 문제 갯수만큼 실행해줘야 함, 이름이 겹칠 경우 실행이 안되는 듯 해서 함수 이름에도 숫자를 부여해줌
 google.charts.setOnLoadCallback(drawChart<%=i%>);
	      
 // ** 문제 갯수만큼 함수를 선언 하기 귀찮으니깐 함수 뒤에 숫자를 부여해주자 !
 		function drawChart<%=i%>() {
	 		
 <%-- ** 데이터를 담을때 <% %> 이걸로 i 돌때마다 새로 받을 수 있게 수정 --%>
 	var data<%=i%> = new google.visualization.DataTable();
			 data<%=i%>.addColumn('string', 'aContent');
			 data<%=i%>.addColumn('number', 'Counts');
			 data<%=i%>.addRows([
				 <%for(int j = 0 ; j< dsList.get(i).getA().size() ; j++){%>
			      ['<%=dsList.get(i).getA().get(j).getaContent()%>', <%=dsList.get(i).getA().get(j).getAnswerCount()%>],
			      <% } %>
			 ]);	    	  
 
	        var options = {
	            title: '<%=dsList.get(i).getQ().getqTitle()%>'
	            // ,is3D : true
	          };
	   
	          var chart = new google.visualization.PieChart(document.getElementById('piechart<%=i%>'));

	          chart.draw(data<%=i%>, options);

	    	  google.visualization.events.addListener(chart, 'select', selectHandler);
	          
	          function selectHandler() {
				  var selection = chart.getSelection();
				  var message = '';
				  for (var i = 0; i < selection.length; i++) {
				    var item = selection[i];
				    if (item.row != null && item.column != null) {
				      var str = data<%=i%>.getFormattedValue(item.row, item.column);
				      message += str;
				    } else if (item.row != null) {
				      var str = data<%=i%>.getFormattedValue(item.row, 0);
				      message += str;
				    } else if (item.column != null) {
				      var str = data<%=i%>.getFormattedValue(0, item.column);
				      message += str;
				    }
				  }
				  if (message == '') {
				  }
				  // 실행부
				  ajaj(message);
				}
	          function ajaj(aContent){
	        	  $.ajax({
	        		  url : "<%= request.getContextPath()%>/sortChart.ch",
	        		  data : {aContent: aContent, qNum : <%=dsList.get(i).getQ().getqNum()%>},
	        		  success : function(data){
        				 var qNum = data[0];
        				 var aContent = data[1];
	        			 $("#piechart<%=i%> > #add").remove();
	        			 if(data != null){
		        		 	 $("#piechart<%=i%>").append("<div id = 'add'>"
		        		 		 +"<h3>"+aContent+"에 대한 분석"
								 +"&nbsp;&nbsp;&nbsp; <select class = 'target' name = targetType>"
								 +"<option>-------</option>"
								 +"<option value = finalEducation>최종학력</option>"
								 +"<option value = job>직업</option>"
								 +"<option value = income>소득</option>"
								 +"<option value = livingType>주거형태</option>"
								 +"<option value = houseType>주택유형</option>"
								 +"<option value = religion>종교</option>"
								 +"<option value = maritalStatus>혼인</option>"
								 +"<option value = livingWith>동거가족</option>"
								 +"<option value = armyGo>병역</option>"
								 +"</select></h3>"
							 +"</div>");
		        		 	$(".target").change(function(){
		        		 		$.ajax({
		        		 			url : "<%=request.getContextPath() %>/sortByType.sv",
		        		 			data : {qNum : qNum, aContent : aContent},
		        		 			success : function(data){
		        		 				console.log(data);
		        		 			}
		        		 		});
		        		 		
		        		 	});
	        			 }
	        			 
	        		 	
	        		  }
	        	  });
	          }
	          
	      }
  <%}%>
  </script>	
  </body>
</html>