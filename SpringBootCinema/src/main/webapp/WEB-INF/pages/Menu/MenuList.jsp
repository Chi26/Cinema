<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>超級影城菜單</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		loadPage();
	});

	function loadPage() {
		$
				.ajax({
					type : 'post',
					url : '/AllFoodList.controller',
					dataType : 'JSON',
					contentType : 'application/json',
					success : function(data) {
						$("#showFoodList").empty("");

						if (data == null) {
							$('table').prepend(
									"<tr><td colspan='2'>暫無資料</td></tr>");
						} else {
							var table = $('#showFoodList');

							table
									.append(" <thead><tr><th>圖片</th><th>品項</th><th>價格</th><th>加入購物車</th></tr></thead>");

							$
									.each(
											data,
											function(i, n) {
												var tb = "<tbody>";
												var tr = "<tr >"
														+ "<td>"
														+ n.pic
														+ "</td>"
														+ "<td>"
														+ n.food
														+ "</td>"
														+ "<td>"
														+ n.price
														+ "</td>"
														+ "<td><a href='/searchmenu?foodNo="
														+ n.id
														+ "'>"
														+ " <img src='/images/shopcar.jpg ' alt='購物車' width='30px' >"
														+ "</a></td>" + "</tr>";
												var tb2 = "</tbody>";
												table.append(tb);
												table.append(tr);
												table.append(tb2);
											});
						}
					}
				});
	}
</script>
</head>

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

.player {
	width: 100px;
	height: 80px;
}

.mine {
	float: left;
}

#showFoodList{
position: absolute;
	top: 150px;

	
}
.a1{
color: #f2f2f2;
text-decoration: none;
}
#a2{
position: absolute;
right:5%;
}
</style>
<body>
<%@include file="../Header.jsp"%>
	

	</header>


			
<br>
首頁->訂餐
<div class="btn-group btn-group-toggle" data-toggle="buttons" id="a2">
  
  <label class="btn btn-secondary">
    <a href="http://localhost:8080/AllMenuList" class="a1"> 查詢購物車</a>
  </label>
  <label class="btn btn-secondary">
  
   <a href="http://localhost:8080/thisOrder" class="a1">已付款訂單</a>
  </label>
</div>



	<table id="showFoodList" border="1" class="table table-striped"></table>

	</table>

	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@include file="../footer.jsp"%>
</body>
</html>