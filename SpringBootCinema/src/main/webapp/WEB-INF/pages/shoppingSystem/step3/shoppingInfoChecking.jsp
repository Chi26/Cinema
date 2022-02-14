<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.cinema.model.Order"
	import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Step3: 是否繼續訂位?</title>
<style>
.formstyle {
	margin:50px 30% auto;

	border-radius: 15px;
	width: 640px;
	padding-bottom: 20px;
	padding-left: 10px;
	background-color:LightGray;
	box-shadow: 0 0 40px rgba(8,7,16,0.6);
	font-weight:bold;
	/* 	height:500px; */

}

.divst {
	margin-top: 30px;
	margin-bottom: 30px;
	margin-left: 30px;
	margin-right: 30px;
}

.bar {
	margin-top: 10px;
/* 	margin-left: 10px; */
	margin-right: 10px;
}

.block {
	width: 13px;
	margin-left: 10px;
	margin-right: 5px;
	height: 37px;
	width: 30px;
	float: left;
	border: 5px solid cornflowerblue;
	text-align: center;
	box-shadow: 3px 3px 5px black;
}

.rect {
	width: 200px;
	height: 50px;
	float: left;
	margin-top: 10px;
	margin-bottom: 10px;
}

.bottombut {
	margin-bottom: 30px;
	margin-left: 50px;
}

.clearfloat {
	clear: both;
}
.legendst1{
margin-left:20px;
}
.legendst2{
margin-left:150px;
}
.legendst3{
margin-left:150px;
}
.shadow {
box-shadow: 15px 5px black;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
<%@include file="../../Header.jsp" %>
	<div class="formstyle">
	<legend><span class= 'legendst1'>Step1</span><span class= 'legendst2'>Step2</span><span class= 'legendst3'>Step3</span></legend>
		<div class="progress bar">
			<div class="progress-bar progress-bar-striped progress-bar-animated "
				role="progressbar" aria-valuenow="33" aria-valuemin="0"
				aria-valuemax="100" style="width: 33%"></div>
			<div
				class="progress-bar progress-bar-striped progress-bar-animated bg-success"
				role="progressbar" aria-valuenow="33" aria-valuemin="0"
				aria-valuemax="100" style="width: 33%"></div>
			<div
				class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
				role="progressbar" aria-valuenow="34" aria-valuemin="0"
				aria-valuemax="100" style="width: 34%"></div>
		</div>

		<br> <br> <label><span>已選取座位如下:</span></label><br> <br>
		<form action="deleteSeatController" method="post">

			<!-- 		<table> -->
			<!-- 			<tr> -->
			<!-- 				<td>座位</td> -->
			<!-- 			</tr> -->
			<%
			List<Order> buyerSeats = (List<Order>) session.getAttribute("buyerSeats");
			for (Order od : buyerSeats) {
				// 				String option = "<td></td><td>" + od.getSeat() + "</td><td><input type='submit' class='btn btn-danger' name='deleteSeat' value='刪除座位-"
				// 				+ od.getSeat() + "'></td>";
				String option = "<div class='rect'><td><div class='block'>" + od.getSeat()
				+ "</div></td><td><div><input type='submit' class='btn btn-danger shadow' name='deleteSeat' value='刪除座位-"
				+ od.getSeat() + "' width='50'></div></td></div>";
				out.println(option);
			}
			// 			String clearfloat = "<div class='clearfloat'></div>";
			// 			out.println(clearfloat);
			// 			if (buyerSeats.size() >= 1) {
			// 				int odNum = (buyerSeats.get(0)).getOrder_No();
			// 				String hiddenInput = "<input type='hidden' id='odNum' value='" + odNum + "'>";
			// 				out.println(hiddenInput);
			// 				String buyButton = "<button id='buy' class='btn btn-warning' onclick='clickState()' >付款</button>";
			// 				out.println(buyButton);
			// 				out.println(odNum);
			// 				out.println("<br>");
			// 				out.println("<br>");
			// 			}
			%>
			<!-- 		</table> -->
			<div class="clearfloat"></div>
			<br>
			<br>
			<input type='submit' class='btn btn-warning shadow' name='pickSeat'
				value='繼續訂位'>
			<div id="paymentInfo"></div>

		</form>
		<br> <br>
		<%
		List<Order> buyerSeats1 = (List<Order>) session.getAttribute("buyerSeats");
		if (buyerSeats1.size() >= 1) {
			int odNum = (buyerSeats.get(0)).getOrder_No();
			String hiddenInput = "<input type='hidden' id='odNum' value='" + odNum + "'>";
			out.println(hiddenInput);
			String buyButton = "<button id='buy' class='btn btn-success shadow' onclick='buy()' >付款</button>";
			out.println(buyButton);
		}
		%>



		<br> <br> <a href="http://localhost:8080/shopping.mainPage"
			class='btn btn-info shadow'>返回訂位系統</a>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		function clickState() {

			buy();
		}

		function buy() {

			var y = $('#odNum').val();
			console.log(y);

			$.ajax({
				type : 'post',
				url : '/searchingOrder/buyOrder?orderNo=' + y,
				dataType : 'JSON',
				contentType : 'application/json',
				success : function(data) {
					console.log("hi");
					console.log(data[0]);
					$('#paymentInfo').empty();
					$('#paymentInfo').append(data);

				}
			});

		}
	</script>
<%@include file="../../footer.jsp" %>
</body>
</html>