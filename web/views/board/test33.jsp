<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://fonts.googleapis.com/earlyaccess/jejuhallasan.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css" rel="stylesheet">

<style>
@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
   /* #noticeDetailTable{
       border-top: 1px solid black;
      border-bottom: 1px solid black;
       border-collapse: collapse;
       text-align : center;
       width : 700px;
     } */
     

   
   #noticeDetailTable2{
      border-top: 2px solid black;
       border-collapse: collapse;
      width : 700px;
   }
   input[type = button]{
      cursor: pointer;
      width : 100px;
      border-radius : 15px;
         font-size : 17px;
   }
   #buttonChoice{
      padding-left : 140px;
   }
   #noticeDetailTable3{
      border-top: 2px solid black;
       border-collapse: collapse;
      width : 700px;
   }
   
</style>
</head>
<body>

<!-- <div id = notice1>
<table id = noticeDetailTable>
   
   <tr>   
      <td colspan = 6 id = noticeDetail style = "background : #6AA2F7; color : white; border-bottom : 2px solid black;"> 게시판 상세보기
   </tr>
   <tr>
      <td width = 100px height = 50px style = "border-bottom : 1px solid black"> 카테고리 </td>
      <td width = 130px style = "border-bottom : 1px solid black; border-right : 1px solid black;"> 아무거나 </td>
      <td width = 50px style = "border-bottom : 1px solid black;"> 제목 </td>
      <td colspan = 3 style = "border-bottom : 1px solid black;"> 제목쓰기 </td>
   </tr>
   <tr>
      <td height = 40px style = "border-bottom : 1px solid black"> 작성자 </td>
      <td style = "border-right : 1px solid black; border-bottom : 1px solid black;"> ???? </td>
      <td width = 50px style = "border-bottom : 1px solid black"> 조회수 </td>
      <td style = "border-right : 1px solid black; border-bottom : 1px solid black"> count </td>
      <td width = 50px style = "border-bottom : 1px solid black"> 작성일 </td>
      <td style = "border-bottom : 1px solid black"> sysdate </td>
   </tr>
   <tr>
      <td colspan = 6 style = "text-align : left" height = 35px> 내용 </td>
      
   </tr>   
   </table>
   </div>
    -->
   <br><br><br><br><br><br><br>
   
   
   
   <div id = notice2>
   <table id = noticeDetailTable2>
   <tr>
      <td colspan = 4 style = "text-align : center; height : 63px; font-size : 1.8em; font-family: 'Hanna', sans-serif; letter-spacing: 8px;"> 제목을 여기다가 </td>
   </tr>
    <tr>
        <td style = "width: 104px; height: 44px; font-weight: bold; border-bottom: 3px solid #6BD16C;"> CATEGORY </td> 
        <td style = "color : #3E4A3E; border-bottom: 3px solid #6BD16C;"> 아무거나 </td>
        <td style = "width: 72px; font-weight: bold; border-bottom: 3px solid #6BD16C;"> DATE </td>
        <td style = "width: 80px; color : #3E4A3E; border-bottom: 3px solid #6BD16C;"> 작성일 </td>
    </tr>  
    <tr>
       <td colspan = 4 style = "text-align : right; font-size : 1.1em;"> 작성자 관리자, 조회수 count</td>
    </tr>
    <tr>
       <td colspan = 4 style = "height : 100px; text-align : left; padding-bottom : 30px; font-size : 1.3em; border-bottom: 2px solid darkgray;"> 내용 </td>
    </tr> 
    <tr>
       <td style = "font-size : 1.3em;"> 댓글 </td>
      <td colspan = 2>
      <input type = text style = "width : 470px; height : 100px; font-size : 1.4em;">
      </td>
      <td>
      <input type = button value = 댓글등록 style = "height : 100px;">
      </td> 
    </tr>
   
   
    </table>
    </div>
    <br><br><br>
    <div id = buttonChoice>
            <input type = button value = 수정하기>
            <input type = button value = 삭제하기>
            <input type = button value = 목록보기>
            <input type = button value = 새글쓰기>     
    </div>
    </div>
    
    
    
     <br><br><br><br><br><br><br><br>
   <div id = notice3>
   <table id = noticeDetailTable3>
   <tr>
      <td colspan = 4 style = "text-align : center; height : 63px; font-size : 1.8em; font-family: 'Hanna', sans-serif; letter-spacing: 8px;"> 제목을 여기다가 </td>
   </tr>
    <tr>
        <td style = "width: 104px; height: 44px; font-weight: bold; border-bottom: 3px solid #6BD16C;"> CATEGORY </td> 
        <td style = "color : #3E4A3E; border-bottom: 3px solid #6BD16C;"> 아무거나 </td>
        <td style = "width: 72px; font-weight: bold; border-bottom: 3px solid #6BD16C;"> DATE </td>
        <td style = "width: 80px; color : #3E4A3E; border-bottom: 3px solid #6BD16C;"> 작성일 </td>
    </tr>  
    <tr>
       <td colspan = 4 style = "text-align : right; font-size : 1.1em;"> 작성자 관리자, 조회수 count</td>
    </tr>
    <tr>
       <td colspan = 4 style = "height : 100px; text-align : left; padding-bottom : 30px; font-size : 1.3em; border-bottom: 2px solid darkgray;"> 내용 </td>
    </tr> 
    <tr>
       <td colspan = 4 style = "text-align : left; font-size : 1.3em;"> 댓글보기 </td>
    </tr>
    <tr>
       <td> 관리자 : </td>
       <td clspan = 3 style = "padding-left : 100px;"> 어찌고저찌고 댓글쓴게 여기로 딱 </td>
    </tr>
    </table>
    </div>
     <br><br><br>
    <div id = buttonChoice>
            <input type = button value = 수정하기>
            <input type = button value = 삭제하기>
            <input type = button value = 목록보기>
            <input type = button value = 새글쓰기>     
    </div>
    </div>
</body>
</html>