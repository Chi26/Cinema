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
<title>歡迎光臨菜單管理系統</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
    var indexPage = 1;
    
    $(document).ready(function(){
    	loadPage(indexPage);
    	var res =$("#res").val();
 		if(res == "刪除"){
 			alert('刪除成功');
 		}
    });
    
	function change(page){
		indexPage = page;
		loadPage(indexPage);
	}
    
    function loadPage(indexPage){
    	$.ajax({
    		type:'post',
    		url:'/AllFoodListByPage/' + indexPage,
    		dataType:'JSON',
    		contentType:'application/json',
    		success: function(data){
    			$("#showFoodList").empty("");
    			
    			if(data==null){
    				$('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
    			}else{
    				var table = $('#showFoodList');
    				
    				table.append(" <thead><tr><th >圖片</th><th>品項</th><th>價格</th><th>數量</th><th>修改</th><th>刪除</th><th>庫存</th></tr></thead>");
    				
    				$.each(data, function(i,n){
    				  var tb= "<tbody>";
    				  var tr = "<tr>" + "<td>" + n.pic + "</td>"+ "<td>" + n.food + "</td>" +
    				           "<td>" + n.price + "</td>" + "<td>" + n.pcs + "</td>" +   
    				           "<td><a href=search/"+n.id+">修改</a></td>"+
    				           "<td><a href=delete/"+n.id+">刪除</a></td>"+
    				           "<td><a href=FindAllStock?id="+n.id+">庫存</a></td>"+
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
#showFoodList{
position: absolute;
	top: 150px;
	left:230px;
	width: 85%;
}
#showpage{
	position: absolute;
	left:230px;
	width: 85%;
	top:800px;
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
	left:200px;
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

<table id="showFoodList" border="1" class="table table-striped"></table>
<table id="showpage" class="table table-striped">
    <tr>
       <td>Total Pages:${totalPages} Total Records: ${totalElements}</td> 
       <td colspan="3" align="right">Previous 
       <c:forEach var="i" begin="1" end="${totalPages}" step="1">
           <button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
       </c:forEach>
       Next</td> 
    </tr>
<input id="res" type="hidden" value="${res}">
</table>

		
<div class="text">首頁->商品管理->全部菜單</div>	

		


</form>		
</body>
</html>