<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增食物訂單</title>
<style>
body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

.topnav {
	overflow: hidden;
	background-color: #333;
}

.topnav a {
	float: left;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	width: 900px;
}

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.col-75 {
	float: left;
	width: 75%;
	margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}
</style>
</head>
<body>

	<div style="padding-left: 16px">
		<h1>食物訂單管理系統</h1>

	</div>
	<div class="topnav">
		<a href="http://localhost:8080/foodOrder/foodordercreate">新增食物訂單</a> <a
			href="http://localhost:8080/foodOrder/foodorderupdate">修改食物訂單</a> <a
			href="http://localhost:8080/foodOrder/foodorderdelete">刪除食物訂單</a> <a
			href="http://localhost:8080/foodOrder/foodorderread">查詢食物訂單</a>
	</div>

	<div class="container">
		<h2>新增食物訂單</h2>
		<form:form action="createFoodOrders" method="post" modelAttribute="FoodOrder">
			<div class="row">
				<div class="col-25">
					<form:label  path="account" for="Account">帳戶名(Account):</form:label>
				</div>
				<div class="col-75">
					<form:input path="account" type="text" id="Account" name="account" placeholder=""/>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label  path="movie" for="Movie">電影名稱(Movie):</form:label>
				</div>
				<div class="col-75">
					<form:input path="movie" type="text" id="Movie" name="movie" placeholder=""/>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label  path="seat" for="Seat">座位(Seat):</form:label>
				</div>
				<div class="col-75">
					<form:input path="seat" type="text" id="Seat" name="seat" placeholder=""/>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label  path ="date" for="Date">日期(Date)</form:label>
				</div>
				<div class="col-75">
					<form:input  path ="date" type="date" id="Date" name="date"/>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label  path="showing" for="Showing">場次(Showing):</form:label>
				</div>
				<div class="col-75">
					<form:input path="showing" type="text" id="Showing" name="showing" placeholder=""/>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label  path="food_Name" for="food_Name">食物名稱(Food_name):</form:label>
				</div>
				<div class="col-75">
					<form:input path="food_Name" type="text" id="food_Name" name="food_name" placeholder=""/>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label  path="unit_Price" for="Unit_price">單位價格(Unit_price):</form:label>
				</div>
				<div class="col-75">
					<form:input path="unit_Price" type="text" id="Unit_price" name="unit_price" placeholder=""/>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label  path="number" for="Number">數量(Number):</form:label>
				</div>
				<div class="col-75">
					<form:input path="number" type="text" id="Number" name="number" placeholder=""/>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<form:label  path="phone" for="Phone">電話(Phone):</form:label>
				</div>
				<div class="col-75">
					<form:input path="phone" type="text" id="Phone" name="phone" placeholder=""/>
				</div>
			</div>
			
			
			<br>
			<div class="row">
				<form:button value="Send">新增食物訂單</form:button>
			</div>
		</form:form>
	</div>

</body>
</html>