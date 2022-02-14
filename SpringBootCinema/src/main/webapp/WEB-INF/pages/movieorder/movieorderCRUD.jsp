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
  	<%@include file="../Dashboard.jsp"%>  




	<div class='buts'>
		<div class="dropdown">
			<button class="btn btn-primary dropdown-toggle" type="button"
				id="dropdownMenuButton1" data-bs-toggle="dropdown"
				aria-expanded="false">功能按鈕</button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<li><button class="dropdown-item btn btn-info"><a href='/movieorder/insertorder'>新增訂單</a></button></li>
				<li><button class="dropdown-item btn btn-info"><a href='/movieorder/ordermain.controller'>查詢訂單</a></button></li>
			</ul>
		</div>
	</div>
	<div class="searchOrderBut">
			<input class="form-control" id="mySearch" type="text"
				placeholder="Search..">
	</div>
	<div class="container">
 	<table id="showproduct" border="1" class='edge table table-bordered table-hover table-striped tbstyle'></table> 
 	<table class='totalpage'><tr><td>總頁數:${MovieOrdertotalPages} 總筆數: ${MovieOrdertotalElements}</td></tr></table>
	<table id="showpage" class='pageindex' >
    <tr>
<%--         <td>總頁數:${MovieOrdertotalPages} 總筆數: ${MovieOrdertotalElements}</td>   --%>
       <td colspan="3" align="right"> 頁數:
       <c:forEach var="i" begin="1" end="${MovieOrdertotalPages}" step="1">
           <button class='btn btn-info' id="myPage" value="${i}" onclick="change(${i})">${i}</button>
       </c:forEach>
      </td> 
    </tr>
	</table>
	<div class='table-sm'>
	<table id="showupdate" border="1" class='edge table updatetable'>
	<tfoot></tfoot>		
		</table></div>
	</div>
