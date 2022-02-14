<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單資訊欄重複，新增失敗</title>
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

table {
	border: 3px cornflowerblue solid;
	border-radius: 15px;
	background-color: gray;
	border-collapse: collapse;
	text-align: center;
}

td {
	border: 3px cornflowerblue solid;
	border-collapse: collapse;
	padding: 10px;
	color: yellow;
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
您好，訂單欄位有資訊重複，故新增失敗!
</body>
</html>