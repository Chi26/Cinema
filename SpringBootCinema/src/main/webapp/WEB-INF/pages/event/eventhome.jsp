<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="tw.cinema.model.Movie"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Controller</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
<%@include file="../Dashboard.jsp"%>
	
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<div align="center">
	 <div align="right">
	<form action="insertevent.controller" method="get">
			<button type="submit" value="send" class="btn btn-success">新增活動</button>
		</form>
		</div>
		<h1>活動管理</h1>
	
	    <br>
		

	
    <br>
    <div class="table-responsive">
	<table class="table table-striped align-middle">
		 <thead>
		<tr>
			<th scope="col" class="fs-4">編號</th>
			<th scope="col" class="fs-4">名稱</th>
			<th scope="col" class="fs-4">開始</th>
			<th scope="col" class="fs-4">結束</th>
			<th scope="col" class="fs-4">地點</th>
			<th scope="col" class="fs-4">辦法</th>
			
			<th scope="col" class="fs-4">圖片</th>
            <th scope="col" class="fs-4"></th>
            <th scope="col" class="fs-4"></th>
		</tr>
		 </thead>
		<tbody>
		<c:forEach items="${allEvents}" var="element">

			<tr>
				<th class="fs-5" scope="row"><c:out value="${element.event_No}" /></th>
				<td class="fs-5" ><c:out value="${element.event_Name}" /></td>
				
				<td class="fs-5" ><c:out value="${element.begin_Date}" /></td>
				<td class="fs-5" ><c:out value="${element.end_Date}" /></td>
				<td class="fs-5" ><c:out value="${element.location}" /></td>
				<td class="fs-5" ><c:out value="${element.method}" /></td>
				
				
				<td><img src="/upload/${element.filename}" height="200"
					width="150"></td>

				<td>
					<form action="findEventById/${element.event_No}" method="get">
						<button type="submit" value="send" class="btn btn-success">修改</button>
					</form>

				</td> 
				<td>
					<form action="deleteEvent/${element.event_No}" method="get">
						<button type="submit" value="send" class="btn btn-success">刪除</button>
					</form>
				</td> 
			</tr>


		</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	</div>
	</main>
</body>
</html>