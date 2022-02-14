<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Movie</title>
<link rel="stylesheet" href="/css/create.css">

</head>

<body>
	<div class="container">
		<h2>修改電影</h2>
		<form:form action="MovieUpdate.controller" method="post"
			modelAttribute="m1" enctype="multipart/form-data" >
			<div class="row">
				<div class="col-25">
					<form:label path="movie_No">電影編號:</form:label>
				</div>
				<div class="col-75">
					<form:input path="movie_No" />
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<form:label path="movie_Name">電影名稱:</form:label>
				</div>
				<div class="col-75">
					<form:input path="movie_Name" />
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label path="movie_Date">電影上映日期:</form:label>
				</div>
				<div class="col-75">
					<form:input type="date" path="movie_Date" />
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<form:label path="movie_Length">片長:</form:label>
				</div>
				<div class="col-75">
					<form:input path="movie_Length" />
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label path="type">類別:</form:label>
				</div>
				<div class="col-75">
					<form:input path="type" />
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label path="grading">級別:</form:label>
				</div>
				<div class="col-75">
					<form:input path="grading" />
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label path="releases">上映狀況:</form:label>
				</div>
				<div class="col-75">
					<form:input path="releases" />
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label path="director">導演:</form:label>
				</div>
				<div class="col-75">
					<form:input path="director" />
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<form:label path="actor">演員:</form:label>
				</div>
				<div class="col-75">
					<form:input path="actor" />
				</div>
			</div>
				<div class="row">
				<div class="col-25">
					<form:label path="vedio_url">Vedio URL:</form:label>
				</div>
				<div class="col-75">
					<form:input path="vedio_url" />
				</div>
			</div>

		<div class="row">
				<div class="col-25">
					<form:label path="filename"></form:label>
				</div>
				<div class="col-75">
					<form:input type="hidden" path="filename" />
				</div>
			</div>


			<div class="row">
				<div class="col-25">
					<form:label path="picture"></form:label>
				</div>
				<div class="col-75">
					<form:input type="hidden" path="picture" />
				</div>
			</div> 
			

		<div class="row">
				<div class="col-25">
					<form:label path=""></form:label>
				</div>
				<div class="col-75">
					<form:input type="file" name="files" path="" />
				</div>
			</div>


			<div class="row">
				<div class="col-25">
					<form:label path="intro">簡介:</form:label>
				</div>
				<div class="col-75">
					<form:input path="intro" />
				</div>
			</div>

			<br>

			<div class="row">
				<form:button  value="Send" class="submit">送出修改</form:button>
			</div>
		</form:form>
	</div>



</body>
</html>