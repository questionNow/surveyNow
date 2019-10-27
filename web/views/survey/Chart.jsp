<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
	  
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

        chart2.draw(data, google.charts.Bar.convertOptions(options2));
      }
      
      function addData(){
	    count++;
		data2.addRow(['Dialogue ' + count2, Number(document.getElementById('sendInput').value), Number(document.getElementById('responseInput').value)]);
		chart2.draw(data2, options2)
      }
      function removeData(){
		data2.removeRow(0);
		chart2.draw(data2, opstions2)
      }
    </script>
  </head>
  <body>
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
    send:<br>
    <input id="sendInput" type="text"><br>
    response:<br>
    <input id="responseInput" type="text"><br><br>
    <button onclick="addData();">add</button> <button onclick="removeData();">remove</button>
  </body>
</html>