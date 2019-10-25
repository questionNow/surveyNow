<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import ="java.util.*, survey.model.vo.*"%>
	

<html>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <head>
  
  </head>
  <body>
  	<div id = "abc">
  	
  	
  	</div>
  	
  	
  	
  	<script type="text/javascript">
  		$("#abc").append("<div>div1</div>");
  		
  		
  		for(var i = 0 ; i<10 ; i++){
  			function abc+i(){
  				alert(i);
  			}
  		}
  		$(function(){
  			abc(3);
  		})
  		
  	</script>
  	
  </body>
</html>