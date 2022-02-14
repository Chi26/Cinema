<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>交易紀錄</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
	
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>

<style>

.tbstyle {
	margin-left: 600px;
	width: 100px;
	
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
<div class='head'>您的交易紀錄如下:</div>
<br>
</h1>
<div id='tradeTable' class='tb'>
<table id="showtrade" border="1" class="table-primary tbstyle ">
<thead>
	<tr id='ptitle' class='table-primary'><th>順序</th><th>訂單編號</th><th>電影名稱</th><th>日期</th><th>場次</th><th>座位</th></tr>
	</thead>
	<tbody></tbody>
	<tfoot>
	<tr id='ptitle' class='table-primary'><th>順序</th><th>訂單編號</th><th>電影名稱</th><th>日期</th><th>場次</th><th>座位</th></tr>
	</tfoot>
</table>
</div>
<br>
<br>
<h1>
<a href="http://localhost:8080/shopping.mainPage" class='btn btn-info shadow'>返回訂位系統</a> 
</h1>
<%@include file="../../footer.jsp" %>
<script type="text/javascript">

	var table = $('#showtrade').DataTable({
	"language": { "emptyTable": " ⬆ Pleae click the Table Head to get the information. 😉"},
	"lengthMenu": [ 3, 5, 10]
	});
    
    $(document).ready(function(){
    	loadTrade();
    });
    
    function loadTrade(){
    	$.ajax({
    		type:'post',
    		url:'/shopping.tradehistory',
    		dataType:'JSON',
    		contentType:'application/json',
    		success: function(data){
    			
    			console.log(data);
    			
     			if(data !=null){ 				
    				table.clear();				
    				$.each(data, function(i,n){
    			
    				  table.row.add([i+1,n.merchantTrade_No,n.movie,n.date,(n.showing).substring(0,5),n.seat]);
    				});
    			}
    		}
    	});
    }
    
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>