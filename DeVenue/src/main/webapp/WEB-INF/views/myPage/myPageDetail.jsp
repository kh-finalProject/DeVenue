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
	height: 6000px;
	padding: 50px 0 30px 0;
	color: white;
}

/* input태그 size */
.input-size {
	width: 400px;
	height: 50px;
	margin-left: 40px;
}

/* 어느페이지 인지 보여줄 div */
.main-title {
	width: 100%;
	height: 60px;
	margin-left: 5%;
	padding-right: 0;
	border-bottom: 2px dashed white;
}

/* 정보를 나오게할 div */
.content {
	width: 100%;
	height: 200px;
	margin-left: 5%;
	margin-top: 5%;
}

/* 사용자의 개인 정보가 나올 div */
.content-memberinfo {
	height: 100px;
	position: relative;
	border-bottom: 2px dashed white;
}

/* 활동가능버튼의 마우스 버튼 모양 제거 */
.content-memberinfo .btn {
	cursor: default;
}

/* | 의 크기 */
.bar {
	padding: 0 10px 0 10px;
}

/* 자기소개, 보유기술 등등 칸막이 div */
.partition {
	padding: 20px 0 20px 0;
	height: auto;
	border-bottom: 2px dashed white;
}

/* 자기소개, 보유기술 등등 제목 */
.page-title h4 {
	height: 50px;
}

/* 평가 항목 title div */
.evaluation .col-7 {
	text-align: left;
	display: inline-block;
}

/* 평가 항목에서 불러올 값 div */
.evaluation .col-3 {
	text-align: right;
	display: inline-block;
}

/* 누적된 금액 div */
.accumulated-amount {
	width: 100%;
	height: 30px;
	border-top: 2px dashed white;
	margin-top: 10px;
	padding-top: 10px;
}

/* 자세히 더보기 */
.detail-view {
	width: 100%;
	height: 30%;
	text-align: right;
}

/* 포트폴리오 기본3개 div */
.portfolio {
	display: inline-block;
	width: 30%;
	height: 300px;
	border: 1px solid red;
	margin: 1%;
}

/* 하나의 포트폴리오 이미지를 보여줄 div */
.port-img {
	position: absolute;
	width: 26.5%;
	height: 55%;
	margin: 1%;
}

