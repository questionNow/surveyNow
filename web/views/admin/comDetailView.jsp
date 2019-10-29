<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, survey.model.vo.*"%>
<%
   ArrayList<DoSurvey> dsList =(ArrayList<DoSurvey>)request.getAttribute("dsList"); 
%>    

<html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <head>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
  <style>

#Area{
position : absolute;
padding-left:1000px;
padding-top:100px;
}
  
#chartArea{
padding-left : 200px;
}

  </style>
  </head>
  <body >
		<%@include file="admin_menubar.jsp"%>
  <p align="center" style="font-family: 'Jua', sans-serif; font-size : 90px;"><%=dsList.get(0).getS().getsNum()%> . <%=dsList.get(0).getS().getsTitle() %></p>
  <h2 align = "right" style="font-family: 'Jua', sans-serif; font-size : 50px; padding-right:100px;">설문 기간 : <%=dsList.get(0).getS().getsStartDate()%> ~ <%=dsList.get(0).getS().getsEndDate() %></h2>
  <br><br>

  <div  id = "chartArea" style="background-color:#EAF9E7">   <div id ="Area"></div></div>

<br><br><br>

  
  
  <script type="text/javascript">

  
// ***** 여기는 문제 갯수만큼 돌아가야 하는 부분**********
  <%for(int i = 0 ; i < dsList.size() ; i++){ %>
// ** 문제 갯수마다 piechart"넘버" 로 DIV를 추가해줌
  $("#chartArea").append("<div id='piechart<%=i%>' style='width: 1000px; height: 600px;'></div>");  
	$("#Area").append("<div id='radio_area<%=i%>'></div>");
	$("#Area").append("<div id = 'bar_area<%=i%>'style='width: 1000px; height: 578.67px;'></div>");
     google.charts.load("current", {packages:["corechart"]});
   
 // ** drawChart 함수를 문제 갯수만큼 실행해줘야 함, 이름이 겹칠 경우 실행이 안되는 듯 해서 함수 이름에도 숫자를 부여해줌
 google.charts.setOnLoadCallback(drawChart<%=i%>);
         
 // ** 문제 갯수만큼 함수를 선언 하기 귀찮으니깐 함수 뒤에 숫자를 부여해주자 !
       function drawChart<%=i%>() {
    	    var value;
    	    var qnum;
 <%-- ** 데이터를 담을때 <% %> 이걸로 i 돌때마다 새로 받을 수 있게 수정 --%>
            var data<%=i%> = google.visualization.arrayToDataTable([
               ['<%=dsList.get(i).getQ().getqTitle()%>', '응답 수'],
               <%for(int j = 0 ; j< dsList.get(i).getA().size() ; j++){%>
               ['<%=dsList.get(i).getA().get(j).getaContent()%>', <%=dsList.get(i).getA().get(j).getAnswerCount()%>],
               <% } %>
               ]);
            

            
            
           var options = {
               title: '<%=dsList.get(i).getQ().getqNum()%> . <%=dsList.get(i).getQ().getqTitle()%>',
               // ,is3D : true
            	   is3D: true,
            	   backgroundColor : "#EAF9E7"
             };
      
             var chart = new google.visualization.PieChart(document.getElementById('piechart<%=i%>'));

             chart.draw(data<%=i%>, options);

            google.visualization.events.addListener(chart, 'select', selectHandler);
             
             function selectHandler() {
            	 document.querySelector("#radio_area<%=i%>").innerHTML = "";
            	 $("#radio_area<%=i%>").append("<label for = 'Panel'>패널 정보  </label>"
            		    	 +"<input type = 'radio' name = 'PanelData<%=i%>' id='gender' value = 'gender' checked>성별"
							+"<input type = 'radio' name ='PanelData<%=i%>' value = 'finaledu'>최종 학력"
							+"<input type = 'radio' name ='PanelData<%=i%>' value = 'job'>직업"
							+"<input type = 'radio' name = 'PanelData<%=i%>' value = 'income'>평균 월별 소득"
							+"<input type = 'radio' name = 'PanelData<%=i%>' value = 'livingtype'>거주형태"
							+"<input type = 'radio' name = 'PanelData<%=i%>' value = 'housetype'>주택여행"
							+"<input type = 'radio' name = 'PanelData<%=i%>' value = 'religion'>종교"
							+"<input type = 'radio' name = 'PanelData<%=i%>' value = 'marital'>혼인여부"
							+"<input type = 'radio' name = 'PanelData<%=i%>' value = 'livingwith'>동거가족"
							+"<input type = 'radio' name = 'PanelData<%=i%>' value = 'army'>병역여부");
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
              //alert('클릭 이벤트에 딸린 내용 : ' + message);
              showbar();
            }
             function showbar(){
            	 
            	 var selectedItem = chart.getSelection()[0];            
             	value = data<%=i%>.getValue(selectedItem.row, 0);
                qnum =  <%=dsList.get(i).getQ().getqNum()%>;

            	 $.ajax({
                     url:"<%=request.getContextPath()%>/gender.ch",
                     data: {value : value, qnum : qnum},
                     type:"get",
                     success : function barchart(data){
            
                       $("#bar_area<%=i%>").append("<div id ='barchart<%=i%>'><div>");
                  
                       
                       var bar = google.visualization.arrayToDataTable([
                            ['성별', 'count', { role: 'style' } ],
                            ['남자', data[0], 'color: #5E72E1 '],
                            ['여자', data[1], 'color: #EB6E85'],
                           
                          ]);
                     var view = new google.visualization.DataView(bar);
                    
                   var options = {
                         title: "성별 별 패널 통계",
                         width: 600,	
                         height: 400,
                         bar: {groupWidth: "80%"},
                         legend: { position: "none" },
                         backgroundColor : "#EAF9E7"
                       };
                       var chart = new google.visualization.BarChart(document.getElementById("barchart<%=i%>"));
                       chart.draw(view, options);
                       
                       
                     }
                       
                     
                     
                  });
            	 
            	 radio();
            	 
             }

             function radio(){
            	 
            	 var selectedItem = chart.getSelection()[0];            
              	value = data<%=i%>.getValue(selectedItem.row, 0);
                 qnum =  <%=dsList.get(i).getQ().getqNum()%>;
                 
                 $("input:radio[name = PanelData<%=i%>]").click(function(){
                	 if($("input:radio[name=PanelData<%=i%>]:checked").val()=='finaledu'){
                		 
                	 $.ajax({
                         url:"<%=request.getContextPath()%>/finaledu.ch",
                         data : {value : value, qnum : qnum},
                         type:"get",
                         success : function barchart(data){
                        	 
                        	    $("#bar_area<%=i%>").append("<div id ='barchart<%=i%>'><div>");
                                
                        	 var bar = google.visualization.arrayToDataTable([
                                 ['최종학력', 'count', { role: 'style' } ],
                                 ['초등학교 졸업', data[0], 'color: #EECB3E'],
                                 ['중학교 졸업', data[1], 'color: #8FEE46'],
                                 ['고등학교 졸업', data[2], 'color: #2E99F6'],
                                 ['2.3학년제 대학교 졸업', data[3], 'color: #F79335'],
                                 ['4년제 대학교 졸업', data[4], 'color: #CB6EE9'],
                                 ['석사학위 취득', data[5], 'color: #4963E5'],
                                 ['박사학위 취득', data[6], 'color: #4963E5']
                               ]);
                          var view = new google.visualization.DataView(bar);
                         
                        var options = {
                              title: "최종 힉력 별 패널 통계",
                              width: 600,	
                              height: 400,
                              bar: {groupWidth: "80%"},
                              legend: { position: "none" },
                              backgroundColor : "#EAF9E7"
                            };
                        var chart = new google.visualization.BarChart(document.getElementById("barchart<%=i%>"));
                        chart.draw(view, options);
                            
                         }

                         
                     });
                	 }else if($("input:radio[name=PanelData<%=i%>]:checked").val()=='job'){
                		 $.ajax({
                             url:"<%=request.getContextPath()%>/job.ch",
                             data : {value : value, qnum : qnum},
                             type:"get",
                             success : function barchart(data){

                         	    $("#bar_area<%=i%>").append("<div id ='barchart<%=i%>'><div>");
                        
                               var bar = google.visualization.arrayToDataTable([
                                    ['직업', 'count', { role: 'style' } ],
                                    ['무직', data[0], 'color: #C4C0C0'],
                                    ['학생', data[1], 'color: #83BAD5'],
                                    ['자영업', data[2], 'color: #EC9255'],
                                    ['사무직', data[3], 'color: #5695D0'],
                                    ['판매/서비스직', data[4], 'color: #9EDA2F'],
                                    ['생산/기술직', data[5], 'color: #F2E477'],
                                    ['전문/예술직', data[6], 'color: #F67DC4'],
                                    ['경영/관리직', data[6], 'color: #33254C'],
                                    ['농/어/축산업', data[6], 'color: #5DF0B5'],
                                    ['기타', data[6], 'color:# 92652E']
                                    
                                    ]);
                             var view = new google.visualization.DataView(bar);
                            
                           var options = {
                                 title: "직업 별 패널 통계",
                                 width: 600,	
                                 height: 400,
                                 bar: {groupWidth: "80%"},
                                 legend: { position: "none" },
                                 backgroundColor : "#EAF9E7"
                               };
                               var chart = new google.visualization.BarChart(document.getElementById("barchart<%=i%>"));
                               chart.draw(view, options);
                                
                             }

                             
                         });
                	 }else if($("input:radio[name=PanelData<%=i%>]:checked").val()=='income'){
                		 $.ajax({
                   		  url:"<%=request.getContextPath()%>/income.ch",
                             data : {value : value, qnum : qnum},
                             type:"get",
                             success : function barchart(data){
                           	  
                        	    $("#bar_area<%=i%>").append("<div id ='barchart<%=i%>'><div>");
                        	    
                        	    
                        	   var bar = google.visualization.arrayToDataTable([
                                  ['월소득', 'count', { role: 'style' } ],
                                  ['200만원 미만', data[0], 'color: #699756 '],
                                  ['200만원 이상 400만원 미만', data[1], 'color: #B76FBA'],
                                  ['400만원 이상 600만원 미만', data[2], 'color: #4055C2'],
                                  ['600만원 이상', data[3], 'color: #6F574F']
                                  
                                  ]);
                           var view = new google.visualization.DataView(bar);
                          
                         var options = {
                               title: "월 소득 별 패널 통계",
                               width: 600,	
                               height: 400,
                               bar: {groupWidth: "80%"},
                               legend: { position: "none" },
                               backgroundColor : "#EAF9E7"
                             };
                             var chart = new google.visualization.BarChart(document.getElementById("barchart<%=i%>"));
                             chart.draw(view, options);
                             
                               
                            }

                            
                        });
                   	 		
                	 }else if($("input:radio[name=PanelData<%=i%>]:checked").val()=='livingtype'){
                		 $.ajax({
                    		 url:"<%=request.getContextPath()%>/livingtype.ch",
                             data : {value : value, qnum : qnum},
                             type:"get",
                             success : function barchart(data){
                            	  
                         	    $("#bar_area<%=i%>").append("<div id ='barchart<%=i%>'><div>");
                         	    
                         	    
                         	   var bar = google.visualization.arrayToDataTable([
                                   ['주거형태', 'count', { role: 'style' } ],
                                   ['월세', data[0], 'color: #AC60C5 '],
                                   ['전제', data[1], 'color: #3587D6'],
                                   ['자가', data[2], 'color: #E8586B'],
                                   ['기타', data[3], 'color: #DBE556']
                                   
                                   ]);
                            var view = new google.visualization.DataView(bar);
                           
                          var options = {
                                title: "주거형태 별 패널 통계",
                                width: 600,	
                                height: 400,
                                bar: {groupWidth: "80%"},
                                legend: { position: "none" },
                                backgroundColor : "#EAF9E7"
                              };
                              var chart = new google.visualization.BarChart(document.getElementById("barchart<%=i%>"));
                              chart.draw(view, options);
                              
                                
                             }

                             
                         });
                	 }else if($("input:radio[name=PanelData<%=i%>]:checked").val()=='housetype'){
                		 $.ajax({
                    		 url:"<%=request.getContextPath()%>/housetype.ch",
                             data : {value : value, qnum : qnum},
                             type:"get",
                             success : function barchart(data){
                            	  
                         	    $("#bar_area<%=i%>").append("<div id ='barchart<%=i%>'><div>");
                         	    
                         	    
                         	   var bar = google.visualization.arrayToDataTable([
                                   ['주택유형', 'count', { role: 'style' } ],
                                   ['단독 주택', data[0], 'color: #E8741A'],
                                   ['다세대 주택', data[1], 'color: #637DDA'],
                                   ['아파트', data[2], 'color: #439545'],
                                   ['기타', data[3], 'color: #971BA3']
                                   
                                   ]);
                            var view = new google.visualization.DataView(bar);
                           
                          var options = {
                                title: "주택유형 별 패널 통계",
                                width: 600,	
                                height: 400,
                                bar: {groupWidth: "80%"},
                                legend: { position: "none" },
                                backgroundColor : "#EAF9E7"
                              };
                              var chart = new google.visualization.BarChart(document.getElementById("barchart<%=i%>"));
                              chart.draw(view, options);
                              
                                
                             }

                             
                         });
                    	 		
                	 }else if($("input:radio[name=PanelData<%=i%>]:checked").val()=='religion'){
                		 $.ajax({
                    		 url:"<%=request.getContextPath()%>/religion.ch",
                             data : {value : value, qnum : qnum},
                             type:"get",
                             success : function barchart(data){
                            	  
                         	    $("#bar_area<%=i%>").append("<div id ='barchart<%=i%>'><div>");
                         	    
        
                         	    
                         	   var bar = google.visualization.arrayToDataTable([
                                   ['종교', 'count', { role: 'style' } ],
                                   ['무교', data[0], 'color: #6E7C52 '],
                                   ['기독교', data[1], 'color: #A37CD1'],
                                   ['불교', data[2], 'color: #D57856'],
                                   ['천주교', data[3], 'color: #577DF8'],
                                   ['기타', data[4], 'color: #FF96C0']
                                   
                                   ]);
                            var view = new google.visualization.DataView(bar);
                           
                          var options = {
                                title: "종교 별 패널 통계",
                                width: 600,	
                                height: 400,
                                bar: {groupWidth: "80%"},
                                legend: { position: "none" },
                                backgroundColor : "#EAF9E7"
                              };
                              var chart = new google.visualization.BarChart(document.getElementById("barchart<%=i%>"));
                              chart.draw(view, options);
                              
                                
                             }

                             
                         });
                	 }else if($("input:radio[name=PanelData<%=i%>]:checked").val()=='marital'){
                		 $.ajax({
                    		 url:"<%=request.getContextPath()%>/marital.ch",
                             data : {value : value, qnum : qnum},
                             type:"get",
                             success : function barchart(data){
                            	  
                         	    $("#bar_area<%=i%>").append("<div id ='barchart<%=i%>'><div>");
                         	    
        
                         	    
                         	   var bar = google.visualization.arrayToDataTable([
                                   ['결혼여부', 'count', { role: 'style' } ],
                                   ['미혼', data[0], 'color: #75CC77 '],
                                   ['기혼', data[1], 'color: #8646B4']
                                   
                                   ]);
                            var view = new google.visualization.DataView(bar);
                           
                          var options = {
                                title: "혼인여부 별 패널 통계",
                                width: 600,	
                                height: 400,
                                bar: {groupWidth: "80%"},
                                legend: { position: "none" },
                                backgroundColor : "#EAF9E7"
                              };
                              var chart = new google.visualization.BarChart(document.getElementById("barchart<%=i%>"));
                              chart.draw(view, options);
                              
                                
                             }

                             
                         });
                    	 		
                	 }else if($("input:radio[name=PanelData<%=i%>]:checked").val()=='livingwith'){
                		 $.ajax({
                    		 url:"<%=request.getContextPath()%>/livingwith.ch",
                             data : {value : value, qnum : qnum},
                             type:"get",
                             success : function barchart(data){
                            	  
                         	    $("#bar_area<%=i%>").append("<div id ='barchart<%=i%>'><div>");
                         	    
        
                         	    
                         	   var bar = google.visualization.arrayToDataTable([
                                   ['동거가족', 'count', { role: 'style' } ],
                                   ['0명', data[0], 'color: #F35E5E '],
                                   ['1명', data[1], 'color: #EE9246'],
                                   ['2명', data[2], 'color: #F2D631'],
                                   ['3명', data[3], 'color: #73BE5D'],
                                   ['4명', data[4], 'color: #489BDA'],
                                   ['5명', data[5], 'color: #584DDC'],
                                   ['6명 이상', data[6], 'color: #7038B0']
                                   ]);
                            var view = new google.visualization.DataView(bar);
                           
                          var options = {
                                title: "동거가족 별 패널 통계",
                                width: 600,	
                                height: 400,
                                bar: {groupWidth: "80%"},
                                legend: { position: "none" },
                                backgroundColor : "#EAF9E7"
                              };
                              var chart = new google.visualization.BarChart(document.getElementById("barchart<%=i%>"));
                              chart.draw(view, options);
                              
                                
                             }

                             
                         });
                	 }else if($("input:radio[name=PanelData<%=i%>]:checked").val()=='army'){
                		 $.ajax({
                    		 url:"<%=request.getContextPath()%>/army.ch",
                             data : {value : value, qnum : qnum},
                             type:"get",
                             success : function barchart(data){
                            	  
                         	    $("#bar_area<%=i%>").append("<div id ='barchart<%=i%>'><div>");
                         	    
        
                         	    
                         	   var bar = google.visualization.arrayToDataTable([
                                   ['병역여부', 'count', { role: 'style' } ],
                                   ['미필', data[0], 'color: #EBD75F'],
                                   ['군필', data[1], 'color: #237D4D'],
                                   ['면제', data[2], 'color: #BC8FC7']
                                   ]);
                            var view = new google.visualization.DataView(bar);
                           
                          var options = {
                                title: "병역여부 별 패널 통계",
                                width: 600,	
                                height: 400,
                                bar: {groupWidth: "80%"},
                                legend: { position: "none" },
                                backgroundColor : "#EAF9E7"
                              };
                              var chart = new google.visualization.BarChart(document.getElementById("barchart<%=i%>"));
                              chart.draw(view, options);
                              
                                
                             }

                             
                         });
                	 }else if($("input:radio[name=PanelData<%=i%>]:checked").val()=='gender'){
                		 $.ajax({
                             url:"<%=request.getContextPath()%>/gender.ch",
                             data: {value : value, qnum : qnum},
                             type:"get",
                             success : function barchart(data){
                    
                               $("#bar_area<%=i%>").append("<div id ='barchart<%=i%>'><div>");
                          
                               
                               var bar = google.visualization.arrayToDataTable([
                                    ['성별', 'count', { role: 'style' } ],
                                    ['남자', data[0], 'color: #5E72E1 '],
                                    ['여자', data[1], 'color: #EB6E85'],
                                   
                                  ]);
                             var view = new google.visualization.DataView(bar);
                            
                           var options = {
                                 title: "성별 별 패널 통계",
                                 width: 600,	
                                 height: 400,
                                 bar: {groupWidth: "80%"},
                                 legend: { position: "none" },
                                 backgroundColor : "#EAF9E7"
                               };
                               var chart = new google.visualization.BarChart(document.getElementById("barchart<%=i%>"));
                               chart.draw(view, options);
                               
                               
                             }
                               
                             
                             
                          });
                    	 
                	 }
                	 
                	 
                	 		
                 });
                 
   
                 
                 

                 
   
          
                 


                 
          
                 
                 
                 
                 
                 
                 
                 
                 
                 

             } 
          

  
         }
          
  <%}%>
  </script>   
    </body>
</html>