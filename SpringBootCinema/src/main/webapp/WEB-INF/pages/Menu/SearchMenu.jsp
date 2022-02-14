<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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

#showproduct {
	position: absolute;
	top: 150px;
}

.a1 {
	color: #f2f2f2;
	text-decoration: none;
}

#a2 {
	position: absolute;
	right: 5%;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var foodNo = $("#foodNo").val();
		load(foodNo);
	});

	var id;
	var food;
	var price;
	var pcs;
	function sendOrder(foodNo) {
		var quantity = $("#quantity").val();
		var mealprice = parseInt(quantity) * parseInt(price);

		if ($.trim(quantity) == '') {
			alert('訂購數量不得為空');
			return;
		}

		if (parseInt(quantity) > parseInt(pcs)) {
			alert('訂購數量已經大於庫存');
			return;
		}

		var params = {
			"id" : id,
			"account" : 1001,
			"food" : food,
			"price" : price,
			"quantity" : quantity,
			"point" : 0,
			"mealprice" : mealprice,
		}

		$.ajax({
			type : 'post',
			url : '/insertmenu',
			dataType : 'JSON',
			contentType : 'application/json',
			data : JSON.stringify(params),
			success : function(data) {
				window.location.href = "/AllMenuList";
				console.log(data);
			},
			error : function() {
				window.location.href = "/AllMenuList";
				console.log("error");
			}
		});

	}

	function load(foodNo) {
		$
				.ajax({
					type : 'post',
					url : '/searchid?foodNo=' + foodNo,
					dataType : 'JSON',
					contentType : 'application/json',
					success : function(data) {
						var json = JSON.stringify(data, null, 4);
						//console.log('success:' + json);
						var jsonArray = JSON.parse(json);
						$('#showproduct').empty("");
						if (json == null) {
							$('table').prepend(
									'<tr><td colspan="2">No Result</td></tr>');
						} else {
							var table = $('#showproduct');
							table
									.append(" <thead><tr id='ptitle'><th>ID</th><th>品項</th><th>價錢</th>"
											+ "<th>訂購數量</th><th>加入購物車</th></tr> <thead>");
							var tb = "<tbody>";
							var tr = "<tr>"
									+ "<td>"
									+ jsonArray.id
									+ "</td>"
									+ "<td id='food'>"
									+ jsonArray.food
									+ "</td>"
									+ "<td id='price'>"
									+ jsonArray.price
									+ "</td>"
									+

									"<td><input id='quantity' type='text'/></td>"
									+ "<td><button id='order' type='button' value='order' onclick='sendOrder("
									+ jsonArray.id
									+ ")'><img src='/images/shopcar.jpg ' alt='購物車' width='30px' ></button></td>"
									+ "</tr>";
							var tb2 = "</tbody>";
							table.append(tb);
							table.append(tr);
							table.append(tb2);
							id = jsonArray.id;
							food = jsonArray.food;
							price = jsonArray.price;
							pcs = jsonArray.pcs;
						}
					}
				});
	}
</script>
<meta charset="UTF-8">
<title>Product Purchase Order</title>
</head>
<body>
	<%@include file="../Header.jsp"%>

	<br>
	首頁->選購商品
	<div class="btn-group btn-group-toggle" data-toggle="buttons" id="a2">

		<label class="btn btn-secondary"> <a
			href="http://localhost:8080/AllMenuList" class="a1"> 查詢購物車</a>
		</label> <label class="btn btn-secondary"> <a
			href="http://localhost:8080/thisOrder" class="a1">已付款訂單</a>
		</label>
	</div>



	<table id="showproduct" border="1" class="table table-striped"></table>
	<input id="foodNo" type="hidden" value="${foodNo}">
	<div id="feedback" align="center"></div>


</body>
</html>