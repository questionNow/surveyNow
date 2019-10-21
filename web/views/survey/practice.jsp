<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import ="java.util.*, survey.model.vo.*"%>
	
<%
	ArrayList<Survey> aList = new ArrayList<Survey>();
	Survey s1 = new Survey();
	Survey s2 = new Survey();
	
	s1.setsTitle("예");
	s1.setsCount(50); 
	s2.setsTitle("아니오");
	s2.setsCount(150);
	
	aList.add(s1);
	aList.add(s2);
%>
ㅁ
<html>
  <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
     
     var data;
     var chart;

      // Load the Visualization API and the piechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
    	     // Create our data table.
    	  var data = new google.visualization.DataTable();
          data.addColumn('string', '응답 내용');
          data.addColumn('number', '응답 수');
    
          
          <% for(int i = 0 ; i < aList.size() ; i++){ %>
          data.addRow(['<%=aList.get(i).getsTitle()%>', <%=aList.get(i).getsCount()%>]);
          <% } %>
          
          
        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        google.visualization.events.addListener(chart, 'select', selectHandler);
        chart.draw(data, options);
      }

      function selectHandler() {
        var selectedItem = chart.getSelection()[0];
        var value = data.getValue(selectedItem.row, 0);
        alert('The user selected ' + value);
      }

    </script>
  </head>
  <body>
    <!--Div that will hold the pie chart-->
    <div id="chart_div" style="width:400; height:300"></div>
  </body>
</html>