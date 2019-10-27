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
  
  </style>
  </head>
  <body>
  <div id = "chartArea"></div>
  
  <script type="text/javascript">

  
// ***** 여기는 문제 갯수만큼 돌아가야 하는 부분**********
  <%for(int i = 0 ; i < dsList.size() ; i++){ %>
// ** 문제 갯수마다 piechart"넘버" 로 DIV를 추가해줌
  $("#chartArea").append("<div id='piechart<%=i%>' style='width: 40%; height: 300px;'></div>");  
 
  	google.charts.load("current", {packages:["corechart"]});
	
 // ** drawChart 함수를 문제 갯수만큼 실행해줘야 함, 이름이 겹칠 경우 실행이 안되는 듯 해서 함수 이름에도 숫자를 부여해줌
 google.charts.setOnLoadCallback(drawChart<%=i%>);
	      
 // ** 문제 갯수만큼 함수를 선언 하기 귀찮으니깐 함수 뒤에 숫자를 부여해주자 !
 		function drawChart<%=i%>() {
	 		
 <%-- ** 데이터를 담을때 <% %> 이걸로 i 돌때마다 새로 받을 수 있게 수정 --%>
	    	  var data<%=i%> = google.visualization.arrayToDataTable([
			      ['<%=dsList.get(i).getQ().getqTitle()%>', '응답 수'],
			      <%for(int j = 0 ; j< dsList.get(i).getA().size() ; j++){%>
			      ['<%=dsList.get(i).getA().get(j).getaContent()%>', <%=dsList.get(i).getA().get(j).getAnswerCount()%>],
			      <% } %>
			      ]);
	    	  
	        var options = {
	            title: '<%=dsList.get(i).getS().getsTitle()%>'
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
				    message = 'nothing';
				  }
				  alert('클릭 이벤트에 딸린 내용 : ' + message);
				  aaa(message);
				}
	          function aaa(a){
	        	  alert(a);
	          }
	      }
  <%}%>
  </script>	
  </body>
</html>