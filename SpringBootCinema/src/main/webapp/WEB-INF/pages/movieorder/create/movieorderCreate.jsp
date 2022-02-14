<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單系統</title>
<link rel="stylesheet" href="/css/order.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">


</head>
<body>
	<%@include file="../../Dashboard.jsp"%>


	<div>

		<div class='buts'>
			<div class="dropdown">
				<button class="btn btn-primary dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">功能按鈕</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><button class="dropdown-item btn btn-info">
							<a href='/movieorder/insertorder'>新增訂單</a>
						</button></li>
					<li><button class="dropdown-item btn btn-info">
							<a href='/movieorder/ordermain.controller'>查詢訂單</a>
						</button></li>
				</ul>
			</div>
		</div>
		<div class='container input-group mb-3'>
			
		<table id="showproduct" border="1" class='edge table  tbstyle table-striped' >
		<thead class="table-primary "><tr><th>新增訂單表單</th><th></th></tr></thead>
			<tr>
				<td>帳號:</td><td><input id="account" type="text" name="bname"></td>
			</tr>
			<tr class="table-info ">
				<td>電影名:</td><td> <input id="movie" type="text" name="size"></td>
			</tr>
			<tr>
				<td>日期:</td><td> <input id="date" type="text" name="color"></td>
			</tr>
			<tr class="table-info ">
				<td>場次:</td><td> <input id="showing" type="text" name="age"></td>
			</tr>
			<tr>
				<td>是否付款:</td><td> <input id="paid" type="text" name="bname"></td>
			</tr>
			<tr class="table-info ">
				<td>價錢:</td><td> <input id="unit_Price" type="text" name="size"></td>
			</tr>
			<tr>
				<td>手機:</td><td> <input id="phone" type="text" name="color"></td>
			</tr>
			<tr class="table-info ">
				<td>座位:</td><td><input id="seat" type="text" name="age"></td>
			</tr>
			<tr>
				<td><button class='btn btn-info' onclick="insertOne()">一鍵新增</button>
					<button class='btn btn-success' onclick="insert()">新增</button></td>
					<td></td>
			</tr>
		</table>
		
	</div>

	<script type="text/javascript">
		function insertOne() {
			$("#account").val("Nora");
			$("#movie").val("Test123");
			$("#date").val("2022-02-18");
			$("#showing").val("13:00");
			$("#paid").val("N");
			$("#unit_Price").val("250");
			$("#phone").val("0921913063");
			$("#seat").val("22");
		}

		function insert() {

			var account = $("#account").val();
			var movie = $("#movie").val();
			var date = $("#date").val();
			var showing = $("#showing").val();
			var paid = $("#paid").val();
			var unit_price = parseInt($("#unit_Price").val(),10);
			var phone = $("#phone").val();
			var seat = $("#seat").val();
			
			var order = {
				"account" : account,
				"movie" : movie,
				"seat" : seat,
				"date" : date,
				"showing" : showing,
				"unit_Price" : unit_price,
				"number" : 1,
				"phone" : phone,
				"movie_Price" : unit_price,
				"paid" : paid,
			};

			$.ajax({
				type : 'post',
				url : 'insertOrderbyAjax',
				dataType : 'JSON',
				contentType : 'application/json',
				data : JSON.stringify(order),
				success : function(data1) {
					
					if(data1==1){
						Swal.fire({
							  position: 'top-end',
							  icon: 'success',
							  title: '新增成功',
							  showConfirmButton: false,
							  timer: 1500
							})
							setTimeout(function() {
	    	 location.href = "http://localhost:8080/movieorder/ordermain.controller";
	    	}, 1500); 
							  
					}
				}

			});

		}
	</script>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
		crossorigin="anonymous"></script>
</body>
</html>