<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<link rel="stylesheet" href="/css/membersMain.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- fontawesome-->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<!-- chart.js-->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- sweet Alert -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
    var indexPage = 1;
    
    $(document).ready(function(){
     loadPage(indexPage);
     
     $("#myInput").on("keyup", function() {
    	    var value = $(this).val().toLowerCase();
    	    $("table tr").filter(function() {
    	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    	    });
    	  });
     
    });
    
 function change(page){
  indexPage = page;
  loadPage(indexPage);
 }
    
function confirmation(ev) {
	 ev.preventDefault();
	 var urlToRedirect = ev.currentTarget.getAttribute('href');  //use currentTarget because the click may be on the nested i tag and not a tag causing the href to be empty
	 console.log(urlToRedirect); // verify if this is the right URL
	 swal.fire({
	   title: "確認刪除?",
	   text: "一但刪除, 你將無法檢視此會員資料!",
	   icon: "warning",
	   buttons: true,
	   dangerMode: true,
	 })
	 .then((willDelete) => {
	   // redirect with javascript here as per your logic after showing the alert using the urlToRedirect value
	   if (willDelete) {
	     swal.fire("成功! 您已成功刪除!", {
	       icon: "success",
	     });
	     setTimeout(function() {
	    	 location.href = "http://localhost:8080/admin/managermembers";
	    	}, 1500); // Time in milliseconds
	    $.ajax({
				type : 'get',
				url : "/admin/"+urlToRedirect,
				dataType : 'JSON',
				contentType : 'application/json',
				success : function(data) {
					console.log(data);
				}
	   }) }else {
	     swal.fire("您的刪除動作未執行!");
	   }
	 });
	 } 

 
 
 
    function loadPage(indexPage){
     $.ajax({
      type:'post',
      url:'/admin/findallbypage/' + indexPage,
      dataType:'JSON',
      contentType:'application/json',
      success: function(data){
       $("#showproduct").empty("");
       
       if(data==null){
        $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
       }else{
        var table = $('#showproduct');
        
        table.append("<thead><tr id='ptitle'><th scope='col' class='fs-4'>編號</th><th scope='col' class='fs-4'>帳號</th><th scope='col' class='fs-4'>姓名</th><th scope='col' class='fs-4'>信箱</th><th scope='col' class='fs-4'>電話</th><th scope='col' class='fs-4'>生日</th><th scope='col' class='fs-4'>權限</th><th scope='col' class='fs-4'></th><th scope='col' class='fs-4'></th></tr></thead>");
        
        $.each(data, function(i,n){
          var tr = " <tbody> <tr>" + "<td class='fs-3'>" + n.account_No + "</td>" +
              "<td class='fs-4'>" + n.username + "</td>" + "<td class='fs-4'>" + n.name + "</td>" +
              "</td>" + "<td class='fs-5'>" + n.email + "</td>" 
                    + "</td>" + "<td class='fs-5'>" + n.phone + "</td>"
                    + "</td>" +"<td class='fs-5'>" + n.birthday + "</td>" +
                   "<td class='fs-5'>" + n.role.substr(5,99) + "</td>" +
                   "<td><a class='fas fa-edit fa-2x' style='color:black;' href=selectmember/"+n.account_No+"></a></td>"+
                   "<td><a class='fas fa-trash-alt fa-2x' style='color:black;' href=deletemember/"+n.account_No+" onclick='return confirmation(event)'></a></td>"+
                  /*  "<td><a id='deleteFunction' class='fas fa-trash-alt fa-2x' style='color:black;' href=deletemember/"+n.account_No+"></a></td>"+ */
             "</tr> </tbody>";
          table.append(tr);   
        });
       }
      }
     });
    }
 
 
