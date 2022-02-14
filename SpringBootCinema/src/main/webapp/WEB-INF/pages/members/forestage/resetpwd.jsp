<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>修改密碼</title>
<style type="text/css">
.col-sm-10 {
	height: 50px;
	width: 30%;
}

.gradient-custom {
	background: linear-gradient(120grad, rgb(100, 57, 134),
		rgb(152, 174, 213));
}

.card-registration .select-input.form-control[readonly]:not([disabled])
	{
	font-size: 1rem;
	line-height: 2.15;
	padding-left: .75em;
	padding-right: .75em;
}

.card-registration .select-arrow {
	top: 13px;
}
</style>
</head>
<body>


<header class="p-3 bg-dark text-white">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="/Home" class="nav-link px-2 text-white">Home</a></li>
					<li><a href="/movie/movieusermain.controller"
						class="nav-link px-2 text-white">電影</a></li>
					<li><a href="/event/eventusermain.controller"
						class="nav-link px-2 text-white">活動</a></li>
					<li><a href="/shopping.mainPage"
						class="nav-link px-2 text-white">訂票</a></li>
					<li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
					<li><a href="#" class="nav-link px-2 text-white">About</a></li>
				</ul>
				
				<div class="text-end">
					<a href="/login/page">
						<button type="submit" class="btn btn-outline-light me-2">Login</button>
					</a>
				</div>
				<a href="/save">
					<button type="submit" class="btn btn-outline-light me-2">Sign
						in</button>
				</a>
			</div>
		</div>
	</header>


	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
							<form action="/vergeetpassword.controller" method="post">
								<br>
								<h2>修改密碼</h2>
								<hr />
								<br>
								<div class="form-group">
									<label for="username" class="col-sm-6 control-label">會員帳號</label>
									<div class="col-sm-12">
										<input type="text" class="form-control" name="username"
											id="username" placeholder="username" />
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="col-sm-6 control-label">會員新密碼</label>
									<div class="col-sm-12">
										<input type="password" class="form-control" name="password"
											id="password" placeholder="password" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<input type="submit" value="提交" class="btn btn-info" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>