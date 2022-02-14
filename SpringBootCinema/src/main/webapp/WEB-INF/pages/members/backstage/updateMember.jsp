<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>資料更新</title>

<link rel="stylesheet" href="/css/memberUpdate.css">
</head>
<body>
	<div class="container" align="center">
		<h2 align="left">修改會員</h2>
		<form:form method="POST" action="updatemember"
			modelAttribute="members">
			<table>
				<tr>
					<td><form:label path="username">帳號:</form:label></td>
					<td><form:input path="username" /></td>
				</tr>
				<tr>
					<td><form:label path="name">姓名:</form:label></td>
					<td><form:input path="name" /></td>
				</tr>
				<tr>
					<td><form:label path="id">身分證字號:</form:label></td>
					<td><form:input path="id" /></td>
				</tr>
				<tr>
					<td><form:label path="phone">聯絡資訊:</form:label></td>
					<td><form:input path="phone" /></td>
				</tr>
				<tr>
					<td><form:label path="address">地址:</form:label></td>
					<td><form:input path="address" /></td>
				</tr>
				<tr>
					<td><form:label path="birthday">生日:</form:label></td>
					<td><form:input path="birthday" /></td>
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

					<td colspan="2"><form:hidden accesskey="account_No"
							id="account_No" path="account_No" /></td>
				</tr>
				<tr>

					<td colspan="2"><form:hidden accesskey="email" id="email"
							path="email" /></td>
				</tr>
				<tr>

					<td colspan="2"><form:hidden accesskey="password"
							id="password" path="password" /></td>
				</tr>

				<tr>
					<td colspan="2"><form:button value="Send" class="submit">Submit</form:button></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>