</script>
</head>
<body>
	<%@include file="../../Dashboard.jsp"%>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">


		<div id="search_home">
			<input class="form-control" id="myInput" type="text"
				placeholder="Search..">
		</div>

		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<div align="center">
		
				<div id="gender">
					<h3 align="center">會員性別統計</h3>
					<canvas id="genderChart" width="400" height="400"></canvas>
				</div>

				<div id="address">
					<h3 align="center">會員居住地統計</h3>
					<canvas id="addressChart" width="400" height="400"></canvas>
				</div>

				<div id="age">
					<h3 align="center">會員年齡統計</h3>
					<canvas id="ageChart" width="400" height="400"></canvas>
				</div>
			</div>


			<!--  <div id="productListTitle">使用者清單</div> -->
			<div id="insert" align="center">
				<a href="/admin/insertmain"><button class='btn btn-primary'>使用者新增</button></a>
			</div>
			<div id="export" align="center">
				<a href="/admin/export"><button class='btn btn-info '>轉成CSV檔</button></a>
			</div>
			<table id="showproduct" class="table table-striped align-middle"></table>
			<table id="showpage">
				<tr>
					<td>Total Pages:${totalPages} Total Records: ${totalElements}</td>
					<td colspan="3" align="right">第<c:forEach var="i" begin="1"
							end="${totalPages}" step="1">
							<button id="myPage" value="${i}" onclick="change(${i})"
								class="btn btn-success">${i}</button>
						</c:forEach> 頁
					</td>
				</tr>
			</table>
			<script>
			/* 性別統計 */
				$(document).ready(function() {
							$.ajax({
									url : "/admin/statBirthdayForChart",
									method : "GET",
									dataType : 'JSON',
									contentType : 'application/json',
									success : function(data) {
										console.log(data);
										var chartdata = {
											labels : [ "男性", "女性" ],
											datasets : [ {
												label : '會員性別統計',
												backgroundColor : [
														'rgba(54, 162, 235, 0.2)',
														'rgba(255, 99, 132, 0.2)' ],
												borderColor : 'rgba(200, 200, 200, 0.75)',
												hoverBackgroundColor : 'rgba(200, 200, 200, 1)',
												hoverBorderColor : 'rgba(200, 200, 200, 1)',
												data : data} ]
										};
										var ctx = $("#genderChart");
										var barGraph = new Chart(
												ctx,
												{ type : 'pie',
													data : chartdata});
									},error : function(data) {
									  console.log(data);}
								});
						});
				
			/* 居住地統計 */
				$(document).ready(function() {
							$.ajax({
									url : "/admin/statAddressForChart",
									method : "GET",
									dataType : 'JSON',
									contentType : 'application/json',
									success : function(data) {
										console.log(data);
										var chartdata = {
											labels : [ "新北市", "台北市", "桃園市", "新竹市" ],
											datasets : [ {
												label :'',
												backgroundColor : [
														'#71d1bd',
														'#ffc04d',
														'#d78f89',
														"#e8c3b9"],
												borderColor : 'rgba(200, 200, 200, 0.75)',
												hoverBackgroundColor : 'rgba(200, 200, 200, 1)', 
												hoverBorderColor : 'rgba(200, 200, 200, 1)',
												data : data} ]
										};
										var ctx = $("#addressChart");
										var barGraph = new Chart(
												ctx,
												{ type : 'bar',
													data : chartdata});
									},error : function(data) {
									  console.log(data);}
								});
						});
			/* 年齡統計 */
				$(document).ready(function() {
							$.ajax({
									url : "/admin/statAgeForChart",
									method : "GET",
									dataType : 'JSON',
									contentType : 'application/json',
									success : function(data) {
										console.log(data);
										var chartdata = {
											labels : [ "1950-1960","1960-1970","1970-1980","1980-1990","1990-2000","2000-2010",      ],
											datasets : [ {
												
												backgroundColor : [
													"rgba(255,99,132,0.5)",
											          "rgba(255,159,64,0.5)",
											          "rgba(255,205,86,0.5)",
											          "rgba(75,192,192,0.5)",
											          "rgba(54,162,235,0.5)",
											          "rgba(241, 104, 226, 0.45)"],
												borderColor : 'rgba(200, 200, 200, 0.75)',
												hoverBackgroundColor : 'rgba(200, 200, 200, 1)', 
												hoverBorderColor : 'rgba(200, 200, 200, 1)',
												data : data} ]
										};
										var ctx = $("#ageChart");
										var barGraph = new Chart(
												ctx,
												{ type : 'polarArea',
													data : chartdata});
									},error : function(data) {
									  console.log(data);}
								});
						});
			
		
			</script>
		</div>
	</main>
</body>
</html>