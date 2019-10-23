<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="survey.model.vo.*, java.util.ArrayList"%>

<%
   ArrayList<Chart> cList = (ArrayList<Chart>) request.getAttribute("cList");
ArrayList<DoSurvey>   dsList = (ArrayList<DoSurvey>)request.getAttribute("dsList");

   out.print(cList);
   
     int snum = Integer.valueOf(request.getParameter("snum")); 
   

   //int snum = Integer.valueOf(list.get(0).getSnum());
  
%>

<br><br>

<br>
<%=cList.get(0).getQnum()   %> 
<br>
<%=cList.get(1).getQnum()   %> 
<br>
<%=cList.get(2).getQnum()   %> 
<br>
<%=cList.get(3).getQnum()   %> 
<br>
<%=cList.get(4).getQnum()   %> 


<br><br>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


   

    

   
    <!-- <script>
    
       //질문 응답에 대한 패널들의 특징별 통계
       function drawChart2() {
          var data = google.visualization.arrayToDataTable();

/*                 [
                      [ "Element", "Density", {
                         role : "style"
                      } ], [ "Copper", 8.94, "#b87333" ],
                      [ "Silver", 10.49, "silver" ], [ "Gold", 19.30, "gold" ],
                      [ "Platinum", 21.45, "color: #e5e4e2" ] ]); */
        data.addColumn('string','답변내용');
        data.addColumn('number','count');
                      
                
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

      /*  function selectHandler() {
           var selectedItem = chart.getSelection()[0];
           var value = data.getValue(selectedItem.row, 0);
           
         } */
   </script>
 -->

   

</head>
<body>
 <%@ include file="../admin/adminPage.jsp"%>
 
 <h1 align="center">설문제목 : <%=cList.get(0).getStitle()%></h1>
<%--    <h1 align="center">타겟은 <%=cList.get(0).getStarget()%></h1> --%>
   <h3 align="right">설문 시작 날짜 : <%=cList.get(0).getSstartdt() %></h1>
   <h3 align="right">설문 종료 날짜 : <%=cList.get(0).getSenddt() %></h1>
   
  
   <br>
   <br>
   
<script type="text/javascript">   
    google.charts.load('current', {'packages' : [ 'corechart' ]}); // 차트를 최신버전으로 가져오기
    google.charts.setOnLoadCallback(drawChart);                  //구글차트를 가져오것다
    //  google.charts.setOnLoadCallback(drawChart2)
     //각 질문당 통계
     
      //단답일 경우에 적용됩니당 아마도
      function drawChart() {

         <% for(int i = 0 ; i < dsList.size(); i++){ %>
        var data = new google.visualization.DataTable();
                
      data.addColumn('string','항목이름');
      data.addColumn('number','항목별 count');
        var options = {   
            'title' : '<%=dsList.get(i).getQ().getqTitle()%>'
         };
           <%for(int j = 0 ; j < dsList.get(i).getA().size();j++){%>
              data.addRow(['<%=dsList.get(i).getA().get(j).getaContent()%>', <%=dsList.get(i).getA().get(j).getAnswerCount()%>]);
            $("#chart area").append("<div id = 'chart_div"+<%=i%>+"' style='width:1000; height : 1000' align ='center'></div>)");
            var chartId = 'chart_div'+<%=i%>;
         chart = new google.visualization.PieChart(document.getElementById(chartId));
         chart.draw(data, options);
          <% } %>
          <% } %>
  
       
      }
    
     
    </script>
   <input type="hidden" id="snum" value=<%=snum %>>    
      <div id = "chart_area">  </div>
    <div id="chart_div" style="width:1000; height:1000" align="center"></div>
   
    
   <!-- <div id="barchart_values" style="width: 900px; height: 300px;"></div> -->
    
   <button id="barchart">패널정보</button>
   <script>
      $("#barchart").click(function(){
         
      //#snum = request snum값
   var snum = $("#snum").val();
       
         $.ajax({
            url:"/surveyNow/panel.dt",
            //panelDataServlet만들러 고고
            data :{snum : snum},
            type:"get",
            success : function(data){
               consol.log(list);
               $.each(data, function(index,value){
                  
               });
            }
         });
      });
   </script>
   
    
</body>
</html>