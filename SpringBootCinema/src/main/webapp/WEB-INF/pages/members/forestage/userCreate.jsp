<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.cinema.model.Members"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<title>會員註冊</title>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
#error {
	color: red;
	font-size: 14px;
}
.v_code {
	width: 600px;
	margin: 0 auto;
}

.v_code>input {
	width: 60px
	height: 36px;
	margin-top: 10px;
}

.code_show {
	overflow: hidden;
}

.code_show span {
	display: block;
	float: left;
	margin-bottom: 10px;
}

.code_show a {
	display: block;
	float: left;
	margin-top: 10px;
	margin-left: 10px;
}

.code {
	font-style: italic;
	background-color: #f5f5f5;
	color: blue;
	font-size: 30px;
	letter-spacing: 3px;
	font-weight: bolder;
	float: left;
	cursor: pointer;
	padding: 0 5px;
	text-align: center;
}

#inputCode {
	width: 100px;
	height: 30px;
}

a {
	text-decoration: none;
	font-size: 20px;
	color: #288bc4;
	cursor: pointer;
}

a:hover {
	text-decoration: underline;
}
.card-body {
background: LightGray;
box-shadow: 0 0 40px rgba(8,7,16,0.6);
}

.card-registration .select-input.form-control[readonly]:not([disabled]) {
  font-size: 1rem;
  line-height: 2.15;
  padding-left: .75em;
  padding-right: .75em;
}
.card-registration .select-arrow {
  top: 13px;
}
span{
font-size:10px;
color:grey
}

</style>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function ajax1() {
		$.ajax({
			type : 'post',
			url : '/ajax1',
			success : function(data) {
				if (date.toString == "帳戶已存在") {
					console.log("test");
					$("#test").css("color", "green");
				}
			}

		});
	}
</script>
<head>
<body>

<header class="p-3 bg-dark text-white">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="/"
					class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
					<svg class="bi me-2" width="40" height="32" role="img"
						aria-label="Bootstrap">
						<use xlink:href="#bootstrap" /></svg>
				</a>

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-5 justify-content-center mb-md-0">
					<li><a href="/memberCenter" class="nav-link px-2 text-secondary">Home</a></li>
					<li><a href="/movie/movieusermain.controller"
						class="nav-link px-2 text-white">電影</a></li>
					<li><a href="/event/eventusermain.controller"
						class="nav-link px-2 text-white">活動</a></li>
						<li><a href="/shopping.mainPage"
						class="nav-link px-2 text-white">訂票</a></li>
					<li><a href="/menu.controller" class="nav-link px-2 text-white">訂餐</a></li>
					<li><a href="#" class="nav-link px-2 text-white">About</a></li>
				</ul>
				
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
							<h3 class="mb-4 pb-2 pb-md-0 mb-md-5">會員註冊</h3>

							<form class="" th:action="@{/user/save}" method="post">
								<div class="row">

									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="text" class="form-control form-control-lg"
												name="username" id="username" placeholder="帳號" />
											<div id="error">${errors.username}</div>
										</div>
									</div>

									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="text" class="form-control form-control-lg"
												name="name" id="name" placeholder="姓名" />
											<div id="error">${errors.name}</div>
										</div>
									</div>
									
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="password" class="form-control form-control-lg"
												name="password" id="password" placeholder="密碼" />
												<div class="col-auto">
												<span id="passwordHelpInline" class="form-text">
													請輸入英數字或_，且長度為6~10位字元 </span>
											</div>
											<div id="error">${errors.password}</div>
										</div>
									</div>
									
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="email" class="form-control form-control-lg"
												name="email" id="email" placeholder="信箱" />
											<div id="error">${errors.email}</div>
										</div>
									</div>
									
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="text" class="form-control form-control-lg"
												name="id" id="id" placeholder="身分證字號" />
											<div id="error">${errors.id}</div>
										</div>
									</div>
									
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="text" class="form-control form-control-lg"
												name="phone" id="phone" placeholder="聯絡資訊" />
											<div id="error">${errors.phone}</div>
										</div>
									</div>
									
									<div class="col-md-12 mb-4">
										<div class="form-outline">
											<input type="text" class="form-control form-control-lg"
												name="address" id="address" placeholder="住址" />
											<div id="error">${errors.address}</div>
										</div>
									</div>
									
									<div class="col-md-6 mb-4">
										<div class="form-outline">
											<input type="date" class="form-control form-control-lg"
												name="birthday" id="birthday" placeholder="生日" />
											<div id="error">${errors.birthday}</div>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-sm-10">
											<input type="hidden" class="form-control" name="role"
												id="role" value="ROLE_User" />
										</div>
									</div>

									<div class="col-12">

										<div class="policy">
											<textarea class="form-control" rows="10" readonly>
