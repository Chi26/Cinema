<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Event</title>
<link rel="stylesheet" href="/css/create.css">
</head>

<body>
	<div class="container">
		<h2>新增活動</h2>
		<form action="EventCreate.controller" method="post"
			enctype="multipart/form-data">
			<div class="row">
				<div class="col-25">
					<label for="eventname">活動名稱</label>
				</div>
				<div class="col-75">
					<input type="text" id="eventname" name="eventname" placeholder="">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="begindate">開始時間</label>
				</div>
				<div class="col-75">
					<input type="date" id="begindate" name="begindate">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="enddate">結束時間</label>
				</div>
				<div class="col-75">
					<input type="date" id="enddate" name="enddate">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="location">地點</label>
				</div>
				<div class="col-75">
					<input type="text" id="location" name="location" placeholder="">
				</div>
			</div>
				<div class="row">
				<div class="col-25">
					<label for="method">活動辦法</label>
				</div>
				<div class="col-75">
					<textarea id="method" name="method" placeholder=""
						style="height: 200px"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="notice">注意事項</label>
				</div>
				<div class="col-75">
					<textarea id="notice" name="notice" placeholder=""
						style="height: 200px"></textarea>
				</div>
			</div>


			<div class="row">
				<div class="col-25">
					<label for="file">File Upload</label>
				</div>
				<div class="col-75">
					<input type="file" id="files" name="files" placeholder="">
				</div>

			</div>


			<br>
			<div class="row">
				<input type="submit" name="INSERT" value="新增活動">
			</div>
			<div >
				<input type="button"  value="一鍵輸入" id="one" />
			</div>
		</form>


	</div>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">
		//一鍵輸入
		$("#one").click(
						function(event) {
							$('#eventname').val("歲末新年感恩回饋");
							$('#begindate').val("2022-02-04");
							$('#enddate').val("2022-05-04");
							$('#location').val("影城");
							$('#method').val("凡購買MAPPA版本電影票2張+販賣部餐飲100元(含)以上發票");
							$('#notice').val("贈品圖片僅供參考，款式隨機，規格以實際為主，得獎者不得要求折現或轉換其他商品。");
							
							
							
						});
	</script>
</body>
</html>