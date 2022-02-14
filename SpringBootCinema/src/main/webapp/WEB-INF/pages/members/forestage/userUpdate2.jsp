<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.cinema.model.Members"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>會員資料修改</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
#error {
	color: red;
	font-size: 3px;
}

.card-body {
background: LightGray;
box-shadow: 0 0 40px rgba(8,7,16,0.6);
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
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<head>
<body>
<%@include file="../../Header.jsp"%>
	<section class="vh-100 gradient-custom">
		<div class="container py-5 h-100">
			<div class="row justify-content-center align-items-center h-100">
				<div class="col-12 col-lg-9 col-xl-7">
					<div class="card shadow-2-strong card-registration"
						style="border-radius: 15px;">
						<div class="card-body p-4 p-md-5">
							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">會員資料修改</h3>


							<form:form method="POST" action="/users/update"
								modelAttribute="members">
								<div class="row">

									<div class="col-md-6 mb-4">
										<div class="form-outline">
										<form:label path="username">帳號</form:label>
											<form:input path="username"
												class="form-control form-control-lg" id="username"
												placeholder="帳號" />
											<div id="error">${errors.username}</div>
										</div>
									</div>

									<div class="col-md-6 mb-4">
										<div class="form-outline">
										<form:label path="name">姓名</form:label>
											<form:input path="name" class="form-control form-control-lg"
												id="name" placeholder="姓名" />
											<div id="error">${errors.name}</div>
										</div>
									</div>

									<div class="col-md-6 mb-4">
										<div class="form-outline">
										<form:label path="email">信箱</form:label>
											<form:input path="email" class="form-control form-control-lg"
												id="email" placeholder="信箱" />
											<div id="error">${errors.email}</div>
										</div>
									</div>

									<div class="col-md-6 mb-4">
										<div class="form-outline">
										<form:label path="id">身分證字號</form:label>
											<form:input path="id" class="form-control form-control-lg"
												id="id" placeholder="身分證字號" />
											<div id="error">${errors.id}</div>
										</div>
									</div>

									<div class="col-md-6 mb-4">
										<div class="form-outline">
										<form:label path="phone">聯絡資訊</form:label>
											<form:input path="phone" class="form-control form-control-lg"
												id="phone" placeholder="聯絡資訊" />
											<div id="error">${errors.phone}</div>
										</div>
									</div>

									<div class="col-md-6 mb-4">
										<div class="form-outline">
										<form:label path="address">住址</form:label>
											<form:input path="address"
												class="form-control form-control-lg" id="address"
												placeholder="住址" />
											<div id="error">${errors.address}</div>
										</div>
									</div>

									<div>
										<form:hidden accesskey="account_No" id="account_No"
											path="account_No" />
									</div>
									<div>

										<form:hidden accesskey="birthday" id="birthday"
											path="birthday" />
									</div>
									<div>

										<form:hidden accesskey="role" id="role" path="role" />
									</div>
									<div>

										<form:hidden accesskey="password" id="password"
											path="password" />
									</div>
									<div>

										<form:hidden accesskey="account_No" id="account_No"
											path="account_No" />
									</div>

									<div class="col-sm-offset-2 col-sm-10">
										<form:button value="Send" class="submit btn btn-primary btn-lg">Submit</form:button>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		
	</script>
	<%@include file="../../footer.jsp"%>
</body>
</html>