歡迎您光臨超級影城官方網站（以下簡稱本網站），為了讓您能夠安心使用本網站的各項服務與資訊，特此向您說明本網站的隱私權保護政策，以保障您的權益，請您詳閱下列內容：

一、隱私權保護政策的適用範圍
隱私權保護政策內容，包括本網站如何處理在您使用網站服務時收集到的個人識別資料。隱私權保護政策不適用於本網站以外的相關連結網站，也不適用於非本網站所委託或參與管理的人員。

二、個人資料的蒐集、處理及利用方式
當您造訪本網站或使用本網站所提供之功能服務時，我們將視該服務功能性質，請您提供必要的個人資料，並在該特定目的範圍內處理及利用您的個人資料；非經您書面同意，本網站不會將個人資料用於其他用途。 本網站在您使用服務信箱、問卷調查等互動性功能時，會保留您所提供的姓名、電子郵件地址、聯絡方式及使用時間等。 於一般瀏覽時，伺服器會自行記錄相關行徑，包括您使用連線設備的IP位址、使用時間、使用的瀏覽器、瀏覽及點選資料記錄等，做為我們增進網站服務的參考依據，此記錄為內部應用，決不對外公佈。 為提供精確的服務，我們會將收集的問卷調查內容進行統計與分析，分析結果之統計數據或說明文字呈現，除供內部研究外，我們會視需要公佈統計數據及說明文字，但不涉及特定個人之資料。

三、資料之保護
本網站主機均設有防火牆、防毒系統等相關的各項資訊安全設備及必要的安全防護措施，加以保護網站及您的個人資料採用嚴格的保護措施，只由經過授權的人員才能接觸您的個人資料，相關處理人員皆簽有保密合約，如有違反保密義務者，將會受到相關的法律處分。 如因業務需要有必要委託其他單位提供服務時，本網站亦會嚴格要求其遵守保密義務，並且採取必要檢查程序以確定其將確實遵守。

四、網站對外的相關連結
本網站的網頁提供其他網站的網路連結，您也可經由本網站所提供的連結，點選進入其他網站。但該連結網站不適用本網站的隱私權保護政策，您必須參考該連結網站中的隱私權保護政策。

五、與第三人共用個人資料之政策
本網站絕不會提供、交換、出租或出售任何您的個人資料給其他個人、團體、私人企業或公務機關，但有法律依據或合約義務者，不在此限。
前項但書之情形包括不限於：
1. 經由您書面同意。
2. 法律明文規定。
3. 為免除您生命、身體、自由或財產上之危險。
4. 與公務機關或學術研究機構合作，基於公共利益為統計或學術研究而有必要，且資料經過提供者處理或蒐集著依其揭露方式無從識別特定之當事人。
5. 當您在網站的行為，違反服務條款或可能損害或妨礙網站與其他使用者權益或導致任何人遭受損害時，經網站管理單位研析揭露您的個人資料是為了辨識、聯絡或採取法律行動所必要者。
6. 有利於您的權益。
7. 本網站委託廠商協助蒐集、處理或利用您的個人資料時，將對委外廠商或個人善盡監督管理之責。

