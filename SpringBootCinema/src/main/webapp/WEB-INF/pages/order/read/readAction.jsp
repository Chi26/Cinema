<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="tw.cinema.model.Order"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單管理系統</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"><link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>


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

<div class="container">
	<div>
		<h1>訂單管理系統</h1>

	</div>
	<div class="topnav">
		<a href="http://localhost:8080/order/ordercreate">新增訂單</a> <a
			href="http://localhost:8080/order/orderupdate">修改訂單</a> <a
			href="http://localhost:8080/order/orderdelete">刪除訂單</a> <a
			href="http://localhost:8080/order/orderread">查詢訂單</a>
	</div>
	
	<form action="updateordelete" method="post">
	<%
	List<Order> select_Info = (List<Order>) session.getAttribute("select_Info");
	out.write("<br>");
	out.write("<br>");
	out.write("<br>");
	out.write(
			"<table id='action' class='table table-striped align-middle'><thead><tr><th scope='col' class='fs-5'>順序</th><th scope='col' class='fs-5'>帳戶名(Account)</th><th scope='col' class='fs-5'>電影名稱(Movie)</th><th scope='col' class='fs-5'>座位(Seat)</th><th scope='col' class='fs-5'>日期(date)</th>\r\n"
			+ "<th scope='col' class='fs-5'>場次(Showing)</th>\r\n" + "<th scope='col' class='fs-5'>單位價格(UnitPrice)</th>\r\n" + " <th scope='col' class='fs-5'>張數(Number)</th>\r\n"
			+ "<th scope='col' class='fs-5'>連絡電話(Tel)</th>\r\n" + "<th scope='col' class='fs-5'>訂單編號(OrderNo)</th>\r\n" +"</tr>"+"</thead>");
	int count = 0;
	for (Order od : select_Info) {
		count++;
		out.write("<tbody><tr><td class='fs-6'>" + count + "</td><td class='fs-6'>" + od.getAccount() + "</td><td class='fs-6'>" + od.getMovie() + "</td><td class='fs-6'>"
		+ od.getSeat() + "</td><td class='fs-6'>" + od.getDate() + "</td><td class='fs-6'>" + od.getShowing().substring(0, 8) + "</td><td class='fs-6'>"
		+ od.getUnit_Price() + "</td><td class='fs-6'>" + od.getNumber() + "</td><td class='fs-6'>" + od.getPhone() + "</td><td class='fs-6'>"
		+ od.getOrder_No() + "</td>");

	String updateButton ="<td><button type= 'submit' class='btn btn-success' name ='update' value='"+od.getOrder_No()+"'>Update </button></td>"; 
	String deleteButton ="<td><button type= 'submit'  class='btn btn-success' name ='delete' value='"+od.getOrder_No()+"'>Delete </button></td>"+"</tr></tbody>";  
	
	out.write(updateButton);
	out.write(deleteButton);
	
	}
	out.write("</table>");
	out.write("<br>");
	%>
	</form>
	</div>
</body>
</html>