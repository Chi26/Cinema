<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查無此訂單</title>
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


</style>
</head>
<body>

<div style="padding-left: 16px">
		<h1>訂單管理系統</h1>

	</div>
	<div class="topnav">
	<a href="http://localhost:8080/order/ordercreate">新增訂單</a> <a
			href="http://localhost:8080/order/orderupdate">修改訂單</a> <a
			href="http://localhost:8080/order/orderdelete">刪除訂單</a> <a
			href="http://localhost:8080/order/orderread">查詢訂單</a>
	</div>
	<br>
	查無訂單!!
</body>
</html>