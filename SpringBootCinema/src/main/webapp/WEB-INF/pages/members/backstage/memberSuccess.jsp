<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.footer{
position:absolute;
top:430px;
left:480px
}
button{
 background-color: #FFC300 ;
 color: white;
 padding: 12px 20px;
 border: none;
 border-radius: 4px;
 cursor: pointer;
}
</style>
<title>success page</title>
</head>
<body>
<%@include file="../../Header.jsp"%>
<div align="center">
<h1>操作成功</h1>
<p><a href="/admins/welcomeadmin"><button>返回</button></a></p>
<img src="/images/success.png">
</div>
<div class="footer">
<%@include file="../../footer.jsp"%>
</div>
</body>
</html>