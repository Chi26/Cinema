<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.cinema.model.Members"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增資料</title>

<link rel="stylesheet" href="/css/memberInsert.css">
</head>
<body>
	<div class="container" align="center">
		<h2 align="left">新增會員</h2>
		<form:form method="Post" action="insertmember"
			modelAttribute="members">
			<table>
				<tr>
					<td class="label"><form:label path="username">帳號</form:label></td>
					<td><form:input class="username" path="username" id="username"
							required="required" /></td>
					<td id="error">${errors.username}</td>
				</tr>
				<tr>
					<td class="label"><form:label path="name">姓名</form:label></td>
					<td class="name"><form:input path="name" id="name"
							required="required" /></td>
					<td id="error">${errors.name}</td>
				</tr>
				<tr>
					<td class="label"><form:label path="password">密碼</form:label></td>
					<td class="password"><form:input type="password"
							path="password" id="password" required="required" /></td>
					<td id="error">${errors.password}</td>
				</tr>
				<tr>
					<td class="label"><form:label path="email">信箱</form:label></td>
					<td class="email"><form:input path="email" type="email"
							id="email" required="required" /></td>
					<td id="error">${errors.email}</td>
				</tr>
				<tr>
					<td class="label"><form:label path="id">身分證字號</form:label></td>
					<td class="id"><form:input path="id" id="id"
							required="required" /></td>
					<td id="error">${errors.id}</td>
				</tr>
				<tr>
					<td class="label"><form:label path="phone">聯絡資訊</form:label></td>
					<td class="phone"><form:input path="phone" id="phone"
							required="required" /></td>
					<td id="error">${errors.phone}</td>
				</tr>
				<tr>
					<td class="label"><form:label path="address">地址</form:label></td>
					<td class="address"><form:input path="address" id="address"
							required="required" /></td>
					<td id="error">${errors.address}</td>
				</tr>
				<tr>
					<td class="label"><form:label path="birthday">生日</form:label></td>
					<td class="birthday"><form:input path="birthday" type="date"
							id="birthday" required="required" /></td>
					<td id="error">${errors.birthday}</td>
				</tr>
				<tr>
					<td class="label"><form:label path="role">操作權限</form:label></td>
					<td class="role"><form:select path="role" id="role">
							<form:option value="--請選擇--" />
							<form:option value="ROLE_Admin" />
							<form:option value="ROLE_User" />
						</form:select></td>
					<td id="error">${errors.role}</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><form:button value="Send"
							class="submit">Submit</form:button></td>
				</tr>
			</table>
		</form:form>
	</div>
	<div>
		<input type="button" value="一鍵輸入" id="one" />
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">
		//一鍵輸入
		$("#one").click(function(event) {
			$('#username').val("Adele");
			$('#name').val("雲婉婷");
			$('#password').val("Adele123");
			$('#email').val("Adele123@gmail.com");
			$('#id').val("A269964426");
			$('#phone').val("0920907231");
			$('#address').val("台北市松山區民生東路五段84號");
			$('#birthday').val("1976-07-04");
		});
	</script>
</body>
</html>