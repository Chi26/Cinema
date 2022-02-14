<%@page import="tw.cinema.model.FoodOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="tw.cinema.model.FoodOrder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>食物訂單管理系統</title>
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
	margin-left:100px;
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
		<h1>食物訂單管理系統</h1>

	</div>
	<div class="topnav">
		<a href="http://localhost:8080/foodOrder/foodordercreate">新增食物訂單</a> <a
			href="http://localhost:8080/foodOrder/foodorderupdate">修改食物訂單</a> <a
			href="http://localhost:8080/foodOrder/foodorderdelete">刪除食物訂單</a> <a
			href="http://localhost:8080/foodOrder/foodorderread">查詢食物訂單</a>
	</div>

	<%
	FoodOrder od = (FoodOrder) session.getAttribute("create_Info");
	out.write("<br>");
	out.write("訂單新增成功，新增資訊如下");
	out.write("<br>");
	out.write("<br>");
	out.write("<table id='action'></td><td>帳戶名(Account)</td><td>電影名稱(Movie)</td><td>座位(Seat)</td><td>日期(date)</td>\r\n"
			+ "<td>場次(Showing)</td>\r\n" +"<td>食物名稱(FoodName)</td>\r\n" +"<td>單位價格(UnitPrice)</td>\r\n" + " <td>張數(Number)</td>\r\n"
			+ "<td>連絡電話(Tel)</td>\r\n" + "<td>訂單編號(OrderNo)</td>\r\n" + "</tr>");

	out.write("</td><td>" + od.getAccount() + "</td><td>" + od.getMovie() + "</td><td>" + od.getSeat() + "</td><td>"
			+ od.getDate() + "</td><td>" + od.getShowing() +"</td><td>" +od.getFood_Name()+"</td><td>" + od.getUnit_Price() + "</td><td>" + od.getNumber()
			+ "</td><td>" + od.getPhone() + "</td><td>" + od.getFoodorder_No() + "</td>");

	out.write("</table>");
	out.write("<br>");
	%>

</body>
</html>