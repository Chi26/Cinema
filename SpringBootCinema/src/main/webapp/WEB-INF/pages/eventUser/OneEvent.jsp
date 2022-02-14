<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>電影介紹</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/OneEvent.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var id = $("#id").val();
		load(id);
	});
	function load(id) {
		$.ajax({
					type : 'post',
					url : '/event/oneEvent.controller?id=' + id,
					dataType : 'JSON',
					contentType : 'application/json',
					success : function(data) {
						var json = JSON.stringify(data, null, 4);
						console.log('success:' + json);
						var jsonArray = JSON.parse(json);
						$('#eventMain').empty("");

						var show = $('#eventMain');

						var tr = "<figure>"
								+ " <img src='/upload/"+jsonArray.filename+"'>"
								+ "</figure>"

								+ "<section class='eventInfo'>"
								
								+ "<h1>"
								+ jsonArray.event_Name
								+ "</h1>"
								+ "<ul><li>"
								+ "<p class='title'>開始日期:</p>"
							    + "<p>"+ "<time>"+ jsonArray.begin_Date+ "</time>"+ "</p>"
							    +"</li>"
							    +"<li>"
							    + "<p class='title'>結束日期:</p>"
							    + "<p>"+ "<time>"+ jsonArray.end_Date+ "</time>"+ "</p>"
							    +"</li>"
							    +"<li>"
							    + "<p class='title'>活動地點:</p>"
							    + "<p>"+jsonArray.location+ "</p>"
							    +"</li>"
							    +"<li>"
							    + "<p class='title'>活動辦法:</p>"
							    + "<p>"+jsonArray.method+ "</p>"
							    +"</li>"
							    +"<li>"
							    + "<p class='title'>注意事項:</p>"
							    + "<p>"+jsonArray.notice+ "</p>"
							    +"</li></div>"
								+ "</section>";
						show.append(tr);

					}
				});
	}
</script>
</head>
<body>
	<%@include file="../Header.jsp"%>
	<div class="container">
	
	
		<article class="article">
		
			<div id="eventMain" class="eventMain"></div>
			
		</article>

	</div>
	<input id="id" type="hidden" value="${id}">

<%@include file="../footer.jsp"%>

</body>
</html>