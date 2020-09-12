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

/* 포트폴리오 */

/* 포트폴리오전부를 보여줄 div*/
.portfolio-view {
	width: 100%;
	height: 350px;
	margin-left: 5%;
	margin-top: 2%;
	position: relative;
}

/* 포트폴리오 전체 보여줄 테이블 */
.pTable {
	width: 100%;
	/* border: 1px solid white; */
	/* border-collapse: separate;
            border-spacing: 20px 10px; */
}

/* 포트폴리오 td */
.pTable tr td {
	border: 1px solid white;
	/* width: 25%; */
	/* height: 300px; */
	font-size: 20px;
}

/* 이미지 보여주기 */
.img {
	width: 30%;
	height: 200px;
}

/* 포트폴리오 내용 */
.category {
	width: 20%;
	text-align: center;
	vertical-align: middle;
	height: 30%;
}

/* 포트폴리오 제목 */
.title {
	width: 50%;
	text-align: center;
	vertical-align: middle;
}

/* 참여율 과 기술 */
.join, .tec {
	text-align: center;
	vertical-align: middle;
}

/* 경력 테이블 */
.Ctable {
	border: 1px solid white;
	width: 100%;
	font-size: 20px;
	border-collapse: separate;
	border-spacing: 0 10px;
}

/* 경력 제목 */
.career-title {
	width: 20%;
	padding-left: 15px;
	margin-bottom: 5px;
	margin-top: 1%;
	border-bottom: 1px solid grey;
}