.port-img img {
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

/* 하나의 포트폴리오 제목을 보여줄 div */
.port-title {
	position: absolute;
	width: 26.5%;
	height: 20%;
	margin: 1%;
	margin-top: 30%;
}

/* 포트폴리오가 있을시 */
/* 하나의 포트폴리오 제목 사이즈 및 설정 */
.port-title p {
	overflow: hidden;
	width: 150px;
	height: 25px;
	font-size: 20px;
}

/* 하나의 포트폴리오 카테고리 사이즈 및 설정 */
.port-title span {
	width: 150px;
	height: 20px;
	font-size: 15px;
	color: gray;
}

/* 포트폴리오가 없을 시 */
.port-img p {
	text-align: center;
	margin-top: 50%;
	font-size: 25px;
}

/* 자격증 div */
.career-conatiner {
	width: 100%;
	height: auto;
	border: 1px solid white;
	padding-bottom: 10px;
}

/* 자격증 div 가로줄 */
.career-inner {
	height: 50px;
	border-bottom: 2px dashed gray;
	margin-top: 2%;
	font-size: 18px;
	position: relative;
}

/* 자격증 div 제목 */
.career-title {
	width: 80px;
	display: inline-block;
	padding-left: 5px;
	margin-bottom: 5px;
	margin-top: 1%;
}

/* 자격증 div content DB값이 나옴 */
.career-content {
	display: inline-block;
}

/* 각각의 클라이언트에 평가 div */
.client-history {
	width: 100%;
	height: auto;
	border: 1px solid white;
	margin-top: 5%;
}

/* 각각의 별이 보일 전체 div */
.star-history {
	margin-top: 1%;
	border-top: 2px dashed white;
	border-bottom: 2px dashed white;
	font-size: 15px;
	padding: 15px 20px 15px 20px;
	text-align: center;
}

/* 각각의 별이 보일 div */
.star {
	display: inline-block;
	padding-left: 10px;
	padding-right: 20px;
	margin-left: 5px;
	border-right: 2px dashed white;
}

/* 클라이언트 이미지 */
.client-img {
	width: 70px;
	height: 70px;
	border-radius: 50px 50px 50px 50px;
	border: 1px solid white;
	display: inline-block;
}

/* 클라이언트 평가의 내용 */
.history-content {
	margin-top: 3%;
	height: 50px;
	width: 100%;
	overflow: hidden;
}

/* 서브 메뉴바 a 태그 */
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
	<!-- menubar -->
	<!-- 버튼클릭 script가 안먹는다. -->
	<%-- <jsp:include page="../common/menubar.jsp"/> --%>

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
						<a href="clientList.do ">클라이언트 찾기</a>
						<a href="partnersList.do">파트너스 찾기</a>
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

	<!-- sideMenubar -->
	<jsp:include page="../common/sideMenubarAll.jsp" />
	


	<!-- Section -->
	<section>
		<div class="container">
			<div class="row text-white"
				style="border-bottom: 1px solid lightgray; width: 1000px;">
				<div class="col-12"
					style="padding: 3%; font-size: 150%; font-family: 'Jua', sans-serif;">
					${loginUser.memNick }님의 마이페이지 <input type="hidden" id="userType"
						value="${loginUser.userType }">
				</div>
			</div>
			<div class="row">
				<!-- 구 sideMenubar -->
				<%-- <jsp:include page="../common/myPageMenubar.jsp" /> --%>
				<!-- 새 sidMenubar -->
				<jsp:include page="../common/pSideMenubar.jsp"/>
			</div>
			<div class="col-8 text-white" style="font-family: 'Jua', sans-serif; margin-left: 210px;">
				<br>
				<div class="row">
					<div class="col-12 main-title">
						<p style="float: left; font-size: 30px;">마이페이지 - 프로필보기</p>
					</div>
					<div class="col-12 content">
						<div class="col-12 content-memberinfo">
							<h2>
								<span>${loginUser.memNick }</span>
								<c:if test="${loginUser.memAction eq 'Y'}">
									<span class="btn btn-success">활동가능</span>
								</c:if>
								<c:if test="${loginUser.memAction eq 'N'}">
									<span class="btn btn-success">활동불가능</span>
								</c:if>
								<a href="PartnesInfo.html" class="btn btn-info"
									style="float: right; margin-top: 30px;">업데이트 하기</a>
							</h2>
							<h5 style="color: grey">
								<span>개발자</span> <span class="bar">|</span> <span>개인</span> <span
									class="bar">|</span> <span>신원 인증</span> <span class="bar">|</span>
								<span>연락처 등록</span>
							</h5>
						</div>
						<div class="col-12 pofile-info"
							style="padding: 20px 0 20px 0; text-align: center; position: relative; height: 320px; border-bottom: 2px dashed white;">
							<div class="col-6"
								style="border-right: 2px dashed white; padding: 10px 10px 10px 10px; position: absolute;">
								<div class="col-12" style="height: 120px;">
									<h4>활동 요약 정보</h4>
									<div class="col-12" style="width: 100%; font-size: xx-large;">
										★★★★★</div>
									<div class="col-12" style="width: 100%;">
										<span style="font-size: 20px;">평균평점 <span>0.0</span> /
											평가 <span>0</span>개
										</span>
									</div>
								</div>
								<br>
								<div class="col-12">
									<div class="col-12 evaluation">
										<div class="col-7">
											<span style="font-size: 20px;">계약한 프로젝트</span>
										</div>
										<div class="col-3">
											<span style="margin-right: 5px; font-size: 20px;">0</span><span>건</span>
										</div>
									</div>
									<div class="col-12">
										<div class="col-7"
											style="text-align: left; display: inline-block;">
											<span style="font-size: 20px;">포트폴리오</span>
										</div>
										<div class="col-3"
											style="text-align: right; display: inline-block;">
											<span style="margin-right: 5px; font-size: 20px;">0</span><span>개</span>
										</div>
									</div>
									<div class="col-12 accumulated-amount">
										<div class="col-7"
											style="text-align: left; display: inline-block;">
											<span style="font-size: 20px;">누적 완료 금액</span>
										</div>
										<div class="col-3"
											style="text-align: right; display: inline-block;">
											<span style="margin-right: 5px; font-size: 20px;">0</span><span>원</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6"
								style="padding: 10px 10px 10px 10px; position: absolute; margin-left: 370px;">
								<h4>세부 항목 평가</h4>
								<canvas id="marksChart"></canvas>
							</div>
							<script>
                                    var marksCanvas = document.getElementById("marksChart");

                                    Chart.defaults.global.defaultFontFamily = "Lato";
                                    Chart.defaults.global.defaultFontSize = 18;

                                    var marksData = {
                                        labels: ["전문성", "만족도", "의사소통", "일정 준수", "적극성"],
                                        datasets: [{
                                            lable: "",
                                            scaleOverride: true,

                                            backgroundColor: "#2693F2",
                                            borderColor: "#2693F2",
                                            fill: false,
                                            radius: 6,
                                            pointRadius: 3,
                                            pointBorderWidth: 0,
                                            pointBorderColor: "#2693F2",
                                            data: [2, 3, 4, 0, 5]
                                        }]
                                    };

                                    var chartOptions = {
                                        scale: {
                                            gridLines: {
                                                color: "lightgrey",
                                                lineWidth: 3,
                                                backgroundColor: "#2693F2",
                                            },
                                            angleLines: {
                                                display: false
                                            },
                                            ticks: {
                                                /* 눈금선제거 */
                                                display: false,
                                                beginAtZero: true,
                                                min: 0,
                                                max: 5,
                                                stepSize: 1
                                            },
                                            pointLabels: {
                                                fontSize: 18,
                                                fontColor: "lightgrey"
                                            }
                                        },
                                        /* 왼쪽레이블 제거 */
                                        legend: {
                                            display: false
                                        }
                                    };

                                    var radarChart = new Chart(marksCanvas, {
                                        type: 'radar',
                                        data: marksData,
                                        options: chartOptions
                                    });
                                </script>
						</div>
						<br> <br>
						<div class="col-12 partition">
							<div class="col-12 page-title">
								<h4>
									자기소개 <a href="Self-introduction.html" class="btn btn-info"
										style="float: right;">업데이트 하기</a>
								</h4>
								<p style="overflow: hidden; height: 200px;">값밧밧바삽낭만암ㄴ아</p>
							</div>
							<!-- <dlv class="detail-view">
                                    <h6><a href="#">자기소개 더보기 ></a></h6>
                                </dlv> -->
						</div>
						<div class="col-12 partition">
							<div class="col-12 page-title">
								<h4 style="height: 50px;">
									포트폴리오 <a href="#" class="btn btn-info" style="float: right;">업데이트
										하기</a>
								</h4>
								<!-- 하나의 포트폴리오 -->
								<div class="portfolio">
									<div class="port-img">
										<img src="../image/pwdforget.png">
									</div>
									<div class="port-title">
										<p>
											<a href="#">1. 아아ㅏ아아아ㅏ아아아아아아아아아아아아ㅏ아아아아앙</a>
										</p>
										<span>개발 - 어플리케이션</span>
									</div>
								</div>
								<!-- 하나의 포트폴리오 -->
								<div class="portfolio">
									<div class="port-img">
										<p>아무도 없음~</p>
									</div>
									<div class="port-title">
										<p>
											<a href="#"></a>
										</p>
										<span></span>
									</div>
								</div>
								<!-- 하나의 포트폴리오 -->
								<div class="portfolio">
									<div class="port-img">
										<p>이미지가 없어유</p>
									</div>
									<div class="port-title">
										<p>
											<a href="#">2. 아아ㅏ아아아ㅏ아아아아아아아아아아아아ㅏ아아아아앙</a>
										</p>
										<span>디자인 - 기타</span>
									</div>
								</div>
							</div>
							<script>
                                        // p태그의 글자가 hidden이되면 ...으로 표시
                                </script>
							<!-- <dlv class="detail-view">
                                    <h6><a href="#">포트폴리오 더보기 ></a></h6>
                                </dlv> -->
						</div>
						<div class="col-12 partition">
							<div class="col-12 page-title">
								<h4 style="height: 50px;">
									경력 <a href="#" class="btn btn-info" style="float: right;">업데이트
										하기</a>
								</h4>
								<div class="col-12 career-conatiner">
									<div class="col-12 career-inner">
										<div class="col-4 career-title">
											<b>회사명</b>
										</div>
										<div class="col-10 career-content">어느 회사명?</div>
									</div>
									<div class="col-12 career-inner">
										<div class="col-4 career-title">
											<b>근무부서</b>
										</div>
										<div class="col-10 career-content">어느 근무 부서?</div>
									</div>
									<div class="col-12 career-inner">
										<div class="col-4 career-title">
											<b>직위</b>
										</div>
										<div class="col-10 career-content">어느 직위임?</div>
									</div>
									<div class="col-12 career-inner">
										<div class="col-4 career-title">
											<b>근무시간</b>
										</div>
										<div class="col-10 career-content">2020년 02월 ~ 현재(6개월)</div>
									</div>
									<div class="col-12 career-inner">
										<div class="col-4 career-title">
											<b>설명</b>
										</div>
										<div class="col-10 career-content">
											<p>설명란</p>
										</div>
									</div>
								</div>
							</div>
							<!-- <dlv class="detail-view">
                                    <h6><a href="#">경력 더 보기 ></a></h6>
                                </dlv> -->
						</div>
						<div class="col-12 partition">
							<div class="col-12 page-title">
								<h4 style="height: 50px;">
									보유 기술 <a href="#" class="btn btn-info" style="float: right;">업데이트
										하기</a>
								</h4>
								<div class="skill">
									<table class="table">
										<tr class="table-secondary"
											style="font-size: 20px; text-align: center;">
											<td>종류</td>
											<td>숙련도</td>
											<td>경험</td>
										</tr>
										<tr>
											<td><input class="text" type="text" readonly
												style="width: 190px; height: 40px;" value="jsp/Servlet"></td>
											<td><input type="text" readonly
												style="width: 190px; height: 40px;" value="1등급"></td>
											<td><input type="text" readonly
												style="width: 190px; height: 40px;" value="3년이상"></td>
										</tr>
										<tr>
											<td><input type="text" readonly
												style="width: 190px; height: 40px;" value="java"></td>
											<td><input type="text" readonly
												style="width: 190px; height: 40px;" value="중급"></td>
											<td><input type="text" readonly
												style="width: 190px; height: 40px;" value="1년이하"></td>
										</tr>
										<tr>
											<td><input type="text" readonly
												style="width: 190px; height: 40px;" value="jsp/Servlet"></td>
											<td><input type="text" readonly
												style="width: 190px; height: 40px;" value="5등급"></td>
											<td><input type="text" readonly
												style="width: 190px; height: 40px;" value="1년이상"></td>
										</tr>
									</table>
								</div>
							</div>
							<!-- <dlv class="detail-view">
                                    <h6><a href="#">보유기술 더보기 ></a></h6>
                                </dlv> -->
						</div>

						<div class="col-12 partition">
							<div class="col-12 page-title">
								<h4 style="height: 50px;">
									학력 <a href="#" class="btn btn-info" style="float: right;">업데이트
										하기</a>
								</h4>
								<div class="academic">
									<table class="table">
										<tr class="table-secondary" style="text-align: center;">
											<td>학교명</td>
											<td>전공</td>
											<td>분류</td>
											<td>상태</td>
											<td>입학일</td>
											<td>졸업일</td>
										</tr>
										<tr class="table-light"
											style="text-align: center; vertical-align: middle;">
											<td>한국복지대학교</td>
											<td>컴퓨터정보보안과</td>
											<td>전문대</td>
											<td>퇴학</td>
											<td>2020년 1월</td>
											<td>2020년 9월</td>
										</tr>
									</table>
								</div>
							</div>
							<!-- <dlv class="detail-view">
                                    <h6><a href="#">학력 더보기 ></a></h6>
                                </dlv> -->
						</div>
						<div class="col-12 partition">
							<div class="col-12 page-title">
								<h4 style="height: 50px;">
									자격증 <a href="#" class="btn btn-info" style="float: right;">업데이트
										하기</a>
								</h4>
								<div class="certificate">
									<table class="table">
										<tr class="table-secondary" style="text-align: center;">
											<td>자격증명</td>
											<td>발급기관</td>
											<td>발행일자</td>
											<td>일련번호</td>
											<td>도구</td>
										</tr>
										<tr class="table-light"
											style="text-align: center; vertical-align: middle;">
											<td>정보처리산업기능사</td>
											<td>Q-net</td>
											<td>2020년 09월 03일</td>
											<td>당신의 일련번호</td>
											<td><a href="certificateUpdate.html"
												class="btn btn-info">수정</a> <a href="#" class="btn btn-info">삭제</a>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<!-- <dlv class="detail-view">
                                    <h6><a href="#">자격증 더보기 ></a></h6>
                                </dlv> -->
						</div>
						<div class="col-12 partition">
							<div class="col-12 page-title">
								<h4 style="height: 50px;">
									평가 <a href="#" class="btn btn-info" style="float: right;">업데이트
										하기</a>
								</h4>
								<div class="history">
									<!-- 평가 시작 -->
									<div class="col-12 client-history">
										<div class="col-12" style="margin-top: 3%;">
											<h4>데이터 시각화 솔루션 프로토타입 개발</h4>
										</div>
										<div class="col-6" style="margin-top: 1%;">
											<div class="col-3" style="display: inline-block;">디자인</div>
											<div class="col-5"
												style="display: inline-block; border-left: 1px solid white;">
												퍼블리싱</div>
										</div>
										<div class="col-6" style="margin-top: 1%;">
											<div class="col-4" style="display: inline-block;">
												클라이언트</div>
											<div class="col-6" style="display: inline-block;">
												클라이언트명</div>
										</div>
										<div class="col-12" style="margin-top: 1%;">
											<table class="table">
												<tr>
													<th class="table-secondary">계약금액</th>
													<td class="table-light"><span>4,040,404원</span></td>
													<th class="table-secondary">프로젝트 기간</th>
													<td class="table-light"><span>60일</span></td>
													<th class="table-secondary">계약일자</th>
													<td class="table-light"><span>2020년 07월 07일</span></td>
												</tr>
											</table>
										</div>
										<div class="col-12"
											style="margin-top: 1%; text-align: center;">
											<span style="display: inline-block;">★★★★★</span> <span
												style="display: inline-block;">0.0</span>
										</div>
										<div class="col-12 star-history">
											<div class="col-2 star">
												<span>전문성</span> <span style="display: inline-block;">★★★★★</span>
												<span style="display: inline-block;">0.0</span>
											</div>
											<div class="col-2 star">
												<span>결과물만족도</span> <span style="display: inline-block;">★★★★★</span>
												<span style="display: inline-block;">0.0</span>
											</div>
											<div class="col-2 star">
												<span>의사소통</span> <span style="display: inline-block;">★★★★★</span>
												<span style="display: inline-block;">0.0</span>
											</div>
											<div class="col-2 star">
												<span>일정준수</span> <span style="display: inline-block;">★★★★★</span>
												<span style="display: inline-block;">0.0</span>
											</div>
											<div class="col-2 star" style="border: none;">
												<span>적극성</span> <span style="display: inline-block;">★★★★★</span>
												<span style="display: inline-block;">0.0</span>
											</div>
										</div>
										<div class="col-12" style="margin-top: 2%;">
											<div class="col-2"
												style="display: inline-block; vertical-align: top;">
												<div class="client-img"></div>
											</div>
											<div class="col-9" style="display: inline-block;">
												<div class="col-5">
													<span>클라이언트</span> <span>클라이언트명</span>
												</div>
												<div class="col-12 history-content">
													<p>아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아
														아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아
														아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아</p>
												</div>
											</div>
										</div>
									</div>
									<!-- 평가 div끝-->
									<!-- 평가 시작 -->
									<div class="col-12 client-history">
										<div class="col-12" style="margin-top: 3%;">
											<h4>데이터 시각화 솔루션 프로토타입 개발</h4>
										</div>
										<div class="col-6" style="margin-top: 1%;">
											<div class="col-3" style="display: inline-block;">디자인</div>
											<div class="col-5"
												style="display: inline-block; border-left: 1px solid white;">
												퍼블리싱</div>
										</div>
										<div class="col-6" style="margin-top: 1%;">
											<div class="col-4" style="display: inline-block;">
												클라이언트</div>
											<div class="col-6" style="display: inline-block;">
												클라이언트명</div>
										</div>
										<div class="col-12" style="margin-top: 1%;">
											<table class="table">
												<tr>
													<th class="table-secondary">계약금액</th>
													<td class="table-light"><span>4,040,404원</span></td>
													<th class="table-secondary">프로젝트 기간</th>
													<td class="table-light"><span>60일</span></td>
													<th class="table-secondary">계약일자</th>
													<td class="table-light"><span>2020년 07월 07일</span></td>
												</tr>
											</table>
										</div>
										<div class="col-12"
											style="margin-top: 1%; text-align: center;">
											<span style="display: inline-block;">★★★★★</span> <span
												style="display: inline-block;">0.0</span>
										</div>
										<div class="col-12 star-history">
											<div class="col-2 star">
												<span>전문성</span> <span style="display: inline-block;">★★★★★</span>
												<span style="display: inline-block;">0.0</span>
											</div>
											<div class="col-2 star">
												<span>결과물만족도</span> <span style="display: inline-block;">★★★★★</span>
												<span style="display: inline-block;">0.0</span>
											</div>
											<div class="col-2 star">
												<span>의사소통</span> <span style="display: inline-block;">★★★★★</span>
												<span style="display: inline-block;">0.0</span>
											</div>
											<div class="col-2 star">
												<span>일정준수</span> <span style="display: inline-block;">★★★★★</span>
												<span style="display: inline-block;">0.0</span>
											</div>
											<div class="col-2 star" style="border: none;">
												<span>적극성</span> <span style="display: inline-block;">★★★★★</span>
												<span style="display: inline-block;">0.0</span>
											</div>
										</div>
										<div class="col-12" style="margin-top: 2%;">
											<div class="col-2"
												style="display: inline-block; vertical-align: top;">
												<div class="client-img"></div>
											</div>
											<div class="col-9" style="display: inline-block;">
												<div class="col-5">
													<span>클라이언트</span> <span>클라이언트명</span>
												</div>
												<div class="col-12 history-content">
													<p>아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아
														아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아
														아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아</p>
												</div>
											</div>
										</div>
									</div>
									<!-- 평가 div끝-->
								</div>
							</div>
							<!-- <dlv class="detail-view">
                                    <h6><a href="#">평가 더보기 ></a></h6>
                                </dlv> -->
						</div>
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
    <jsp:include page="../common/footer.jsp"/>

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