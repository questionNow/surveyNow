<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, survey.model.vo.*"%>
<%
	ArrayList<DoSurvey> dsList =(ArrayList<DoSurvey>)request.getAttribute("dsList"); 
%>

<!DOCTYPE html>
<html>
<style>
</style>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
    	
    <%for(int i = 1 ; i < 2 ; i++){ %>
    	$("#chartArea").append("<div id='piechart<%i%>' style='width: 40%; height: 500px;'></div>");
    	google.charts.load("current", {packages:["corechart"]});
      	google.charts.setOnLoadCallback(drawChart<%=i%>);
	
      function drawChart1() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);
      var options = {
          title: 'My Daily Activities'
          // ,is3D : true
        };
 
        var chart = new google.visualization.PieChart(document.getElementById('piechart1'));

        chart.draw(data, options);
      }
      
      function drawChart<%=i%>() {
          var data = google.visualization.arrayToDataTable([
            ['Task', 'Hours per Day'],
            ['Work',     11],
            ['Eat',      2],
            ['Commute',  2],
            ['Watch TV', 2],
            ['Sleep',    7]
          ]);
        var options = {
            title: 'My Daily Activities'
            // ,is3D : true
          };
   
          var chart = new google.visualization.PieChart(document.getElementById('piechart<%=i%>'));

          chart.draw(data, options);
          console.log("#piechart<%=i%> > div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(2) > g > text"));
      }
      <%}%>  
          
          
          
// 바차트
    /*   google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart2);
	  
	  var count2 = 0;
	  var data2;
	  var chart2;
      var options2;
	  
      function drawChart2() {
	  data2 = new google.visualization.DataTable();
	  data2.addColumn('string', 'Dialogue');
	  data2.addColumn('number', 'Send');
	  data2.addColumn('number', 'Resoponse');
	  data2.addRow(['Dialogue 1', 1, 1]);
	  
        options2 = {
          chart2: {
            title: 'Analysis of Dialogue System',
            subtitle: '',
          }
        };

        chart2 = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart2.draw(data2, google.charts.Bar.convertOptions(options2));
      }
      
      function addData(){
	    count++;
		data2.addRow(['Dialogue ' + count2, Number(document.getElementById('sendInput').value), Number(document.getElementById('responseInput').value)]);
		chart2.draw(data2, options2)
      }
      function removeData(){
		data2.removeRow(0);
		chart2.draw(data2, opstions2)
      } */
    </script>

</head>
<body>
	<div id="chartArea"></div>



	<div id="columnchart_material" style="width: 40%; height: 500px;"></div>


</body>
</html>