/* 경력 내용 */
.career-text {
	border-bottom: 1px solid grey;
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
	<jsp:include page="../common/menubar.jsp" />

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
				<jsp:include page="../common/pSideMenubar.jsp" />
			</div>
			<div class="col-8 text-white"
				style="font-family: 'Jua', sans-serif; margin-left: 210px;">
				<br>
				<div class="row">
					<div class="col-12 main-title">
						<p style="float: left; font-size: 30px;">마이페이지 - 프로필보기</p>
					</div>
					<div class="col-12 content">
						<div class="col-12 content-memberinfo">
							<h2>
								<span>${fp.memNick }</span>
								<%-- <c:if test="${loginUser.memAction eq 'Y'}">
									<span class="btn btn-success">활동가능</span>
								</c:if>
								<c:if test="${loginUser.memAction eq 'N'}">
									<span class="btn btn-success">활동불가능</span>
								</c:if> --%>
								<c:if test="${fp.piType eq 1}">
									<span class="btn btn-success">활동 가능</span>
								</c:if>
								<c:if test="${fp.piType eq 2}">
									<span class="btn btn-warning">협의 필요</span>
								</c:if>
								<c:if test="${fp.piType eq 3}">
									<span class="btn btn-secondary">활동 불가능</span>
								</c:if>
								<a href="PartnesInfo.html" class="btn btn-info"
									style="float: right; margin-top: 30px;">업데이트 하기</a>
							</h2>
							<h5>
								<span>${fp.mcType }</span> <span class="bar">|</span> <span>${fp.memTypeKind }</span>
								<span class="bar">|</span>
								<c:choose>
									<c:when test="${fp.ideStatus eq 'complete'}">
										<span>신원인증</span>
									</c:when>
									<c:otherwise>
										<span style="color: grey;">신원인증</span>
									</c:otherwise>
								</c:choose>
								<span class="bar">|</span>
								<c:choose>
									<c:when test="${empty fp.cellPhone }">
										<span style="border: none; color: gray;">연락처 없음</span>
									</c:when>
									<c:otherwise>
										<span style="border: none;">연락처 등록</span>
									</c:otherwise>
								</c:choose>
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
								var marksCanvas = document
										.getElementById("marksChart");

								Chart.defaults.global.defaultFontFamily = "Lato";
								Chart.defaults.global.defaultFontSize = 18;

								var marksData = {
									labels : [ "전문성(2)", "만족도(3)", "의사소통(4)",
											"일정 준수(0)", "적극성(5)" ],
									datasets : [ {
										lable : "",
										scaleOverride : true,

										backgroundColor : "#2693F2",
										borderColor : "#2693F2",
										fill : false,
										radius : 6,
										pointRadius : 3,
										pointBorderWidth : 0,
										pointBorderColor : "#2693F2",
										data : [ 2, 3, 4, 0, 5 ]
									} ]
								};

								var chartOptions = {
									scale : {
										gridLines : {
											color : "lightgrey",
											lineWidth : 3,
											backgroundColor : "#2693F2",
										},
										angleLines : {
											display : false
										},
										ticks : {
											/* 눈금선제거 */
											display : false,
											beginAtZero : true,
											min : 0,
											max : 5,
											stepSize : 1
										},
										pointLabels : {
											fontSize : 18,
											fontColor : "lightgrey"
										}
									},
									/* 왼쪽레이블 제거 */
									legend : {
										display : false
									}
								};

								var radarChart = new Chart(marksCanvas, {
									type : 'radar',
									data : marksData,
									options : chartOptions
								});
							</script>
						</div>
						<br> <br>
						<div class="col-12 partition">
							<div class="col-12 page-title">
								<h4>
									자기소개 <a href="PR.do" class="btn btn-info" style="float: right;">업데이트
										하기</a>
								</h4>
								<p style="overflow: hidden; height: 200px;">${fp.introduction }</p>
							</div>
							<!-- <dlv class="detail-view">
                                    <h6><a href="#">자기소개 더보기 ></a></h6>
                                </dlv> -->
						</div>
						<div class="col-12 partition">
							<div class="col-12 page-title">
								<h4 style="height: 50px;">
									포트폴리오 <a href="portfolioAll.do" class="btn btn-info"
										style="float: right;">업데이트 하기</a>
								</h4>
								<!-- 포트폴리오 -->
								<c:forEach var="port" items="${portfolio }">
									<table class="pTable">
										<tr>
											<td class="img" rowspan="2"><img src="../image/test.png"
												style="max-width: 100%; height: auto;">
											<td class="category">
												<!-- port.mcId에 따른 출력 --> <c:choose>
													<c:when test="${port.mcId eq 'MC1'}">
														<span>개발자</span>
														<br>
													</c:when>
													<c:when test="${port.mcId eq 'MC2'}">
														<span>디자인</span>
														<br>
													</c:when>
													<c:otherwise>
														<span>개발/디자인</span>
														<br>
													</c:otherwise>
												</c:choose> <!-- port.dcId에 따른 출력 --> <c:choose>
													<c:when test="${port.dcId eq 'DC1'}">
														<span>웹</span>
													</c:when>
													<c:when test="${port.dcId eq 'DC2'}">
														<span>어플리케이션</span>
													</c:when>
													<c:when test="${port.dcId eq 'DC3'}">
														<span>퍼블리싱</span>
													</c:when>
													<c:otherwise>
														<span>기타</span>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="title">${port.portName }</td>
										</tr>
										<tr>
											<td colspan="2" rowspan="2" class="text">
												<p style="margin-left: 3%;">${port.content }</p>
											</td>
										</tr>
										<tr></tr>
										<tr>
											<td><button type="submit" id="${port.portId }"
													class="btn btn-info delPort" style="width: 100%;">삭제</button></td>
											<td class="join">참여율 : ${port.portJoin }%</td>
											<td class="tec"><c:forEach var="pt" items="${portTec }">
													<span>${pt.tName }</span>
												</c:forEach></td>
										</tr>
									</table>
								</c:forEach>
								<br>
								<!-- <dlv class="detail-view">
                                    <h6><a href="#">포트폴리오 더보기 ></a></h6>
                                </dlv> -->
							</div>
							<!-- 보유 기술 -->
							<div class="col-12 partition">
								<div class="col-12 page-title">
									<h4 style="height: 50px;">
										보유 기술 <a href="skill.do" class="btn btn-info"
											style="float: right;">업데이트 하기</a>
									</h4>
									<div class="skill">
										<table class="table">
											<tr class="table-secondary"
												style="font-size: 20px; text-align: center;">
												<td>종류</td>
												<td>숙련도</td>
												<td>경험</td>
											</tr>
											<c:forEach var="skill" items="${skillList }">
												<tr>
													<td><input class="text" type="text" readonly
														style="width: 190px; height: 40px; text-align: center;"
														value="${skill.skillKind }"></td>
													<td><input type="text" readonly
														style="width: 190px; height: 40px; text-align: center;"
														value="${skill.skillKind }등급"></td>
													<td><input type="text" readonly
														style="width: 190px; height: 40px; text-align: center;"
														value="${skill.skillYear }"></td>
												</tr>
											</c:forEach>
										</table>
									</div>
								</div>
								<!-- <dlv class="detail-view">
                                    <h6><a href="#">보유기술 더보기 ></a></h6>
                                </dlv> -->
							</div>
							<!-- 경력 -->
							<div class="col-12" style="margin-top: 2%;">
								<div class="col-12 page-title">
									<h4 style="height: 50px;">
										경력 <a href="career.do" class="btn btn-info"
											style="float: right;">업데이트 하기</a>
									</h4>

									<c:forEach var="career" items="${careerList }">
										<table class="Ctable">
											<tr>
												<td class="career-title">회사명</td>
												<td class="career-text">: ${career.cName }</td>
											</tr>
											<tr>
												<td class="career-title">근무 부서</td>
												<td class="career-text">: ${career.cDept }</td>
											</tr>
											<tr>
												<td class="career-title">직위</td>
												<td class="career-text">: ${career.cPosition }</td>
											</tr>
											<tr>
												<td class="career-title" style="border: none">근무시간</td>
												<td>: ${career.cStartDate }</td>
											</tr>
											<tr>
												<td><input type="hidden" name="cId"
													value="${career.cId }"> <input type="hidden"
													name="profileId" value="${career.profileId }"></td>
											</tr>
										</table>
										<br>
									</c:forEach>
								</div>
							</div>
							<div class="col-12 partition">
								<div class="col-12 page-title">
									<h4 style="height: 50px;">
										학력 <a href="academic.do" class="btn btn-info"
											style="float: right;">업데이트 하기</a>
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
											<c:forEach var="sc" items="${sccareerList }">
												<tr class="table-light"
													style="text-align: center; vertical-align: middle;">
													<td>${sc.scName }</td>
													<td>${sc.scMajor }</td>
													<c:choose>
														<c:when test="${sc.sgId eq 'SG1'}">
															<td>중학교</td>
														</c:when>
														<c:when test="${sc.sgId eq 'SG2'}">
															<td>고등학교</td>
														</c:when>
														<c:when test="${sc.sgId eq 'SG3'}">
															<td>전문대(2~3)</td>
														</c:when>
														<c:when test="${sc.sgId eq 'SG4'}">
															<td>대학교(4)</td>
														</c:when>
														<c:when test="${sc.sgId eq 'SG5'}">
															<td>대학원</td>
														</c:when>
														<c:when test="${sc.sgId eq 'SG6'}">
															<td>박사과정</td>
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${sc.ssId eq 'SS1'}">
															<td>재학</td>
														</c:when>
														<c:when test="${sc.ssId eq 'SS2'}">
															<td>휴학</td>
														</c:when>
														<c:when test="${sc.ssId eq 'SS3'}">
															<td>졸업</td>
														</c:when>
														<c:when test="${sc.ssId eq 'SS4'}">
															<td>자퇴</td>
														</c:when>
													</c:choose>
													<td>2020년 1월</td>
													<td>2020년 3월</td>
												</tr>
											</c:forEach>
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
										자격증 <a href="certificate.do" class="btn btn-info" style="float: right;">업데이트
											하기</a>
									</h4>
									<div class="certificate">
										<table class="table">
											<tr class="table-secondary" style="text-align: center;">
												<td>자격증명</td>
												<td>발급기관</td>
												<td>발행일자</td>
												<td>일련번호</td>
											</tr>
											<c:forEach var="certi" items="${certiList }">
												<tr class="table-light"
													style="text-align: center; vertical-align: middle;">
													<td>${certi.ccName }</td>
													<td>${certi.ccPlace }</td>
													<td>2020년 09월 03일</td>
													<td>${certi.ccNumber }</td>
												</tr>
											</c:forEach>
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
	<jsp:include page="../common/footer.jsp" />

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script> -->
</body>

</html>