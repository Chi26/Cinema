<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>超級影城菜單</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>

<style>
.mainpic{
	width:1430px;
	height:300px;
}

#img1{
	width:400px;
	height:300px;
	
}
.main{
	position: absolute;
	top: 400px;
	left:100px;
	width:600px;
}
.title{
	position: absolute;
	left:300px;
}
.adpic{
	position: absolute;
	top: 550px;
	left:750px;
}
.text{
	position: absolute;
	left:20px;
}
.text1{
	position: absolute;
	top: 150px;
}
</style>
<body>

	<%@include file="../Header.jsp"%>

	<div class="mainpic">
		<img src="/images/超級影城大圖.jpg" class="mainpic">
	</div>
	<div class="mid">
	<div class="main">
		<div class="text">首頁->影城介紹</div>	
		</br>
		</br>
		<div >
			<h2 class="title">關於超級影城</h2>
		<ul class="text1">
		<div>
		超級影城坐落於桃園市中壢區，鄰近桃園高鐵站，舉凡學生族群到新住民、新移工、粉領族及親子家庭，都是此據點主力消費者，優質的電影院，提供您最優質的觀影享受
		</div>
		</br>
		<li>現代感的視覺空間</li>
		<li>美食饗宴</li>
		<li>4XD座椅</li>
		<li>22公尺巨幅銀幕</li>
		</ul>
		</div>
	</div>
	
 	<div class="adpic">
    	<img id="img1" src="/images/介紹1.jpg" />    
  	</div>
  	</div>
</br>
</br>
</br>
<%@include file="map.jsp"%>




	
 <script>
    var pics = document.getElementById("img1");

    var i = 1;
    window.onload = function () {
      play=setInterval("changeImg()", 2000);
    }

    function changeImg() {      
      pics.src = "/images/介紹" + i + ".jpg";
   
      if (i >=4) {
        i=0;
      }
      i++;
    }

    
  </script>






	</form>
	
	
</body>
</html>