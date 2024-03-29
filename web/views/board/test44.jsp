<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
#container {
	width: 960px;
	margin: 0 auto;
	text-align: center;
}

.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
.tab li {
	float: left;
}
/* Style the links inside the list items */
.tab li a {
	display: inline-block;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
}

ul.tab li.current {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	border-bottom: none;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-weight:bold;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
	
		/* border: 1px solid #476600;
	border-bottom: none; */
}

.tabcontent.current {
	display: block;
}
</style>
</head>
<body>
	<input id="valTest">
	<div id="container">
		<ul class="tab">
			<li id="test1" class="current" data-tab="tab1"><a href="#">About</a></li>
			<li id="test2" data-tab="tab2"><a href="#">Portfolio</a></li>
			<li data-tab="tab3"><a href="#">Contact</a></li>
			<li data-tab="tab4"><a href="#">Travel</a></li>
		</ul>
		<div id="tab1" class="tabcontent current">
			<h3>About</h3>
			<p>Lorem Ipsum is simply dummy text of the printing and
				typesetting industry. Lorem Ipsum has been the industry's standard
				dummy text ever since the 1500s, when an unknown printer took a
				galley of type and scrambled it to make a type specimen book. It has
				survived not only five centuries, but also the leap into electronic
				typesetting, remaining essentially unchanged. It was popularised in
				the 1960s with the release of Letraset sheets containing Lorem Ipsum
				passages, and more recently with desktop publishing software like
				Aldus PageMaker including versions of Lorem Ipsum.</p>
		</div>

		<div id="tab2" class="tabcontent">
			<h3>Portfolio</h3>
			<p>Contrary to popular belief, Lorem Ipsum is not simply random
				text. It has roots in a piece of classical Latin literature from 45
				BC, making it over 2000 years old. Richard McClintock, a Latin
				professor at Hampden-Sydney College in Virginia, looked up one of
				the more obscure Latin words, consectetur, from a Lorem Ipsum
				passage, and going through the cites of the word in classical
				literature, discovered the undoubtable source. Lorem Ipsum comes
				from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum"
				(The Extremes of Good and Evil) by Cicero, written in 45 BC. This
				book is a treatise on the theory of ethics, very popular during the
				Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit
				amet..", comes from a line in section 1.10.32.</p>
		</div>

		<div id="tab3" class="tabcontent">
			<h3>Contact</h3>
			<p>It is a long established fact that a reader will be distracted
				by the readable content of a page when looking at its layout. The
				point of using Lorem Ipsum is that it has a more-or-less normal
				distribution of letters, as opposed to using 'Content here, content
				here', making it look like readable English. Many desktop publishing
				packages and web page editors now use Lorem Ipsum as their default
				model text, and a search for 'lorem ipsum' will uncover many web
				sites still in their infancy. Various versions have evolved over the
				years, sometimes by accident, sometimes on purpose (injected humour
				and the like).</p>
		</div>

		<div id="tab4" class="tabcontent">
			<h3>Travel</h3>
			<p>Lorem Ipsum is simply dummy text of the printing and
				typesetting industry. Lorem Ipsum has been the industry's standard
				dummy text ever since the 1500s, when an unknown printer took a
				galley of type and scrambled it to make a type specimen book. It has
				survived not only five centuries, but also the leap into electronic
				typesetting, remaining essentially unchanged. It was popularised in
				the 1960s with the release of Letraset sheets containing Lorem Ipsum
				passages, and more recently with desktop publishing software like
				Aldus PageMaker including versions of Lorem Ipsum.</p>
		</div>
	</div>
	<script>
		$(function() {
			$('ul.tab li').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('ul.tab li').removeClass('current');
				$('.tabcontent').removeClass('current');
				$(this).addClass('current');
				$('#' + activeTab).addClass('current');
			});
		});
		
		$(function() {
			$('#test1').click(function(){
				$('#valTest').val('E');
			});
			$('#test2').click(function(){
				$('#valTest').val('S');
			});
		});
	</script>
</body>
</html>