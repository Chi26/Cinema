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
		<h2>修改活動</h2>
		<form:form action="EventUpdate.controller" method="post"
			modelAttribute="e1" enctype="multipart/form-data">
			<div class="row">
				<div class="col-25">
					<form:label path="event_No">活動編號:</form:label>
				</div>
				<div class="col-75">
					<form:input path="event_No" />
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<form:label path="event_Name">活動名稱:</form:label>
				</div>
				<div class="col-75">
					<form:input path="event_Name" />
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label path="begin_Date">開始日期:</form:label>
				</div>
				<div class="col-75">
					<form:input type="date" path="begin_Date" />
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<form:label path="end_Date">結束日期:</form:label>
				</div>
				<div class="col-75">
					<form:input type="date" path="end_Date" />
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label path="location">地點:</form:label>
				</div>
				<div class="col-75">
					<form:input path="location" />
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label path="method">活動辦法:</form:label>
				</div>
				<div class="col-75">
					<form:input path="method" />
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label path="notice">注意事項:</form:label>
				</div>
				<div class="col-75">
					<form:input path="notice" />
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


			<br>

			<div class="row">
				<form:button value="Send" class="submit">送出修改</form:button>
			</div>
		</form:form>
	</div>



</body>
</html>