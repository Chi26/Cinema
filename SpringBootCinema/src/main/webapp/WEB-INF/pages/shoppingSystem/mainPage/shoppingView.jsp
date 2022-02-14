<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂位系統</title>
<style>

.formstyle{
/*      height: 350px; 
     width: 400px; 
	margin:0 auto;
    background-color: LightGray;
    position: absolute; 
    transform: translate(-50%,-50%);
    top: 55%;
    left: 50%;
    border-radius: 10px;
    backdrop-filter: blur(10px);
    border: 2px solid rgba(255,255,255,0.1);
    box-shadow: 0 0 40px rgba(8,7,16,0.6);
    padding: 50px 35px;
    font-weight:bold; */
    	margin:100px 30% auto;
  
	
	border-radius: 15px;
	width: 640px;
	height:500px;
	background-color:LightGray;
	box-shadow: 0 0 40px rgba(8,7,16,0.6);
	font-weight:bold;

}
/* .formstyle *{ */
/*     font-family: 'Poppins',sans-serif; */
/*     color: #ffffff; */
/*     letter-spacing: 0.5px; */
/*     outline: none; */
/*     border: none; */
/* } */



/* .formstyle { */
/* 	margin-top: 200px; */
/* 	margin-left: 600px; */
/* 	border: 5px solid cornflowerblue; */
/* 	border-radius: 15px; */
/* 	width: 500px; */
/* } */

.divst {
	margin-top: 60px;
	margin-bottom: 60px;
	margin-left:60px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@include file="../../Header.jsp" %>
	<div class="formstyle">

		<div class="divst">
			<a href="http://localhost:8080/shopping.step1">我要訂位</a>
		</div>

		<div class="divst">
			<a href="http://localhost:8080/shopping.searchingOrder">查詢訂位</a>
		</div>
		
		<div class="divst">
			<a href="http://localhost:8080/shopping.getsearchingTrade">交易紀錄</a>
		</div>

	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<%@include file="../../footer.jsp" %>
</body>
</html>