<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">

<title>Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/dashboard.css">
<style type="text/css">
.container {
 position: absolute;
 width:1000px;
 top: 40px;
 left: 40px;
 
}
</style>


</head>
<body>

	<div class="container">
	<nav id="sidebarMenu"
		class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse">
		<div class="position-sticky pt-3">
			<ul class="nav flex-column">
			   <h2 style="color:white"> 管理系統</h2>
			
				<br>
				<li class="nav-item"><a class="nav-link" href="/admin/managermembers"> <span
						data-feather="shopping-cart"></span> <p style="color:white" class="fs-3">會員管理</p>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/movie/MovieQueryAll.controller/1"> <span
						data-feather="users"></span> <p style="color:white" class="fs-3">電影管理</p>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/event/EventQueryAll.controller"> <span
						data-feather="bar-chart-2"></span> <p style="color:white" class="fs-3">活動管理</p>
				</a></li>
				<li class="nav-item"><a class="nav-link" href=" /movieorder/ordermain.controller"> <span
						data-feather="layers"></span> <p style="color:white" class="fs-3">訂單管理</p>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/food.controller"> <span
						data-feather="layers"></span> <p style="color:white" class="fs-3">商品管理</p>
				</a></li>
					<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="/logout"> <span data-feather="home"></span>
						<p style="color:white" class="fs-3">登出</p>
				</a></li>
			</ul>

		</div>
	</nav>
</div>


</body>
</html>
