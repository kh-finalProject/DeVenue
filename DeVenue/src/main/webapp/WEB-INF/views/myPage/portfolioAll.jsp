<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">


<!--responsive meta tag-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Landing Page - Start Bootstrap Theme</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!--jQuery-->
<script src="http://code.jquery.com/jquery-Latest.min.js"></script>

<style>
body {
	font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-weight: 700;
}

header.masthead {
	position: relative;
	background-color: #343a40;
	background: url("mainImg.jpg") no-repeat center center;
	background-size: cover;
	padding-top: 8rem;
	padding-bottom: 8rem;
	height: 50rem;
}

header.masthead .overlay {
	position: absolute;
	background-color: #212529;
	height: 100%;
	width: 100%;
	top: 0;
	left: 0;
	opacity: 0.3;
}

header.masthead h1 {
	font-size: 2rem;
}

@media ( min-width : 768px) {
	header.masthead {
		padding-top: 12rem;
		padding-bottom: 12rem;
	}
	header.masthead h1 {
		font-size: 3rem;
	}
}

.showcase .showcase-text {
	padding: 3rem;
}

.showcase .showcase-img {
	min-height: 30rem;
	background-size: cover;
}

@media ( min-width : 768px) {
	.showcase .showcase-text {
		padding: 7rem;
	}
}

footer.footer {
	padding-top: 4rem;
	padding-bottom: 4rem;
}

#navbarMain>ul>li>a {
	color: white;
}

#navbarMain>ul>li>a:hover {
	color: lightblue;
}

@import url('https://fonts.googleapis.com/css?family=Roboto');

* {
	margin: 0;
	padding: 0;
}

i {
	margin-right: 10px;
}

/*------------------------*/

/*----------step-wizard------------*/
.d-flex {
	display: flex;
}

.justify-content-center {
	justify-content: center;
}

.align-items-center {
	align-items: center;
}

/*---------signup-step-------------*/
.signup-step-container {
	padding: 150px 0px;
	padding-bottom: 60px;
}

.wizard .tab-pane {
	position: relative;
	padding-top: 20px;
}

.footer-link {
	margin-top: 30px;
}

.list-inline li {
	display: inline-block;
}

@media ( max-width : 767px) {
	.wizard .nav-tabs>li a i {
		display: none;
	}
}

.back-to-top {
	position: fixed;
	bottom: 100px;
	right: 20px;
	display: none;
	z-index: 100;
}

/* 프로세스 관련 style */
.wizard .nav-tabs {
	position: relative;
	margin-bottom: 0;
	border-bottom-color: transparent;
}

.wizard>div.wizard-inner {
	position: relative;
	margin-bottom: 50px;
	text-align: center;
}

.connecting-line {
	height: 4px;
	background: #e0e0e0;
	position: absolute;
	width: 80%;
	margin: 0 auto;
	left: 0;
	right: 0;
	top: 10px;
	z-index: 1;
}

.wizard .nav-tabs>li.active>a, .wizard .nav-tabs>li.active>a:hover,
	.wizard .nav-tabs>li.active>a:focus {
	color: #555555;
	cursor: default;
	border: 0;
	border-bottom-color: transparent;
}

span.round-tab {
	width: 80px;
	height: 80px;
	line-height: 70px;
	display: inline-block;
	border-radius: 50%;
	background: #fff;
	z-index: 2;
	position: absolute;
	left: -30px;
	top: -30px;
	text-align: center;
	font-size: 30px !important;
	color: #0e214b;
	font-weight: 700;
	border: 1px solid #ddd;
}

span.round-tab i {
	color: #fff;
}

.wizard li.active span.round-tab {
	background: #2793F2;
	color: #fff;
	border-color: #2793F2;
}

.wizard li.active span.round-tab i {
	color: #5bc0de;
}

.wizard .nav-tabs>li.active>a i {
	color: #2793F2;
}

.wizard .nav-tabs>li {
	width: 25%;
}

.wizard li:after {
	content: " ";
	position: absolute;
	left: 46%;
	opacity: 0;
	margin: 0 auto;
	bottom: 0px;
	border: 5px solid transparent;
	border-bottom-color: red;
	transition: 0.1s ease-in-out;
}

.wizard .nav-tabs>li a {
	width: 30px;
	height: 30px;
	margin: 20px auto;
	border-radius: 100%;
	padding: 0;
	background-color: transparent;
	position: relative;
	top: 0;
}

.wizard .nav-tabs>li a i {
	position: absolute;
	top: -53px;
	font-style: normal;
	font-weight: 400;
	white-space: nowrap;
	left: 51%;
	padding-left: 15px;
	transform: translate(-50%, -50%);
	font-size: 18px;
	font-weight: 700;
	color: #fff;
	font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP',
		'Sans-serif' !important;
}

.wizard .nav-tabs>li a:hover {
	background: transparent;
}

/* 프로세스 style 끝 */

/* 메인메뉴 마우스 호버 효과 */
.hvr-underline-from-center {
	display: inline-block;
	vertical-align: middle;
	-webkit-transform: perspective(1px) translateZ(0);
	transform: perspective(1px) translateZ(0);
	box-shadow: 0 0 1px rgba(0, 0, 0, 0);
	position: relative;
	overflow: hidden;
}

.hvr-underline-from-center:before {
	content: "";
	position: absolute;
	z-index: -1;
	left: 51%;
	right: 51%;
	bottom: 0;
	background: #2098D1;
	height: 4px;
	-webkit-transition-property: left, right;
	transition-property: left, right;
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-timing-function: ease-out;
	transition-timing-function: ease-out;
}

.hvr-underline-from-center:hover:before, .hvr-underline-from-center:focus:before,
	.hvr-underline-from-center:active:before {
	left: 0;
	right: 0;
}

