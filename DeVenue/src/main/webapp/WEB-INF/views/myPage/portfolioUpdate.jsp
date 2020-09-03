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

/* 포트폴리오 가로 하나의 크기 */
.port-container {
	margin-left: 5%;
	height: 20px;
	margin-top: 5%;
	position: relative;
}

/* 포트폴리오 가로의 제목 div */
.port-title {
	position: absolute;
	margin-left: 5%;
	font-size: 20px;
}

/* title틀과 input 사이조절 */
.port-input {
	position: absolute;
	margin-left: 20%;
}

/* 이미지 추가할 곳의 한줄평가 div */
.img-content {
	margin-left: 5%;
	height: 50px;
	margin-top: 5%;
	position: relative;
}

/* 서브로 보여줄 내용 */
.sub-content {
	margin-left: 27%;
	color: grey;
}

/* input 태그 number  화살표 제거 */
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
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
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />

	<!-- munubar -->
	<jsp:include page="../common/menubar.jsp"/>
	<!-- sidebar -->
	<jsp:include page="../common/sideMenubarAll.jsp" />S


	<!-- Section -->
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
					<div class="col-12"
						style="width: 100%; height: 60px; margin-left: 5%; border-bottom: 2px dashed white;">
						<p style="float: left; font-size: 30px;">마이페이지 - 포트폴리오 추가</p>
					</div>
					<div class="col-12" style="width: 100%; height: 1200px;">
						<form method="POST" action="piInsert.do" enctype="multipart/form-data">
							<input type="hidden" name="profileId" value=${profile.profileId }>
							<div class="col-12 port-container">
								<div class="col-4 port-title">
									<label for="title">* 제목</label>
								</div>
								<div class="col-4 port-input">
									<input type="text" id="title" name="title"
										style="width: 400px; height: 40px;">
								</div>
							</div>
							<div class="col-12 port-container">
								<div class="col-4 port-title">
									<label for="jobtype">* 카테고리</label>
								</div>
								<div class="col-8 port-input">
									<select name="jobtype" id="jobtype" name="jobtype"
										style="width: 150px; height: 40px;">
										<option value="MC1">개발</option>
										<option value="MC2">디자인</option>
										<option value="MC3">개발/디자인</option>
									</select> <select name="jobaction" name="jobaction"
										style="width: 150px; height: 40px;">
										<option value="DC1">웹</option>
										<option value="DC2">어플리케이션</option>
										<option value="DC3">퍼플리싱</option>
										<option value="DC4">기타</option>
									</select>
								</div>
							</div>
							<div class="col-12 port-container" style="height: 250px;">
								<div class="col-4 port-title">
									<label for="portfolio-content">* 설명</label>
								</div>
								<div class="col-4 port-input">
									<textarea id="portfolio-content" name="portfolio-content"
										cols="60" rows="10"></textarea>
								</div>
							</div>
							<div class="col-12" style="margin-left: 27%; color: grey;">
								<span>한글 기준 5,000자 이하로 작성해주세요</span>
							</div>
							<div class="col-12 port-container">
								<div class="col-4 port-title">
									<label for="start-year">* 참여 시작일</label>
								</div>
								<div class="col-7" id="start-year"
									style="position: absolute; margin-left: 20%;">
									<select id="start-year" name="start-year"
										style="width: 150px; height: 40px;">
										<option value="year">년</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
									</select> <select name="start-month" name="start-month"
										style="width: 150px; height: 40px;">
										<option value="month">월</option>
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select>
								</div>
							</div>
							<div class="col-12 port-container">
								<div class="col-4 port-title">
									<label for="start-year">* 참여 종료일</label>
								</div>
								<div class="col-7" id="start-year"
									style="position: absolute; margin-left: 20%;">
									<select id="end-year" name="end-year"
										style="width: 150px; height: 40px;">
										<option value="year">년</option>
										<option value="2010">2010</option>
										<option value="2011">2011</option>
										<option value="2012">2012</option>
										<option value="2013">2013</option>
										<option value="2014">2014</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
									</select> <select name="end-month" name="end-month"
										style="width: 150px; height: 40px;">
										<option value="month">월</option>
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select>
								</div>
							</div>
							<div class="col-12 port-container" style="height: 50px;">
								<div class="col-4 port-title">
									<label for="participation">* 참여율</label>
								</div>
								<div class="col-4 port-input">
									<!-- 제약조건 걸어주자 -->
									<input type="number" id="participation" name="participation"
										style="width: 150px; height: 40px;"> %
								</div>
							</div>
							<div class="col-12 sub-content">
								<span>참여율은 1~100까지 정수로 입력해주세요</span>
							</div>
							<!-- 하나의 이미지를 추가할 공간-->
							<div class="col-12 port-container">
								<div class="col-4 port-title">
									<label for="img">* 이미지</label>
								</div>
								<div class="col-10 port-input">
									<input type="file" id="img1" name="img1" class="btn btn-info">
									<span class="btn btn-info select1">선택</span> <span
										class="btn btn-info img-delete1">삭제</span>
									<p id="view"></p>
								</div>
							</div>
							<div class="col-12 img-content">
								<div class="col-4 port-title">
									<label for="img-content1">* 한 줄 설명</label>
								</div>
								<div class="col-4 port-input">
									<input type="text" id="img-content1" name="img-content1"
										readonly placeholder="이미지를 선택해주세요"
										style="width: 500px; height: 40px; background-color: gray;">
								</div>
							</div>
							<div class="col-12 sub-content">
								<span>한글 기준 120자 미만</span>
							</div>
							<!-- 하나의 이미지를 추가할 공간-->
							<!--<div class="col-12 port-container">
								<div class="col-4 port-title">
									<label for="img">* 이미지</label>
								</div>
								<div class="col-10 port-input">
									<input type="file" id="img2" name="img2" class="btn btn-info">
									<span class="btn btn-info select2">선택</span> <span
										class="btn btn-info img-delete2">삭제</span>
									<p id="view"></p>
								</div>
							</div>
							<div class="col-12 img-content">
								<div class="col-4 port-title">
									<label for="img-content2">* 한 줄 설명</label>
								</div>
								<div class="col-4 port-input">
									<input type="text" id="img-content2" name="img-content2"
										readonly placeholder="이미지를 선택해주세요"
										style="width: 500px; height: 40px; background-color: gray;">
								</div>
							</div>
							<div class="col-12 sub-content">
								<span>한글 기준 120자 미만</span>
							</div>
							하나의 이미지를 추가할 공간
							<div class="col-12 port-container">
								<div class="col-4 port-title">
									<label for="img">* 이미지</label>
								</div>
								<div class="col-10 port-input">
									<input type="file" id="img3" name="img3" class="btn btn-info">
									<span class="btn btn-info select3">선택</span> <span
										class="btn btn-info img-delete3">삭제</span>
									<p id="view"></p>
								</div>
							</div>
							<div class="col-12 img-content">
								<div class="col-4 port-title">
									<label for="img-content2">* 한 줄 설명</label>
								</div>
								<div class="col-4 port-input">
									<input type="text" id="img-content3" name="img-content3"
										readonly placeholder="이미지를 선택해주세요"
										style="width: 500px; height: 40px; background-color: gray;">
								</div>
							</div>
							<div class="col-12 sub-content">
								<span>한글 기준 120자 미만</span>
							</div> -->

							<script>
                  // 1번째 이미지 관련 기능
                  // 이미지를 저장하게 되면 글자를 쓸수있게한다.
                  $(".select1").click(function(){
                    // 파일명 추출하기
                    var fileValue = $("#img1").val().split("\\");
                    var fileName = fileValue[fileValue.length-1];
                    
                    if(fileName != null){
                      $("#img-content1").prop("readonly",false);
                      $("#img-content1").css("background-color","white");
                    }
                  })
                  // 삭제 버튼을 누르면 브라우저에 올라온 img 삭제
                  $(".img-delete1").click(function() {
                    // 이미지 file 값 삭제
                    $("#img1").val("");
                    // 한줄평가의 값 삭제
                    $("#img-content1").val("");
                    $("#img-content1").prop("readonly",true);
                    $("#img-content1").css("background-color","gray");
                  });

                  // 2번째 이미지 관련 기능
                  // 이미지를 저장하게 되면 글자를 쓸수있게한다.
                  $(".select2").click(function(){
                    // 파일명 추출하기
                    var fileValue = $("#img2").val().split("\\");
                    var fileName = fileValue[fileValue.length-1];
                    
                    if(fileName != null){
                      $("#img-content2").prop("readonly",false);
                      $("#img-content2").css("background-color","white");
                    }
                  })
                  // 삭제 버튼을 누르면 브라우저에 올라온 img 삭제
                  $(".img-delete2").click(function() {
                    // 이미지 file 값 삭제
                    $("#img2").val("");
                    // 한줄평가의 값 삭제
                    $("#img-content2").val("");
                    $("#img-content2").prop("readonly",true);
                    $("#img-content2").css("background-color","gray");
                  });
                  // 3번째 이미지 관련 기능
                  // 이미지를 저장하게 되면 글자를 쓸수있게한다.
                  $(".select3").click(function(){
                    // 파일명 추출하기
                    var fileValue = $("#img3").val().split("\\");
                    var fileName = fileValue[fileValue.length-1];
                    
                    if(fileName != null){
                      $("#img-content3").prop("readonly",false);
                      $("#img-content3").css("background-color","white");
                    }
                  })
                  // 삭제 버튼을 누르면 브라우저에 올라온 img 삭제
                  $(".img-delete3").click(function() {
                    // 이미지 file 값 삭제
                    $("#img3").val("");
                    // 한줄평가의 값 삭제
                    $("#img-content3").val("");
                    $("#img-content3").prop("readonly",true);
                    $("#img-content3").css("background-color","gray");
                  });
                  

                </script>

							<div class="col-12"
								style="margin-left: 5%; height: 100px; margin-top: 5%; position: relative;">
								<div class="col-4 port-title">
									<label>* 관련 기술</label>
								</div>
								<div class="col-9 port-input" style="font-size: 25px;">
									<input type="checkbox" id="java" name="subject" value="T1">&nbsp;&nbsp;<label
										for="java" style="margin-right: 3%;">java</label> <input
										type="checkbox" id="oracle" name="subject" value="T2">&nbsp;&nbsp;<label
										for="oracle" style="margin-right: 3%;">oracle</label> <input
										type="checkbox" id="html5" name="subject" value="T3">&nbsp;&nbsp;<label
										for="html5" style="margin-right: 3%;">html5</label> <input
										type="checkbox" id="css" name="subject" value="T4">&nbsp;&nbsp;<label
										for="css" style="margin-right: 3%;">css</label> <br> <input
										type="checkbox" id="javascript" name="subject"
										value="javascript">&nbsp;&nbsp;<label for="T5"
										style="margin-right: 3%;">javascript</label> <input
										type="checkbox" id="jquery" name="subject" value="T6">&nbsp;&nbsp;<label
										for="jquery" style="margin-right: 3%;">jquery</label> <input
										type="checkbox" id="etc" name="subject" value="T7">&nbsp;&nbsp;<label
										for="etc" style="margin-right: 3%;">etc</label>
								</div>
							</div>

							<div class="col-12" style="height: 50px; text-align: right;">
								<a href="mypagePortfolioAll.html" class="btn btn-info">취소</a>
								<button type="submit" class="btn btn-info">수정완료</button>
							</div>
					</div>
					</form>
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
	<footer class="footer" style="background-color: #212426;">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 h-100 text-center text-lg-left my-auto">
					<ul class="list-inline mb-2">
						<li class="list-inline-item"><a href="#">고객센터</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">운영시간</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">이용약관</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">공지사항</a></li>
					</ul>
					<p class="text-muted small mb-4 mb-lg-0">&copy; Your Website
						2020. All Rights Reserved.</p>
				</div>
				<div class="col-lg-6 h-100 text-center text-lg-right my-auto">
					<ul class="list-inline mb-0">
						<li class="list-inline-item mr-3"><a href="#"> <i
								class="fab fa-facebook fa-2x fa-fw"></i>
						</a></li>
						<li class="list-inline-item mr-3"><a href="#"> <i
								class="fab fa-twitter-square fa-2x fa-fw"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-instagram fa-2x fa-fw"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

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