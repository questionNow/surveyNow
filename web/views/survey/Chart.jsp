<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="survey.model.vo.*, java.util.ArrayList"%>

<%
   ArrayList<DoSurvey> dsList = (ArrayList<DoSurvey>) request.getAttribute("dsList");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
    
<script type="text/javascript">   
    google.charts.load('current', {'packages' : [ 'corechart' ]}); // 차트를 최신버전으로 가져오기
	google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
		<% for(int i= 0 ; i< dsList.size(); i++){%>
		var data = new google.visualization.DataTable();
		data.addColumn('string','항목이름');
		data.addColumn('number','항목별 count');
		var options = {'title' : '타이틀'};
			<% for(int j=0 ; j< dsList.get(i).getA().size(); j++){%>
				data.addRow(['<%= dsList.get(i).getA().get(j).getaContent() %>', <%= dsList.get(i).getA().get(j).getAnswerCount() %>])
			<% } %>
		<% } %>
    	          
		$("#chart_area").append("<div>divdiv</div>")
		
      	data.addRow(['예',3]);
      	data.addRow(['아니오',5]);
      	 chart = new google.visualization.PieChart(document.getElementById('chart_div'));
         chart.draw(data, options);
      	};
      
    <%-- data.addRow(['<%=dsList.get(i).getA().get(i).getaContent()%>', <%=dsList.get(i).getA().get(i).getAnswerCount()%>]);         
         chart = new google.visualization.PieChart(document.getElementById('chart_div'));
         chart.draw(data, options);
          <% } %> --%>
      

    </script>    
    <div id="chart_div" style="width:1000; height:1000" align="center"></div>
    <div id = "chart_area"></div>
    
</body>
</html>