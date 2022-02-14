<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>付款成功!!!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<style>
.formstyle {
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
	margin-right:30px;

}
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	Swal.fire({
		  title: '付款成功!',
		  text: '請至 ➡ 訂票 ➡ 交易紀錄 查看詳情，謝謝!'
		 
		})
	
});

</script>
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

<%@include file="../../footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>