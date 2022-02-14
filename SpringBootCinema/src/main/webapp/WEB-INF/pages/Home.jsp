<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主頁面</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/carousel/">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/carousel.css">

<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

	<header class="p-3 bg-dark text-white">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="/Home" class="nav-link px-2 text-white">Home</a></li>
					<li><a href="/movie/movieusermain.controller"
						class="nav-link px-2 text-white">電影</a></li>
					<li><a href="/event/eventusermain.controller"
						class="nav-link px-2 text-white">活動</a></li>
					<li><a href="/shopping.mainPage"
						class="nav-link px-2 text-white">訂票</a></li>
					
					<li><a href="/introduce.controller" class="nav-link px-2 text-white">About</a></li>
				</ul>
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">

					<input type="search" id="search"
						class="form-control form-control-dark" placeholder="Search..."
						aria-label="Search">

					<div id="info-lists"></div>

				</form>


				<div class="text-end">
					<a href="/login/page">
						<button type="submit" class="btn btn-outline-light me-2">Login</button>
					</a>
				</div>
				<a href="/save">
					<button type="submit" class="btn btn-outline-light me-2">Sign
						in</button>
				</a>
		
			
				<form action="/logout" method="post">
					<button type="submit" class="btn btn-warning">Logout</button>
				</form>

			
		</div>
		</div>

	</header>

	<main>


		<div id="myCarousel" class="carousel slid top" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/images/123.jpeg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/images/12345.jpeg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/images/789.jpeg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>


		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->

		<div class="container marketing">



			<!-- START THE FEATURETTES -->

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						玩命關頭9 <span class="text-muted"></span>
					</h2>
					<p class="lead">馮迪索飾演的唐老大和莉蒂與他的兒子小布萊恩，正在過著與世隔絕的平靜生活，但是他們都知道這種平靜的生活隨時隨地都會受到致命危機的威脅。這次，這個威脅將逼迫唐老大面對他過去犯下的罪孽，如果他想要拯救他最愛的人們。他的團隊將再度攜手合作，槓上他們遇過最高竿的職業刺客和飆速車手，並且阻止他摧毀全世界的邪惡計畫。</p>
				</div>
				<div class="col-md-5">
					<img alt=".." src="/images/88.jpeg" width="500" height="500">

				</div>
			</div>

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7 order-md-2">
					<h2 class="featurette-heading">
						蜘蛛人：無家日 <span class="text-muted"></span>
					</h2>
					<p class="lead">故事接續《蜘蛛人：離家日》片尾，描述號角日報對外公佈了蜘蛛人真實身份是彼得帕克後，警察指控他利用無人機殺害神秘法師，讓彼得帕克遭到輿論攻擊、而他與親友的生活也大受影響。為了改變現況，絕望的彼得帕克找上了「奇異博士」，希望他施展法術讓大家忘記他是蜘蛛人的事實。</p>
				</div>
				<div class="col-md-5 order-md-1">
					<img alt=".." src="/images/55.jpeg" width="500" height="500">

				</div>
			</div>



			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						金牌特務：金士曼起源 <span class="text-muted"></span>
					</h2>
					<p class="lead">當史上最殘暴的暴君與犯罪主謀齊聚一堂，密謀策劃一場足以讓世上數百萬人斷命的血腥戰爭時，一位偉大的紳士挺身而出，憑藉著他兒子的幫助、可靠的助手，以及風格極致的裝備，他們將分秒必爭地阻止這場悲劇發生，而這就是「金牌特務」的誕生。</p>
				</div>
				<div class="col-md-5">
					<img alt=".." src="/images/77.jpeg" width="500" height="500">

				</div>
			</div>

			<!-- /END THE FEATURETTES -->

		</div>
		<!-- /.container -->

		<%@include file="footer.jsp"%>

	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>
