<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

/* 총평가가 나오는 div */
.all-evaluation {
	width: 100%;
	margin-left: 5%;
	margin-top: 3%;
	font-size: 25px;
}

/* 총평가 갯수 input */
.all-evaluation input {
	border-radius: 20px 20px 20px 20px;
	text-align: right;
	margin-right: 10px;
	padding-right: 10px;
}

/* 평가 테이블 */
.evalTable {
	width: 100%;
	border: 1px solid white;
	margin-left: 50px;
}

/* 평가 제목 */
.evalTitle {
	font-size: 20px;
	color: #2099bb;
	padding: 20px 0 10px 20px;
}

/* 평가 전체 padding */
.evalPadding {
	padding: 10px 0 10px 20px;
}

/* 별점 li */
.evalPadding .agv li {
	list-style-type: none;
	float: left;
	margin-left: 10px;
	text-align: center;
	width: 18%;
}
/* 별점 */
.fa-star {
	margin-right: 0;
}

/* 클라이언트 이미지 */
.client-img {
	width: 70px;
	height: 70px;
	border-radius: 50px 50px 50px 50px;
	border: 1px solid white;
}

/* 클라이언트 정보 li */
.evalPadding .client li {
	list-style-type: none;
	float: left;
	margin-left: 10px;
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
				style="border-bottom: 1px solid lightgray; width: 1000px;"></div>
			<div class="row">
				<!-- 구 sideMenubar -->
				<%-- <jsp:include page="../common/myPageMenubar.jsp" /> --%>
				<!-- 새버전을 쓸꺼면 로그인 했을시 그거 빼야함 -->
				<!-- 새 sidMenubar -->
				<jsp:include page="../common/findPartSideMenubar.jsp" />
			</div>
			<div class="col-8 text-white" style="font-family: 'Jua', sans-serif; margin-left: 210px;">
				<br>
				<div class="row">
					<div class="col-12"
						style="width: 100%; height: 60px; margin-left: 5%; padding-right: 0; border-bottom: 2px dashed white;">
						<p style="float: left; font-size: 30px;">평가 - 평가 조회</p>
					</div>
					<div class="col-12 all-evaluation">
						<span>총 평가 한 갯수</span> <input type="text" size="3" readonly
							value="1">건
					</div>
					<div class="col-12" style="font-size: 15px;">
						<c:forEach var="eval" items="${PartEval }">
										<!-- 평가 시작 -->
										<table class="evalTable">
											<tr>
												<td class="evalTitle" colspan="3"><a href="#">${eval.proName }</a></td>
											</tr>
											<tr>
												<td class="evalPadding" colspan="3">${eval.mcType }|
													${eval.dcType }</td>
											</tr>
											<tr>
												<td class="evalPadding" style="width: 230px;"><i
													class="fas fa-won-sign">계약금액 : </i>${eval.proPayment }원</td>
												<td style="padding-bottom: 10px; padding-top: 10px;"><i
													class="far fa-clock">프로젝트 기간 : </i>${eval.proDuration }일</td>
												<td style="padding-bottom: 10px; padding-top: 10px;"><i
													class="far fa-calendar-alt">계약일자 : </i>
												<fmt:parseDate pattern="yyyy-MM-dd"
														value="${eval.proStartDate }" var="parsedDate" /> <fmt:formatDate
														value="${parsedDate}" pattern="yyyy년 MM월 dd일" /></td>
											</tr>

											<tr>
												<td class="evalPadding" colspan="3"
													style="text-align: center; font-size: 20px; border-bottom: 2px dashed white;">평균
													평점 : <c:choose>
														<c:when test="${eval.eAgv eq 1}">
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="far fa-star" style="color: yellow;"></i>
															<i class="far fa-star" style="color: yellow;"></i>
															<i class="far fa-star" style="color: yellow;"></i>
															<i class="far fa-star" style="color: yellow;"></i>
														</c:when>
														<c:when test="${eval.eAgv eq 2}">
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="far fa-star" style="color: yellow;"></i>
															<i class="far fa-star" style="color: yellow;"></i>
															<i class="far fa-star" style="color: yellow;"></i>
														</c:when>
														<c:when test="${eval.eAgv eq 3}">
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="far fa-star" style="color: yellow;"></i>
															<i class="far fa-star" style="color: yellow;"></i>
														</c:when>
														<c:when test="${eval.eAgv eq 4}">
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="far fa-star" style="color: yellow;"></i>
														</c:when>
														<c:when test="${eval.eAgv eq 5}">
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="fas fa-star" style="color: yellow;"></i>
															<i class="fas fa-star" style="color: yellow;"></i>
														</c:when>
													</c:choose>
												</td>
											</tr>
											<tr>
												<td class="evalPadding" colspan="3"
													style="border-bottom: 2px dashed white;">
													<ul class="agv">
														<li>전문성(${eval.eStar1 })</li>
														<li>결과물 만족도(${eval.eStar2 })</li>
														<li>의사소통(${eval.eStar3 })</li>
														<li>일정 준수(${eval.eStar4 })</li>
														<li>적극성(${eval.eStar5 })</li>
													</ul>
													<ul class="agv">
														<li><c:forEach begin="1" end="${eval.eStar1 }">
																<i class="fas fa-star" style="color: yellow;"></i>
															</c:forEach></li>
														<li><c:forEach begin="1" end="${eval.eStar2 }">
																<i class="fas fa-star" style="color: yellow;"></i>
															</c:forEach></li>
														<li><c:forEach begin="1" end="${eval.eStar3 }">
																<i class="fas fa-star" style="color: yellow;"></i>
															</c:forEach></li>
														<li><c:forEach begin="1" end="${eval.eStar4 }">
																<i class="fas fa-star" style="color: yellow;"></i>
															</c:forEach></li>
														<li><c:forEach begin="1" end="${eval.eStar5 }">
																<i class="fas fa-star" style="color: yellow;"></i>
															</c:forEach></li>
													</ul>
												</td>
											</tr>
											<tr>
												<td class="evalPadding" colspan="3">
													<ul class="client">
														<li><img class="client-img"></li>
														<li><span class="btn btn-secondary btn-sm"
															style="margin-right: 5px; margin-bottom: 5px;">클라이언트</span><span>${eval.memNick }</span>
															<br>
															<p>${eval.eContent }</p></li>
													</ul>
												</td>
											</tr>
										</table>
									</c:forEach>
									<!-- 평가 div끝-->
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

		</div>
		</div>
	</section>


	<!-- Footer -->
	<jsp:include page="../common/footer.jsp" />

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<
	<!-- script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script> -->
</body>

</html>