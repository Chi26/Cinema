<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.cinema.model.Members"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
a{
font-size:20px;
}
</style>
</head>
<body>
	<header class="p-3 bg-dark text-white">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="/"
					class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
					<svg class="bi me-2" width="40" height="32" role="img"
						aria-label="Bootstrap">
						<use xlink:href="#bootstrap" /></svg>
				</a>

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="/memberCenter" class="nav-link px-2 text-secondary">Home</a></li>
					<li><a href="/movie/movieusermain.controller"
						class="nav-link px-2 text-white">電影</a></li>
					<li><a href="/event/eventusermain.controller"
						class="nav-link px-2 text-white">活動</a></li>
						<li><a href="/shopping.mainPage"
						class="nav-link px-2 text-white">訂票</a></li>
					<li><a href="/menu.controller" class="nav-link px-2 text-white">訂餐</a></li>
					<li></li>
					<li><a href="/introduce.controller" class="nav-link px-2 text-white">About</a></li>
				</ul>
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">

					<input type="search" id="search"
						class="form-control form-control-dark" placeholder="Search..."
						aria-label="Search">

					<div id="info-lists"></div>

				</form>


			<h4>歡迎您，${members.username}</h4>
             <br>
 
  <%Members members= (Members) session.getAttribute("members");%> 
                 &nbsp;&nbsp;
                 <a href="/users/edit" class="nav-link px-2 text-white"><button class="btn btn-primary"> 會員修改</button></a>
                 &nbsp;
				<div class="text-end">
					<form action="/logout" method="post">
						<button type="submit" class="btn btn-warning">Logout</button>
					</form>

				</div>
			</div>
		</div>
	</header>
</body>
</html>