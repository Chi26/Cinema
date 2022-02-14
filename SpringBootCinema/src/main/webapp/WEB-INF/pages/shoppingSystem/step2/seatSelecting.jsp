<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Step2: 請選擇座位</title>
<style>


.formstyle {
/* 
	margin:50px 30% auto;
	border: 5px solid cornflowerblue;
	border-radius: 15px;
	width: 640px;
	float: left;
	height: 500px;
	background-color:LightGray;
	box-shadow: 0 0 40px rgba(8,7,16,0.6);
	font-weight:bold; */
		margin:50px 30% auto;
  

	border-radius: 15px;
	width: 640px;
	height:500px;
	background-color:LightGray;
	box-shadow: 0 0 40px rgba(8,7,16,0.6);
	font-weight:bold;
}

.divst {
	margin-top: 30px;
	margin-bottom: 30px;
	margin-left: 30px;
	margin-right: 30px;
}

.floatLeft {
	float: left;
}
.bar {
margin-top:10px;
margin-left:10px;
margin-right:10px;
}
.legendst1{
margin-left:20px;
}
.legendst2{
margin-left:150px;
}

.shadow {
box-shadow: 15px 5px black;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@include file="../../Header.jsp" %>

<br><br>

	<%
		boolean seat_is_taking =(boolean) session.getAttribute("seat_is_taking");
		if(seat_is_taking){
			out.println("<h1>該座位已有人選取! 請您重新選取座位，謝謝! </h1>");
		}

	
	%>

<!-- 	<h1>該座位已有人選取! 請您重新選取座位，謝謝! </h1> -->

	<div class="formstyle">
	<legend><span class= 'legendst1'>Step1</span><span class= 'legendst2'>Step2</span></legend>
		<div class="progress bar">
  <div class="progress-bar progress-bar-striped progress-bar-animated " role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" style="width: 33%"></div>
  <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" style="width: 33%"></div>
</div>
		<form action="seatController" method="post">
			<div class="divst">

				<label><span>剩餘座位:</span></label> <br><br> <select class="form-select" name="MovieSeat" id="MovieSeat">

					<%
					Set<Integer> remaining_Seats = (Set<Integer>) session.getAttribute("remaining_Seats");

					for (int i : remaining_Seats) {
						String option = "<option value='" + i + "'>座位-" + i + "</option>";
						out.println(option);
					}
					%>

				</select>
				
				</div>
						
			<div class="divst">
				
				<label><span>票價:</span></label> <br><br> <select class="form-select" name="MoviePrice"
					id="MoviePrice">

					
					<option value='270'>全票 (270元)</option>
					<option value='250'>優待票 (250元)</option>


				</select>
			</div>


			<div class="divst">
				<input type="submit" class="btn btn-warning shadow" name="pickingSeats" value="選取位子">
			</div>
	</div>
	
</form>
	
	<%@include file="../../footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>