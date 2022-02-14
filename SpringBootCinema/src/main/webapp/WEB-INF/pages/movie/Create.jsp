<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Movie</title>

<link rel="stylesheet" href="/css/create.css">
</head>

<body>


	<div class="container">
		<h2 align="center">新增電影</h2>
		<form action="MovieCreate.controller" method="post"
			enctype="multipart/form-data">
			<div class="row">
				<div align="center" class="col-25">

					<label for="moviename">電影名稱</label>
				</div>
				<div class="col-75">
					<input type="text" id="moviename" name="moviename"
						class="form-control" placeholder="">
				</div>
			</div>
			<div class="row">
				<div align="center" class="col-25">
					<label for="moviename">上映日期</label>
				</div>
				<div class="col-75">
					<input type="date" id="rdate" name="rdate">
				</div>
			</div>
			<div class="row">
				<div align="center" class="col-25">
					<label for="movielength">片長</label>
				</div>
				<div class="col-75">
					<input type="text" id="movielength" name="movielength"
						placeholder="">
				</div>
			</div>
			<div class="row">
				<div align="center" class="col-25">
					<label for="type">類型</label>
				</div>
				<div class="col-75">
					<input type="text" id="type" name="type" placeholder="">
				</div>
			</div>
			<div class="row">
				<div align="center" class="col-25">
					<label for="grading">級別</label>
				</div>
				<div class="col-75">
					<input type="text" id="grading" name="grading" placeholder="">
				</div>
			</div>
			<div class="row">
				<div align="center" class="col-25">
					<label for="release">上映狀況</label>
				</div>
				<div class="col-75">
					<input type="text" id="release" name="releases" placeholder="">
				</div>
			</div>
			<div class="row">
				<div align="center" class="col-25">
					<label for="director">導演</label>
				</div>
				<div class="col-75">
					<input type="text" id="director" name="director" placeholder="">
				</div>
			</div>
			<div class="row">
				<div align="center" class="col-25">
					<label for="actor">演員</label>
				</div>
				<div class="col-75">
					<input type="text" id="actor" name="actor" placeholder="">
				</div>
			</div>
			<div class="row">
				<div align="center" class="col-25">
					<label for="vedio_url">Vedio URL</label>
				</div>
				<div class="col-75">
					<input type="text" id="vedio_url" name="vedio_url" placeholder="">
				</div>
			</div>
			<div class="row">
				<div align="center" class="col-25">
					<label for="file">圖片上傳</label>
				</div>
				<div class="col-75">
					<input type="file" id="files" name="files" placeholder="">
				</div>

			</div>

			<div class="row">
				<div align="center" class="col-25">
					<label for="intro">介紹</label>
				</div>
				<div class="col-75">
					<textarea id="intro" name="intro" placeholder=""
						style="height: 200px"></textarea>
				</div>
			</div>
			<br>
			<div class="row">
				<input type="submit" class="btn btn-primary" name="INSERT"
					value="新增電影">
			</div>
			<div >
				<input type="button" class="btn btn-primary" value="一鍵輸入" id="one" />
			</div>
		</form>

	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">
		//一鍵輸入
		$("#one")
				.click(
						function(event) {
							$('#moviename').val("蝙蝠俠");
							$('#rdate').val("2022-02-04");
							$('#movielength').val("126");
							$('#type').val("動作");
							$('#grading').val("輔導級");
							$('#release').val("上映中");
							$('#director').val("麥特李維斯");
							$('#actor').val("羅伯派汀森、柔伊克拉維茲");
							$('#vedio_url')
									.val(
											"https://www.youtube.com/embed/S3vJy9EG6JE");
							$('#intro')
									.val(
											"由導演麥特李維斯執導、羅伯派汀森主演的【蝙蝠俠】即將上映！布魯斯韋恩雖然是高譚市首富家族的繼承者，性格卻非常孤僻，同時在夜晚化身為蝙蝠俠打擊罪犯。當謎天大聖留下新的謎題，設下陷阱殺害高譚市的菁英份子後，蝙蝠俠循著神祕線索，並與貓女聯手為高譚市伸張正義。");
						});
	</script>
</body>
</html>