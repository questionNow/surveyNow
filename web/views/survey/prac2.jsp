<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="java.util.*, survey.model.vo.*"%>

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
<br>
<br>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
   src="https://www.gstatic.com/charts/loader.js"></script>

</head>
<body>

   <br>

      
   <h1 align="center"><%=aList.get(0).getsTitle() %></h1>
   <h1 align="center">타겟은 <%=aList.get(0).getsCount()    %></h1>
   <h3 align="right">설문 시작 날짜 : </h1>
   <h3 align="right">설문 종료 날짜 : </h1>
   
   
   
   <div id="piechart" style="width: 900px; height: 500px;"></div>
   
   
   <div id="barchart_values" style="width: 900px; height: 300px;"></div>
   
   <script type="text/javascript">
      google.charts.load('current', {
         'packages' : [ 'corechart' ]
      });
      google.charts.setOnLoadCallback(drawChart);


      
      
      //각 질문당 통계
     function drawChart() {


         var data = google.visualization.arrayToDataTable([
            
<%--          <%for (Chart c :list){%> --%>

         [ 'content(ㄹㄹㄹ)', 'count(각항목별 count)' ],
         
         ['예', 3],['아니오',7]
         ]);


         
         
         
         var chart = new google.visualization.PieChart(document.getElementById('piechart'));

         chart.draw(data, options);

      }

      
      //ajax로 ..
      //참여한 타겟들의 수 막대 그래프
      function drawChart2() {
         var data = google.visualization.arrayToDataTable([
               [ "Element", "Density", {
                  role : "style"
               } ], [ "Copper", 8.94, "#b87333" ],
               [ "Silver", 10.49, "silver" ], [ "Gold", 19.30, "gold" ],
               [ "Platinum", 21.45, "color: #e5e4e2" ] ]);

         var view = new google.visualization.DataView(data);
         view.setColumns([ 0, 1, {
            calc : "stringify",
            sourceColumn : 1,
            type : "string",
            role : "annotation"
         }, 2 ]);

         var options = {
            title : "Density of Precious Metals, in g/cm^3",
            width : 600,
            height : 400,
            bar : {
               groupWidth : "95%"
            },
            legend : {
               position : "none"
            },
         };

         var chart = new google.visualization.BarChart(document
               .getElementById("barchart_values"));
         chart.draw(view, options);
      }
   </script>





   
</body>
</html>