/* 마우스 호버 끝 */

/* 메뉴바 폰트 */
#navbarSub ul li a, #navbarMain ul li a {
	font-family: 'Jua', sans-serif;
}

/* 메뉴바 폰트 끝 */

/* 글자색 */
section {
	background-color: #212426;
	width: 100%;
	height: 1600px;
	padding: 50px 0 30px 0;
	color: white;
}

/* input태그 size */
.input-size {
	width: 400px;
	height: 50px;
	margin-left: 40px;
}

/* 어느페이지인지 보여줄 div */
.main-title {
	width: 100%;
	height: 60px;
	margin-left: 5%;
	padding-right: 0;
	border-bottom: 2px dashed white;
}

/* 포트폴리오전부를 보여줄 div*/
.portfolio-view {
	width: 100%;
	height: 350px;
	margin-left: 5%;
	margin-top: 2%;
	border-bottom: 2px dashed grey;
	position: relative;
}

/* 포트폴리오의 각 div */
.portfolio-view .portfolio-info {
	width: 220px;
	height: 310px;
	margin-left: 2%;
	border: 2px solid white;
	display: inline-block;
}

/* 포트폴리오의 카테고리 */
.portfolio-category {
	position: absolute;
	text-align: center;
	margin: auto;
}

/* 포트폴리오의 제목 */
.portfolio-title {
	position: absolute;
	text-align: left;
	margin: auto;
	margin-top: 10px;
}

/* a태그 밑줄없애기 */
#subInfoMenu p a {
	text-decoration-line: none;
	color: white;
}
</style>
<script src="https://kit.fontawesome.com/4b6b63d8f6.js"
	crossorigin="anonymous"></script>

<!--font-->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<!-- chart -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>

<body>
	<!-- munubar -->
	<jsp:include page="../common/menubar.jsp" />
	<!-- sidebar -->
	<jsp:include page="../common/sideMenubarAll.jsp" />

	<!-- Section -->
	<br>
	<section>
		<!-- 왼쪽 공백 -->
		<!-- <div class="left-null" style="width: 15%; height: 1600px; border: 1px solid yellow; float: left;"></div> -->
		<!-- 실제 들어갈 값 -->
		<!-- <div class="center" style="width: 1140px; margin: auto; text-align: center;"> -->
		<div class="container">
			<div class="row text-white"
				style="border-bottom: 1px solid lightgray; width: 1000px;">
				<div class="col-12"
					style="padding: 3%; font-size: 150%; font-family: 'Jua', sans-serif;">
					${loginUser.memNick } 마이페이지</div>
			</div>
			<div class="row">
				<jsp:include page="../common/myPageMenubar.jsp" />
			</div>
			<div class="col-8 text-white" style="font-family: 'Jua', sans-serif;">
				<br>
				<div class="row">
					<div class="col-12 main-title">
						<p style="float: left; font-size: 30px;">마이페이지 - 포트폴리오</p>
						<a href="mypageAllInfo.html" class="btn btn-info"
							style="float: right;">내 프로필에서 보기</a>
					</div>

					<div class="col-12" style="margin-left: 5%; margin-top: 5%;">
						<h4>
							포트폴리오<span id="num" style="color: grey;"> / 0개 </span> <a
								href="portfolioInsert.do" class="btn btn-info"
								style="float: right;">추가하기</a>
						</h4>
					</div>
					<div class="col-12 portfolio-view">
						<!-- 하나의 포트폴리오 시작 -->
						<c:forEach var="i" begin="0" end="2">
							<div class="col-4 portfolio-info" style="margin-top: 3%;">
								<div class="col-12" style="height: 70%;">
									<div class="col-11 portfolio-category looking-btn"
										style="margin-top: 10px; margin-left: 30px; visibility: visible;">
										<button type="button" class="btn btn-info">삭제</button>
										<a href="mypagePortfolioUpdate.html" class="btn btn-info">수정</a>
									</div>
									<div class="col-12 portfolio-category"
										style="margin-top: 50px;">
										<h4>디자인</h4>
									</div>
									<div class="col-12 portfolio-category"
										style="margin-top: 135px;">
										<h5>어플리케이션</h5>
									</div>
								</div>
								<div class="col-12"
									style="height: 30%; border-top: 2px dashed grey;">
									<!-- <h5>1. 제목을 작성하는 곳입니다.</h5> -->
									<div class="col-11 portfolio-title">
										<span>제목을 입력</span>
									</div>
								</div>
							</div>
							<script>
								// div 클릭시 그 포트폴리오 정보를 띄어주기
								$(".portfolio-info").on("click", function() {
									location.href = "mypagePortfolio.html";
								})

								// 수정,삭제 숨기고 보이게하기
								$(".portfolio-info").mouseover(
										function() {
											//$(".looking-btn").show();
											$(".looking-btn").css({"visibility":"visible"});
										})
								$(".portfolio-info").mouseout(
										function() {
											//$(".looking-btn").hide();
											$(".looking-btn").css({"visibility":"hidden"});
										})
								
								// 포트폴리오가 증가시 id 생성해서 넣기
							</script>
							<!-- 하나의 포트폴리오 끝 -->
						</c:forEach>

						<!-- <div class="col-4 portfolio-info"></div>
						<div class="col-4 portfolio-info"></div> -->
					</div>
				</div>
			</div>
		</div>

		<!-- </div> -->

		<!-- 오른쪽 공백 -->
		<!-- <div class="right-null" style="width: 15%; height: 800px; border: 1px solid yellow; float: right;"></div> -->
	</section>
	<br>


	<!-- Footer -->
	<jsp:include page="../common/footer.jsp" />

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>

</html>