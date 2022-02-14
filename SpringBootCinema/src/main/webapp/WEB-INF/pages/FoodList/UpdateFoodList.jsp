<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>歡迎光臨菜單管理系統</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
   
</script>
</head>

<style>
.text{
position: absolute;
	top: 100px;
	left:230px;
	width: 85%;
}


.title {
	position: absolute;
	overflow: hidden;
	background-color: #333;
	top:0px;
	left:230px;
	width: 85%;
	
}
input[type=text], select, textarea {
	width: 80%;
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
	width:100px;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.container2 {
	position: absolute;
	top: 150px;
	left:230px;
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	width: 800px;
	height:400px;
	
	
}

#b{
	position: absolute;
	left:550px;
}

.topnav {
	overflow: hidden;
	background-color: #333;
	position: absolute;
	left:230px;
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
<body>	


		
		<%@include file="../Dashboard.jsp"%>
		
			<div class="topnav">
       <a href="http://localhost:8080/addFood.controller"> 新增菜單</a>
       <a href="http://localhost:8080/AllOrder"> 全部訂單</a>
       <a href="http://localhost:8080/AllStock"> 全部庫存紀錄</a>
	    </div>


<input id="res" type="hidden" value="${res}">
</table>

		
<div class="text">首頁->商品管理->修改菜單</div>	


	<div class="container2">
	
		<form action="updateFood.controller" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col-25">
					<label for="food">品項</label>
				</div>
				<div class="col-75">
					<input type="text" id="food" name="food" value=${food}  >
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="price">價格</label>
				</div>
				<div class="col-75">
					<input type="text" id="price" name="price" value=${price}>
				</div>
			</div>
			
		
            <div class="row">
				<div class="col-25">
					<label for="file">圖片</label>
				</div>
				<div class="col-75">
					<input type="file" id="files" name="myFiles" placeholder="">
				</div>
				
			</div>
            
			
			<br>
			<div class="row" id="b">
				<input type="submit" name="submit" value="修改品項">
			</div>
		</form>
		
		
	</div>	


</form>		
</body>
</html>