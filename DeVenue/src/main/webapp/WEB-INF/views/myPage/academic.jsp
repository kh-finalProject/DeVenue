<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

/* a태그 밑줄없애기 */
#subInfoMenu p a {
	text-decoration-line: none;
	color: white;
}

/* 회원찾기 드롭다운 메뉴 */
.dropbtn {
	color: white;
	font-size: 16px;
	border: none;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: #ddd;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
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
	<%-- <jsp:include page="../common/menubar.jsp" /> --%>
	
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />

	<!--Top Button-->
	<a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top"
		role="button"><i class="fas fa-chevron-up" style="margin: 0"></i></a>
	<script>
		$(document).ready(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 10) {
					$('#back-to-top').css("display", "block")

				} else {
					$('#back-to-top').css("display", "none")

				}
			});
			// scroll body to 0px on click
			$('#back-to-top').click(function() {
				$('body,html').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});
	</script>

	<!--navigation bar 1-->
	<nav class="navbar navbar-expand-lg" style="background-color: black;">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarMain" aria-controls="navbarMain"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarMain">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="#"><img
						src="${contextPath }/resources/images/logo.png" height="80px"
						style="padding-bottom: 0; padding-top: 0; margin-top: 0; margin-bottom: 0;"><span
						class="sr-only">(current)</span></a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a
					class="nav-link hvr-underline-from-center mr-2"
					href="searchProjectList.do">프로젝트찾기</a></li>
				<li class="nav-item"><a
					class="nav-link hvr-underline-from-center mr-2"
					href="addProject.do">프로젝트등록</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link hvr-underline-from-center dropbtn" href="#">회원
						찾기</a>
					<div class="dropdown-content">
						<a href="clientList.do ">클라이언트 찾기</a> <a href="#">파트너스 찾기</a>
					</div></li>
			</ul>

			<ul class="navbar-nav ml-auto">
				<!-- 관리자 페이지, 파트너스/클라이언트페이지 -->
				<c:if test="${empty sessionScope.loginUser }">
					<!-- <button type="button" class="btn btn-secondary">LOGIN</button> -->
					<a href="loginpage.do" class="btn btn-secondary">LOGIN</a>
					<!-- <button type="button" class="btn btn-info" href="sign.do">SIGNIN</button> -->
					<a href="signpage.do" class="btn btn-info">SIGNIN</a>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser }">
					<!-- 관리자 로그인 -->
					<c:if
						test="${loginUser.userType eq 'UT1' || loginUser.userType eq 'UT2'}">
						<h3 align="right" style="color: white">
							<c:out value="${loginUser.userType }관리자" />
							<div class="btn-group">
								<button type="button" class="btn btn-info dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<img src="${contextPath }/resources/images/admin.png"
										height="50px" width="50px"
										style="border-radius: 50px 50px 50px 50px">
								</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">profile</a>
									<div class="dropdown-divider"></div>
									<c:url var="logout" value="logout.do" />
									<a class="dropdown-item" onclick="location.href='${logout }'">logout</a>
								</div>
							</div>
						</h3>
					</c:if>
					<!-- 사용자 로그인 -->
					<c:if
						test="${loginUser.userType eq 'UT3' || loginUser.userType eq 'UT4'}">
						<h3 align="right" style="color: white">
							<c:out value="${loginUser.userType }사용자" />
							<div class="btn-group">
								<button type="button" class="btn btn-info dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<!-- 클라이언트시 기본 이미지 -->
									<c:if test="${loginUser.userType eq 'UT3' }">
										<img src="${contextPath }/resources/images/client.png"
											height="50px" width="50px"
											style="border-radius: 50px 50px 50px 50px">
									</c:if>
									<!-- 파트너스 기본 이미지 -->
									<c:if test="${loginUser.userType eq 'UT4' }">
										<img src="${contextPath }/resources/images/partners.png"
											height="50px" width="50px"
											style="border-radius: 50px 50px 50px 50px">
									</c:if>
								</button>
								<div class="dropdown-menu">
									<a href="profile.do" class="dropdown-item">profile</a>
									<div class="dropdown-divider"></div>
									<c:url var="logout" value="logout.do" />
									<a class="dropdown-item" onclick="location.href='${logout }'">logout</a>
								</div>
							</div>
						</h3>
					</c:if>
				</c:if>
		</div>
		</ul>
		</div>
		</ul>
		</div>
	</nav>

	<script>
		$(function() {
			$("#navbarMain .nav-link").mouseenter(function() {
				$(this).css("font-size", "105%");
			})

			$("#navbarMain .nav-link").mouseleave(function() {
				$(this).css("font-size", "100%");
			})
		})
	</script>
	
	<!-- sidebar -->
	<jsp:include page="../common/sideMenubarAll.jsp" />


	<!-- Section -->
	<section>
		<div class="container">
			<div class="row text-white"
				style="border-bottom: 1px solid lightgray; width: 1000px;">
				<div class="col-2"
					style="padding: 3%; font-size: 150%; font-family: 'Jua', sans-serif;">
					${loginUser.memNick } 마이페이지</div>
			</div>
			<div class="row">
				<jsp:include page="../common/myPageMenubar.jsp" />
			</div>
			<div class="col-8 text-white" style="font-family: 'Jua', sans-serif;">
				<br>
				<div class="row">
					<div class="col-12"
						style="width: 100%; height: 60px; margin-left: 5%; padding-right: 0; border-bottom: 2px dashed white;">
						<p style="float: left; font-size: 30px;">마이페이지 - 학력</p>
						<a href="mypagePortfolioAll.html" class="btn btn-info"
							style="float: right;">전체포트폴리오 보기</a>
					</div>
					<div class="col-12" style="margin-left: 5%; margin-top: 5%;">
						<h3>
							학력 <a href="academicUpdate.do" class="btn btn-info"
								style="float: right;">추가하기</a>
						</h3>
					</div>
					<div class="col-12" style="margin-left: 5%; margin-top: 2%;">
						<c:forEach var="sc" items="${sccareerlist }">
							<table class="table">
								<tr class="table-secondary" style="text-align: center;">
									<td>학교명</td>
									<td>전공</td>
									<td>분류</td>
									<td>상태</td>
									<td>입학일</td>
									<td>졸업일</td>
									<td>도구</td>
								</tr>
								<tr class="table-light"
									style="text-align: center; vertical-align: middle; font-size: 15px">
									<td>${sc.scName }</td>
									<td>${sc.scMajor }</td>
									<td>박사과정</td>
									<td>${sc.ssId }</td>
									<td>2020년 1월</td>
									<td>2020년 3월</td>
									<td><a href="academicUpdate.html" class="btn btn-info">수정</a>
										<a href="#" class="btn btn-info">삭제</a></td>
								</tr>
							</table>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		</div>

		</div>
		</div>
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