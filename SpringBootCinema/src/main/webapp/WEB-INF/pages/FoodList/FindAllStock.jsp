<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
    
    $(document).ready(function(){    	 
    	var id = $("#id").val();    
    	loadPage(id);  
    	var res =$("#res").val();    	
 		if(res == "庫存更新成功"){
 			alert('庫存更新成功');
 		}
 		console.log(id);
    });
    
 function change(){   	
		var increase = $("#increase").val();
    	var decrease = $("#decrease").val();
    	console.log(increase);
    	console.log(decrease);
    	console.log(${id});
	 var params = {  
			 	"id":${id},
	    		"increase":increase,   
	    		"decrease":decrease,
	       };

    	$.ajax({
    		type:'post',
    		url:'/ChangeStock',
    		dataType:'JSON',
            contentType:'application/json',
            data: JSON.stringify(params),
            success: function(data){
            	window.location.href="/FindAllStock?id="+${id};
            	console.log("Right");
            	
            } ,
     	   error: function() {
     		  window.location.href="/FindAllStock?id="+${id};
     		 console.log("error");
            } 		   		
    	});    	
    }

    
    function loadPage(id){    	
    	$.ajax({
    		type:'get',
    		url:'/FindStock?id=' +id,
    		dataType:'JSON',
    		contentType:'application/json',
    		success: function(data){    	
    			$("#showFoodList").empty("");
    			
    			if(data==null){
    				$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
    			}else{
    				var table = $('#showFoodList');
    				
    				table.append("<thead><tr id='ptitle'><th>異動日期</th><th>品項</th><th>庫存數量</th><th>進貨</th><th>銷貨</th></tr></thead>");
    				
    				$.each(data, function(i,n){
    				  var tb= "<tbody>";
    				  var tr = "<tr>" +  "<td>" + n.date + "</td>" +
    				           "<td>" + n.food + "</td>" + 
                               "<td>" + n.pcs + "</td>" + 	  
                               "<td>" + n.increase + "</td>" +   
							   "<td>" + n.decrease + "</td>" + 
    				           "</tr>";
    				  var tb2= "</tbody>";
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
.text{
position: absolute;
	top: 100px;
	left:230px;
	width: 85%;
}
.b{
position: absolute;
	top: 150px;
	left:600px;
}
#showFoodList{
position: absolute;
	top: 200px;
	left:230px;
	width: 85%;
}
#showpage{
	position: absolute;
	left:230px;
	width: 85%;
}
.player {
	width: 100px;
	height: 80px;
}
.title {
	position: absolute;
	overflow: hidden;
	background-color: #333;
	top:0px;
	left:230px;
	width: 85%;
	
}
.topnav {
	overflow: hidden;
	background-color: #333;
	position: absolute;
	left:230px;
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
</style>
<body>	


	
		
		<%@include file="../Dashboard.jsp"%>
		
			<div class="topnav">
       <a href="http://localhost:8080/addFood.controller"> 新增菜單</a>
       <a href="http://localhost:8080/AllOrder"> 全部訂單</a>
       <a href="http://localhost:8080/AllStock"> 全部庫存紀錄</a>
	    </div>

<div class="text">首頁->商品管理->查看單品庫存</div>		    
<div class="b">
新增庫存<input id='increase' type='text' value="${increase}">
刪除庫存<input id='decrease' type='text' value="${decrease}">
<button id='changestock' onclick=change()>異動庫存</button>
</div>	    


<br>
<br>
<table id="showFoodList" border="1" class="table table-striped"></table>
<input id="res" type="hidden" value="${res}">
</table>


<div id="paymentInfo"></div>

<input id="id" type="hidden" value="${id}">

</form>		



</body>
</html>