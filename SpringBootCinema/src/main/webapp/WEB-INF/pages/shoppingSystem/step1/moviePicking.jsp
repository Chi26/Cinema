<%@page import="tw.cinema.model.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Step1: 請選擇電影，日期和場次</title>
<style>



.formstyle {
	margin:50px 30% auto;
  
	
	border-radius: 15px;
	width: 640px;
	height:500px;
	background-color:LightGray;
	box-shadow: 0 0 40px rgba(8,7,16,0.6);
	font-weight:bold;
	
}

.divst {
	margin-top: 30px;
	margin-bottom: 30px;
	margin-left: 30px;
	margin-right:30px;

}
.shadow {
box-shadow: 15px 5px black;
}
.bar {
margin-top:10px;
margin-left:10px;
margin-right:10px;
}
.legendst1{
margin-left:20px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<%@include file="../../Header.jsp" %>


	<div class="formstyle">
	
	<legend><span class= 'legendst1'>Step1</span></legend>
	
	<div class="progress bar">
  <div class="progress-bar progress-bar-striped progress-bar-animated " role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" style="width: 33%"></div>
</div>
		<form action="shopping.step2" method="post">
		
			<div class="divst">

				<label><span>請選擇電影:</span></label> <br><br><select class="form-select" name="Movie" id="Movie">

					<%
					List<Movie> movieList = (List<Movie>) session.getAttribute("movieList");

					for (Movie mv : movieList) {
						String option = "<option value='" + mv.getMovie_Name() + "'>" + mv.getMovie_Name() + "</option>";
						out.println(option);
					}
					%>


					<!-- 						<option value="Movie1">電影1</option> -->
				</select>

			</div>

			<div class="divst">

				<label><span>請選擇日期:</span></label> <br><br> <input class="form-select" type="date" id="date"
					name="date" required="required">

			</div>

			<div class="divst">

				<label><span>請選擇場次:</span></label> <br><br> <select  class="form-select" name="Showing"
					id="Showing">
					<%
					for (int i = 10; i <= 22; i++) {

						String option = "<option value='" + i + ":00'>" + i + ":00</option>";

						out.println(option);
					}
					%>
					<!-- 						<option value="Show1">場次1</option> -->
					<!-- 						<option value="Show1">場次2</option> -->
				</select>

			</div>

			<div class="divst">
				<input type="submit" class="btn btn-info shadow" name="searchingSeats" value="查詢位子">
			</div>
		</form>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<%@include file="../../footer.jsp" %>
</body>
</html>