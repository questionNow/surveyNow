<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
   <style>
        /* reset */
        /* 여백 초기화 */
        body,div,ul,li,dl,dd,dt,ol,h1,h2,h3,h4,h5,h6,input,fieldset,legend,p,select,table,th,td,tr,textarea,button,form,figure,figcaption{margin:0;padding:0;}

        /* a 링크 초기화 */
        a {color: #222; text-decoration: none;}
        a:hover {color: #2698cb;}

        /* 폰트 초기화 */
        body, input, textarea, select, button, table {font-family:  'Nanum Gothic', AppleSDGothicNeo-Regular,'Malgun Gothic','맑은 고딕',dotum,'돋움',sans-serif; color: #222; font-size: 13px; line-height: 1.6;}
        
        /* 폰트 스타일 초기화 */
        em,address {font-style: normal;}

        /* 블릿기호 초기화 */
        ul,li,ol {list-style: none;}

        /* 제목 태그 초기화 */
        h1,h2,h3,h4,h5,h6 {font-size: 13px; font-weight: normal;}
        
        /* 버튼 초기화 */
        button {border: 0;}
        
        /* 반응형 */
        img {width: 100%;}
        
        /* clearfix */
        .clearfix{*zoom:1;}
        .clearfix:before, .clearfix:after {display: block; content: '';line-height: 0;}
        .clearfix:after {clear: both;}

        /* IR 효과 */
        .ir_pm {display:block; overflow:hidden; font-size:0; line-height:0; text-indent:-9999px;} /* 의미있는 이미지의 대체 텍스트를 제공하는 경우(Phark Method) */
        .ir_wa {display:block; overflow:hidden; position:relative; z-index:-1; width:100%; height: 100%;} /* 의미있는 이미지의 대체 텍스트로 이미지가 없어도 대체 텍스트를 보여주고자 할 때(WA IR) */
        .ir_su {overflow: hidden; position:absolute; width:0; height:0; line-height:0; text-indent:-9999px;} /* 대체 텍스트가 아닌 접근성을 위한 숨김 텍스트를 제공할 때 */

        #contents .container {
        border-right: 1px solid #dbdbdb; 
        border-left: 1px solid #dbdbdb; 
        z-index:1;}
        #cont_center {
            overflow: hidden; 
            margin-right: 250px; 
            min-height: 1300px; 
            border-right: 1px solid #dbdbdb;
            border-left: 1px solid #dbdbdb;
        }
        #cont_right {
        position: absolute; 
        right: 0; 
        top: 0px; 
        width: 250px;
        }
        /* 컨테이너 */
        .container {
        position: relative; 
        width: 1200px; 
        margin: 0 auto; }
        /* 컨텐츠 영역 */
        .column {
        padding: 15px; 
        border-bottom: 1px solid #dbdbdb;
        }
        .column .col_tit {
        font-size: 20px; 
        color: #F57839; 
        padding-bottom: 5px;
        }
        .column .col_desc {
            border-bottom: 1px dashed #dbdbdb; 
            padding-bottom: 15px; margin-bottom: 15px;  
            color: #878787;
            line-height: 18px;
            text-align : center;
            font-weight: bold;
        }
        .column.col9 {
        border-bottom: 0;
        } 
        /* 라이트 박스 */
        .square a {float: left; width: 19%; margin: 0.5%; position: relative; overflow: hidden;  }
        .square a img {width: 100%; display: block;}
        .square a em {background: rgba(0,0,0,0.77); color: #fff; width: 100%; text-align: center; position: absolute; left:0; bottom: -30px; opacity: 1; transition: all .3s ease;}
        .square a:hover em {bottom: 0; background: rgba(0,0,0,0.57); }
        .square a:nth-child(1):hover img {filter: blur(2px);}
        .square a:nth-child(2):hover img {filter: brightness(50%);}
        .square a:nth-child(3):hover img {filter: contrast(10%);}
        .square a:nth-child(4):hover img {filter: grayscale(100%);}
        .square a:nth-child(5):hover img {filter: hue-rotate(120deg);}
        .square a:nth-child(6):hover img {filter: invert(100%);}
        .square a:nth-child(7):hover img {filter: opacity(10%);}
        .square a:nth-child(8):hover img {filter: saturate(10%);}
        .square a:nth-child(9):hover img {filter: sepia(120%);}
        .square a:nth-child(10):hover img {filter: sepia(120%) hue-rotate(120deg);}
        /* 사이드 이펙트2 */
        .side2 {
        position: relative; 
        display: block; 
        perspective: 600px;
        }
        .side2 .front {
            transform-style: preserve-3d;
            transform: rotateY(0deg);
            transition: all 0.5s ease-in-out;
            backface-visibility: hidden;
        }
        .side2 .back {
            position: absolute; 
            top: 0; 
            left: 0; 
            width: 100%; height: 100%; z-index: -1;
            transform-style: preserve-3d;
            transform: rotateY(-180deg);
            transition: all 0.5s ease-in-out;
            backface-visibility: hidden;
        }
        .side2 .front figcaption {
            position: absolute; 
            left: 50%; 
            transform: translate(-50%,-50%) translateZ(100px);
            display: block;
            text-align: bottom;
        }
        .side2 .back figcaption {
            position: absolute; left: 50%; top: 50%;
            transform: translate(-50%,-50%) translateZ(100px);
            color: #fff;
            font-size: 20px;
            display: block;
            text-align: center;
        }
        .side2 figcaption {width: 60%;}
        .side2 figcaption h3 {color: #fff; font-size: 20px; font-family: 'Abel', sans-serif; font-weight: bold; background: rgba(0,0,0,0.4); padding: 3px 10px;}
        .side2 figcaption p {font-size: 14px;}
        .side2:hover .front {transform: rotateY(180deg);}
        .side2:hover .back {transform: rotateY(0deg); z-index: 1;}
</style>
</head>
<%@ include file="../common/menubar2.jsp" %>
<body>
		<main>
            <div class="container">
                <section id="cont_center">
                    <article class="column col5">
                        <h4 class="col_tit">이미지 를 넣어야함</h4>
						<p class="col_desc">여기에 이미지 클릭하면 해당 설문으로 가면 좋을거 같은데 ?</p>
						<!-- lightbox -->
						<div class="lightbox square clearfix">
							<a href="image/light01_s.jpg"><img src="image/light01_s.jpg" alt="이미지"><em>blur</em></a>
							<a href="image/light02_s.jpg"><img src="image/light02.jpg" alt="이미지"><em>brightness</em></a>
							<a href="image/light03_s.jpg"><img src="image/light03.jpg" alt="이미지"><em>contrast</em></a>
							<a href="image/light04_s.jpg"><img src="image/light04.jpg" alt="이미지"><em>grayscale</em></a>
							<a href="image/light05_s.jpg"><img src="image/light05.jpg" alt="이미지"><em>hue-rotate</em></a>
							<a href="image/light06_s.jpg"><img src="image/light06.jpg" alt="이미지"><em>invert</em></a>
							<a href="image/light07_s.jpg"><img src="image/light07.jpg" alt="이미지"><em>opacity</em></a>
							<a href="image/light08_s.jpg"><img src="image/light08.jpg" alt="이미지"><em>saturate</em></a>
							<a href="image/light09_s.jpg"><img src="image/light09.jpg" alt="이미지"><em>sepia</em></a>
							<a href="image/light10_s.jpg"><img src="image/light10.jpg" alt="이미지"><em>Mix</em></a>
						</div>
					
                    </article>
           
                   <!-- 동영상은 나중에 필요하면 쓰기 일단 보류  
                   <article class="column col6">
						<h4 class="col_tit">Video</h4>
						<p class="col_desc">필요 할라나 모르겠지만????</p>	
						<div class="video">
							<iframe src="https://www.youtube.com/embed/tHy498wdPaA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</div>
					</article> 
					-->
				
                </section>
               
                <section id="cont_right" >
                    <article class="column col8">
                        <h4 class="col_tit" style = "color : #F57839">우와~~ 설문 해보오오까 </h4>
						<p class="col_desc"> 마우스 올리면 신기방기 </p>
						<!-- side2 -->
						<div class="side2">
                            <figure class="front">
                                <img src="image/hoversuimg1.jpg" alt="이미지2">
                                <figcaption>
                                    <h3>Hover Effect</h3>
                                </figcaption>
                            </figure >
                            <figure class="back">
                                <img src="image/semiLogo.png" alt="이미지2">
                                <figcaption>
                                    <h3>Hover Effect</h3>
                                </figcaption>
                            </figure>
                        </div>
                        <!-- side2//-->
                    </article>
                    <!-- //col8 -->
                    
                    <article class="column col9">
                    <p class="col_desc"> S반 여신 </p>
						<div class="side2">
                            <figure class="front">
                                <img src="image/PNH.jpg" alt="이미지3" style="-webkit-transform: rotate(90deg)">
                            </figure>
                            <figure class="back">
                                <img src="image/KHJ.jpg" alt="이미지3" style="-webkit-transform: rotate(90deg); margin-top : 30px; ">
                            </figure>
                        </div>
                    </article>
                    <!-- //col9 -->
                </section>
                <!-- //cont_right -->
            </div>
        <!-- </section> --> 	
        <!-- //contents -->
    </main>
</body>
</html>