<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="survey.model.vo.*, java.util.ArrayList"%>

<%

     ArrayList<DoSurvey> dsList = (ArrayList<DoSurvey>)request.getAttribute("dsList");

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
 
   
  
   <br>
   <br>

<script type="text/javascript">   
    google.charts.load('current', {'packages' : [ 'corechart' ]}); // 차트를 최신버전으로 가져오기
    google.charts.setOnLoadCallback(drawChart);                  //구글차트를 가져오것다
    //  google.charts.setOnLoadCallback(drawChart2)
     //각 질문당 통계
     var chart = null;
      //단답일 경우에 적용됩니당 아마도
      function drawChart() {

       <% for(int i = 0 ; i < dsList.size(); i++){ 
       
       String title = dsList.get(i).getQ().getqTitle();
       ArrayList<Answer> arr1 = dsList.get(i).getA();
       
       %>
        var data = new google.visualization.DataTable();
             
      data.addColumn('string','항목이름');
      data.addColumn('number','항목별 count');
        var options = {   
            'title' : '<%=title%>'
         };
           <%for(int j = 0 ; j < arr1.size();j++){
           String str1 = arr1.get(j).getaContent();
       int inum1 = arr1.get(j).getAnswerCount();%>
              data.addRow(['<%=str1%>', <%=inum1%>]);
              
              
          <% } %>
           $("#chart_area").append("<div id = 'chart_div"+<%=i%>+"' style='width:1000; height : 1000' align ='center'></div>");
            var chartId = 'chart_div'+<%=i%>;   

         chart = new google.visualization.PieChart(document.getElementById(chartId));
         
         chart.draw(data, options);
          
         google.visualization.events.addListener(chart, 'select', selectHandler); 
          <% } %>

      }
    
    
      var selectHandler = function(){
          
          console.log(chart.getSelection()[0]);
          
           var selectedItem = chart.getSelection()[0];
           
           console.log("하나의 차트에서 선택된 것?"+selectedItem.row);
           
           var value = data.getValue(selectedItem.row, 0);
           
           
           alert("선택한 항목은 " + value   +"입니다");
          //var anum = $("#anum").val();

                    
        };
     
         </script>
         
        
      <div id = "chart_area">  </div>
   

      <button id="barchart">패널정보</button>
        
     <script>
     
        
   $("barchart").click(function(){
     $.ajax({
        url:"/surveyNow/panel.dt",
         //panelDataServlet만들러 고고
         data :{qnum : qnum, anum : anum},      //qnum,anum불러오기
         type:"get",
         success : function(data){
            
            
            $select = $("gsonMapSelect");
            $select.find("option").remove();
               
         
         }  
     }); 
   });
   
     
  
       
    </script>
   <script>
      
   </script>
   
    
</body>
</html>