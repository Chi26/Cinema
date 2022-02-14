<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢食物訂單</title>
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
		<h2>查詢食物訂單</h2>
		<form action="readFoodOrders" method="post" >
			<div class="row">
				<div class="col-25">
					<label  for="maxid">Max_id:</label>
				</div>
				<div class="col-75">
					<input  type="text" id="maxid" name="maxid" placeholder=""/>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label  for="minid">Min_id:</label>
				</div>
				<div class="col-75">
					<input  type="text" id="minid" name="minid" placeholder=""/>
				</div>
			</div>
			
			<br>
			<div class="row">
				<button type= "submit"  name ="read" value="查詢訂單">查詢訂單 </button> 
			</div>
		</form>
	</div>

</body>
</html>