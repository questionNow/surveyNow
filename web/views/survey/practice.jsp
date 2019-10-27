<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import ="java.util.*, survey.model.vo.*"%>


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
  <%for(int i = 1 ; i <3 ; i++){ %>
  <% int j = 2; %>
// ** 문제 갯수마다 piechart"넘버" 로 DIV를 추가해줌
  $("#chartArea").append("<div id='piechart<%=i%>' style='width: 40%; height: 300px;'></div>");  
 
  	google.charts.load("current", {packages:["corechart"]});
	
 // ** drawChart 함수를 문제 갯수만큼 실행해줘야 함, 이름이 겹칠 경우 실행이 안되는 듯 해서 함수 이름에도 숫자를 부여해줌
 google.charts.setOnLoadCallback(drawChart<%=i%>);
	      
 // ** 문제 갯수만큼 함수를 선언 하기 귀찮으니깐 함수 뒤에 숫자를 부여해주자 !
 		function drawChart<%=i%>() {
	 		
 <%-- ** 데이터를 담을때 <% %> 이걸로 i 돌때마다 새로 받을 수 있게 수정 --%>
	    	  var data1 = google.visualization.arrayToDataTable([
			      ['Task', 'Hours per Day'],
			      ['Work',     11],
			      ['Eat',      2],
			      ['Commute',  4],
			      ['Watch TV', 2],
			      ['Sleep',    7]
			    ]);
	    	  
	    	  var data2 = google.visualization.arrayToDataTable([
			      ['Task', 'Hours per Day'],
			      ['일',     5],
			      ['먹기',      30],
			      ['통근',  5],
			      ['티비보기', 6],
			      ['자기',    4]
			    ]);
			 
	        var options = {
	            title: 'My Daily Activities'
	            // ,is3D : true
	          };
	   
	          var chart = new google.visualization.PieChart(document.getElementById('piechart<%=i%>'));

	          chart.draw(data<%=i%>, options);
	          
/* 차트 넘버에 맞춰서 click을 하나하나 해줘야  지정이 되니까 이거는 사실 건드리지 않고 항목이 더 늘어날 것 같으면 추가만 하면 될 것 같아 :) */	          
	          $("#piechart<%=i%> > div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(2) > g > text").click(function(){
	        	  alert(document.querySelector("#piechart<%=i %> div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(2) > g > text").textContent);  
	          });
	          $("#piechart<%=i%> > div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(3) > g > text").click(function(){
	        	  alert(document.querySelector("#piechart<%=i %> div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(3) > g > text").textContent);  
	          });
	          $("#piechart<%=i%> > div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(4) > g > text").click(function(){
	        	  alert(document.querySelector("#piechart<%=i %> div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(4) > g > text").textContent);  
	          });
	          $("#piechart<%=i%> > div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(5) > g > text").click(function(){
	        	  alert(document.querySelector("#piechart<%=i %> div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(5) > g > text").textContent);  
	          });
	          $("#piechart<%=i%> > div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(6) > g > text").click(function(){
	        	  alert(document.querySelector("#piechart<%=i %> div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(6) > g > text").textContent);  
	          });
	          $("#piechart<%=i%> > div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(7) > g > text").click(function(){
	        	  alert(document.querySelector("#piechart<%=i %> div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(7) > g > text").textContent);  
	          });
	          $("#piechart<%=i%> > div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(8) > g > text").click(function(){
	        	  alert(document.querySelector("#piechart<%=i %> div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(8) > g > text").textContent);  
	          });
	          $("#piechart<%=i%> > div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(9) > g > text").click(function(){
	        	  alert(document.querySelector("#piechart<%=i %> div > div:nth-child(1) > div > svg > g:nth-child(4) > g:nth-child(9) > g > text").textContent);  
	          });
	          
	      
	      }
	      
  <%}%>
  </script>	
  </body>
</html>