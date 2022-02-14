<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料</title>
<style type="text/css">
html, body {
	height: 100%;
}

body {
	margin: 0;
	background: linear-gradient(45deg, #49a09d, #5f2c82);
	font-family: sans-serif;
	font-weight: 100;
}

.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

table {
	width: 800px;
	border-collapse: collapse;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 15px;
	background-color: rgba(255, 255, 255, 0.2);
	color: #fff;
}

th {
	text-align: left;
}

thead {th { background-color:#55608f;
	
}

}
tbody {tr { &:hover {
			background-color : rgba(255, 255, 255, 0.3);
	
}

}
td {
	position: relative; &: hover { & : before { 
				 content : "";
	position: absolute;
	left: 0;
	right: 0;
	top: -9999px;
	bottom: -9999px;
	background-color: rgba(255, 255, 255, 0.2);
	z-index: -1;
}

}
}
}
#error {
	font-size: 10px;
	color: red;
	font-family: "Helvetica", "Arial", "LiHei Pro", "黑體-繁", "微軟正黑體",
		sans-serif;
}

.submit {
  display:inline-block;
  background: white;
  border: 1px solid #61a3e5;
  border-radius: 21px;
  padding: 7px 40px 7px 20px;
  color: #61a3e5;
  font-size: 17px;
  cursor:pointer;
  transition: all .3s ease;
}

.submit:hover {
  background: #61a3e5;
  color: #fff;
}

</style>
</head>
<body>
	<div class="container">
		<form:form method="Post" action="insertUser" modelAttribute="members" >
			<table>
				 <tr>
					<td><form:label path="username">帳號:</form:label></td>
					<td><form:input path="username" id="username"
							required="required" /></td>
					<td id="error">${errors.username}</td>
				</tr> 
				<tr>
					<td><form:label path="name">姓名:</form:label></td>
					<td><form:input path="name" id="name" required="required" /></td>
					<td id="error">${errors.name}</td>
				</tr>
				<tr>
					<td><form:label path="password">密碼:</form:label></td>
					<td><form:input path="password" id="password"
							required="required" /></td>
					<td id="error">${errors.password}</td>
				</tr>
				<tr>
					<td><form:label path="email">信箱:</form:label></td>
					<td><form:input path="email" type="email" id="email"
							required="required" /></td>
					<td id="error">${errors.email}</td>
				</tr>
				<tr>
					<td><form:label path="id">身分證字號:</form:label></td>
					<td><form:input path="id" id="id" required="required" /></td>
					<td id="error">${errors.id}</td>
				</tr>
				<tr>
					<td><form:label path="phone">聯絡資訊:</form:label></td>
					<td><form:input path="phone" id="phone" required="required" /></td>
					<td id="error">${errors.phone}</td>
				</tr>
				<tr>
					<td><form:label path="address">地址:</form:label></td>
					<td><form:input path="address" id="address"
							required="required" /></td>
					<td id="error">${errors.address}</td>
				</tr>
				<tr>
					<td><form:label path="birthday">生日:</form:label></td>
					<td><form:input path="birthday" type="date" id="birthday"
							required="required" /></td>
					<td id="error">${errors.birthday}</td>
				</tr>
				<tr>
					<td colspan="3"><form:hidden  accesskey="role" id="role" path="role" value="User"></form:hidden></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><form:button value="Send" class="submit">Submit</form:button></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>