六、Cookie之使用
為了提供您最佳的服務，本網站會在您的電腦中放置並取用我們的Cookie，若您不願接受Cookie的寫入，您可在您使用的瀏覽器功能項中設定隱私權等級為高，即可拒絕Cookie的寫入，但可能會導至網站某些功能無法正常執行 。

七、隱私權保護政策之修正
本網站隱私權保護政策將因應需求隨時進行修正，修正後的條款將刊登於網站上。
						</textarea>
										</div>


										<div class="form-check">
											<input class="form-check-input is-invalid" type="checkbox"
												value="" id="invalidCheck3"
												aria-describedby="invalidCheck3Feedback" required> <label
												class="form-check-label" for="invalidCheck3">
												同意本網站之隱私權條款 </label>
											<div id="invalidCheck3Feedback" class="invalid-feedback">
												送出此表單前須勾選同意</div>
										</div>
									</div>

									<div class="v_code">
										<div class="code_show">
											<span class="code" id="checkCode"></span> <a id="linkbt">看不清換一張</a>
										</div>
										<div class="input_code">
											<label for="inputCode">驗證碼：</label> <input type="text"
												id="inputCode" /> <span id="text_show"></span>
										</div>
									</div>


									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<input type="submit" value="提交" class="btn btn-info"
												id="submit" /> &nbsp; &nbsp; &nbsp; <input type="reset"
												value="重置" class="btn btn-info" />&nbsp; &nbsp; &nbsp; <input
												type="button" value="錯誤" class="btn btn-info" id="one" />
											&nbsp; &nbsp; &nbsp; <input type="button" value="正確"
												class="btn btn-info" id="two" />
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">
		//驗證碼
		var code;
		function createCode() {
			code = "";
			var codeLength = 6; //驗證碼的長度
			var checkCode = document.getElementById("checkCode");
			var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b',
					'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
					'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
					'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
					'Y', 'Z');
			for (var index = 0; index < codeLength; index++) {
				var charNum = Math.floor(Math.random() * 52);
				code += codeChars[charNum];
			}
			if (checkCode) {
				checkCode.className = "code";
				checkCode.innerHTML = code;
			}
		}
		function validateCode() {
			var inputCode = document.getElementById("inputCode").value;
			var textShow = document.getElementById("text_show")
			if (inputCode.length <= 0) {
				textShow.innerHTML = "請輸入驗證碼";
				textShow.style.color = "red";
			} else if (inputCode.toUpperCase() != code.toUpperCase()) {
				textShow.innerHTML = "您輸入的驗證碼有誤";
				textShow.style.color = "red";
				createCode();
			} else {
				textShow.innerHTML = "驗證碼正確";
				textShow.style.color = "green";
			}
		}
		function checkCode() {
			var btn = document.getElementById("submit");
			btn.onclick = function() {
				validateCode();
			}
		}
		window.onload = function() {
			checkCode();
			createCode();
			document.getElementById("checkCode").onclick = function() {
				createCode()
			}
			linkbt.onclick = function() {
				createCode()
			}
			inputCode.onclick = function() {
				validateCode();
			}
		}
		//一鍵輸入
		$("#one").click(function(event) {
			$('#username').val("Nora");
			$('#name').val("郭惠美");
			$('#password').val("3");
			$('#email').val("Nora@gmail.com");
			$('#id').val("4426");
			$('#phone').val("07231");
			$('#address').val("民生東路五段84號");
			$('#birthday').val("1966-03-15");
		});
		$("#two").click(function(event) {
			$('#username').val("Yvonne");
			$('#name').val("翁依帆");
			$('#password').val("Yvonne123");
			$('#email').val("mileycyrusmailfor@gmail.com");
			$('#id').val("A2779034412");
			$('#phone').val("0910237201");
			$('#address').val("桃園市中壢區元化路二段84號");
			$('#birthday').val("1999-03-20");
		});
	</script>
	<%@include file="../../footer.jsp"%>
</body>
</html>