<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>已預約之位子</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	
	
	<link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
	
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
	
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<style>
.tbstyle {
	margin-left: 300px;
	width: 300px;
	
	background-color: LightGray;
	border-radius: 10px;
	text-align:center;
}
tr{
text-align:left;
padding-button:10px;
}
.tb{
margin-left:15%;
margin-right:15%;
}
.shadow {
box-shadow: 15px 5px black;
margin-left:15%;
}
.head {
margin-left:15%;
margin-top:5%
}

</style>
</head>
<body>
<%@include file="../../Header.jsp" %>
	<h1>
		<div class='head'>已選取之訂位:</div>
	</h1>
	<br>
	<div id='orderTable' class='tb'>
	<table id="showorder" border="1" class="table-primary tbstyle ">
	<thead>
	<tr id='ptitle' class='table-primary'><th>順序</th><th>電影名稱</th><th>日期</th><th>場次</th><th></th></tr>
	</thead>
	<tbody></tbody>
	<tfoot>
	<tr id='ptitle' class='table-primary'><th>順序</th><th>電影名稱</th><th>日期</th><th>場次</th><th></th></tr>
	</tfoot>
	</table>
	</div>
	<table id="showpage">
		<!--     <tr> -->
		<%--        <td>Total Pages:${totalPages} Total Records: ${totalElements}</td>  --%>
		<!--        <td colspan="3" align="right">Previous  -->
		<%--        <c:forEach var="i" begin="1" end="${totalPages}" step="1"> --%>
		<%--            <button id="myPage" value="${i}" onclick="change(${i})">${i}</button> --%>
		<%--        </c:forEach> --%>
		<!--        Next</td>  -->
		<!--     </tr> -->
	</table>
	<br>
	<br>
	<table id="showorderInfo" border="1" class="table-primary tbstyle "></table>
	<table id="orderInfopage"></table>
	<br>
	<div id="paymentInfo"></div>
	<h1>
	<a href="http://localhost:8080/shopping.mainPage" class='btn btn-info shadow'>返回訂位系統</a> <br>
	</h1>

	<script type="text/javascript">
	
	var table = $('#showorder').DataTable({
	    "language": { "emptyTable": " ⬆ Pleae click the Table Head to get the information. 😉"},
		"lengthMenu": [ 3, 5, 10],
		"columnDefs": [{ "targets": -1, "data": null,"className": 'orderInfo', "defaultContent":"<button id='orderInfo' class='btn btn-success' onclick='checkInfo()' value='details'>查看詳情</button>" }]
	});
	
	$(document).ready(function() {
				
	loadOrder();
		
	});


		function loadOrder() {
			$
					.ajax({
						type : 'post',
						url : '/searchingOrder',
						dataType : 'JSON',
						contentType : 'application/json',
						success : function(data) {
							

							console.log(data);

							if (data != null) {
// 								$('table').prepend(
// 										"<tr><td colspan='2'>暫無資料</td></tr>");

// 							} else {
// 								var table = $('#showorder').DataTable(
// // 								{
// // 									"columns":[null,null,null,null,"defaultContent": "<button>查看詳情</button>"]
									
// // 								}		
// 								);

// 								table.append("<tr id='ptitle' class='table-primary'><th>順序</th><th>電影名稱</th><th>日期</th><th>場次</th><th></th></tr>");
								table.clear();
								$.each(data,function(i, n) {
									
// 									var tr = "<tr align='left'>"
// 									+ "<td>"+ (i + 1)+ "</td>"
// 									+ "<td>"+ n.movie+ "</td>"
// 									+ "<td>"+ n.date+ "</td>"
// 									+ "<td>"+ (n.showing).substring(0,5)+ "</td>"
// 									+ "<td><button id='orderInfo' value="+ n.order_No+ " class='btn btn-primary' onclick='checkInfo("+ n.order_No+ ")'>察看詳情</button></td>"+ "</tr>";
									
// 									table.append(tr);

 								table.row.add([(i+1),n.movie,n.date,(n.showing).substring(0,5),n.order_No]);
									
								});

								
								

							}

						}
					});
		}

		function checkInfo() {
			
			$('#showorder tbody').on('click','td.orderInfo',function () {
				
				console.log('button is click');				
  				let row = table.row(this).data();
 				x = parseInt(row[4],10);
 			    console.log(x);			
 			    $.ajax({
						type : 'post',
						url : '/searchingOrder/findOrder?orderNo='+ x,
						dataType : 'JSON',
						contentType : 'application/json',
						success : function(data) {

							$('#showorderInfo').empty();

							var table = $('#showorderInfo');

							table.append("<tr><td>電影名稱:</td><td>"+ data[0].movie + "</td></tr>");
							table.append("<tr><td>日期:</td><td>" + data[0].date+ "</td></tr>");
							table.append("<tr><td>場次:</td><td>"+ data[0].showing.substring(0, 5)+ "</td></tr>");

							var seats_no = "";
							var price = 0;

							$.each(data, function(i, n) {
								seats_no += n.seat + ", ";
								price += n.unit_Price;
							});
							var seat_length = (seats_no).length - 1;

							var seats = seats_no.substring(0, seat_length - 1);

							console.log(price);

							table.append("<tr><td>位子:</td><td>" + seats+ "</td></tr>");
							table.append("<tr><td>金額:</td><td>" + price+ "</td></tr>");
							
							table.append("<tr><td colspan='2'><button id='buy' class='btn btn-warning' onclick='buy("
										+ data[0].order_No+ ")'>付款</button></td></tr>");
							table.append("<tr><td colspan='2'><button id='buy' class='btn btn-danger' onclick='cancel("
										+ data[0].order_No+ ")'>取消該筆訂位</button></td></tr>");

						}
					})
			});
 		}

		function buy(y) {
			console.log(y);
			$.ajax({
				type : 'post',
				url : '/searchingOrder/buyOrder?orderNo=' + y,
				dataType : 'JSON',
				contentType : 'application/json',
				success : function(data) {
					console.log(data[0]);
					$('#paymentInfo').empty();
					$('#paymentInfo').append(data);

				}
			});
		}

		function cancel(z) {
			console.log(z);
			Swal.fire({
				  title: '取消訂位後須重新訂位，確認刪除?',
				  text: "",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then((result) => {
				  if (result.isConfirmed) {
				    Swal.fire(
				      'Deleted!',
				      '檔案已刪除!請重新整理頁面!',
				      'success'
				    )
// 				  }
// 				})
			$.ajax({
				type : 'post',
				url : '/searchingOrder/cancelOrder?orderNo=' + z,
				dataType : 'JSON',
				contentType : 'application/json',
				success : function(data) {
					console.log(data);
					if (data == 1) {
						$('#showorderInfo').empty();

 						loadOrder();
					}

				}
			});
			
		  }
	});
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
<%@include file="../../footer.jsp" %>
</body>
</html>