<script type="text/javascript">
	var update_Num=-1;
    var indexPage = 1;
    
    $(document).ready(function(){
    	loadPage(indexPage);
    	
        $("#mySearch").on("keyup", function() {
    	    var value = $(this).val().toLowerCase();
    	    $("#showproduct tbody tr").filter(function() {
    	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    	    });
    	  });

    });
    
	function change(page){
		console.log("Page is "+page);
		indexPage = page;
		console.log("indexPage is "+indexPage);
		loadPage(indexPage);
	}
    
    function loadPage(indexPage){
    	
    	var count = (indexPage-1)*10;
    	
    	$.ajax({
    		type:'post',
    		url:'/movieorder/queryallbypage/' + indexPage,
    		dataType:'JSON',
    		contentType:'application/json',
    		success: function(data){
    			
    			console.log(data);
    			$("#showproduct").empty("");
    			
    			if(data==null){
    				$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
    			}else{
    				var table = $('#showproduct');
    				
    				table.append("<thead><tr class='table-primary'><th>順序</th><th>帳號</th><th>電影名</th><th>日期</th><th>場次</th><th>是否付款</th><th>價錢</th><th>手機</th><th>座位</th><th>訂單編號</th><th></th><th></th></tr></thead>");
    				table.append("<tbody>");
    				$.each(data, function(i,n){
    				  var tr = "<tr align='center'>" 
    				  		 + "<td>" +(count+i+1) + "</td>" 
    				         + "<td>" + n.account + "</td>" 
    				         + "<td>" + n.movie + "</td>" 
    				         + "<td>" + n.date + "</td>" 
    				         + "<td>" + n.showing.substring(0,5) + "</td>" 
    				         + "<td>" + n.paid + "</td>"
    				         + "<td>" + n.unit_Price + "</td>"
    				         + "<td>" + n.phone + "</td>"
    				         + "<td>" + n.seat + "</td>"
    				         +"<td>"+n.order_No+"</td>"
    				         +"<td><button id='update' class='btn btn-success' onclick='update("
								+ n.order_No+ ")'>修改</button></td>"
    				         +"<td><button value='cancel"+n.order_No+"' class='btn btn-danger' onclick='cancel("
									+ n.order_No+ ")'>刪除</button></td>"
    				         + "</tr>";
    				  table.append(tr);
    				});
    				table.append("</tbody>");
    			}
    		}
    	});
    }
    
    function updateOne(){
    	
    	$('#showupdate #account').val("Betty");
    	$('#showupdate #movie').val("12345test");
    	$('#showupdate #date').val("2022-02-18");
    	$('#showupdate #paid').val("Y");
    }
    
    function updateConfirm() {
		var order_No = $("#showupdate #target").val();
		var account = $("#showupdate #account").val();
		var movie = $("#showupdate #movie").val();
		var date = $("#showupdate #date").val();
		var showing = $("#showupdate #showing").val();
		var paid = $("#showupdate #paid").val();
		var unit_price = parseInt($("#showupdate #unit_Price").val(),10);
		var phone = $("#showupdate #phone").val();
		var seat = $("#showupdate #seat").val();
		
		var order = {
			"order_No" :order_No,
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
		
		Swal.fire({
			  title: '確認修改?',
			  text: "",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '修改'
			}).then((result) => {
			  if (result.isConfirmed) {
					$.ajax({
						type : 'post',
						url : 'updateOrderbyAjax',
						dataType : 'JSON',
						contentType : 'application/json',
						data : JSON.stringify(order),
						success : function(data1) {
							
							if(data1==1){
								Swal.fire({
									  position: 'top-end',
									  icon: 'success',
									  title: '修改成功',
									  showConfirmButton: false,
									  timer: 1500
									})
									loadPage(indexPage);
							}
						}

					});
			  }
			})

// 		$.ajax({
// 			type : 'post',
// 			url : 'updateOrderbyAjax',
// 			dataType : 'JSON',
// 			contentType : 'application/json',
// 			data : JSON.stringify(order),
// 			success : function(data1) {
				
// 				if(data1==1){
// 					Swal.fire({
// 						  position: 'top-end',
// 						  icon: 'success',
// 						  title: '修改成功',
// 						  showConfirmButton: false,
// 						  timer: 1500
// 						})
// 						loadPage(indexPage);
// 				}
// 			}

// 		});

	}
    
    function update(z) {
    	update_Num = z;
    	console.log(z);
    	var table = $('#showupdate');
    	table.empty("");
    	$.ajax({
    		type:'post',
    		url:'/movieorder/searchoneorder?orderNo=' + z,
    		dataType:'JSON',
    		contentType:'application/json',
    		success: function(data){   			
    			console.log(data);
    			var head= "<thead><tr class='table-primary'><th>訂單編號</th><th>帳號</th><th>電影名</th><th>日期</th><th>場次</th><th>是否付款</th><th>價錢</th><th>手機</th><th>座位</th>"
    			+"<th></th><th></th></tr></thead>"
    			table.append(head);
    			//table.append("<thead><tr class='table-primary'><th>訂單編號</th><th>帳號</th><th>電影名</th><th>日期</th><th>場次</th><th>是否付款</th><th>價錢</th><th>手機</th><th>座位</th><th></th><th></th><th></th></tr></thead>");
    			
    			table.append("<tbody>");
    	    	 var row = "<tr align='center'>" 
    	    		 + "<td><input id='target' type='text' class='inputst' value="+data.order_No+" readonly></td>" 
    		  		 + "<td><input id='account' type='text' class='inputst' value="+data.account+"></td>" 
    		         + "<td><input id='movie' type='text' class='inputst' value="+data.movie+"></td>" 
    		         + "<td><input id='date' type='text' class='inputst' value="+data.date+"></td>" 
    		         + "<td><input id='showing' type='text' class='inputst' value="+data.showing.substring(0,5)+"></td>" 
    		         + "<td><input id='paid' type='text' class='inputst' value="+data.paid+"></td>" 
    		         + "<td><input id='unit_Price' type='text' class='inputst' value="+data.unit_Price+"></td>" 
    		         + "<td><input id='phone' type='text' class='inputst' value="+data.phone+"></td>" 
    		         + "<td><input id='seat' type='text' class='inputst' value="+data.seat+"></td>"
    		         +"<th><button id='' class='btn btn-info' style='width:100px;' onclick='updateOne("
    					+ z+ ")'>一鍵修改</button></th>"
    		         +"<td><button id='buy' class='btn btn-success' style='width:100px;' onclick='updateConfirm()'>修改</button></td>"
    		         + "</tr>";
    	    	table.append(row);
    	    	table.append("</tbody>");
    			
    		}
    	});    	
    }    
	function cancel(z) {
		console.log(z);
		
		Swal.fire({
			  title: '取消該筆訂位?',
			  text: "",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '確定刪除!'
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      '該筆訂位已刪除!',
			      '',
			      'success'
			    )
			    
			    $.ajax({
					type : 'post',
					url : 'cancelOrder?orderNo=' + z+'&pageNo='+indexPage,
					dataType : 'JSON',
					contentType : 'application/json',
					success : function(data) {
						console.log(data);
						if (data == 1) {
							$('#showproduct').empty();

	 						loadPage(indexPage);

	 						if(z==update_Num){
	 							$('#showupdate').empty();
	 						}
						}

					}
				});
			  }
			})
		
	  }
</script>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
</body>
</html>