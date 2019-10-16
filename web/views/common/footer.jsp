<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- <style>

html {  
/* overflow: hidden; */  
/* overflow-y:scroll; */
}
html, body { width: 100%; height: 100%; margin: 0; padding: 0;
z-index:2;	/* 배치 순서 정하기 */
position: absolute;
}

		/* .footer {
			position:fixed;
			bottom: 0;
			left: 0;
			right: 0;
			height:100px;  
			color: white;
			background-color: #333333;
			text-align:center;
			color:red;
		} */
		  
   	.footer {
	    overflow: hidden;
	    position: absolute;
	    bottom: 0;
	    height: 100px;
	    width:100%; 
	    text-align: center;
	    margin-left:0px; 
	    margin-bottom:-1px;
	    background:#ccc;
    }

</style> -->




<style>
	* {
		box-sizing: border-box;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		}
		html {
		height: 100%;
		}
		body {
		margin: 0;
		height: 100%;
		}
        /* 푸터 */
        .footer {
        	text-align: center; 
			padding: 30px 50px;
			position: fixed;
		    /* position:absolute; */
		    bottom:0;
		    width:100%;
		    height:70px;   
		    background:#ccc;
        		}
        .footer li {position: relative; display: inline; padding: 0 7px 0 10px; white-space: nowrap;}
        .footer li:before {content: ''; width: 1px; height: 12px; background-color: #dbdbdb; position: absolute; left: 0; top: 2px;}
        .footer li:first-child:before {width: 0;}
        .footer address {padding-top: 15px;}
        
        #footer {border-top: 1px solid #dbdbdb;}
        
</style>

</head>
<body>

    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="footer">
                    <ul>
                        <li><a href="#">사이트 도움말</a></li>
                        <li><a href="#">사이트 이용약관</a></li>
                        <li><a href="#">사이트 운영원칙</a></li>
                        <li><a href="#"><strong>개인정보취급방침</strong></a></li>
                        <li><a href="#">책임의 한계와 법적고지</a></li>
                        <li><a href="#">게시중단요청서비스</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                    <address>
                        Copyright &copy;
                        <a href="http://webstoryboy.co.kr"><strong>webstoryboy</strong></a>
                        All Rights Reserved.
                    </address>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>