<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>電影介紹</title>
<link rel="stylesheet" href="/css/oneMovie.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var name = $("#name").val();
		load(name);
	});
	function load(name) {
		$.ajax({
					type : 'post',
					url : '/movie/onemoviename.controller?name=' + name,
					dataType : 'JSON',
					contentType : 'application/json',
					success : function(data) {
						var json = JSON.stringify(data, null, 4);
						console.log('success:' + json);
						var jsonArray = JSON.parse(json);
						$('#movieMain').empty("");

						var show = $('#movieMain');

						var tr = "<figure>"
								+ " <img src='/upload/"+jsonArray.filename+"'>"
								+ "</figure>"

								+ "<section class='movieInfo'>"
								+ "<div class='titleArea'>" 
								+ "<h2>"
								+ jsonArray.movie_Name
								+ "</h2>"
								+ "<h3>"
								+ jsonArray.releases
								+ "</h3>"
								+ "</div>"
								+ "<div class='infoArea'>"
								+ "<table>"
								+ "<tr><td>上映日期</td>"
								+ "<td>"
								+ "<time>"
								+ jsonArray.movie_Date
								+ "</time>"
								+ "</td></tr>"
								+ "<tr><td>片長</td>"
								+ "<td>"
								+ jsonArray.movie_Length
								+ "</td></tr>"
								+ "<tr><td>類別</td>"
								+ "<td>"
								+ jsonArray.type
								+ "</td></tr>"
								+ "<tr><td>級別</td>"
								+ "<td>"
								+ jsonArray.grading
								+ "</td></tr>"
								+ "<tr><td>導演</td>"
								+ "<td>"
								+ jsonArray.director
								+ "</td></tr>"
								+ "<tr><td>演員</td>"
								+ "<td>"
								+ jsonArray.actor
								+ "</td></tr>"
								+ "</div></table></section>"
								+ "<div id='info' class='movieStory'><article class='article'>"
								+ "<h2>劇情簡介</h2>"
								+ "<div class='bbsArticle'>"
								+ "<p>"
								+ jsonArray.intro
								+ "</p>"
								+ "</div>"
								+ "</article>" + "</div>"
								+"<iframe width='760' height='450' src='"
								+jsonArray.vedio_url
								+"'>"
								+"</iframe>";
						show.append(tr);

					}
				});
	}
</script>
</head>
<body>
	
	<section class="movieDetail">
	
	<div class="mtitle">電影介紹</div>
		<article class="article">
		
			<div id="movieMain"></div>
			
		</article>

	</section>
	<input id="name" type="hidden" value="${name}">



</body>
</html>