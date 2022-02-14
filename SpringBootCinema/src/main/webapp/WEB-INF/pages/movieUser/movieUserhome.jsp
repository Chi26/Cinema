<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Movie User Home</title>



<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">

    var indexPage = 1;

    

    $(document).ready(function(){

    	loadPage(indexPage);

        search();

    });

    

	function change(page){

		indexPage = page;

		loadPage(indexPage);

	}

    

    function loadPage(indexPage){

    	$.ajax({

    		type:'post',

    		url:'/movie/queryallbypage/' + indexPage,

    		dataType:'JSON',

    		contentType:'application/json',

    		success: function(data){

    			$("#showmovie").empty("");

    			var show = $('#showmovie');

    				$.each(data, function(i,n){

    				  var tr =  "   <div class='col'> <figure>"+

    				  "<a class='list-group-item list-group-item-action list-group-item-secondary' href='/movie/singleMovie.controller?id=" + n.movie_No+ "'>"  +" <img src='/upload/"+n.filename+"' >"+

    				           "<br><h4>" + n.movie_Name + "</h4>"+"</a>" + 

    				           "<time>" + n.movie_Date + "<time> </div>";

    				       show.append(tr);

    				});

    				

    		}

    	});

    	

    

    }

    

    function search(){

    	$("#search").keyup(function(){

    		$.ajax({

    			type:'POST',

    			url:'moviesearch.controller',

    			data:'keyword=' + $(this).val(),

    			success: function(data){

    				console.log(data);

    				

    				var result = "";

    				$.each(data, function(i,n){

    					result = result + '<div id="mname" onclick="list(' + "'" + n.movie_Name + "'" + 

    							 ')">' + n.movie_Name + '</div>';

    				});

    				

    				console.log('result:' + result);

    				$("#info-lists").show();

    				$("#info-lists").html(result);

    			}

    		});

    	});

    };

    function list(value){

    	

    	var url = 'singleNameMovie.controller?name='+value;

    	$(location).attr('href',url);

    	$("#info-lists").hide();

    }

    

  

</script>

</head>

<body>

	<%@include file="../Header.jsp"%>

	<br>
	<br>

	<div class="container">

		<div class="row" id="showmovie"></div>

		<nav aria-label="Page navigation example">

			<ul class="pagination  justify-content-center">
				<li class="page-item"><button class="page-link" id="myPage" value="${1}"
							onclick="change(${1})"> <span aria-hidden="true">&laquo;</span>
				</button></li>

				<c:forEach var="i" begin="1" end="${totalPages}" step="1">
					<li class="page-item">
						<button class="page-link" id="myPage" value="${i}"
							onclick="change(${i})">${i}</button>
					</li>
				</c:forEach>
				<li class="page-item"><button class="page-link" id="myPage" value="${2}"
							onclick="change(${2})"> <span aria-hidden="true">&raquo;</span>
				</button></li>
			</ul>

		</nav>

	</div>
<%@include file="../footer.jsp"%>
</body>

</html>