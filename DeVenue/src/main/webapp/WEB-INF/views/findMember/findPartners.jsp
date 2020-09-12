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
<!-- <script
  src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
  integrity="sha256-pasqAKBDmFT4eHoN2ndd6lN370kFiGUFyTiUHWhU7k8="
  crossorigin="anonymous"></script> -->

<!-- <script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script> -->
<!-- <script src="http://code.jquery.com/jquery-1.11.1.min.js"
	type="text/javascript"></script> -->
	
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
	
	

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
	height: 100px;
	margin-left: 40px;
}

/* 파트너스 필터 아래 선 라인 */
.filter-bottom {
	width: 100%;
	height: 50px;
	border-bottom: 2px dashed white;
}

/* 필터 div */
.select-list {
	display: inline-block;
}

/* 필터 ul/li 점 없애기 */
.select-list ul li {
	list-style: none;
}

/* 필터 제목 폰트 사이즈 */
.filter-size {
	font-size: 15px;
	margin-bottom: 5px;
}

/* 필터 내용 폰트 사이즈 */
.filter-content {
	font-size: 14px;
	/* margin: 5px 0 0 0; */
}

/* 외주 설명 div */
.content {
	position: absolute;
	width: 500px;
	height: auto;
	border: 1px solid white;
	margin-left: 135px;
	border-radius: 10px 10px 10px 10px;
	font-size: 13px;
	padding-left: 10px;
	padding-top: 10px;
	line-height: 25px;
	margin-top: -90px;
	display: none;
	background-color: #242424;
	z-index: 1;
}

/* 파트너 지역의 전체선택 btn div */
.partners-item button {
	width: 100%;
	height: 25px;
	/* text-align: left; */
}

/* 필터 address(지역) div */
.partners-item-address {
	border: 1px solid gray;
	width: 95%;
	height: 200px;
	overflow: auto;
	border-radius: 10px 10px 10px 10px;
}

/* 필터 address(지역) list */
ul li input {
	margin-bottom: 10;
}

/* 필터 address(지역) list btn(취소/선택) */
.partners-item-btn {
	width: 95%;
	height: 30px;
	border: 1px solid gray;
	text-align: right;
	border-radius: 5px 5px 5px 5px;
	text-align: right;
	padding-right: 10px;
}

/* 필터 address(지역) 취소/선택 input(button) 크기  */
.partners-item-btn input {
	margin: 3 5 0 0;
	font-size: 15px;
}

/* overflow 스크롤 설정 */
.partners-item-address::-webkit-scrollbar {
	width: 10px;
}

.partners-item-address::-webkit-scrollbar-thumb {
	background-color: #2f3542;
	border-radius: 10px;
}

.partners-item-address::-webkit-scrollbar-track {
	background-color: grey;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

/* overflow 스크롤 설정 끝 */

/* 파트너스 찾기해서 나온값을 보여줄 div */
.container-inner {
	/* margin-left: 5%; */
	margin-top: 5%;
}

/* 파트너스 검색할 div */
.partners-select {
	width: 100%;
	height: 50px;
	padding: 5px;
}

/* 파트너스 검색할 table td div 간격 띄우기 */
.border-spacing {
	float: right;
	border-spacing: 100px;
	border-spacing: 10px;
	border-collapse: separate;
}

/* 정렬이 실행되는 div */
/* .sort-active{
            display: inline-block;
        } */
/* 정렬이 실행되지 않는 div */
.sort {
	font-size: 15px;
	width: 100%;
	height: 30px;
	padding: 2%;
	margin-left: 10%;
	margin-top: 2%;
}

/* 각각의 평가 div */
.sort-item {
	display: inline-block;
	border-left: 2px dashed white;
	margin-left: -60px;
}

/* 한페이지에 파트너스 정보를 보여줄 div*/
.partnes-info-container {
	margin-top: 5%;
}

/* 파트너스 정보 박스의 안쪽/내부 */
.inner {
	padding: 2%;
	height: auto;
}

/* 프로필 이미지 보여줄 div */
.profile {
	width: 100px;
	height: 100px;
	border-radius: 50px 50px 50px 50px;
}

/* 하나의 파트너스 정보를 보여줄 div */
.partnes-info {
	width: 100%;
	height: 250px;
	border: 1px solid white;
	margin-bottom: 3%;
}

/* 하나의 파트너스 정보의 왼쪽 div */
.left {
	display: inline-block;
	height: 100%;
	width: 15%;
}

/* 하나의 파트너스 정보의 이미지를 보여줄 div */
.left .img {
	width: 100px;
	height: 100px;
	position: absolute;
	margin-top: 1%;
	margin-left: 1%;
	border-radius: 50px 50px 50px 50px;
}

/* 파트너스의 정보의 닉네임/활동가능성 div */
.left .nickname {
	width: 100px;
	height: 80px;
	position: absolute;
	text-align: center;
	margin-top: 150px;
	margin-left: 1%;
	line-height: 40px;
}

/* 활동가능의 버튼모양 제거 */
.nickname .btn {
	cursor: default;
}

/* 하나의 파트너스 정보의 가운데 div */
.center {
	display: inline-block;
	height: 100%;
	width: 55%;
}

/* 파트너스의 정보의 개발/신원인증/연락처 등록등을 보여줄 바깥div */
.center .personal-info {
	width: 50%;
	height: 40px;
	position: absolute;
	margin-top: 1%;
	margin-left: 1%;
}

/* 개발자 | 개인 사업자 | 신원등록 | 연락처 등록 이런식으로 */
.personal-info span {
	border-right: 1px solid white;
	margin-left: 3%;
	padding-right: 3%;
}

/* 파트너스의 정보의 자기소개를 보여줌 */
.center .self-introduction {
	width: 50%;
	height: 120px;
	position: absolute;
	margin-top: 45px;
	margin-left: 1%;
	overflow: hidden;
}

/* 파트너스 정보의 보유기술을 보여줌 */
.center .skill {
	width: 50%;
	height: 60px;
	position: absolute;
	margin-left: 1%;
	margin-top: 170px;
	padding-top: 1%;
}

/* 파트너스 정보의 보유기술 각각을 보여줌 */
.skill span {
	background-color: lightgray;
	margin: 0 2% 0 2%;
	padding: 0 1% 0 1%;
}

/* 하나의 파트너스 정보의 오른쪽 div */
.hisroty {
	display: inline-block;
	height: 100%;
	width: 29%;
}

/* 오른쪽 div의 별점 */
.hisroty .star {
	position: absolute;
	width: 30%;
	height: 60px;
	text-align: center;
	font-size: 35px;
}

/* 오른쪽 div의 평균별점 */
.hisroty .evaluation {
	position: absolute;
	width: 30%;
	height: 50px;
	margin-top: 60px;
	text-align: center;
}

/* 오른쪽 div의 계약한 프로젝트/ 포트폴리오 갯수 */
.hisroty .contract, .hisroty .portfolio {
	position: absolute;
	width: 30%;
	height: 50px;
	font-size: 20px;
	border-width: 60%;
}

/* div 보다 작은 밑줄 */
.hisroty .star :before, .hisroty .evaluation :before, .hisroty .evaluation :before,
	.hisroty .contract :before, .hisroty .portfolio :before {
	content: "";
	position: absolute;
	left: 0;
	bottom: 0;
	height: 1px;
	width: 85%; /* or 100px */
	border-bottom: 2px dashed white;
	margin-left: 3%;
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
	<jsp:include page="../common/menubar.jsp" />

	<!-- sidebar -->
	<jsp:include page="../common/sideMenubarAll.jsp" />


	<!-- Section -->
	<section>
		<div class="container">
			<div class="row text-white"
				style="border-bottom: 1px solid lightgray; width: 1000px;">
				<div class="col-3"
					style="padding: 3%; font-size: 150%; font-family: 'Jua', sans-serif;">
					파트너스 찾기</div>
			</div>

			<div class="row">
				<!-- 왼쪽 -->
				<div class="col-2 text-white"
					style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
					<br>
					<div class="col-12 filter-bottom">
						<span>파트너스 필터</span>
					</div>
					<br>
					<div>
						<div class="col-12 select-list">
							<div class="filter-size" style="position: absolute;">
								선호 프로젝트 형태 <i class="fas fa-question-circle icon"></i>
							</div>

							<div style="margin-top: 30px;">
								<ul>
									<li class="filter-content"><input type="checkbox"
										id="outP" name="project-form">&nbsp;&nbsp; <label
										for="outP">외주(도급)</label></li>
									<li class="filter-content"><input type="checkbox" id="inP"
										name="project-form">&nbsp;&nbsp; <label for="inP">상주</label>
									</li>
									<li class="filter-content"><input type="checkbox"
										id="allP" name="project-form">&nbsp;&nbsp; <label
										for="allP">와주 + 상주</label></li>
								</ul>
							</div>
							<!-- 근무형태에 따른 검색 -->
							<script type="text/javascript">
                            $(document).ready(function(){
                                $("#outP").change(function(){
                                    if($("#outP").is(":checked")){
                                        alert("외주 선택");
                                    }else{
                                        alert("외주 선택 취소");
                                    }
                                });
                                $("#inP").change(function(){
                                    if($("#inP").is(":checked")){
                                        alert("상주 선택");
                                    }else{
                                        alert("상주 선택 취소");
                                    }
                                });
                                $("#allP").change(function(){
                                	if($("#allP").is(":checked")){
                                        alert("외주 + 상주 선택");
                                    }else{
                                        alert("외주 + 상주 선택 취소");
                                    }
                                })
                                // 만약 둘다 클릭시는?
                                // 컨트롤러에서 넘어오는 값이 없으면 외주+상주로?
                                /* if($("input:checkbox[name=project-form]").is(":checked") == true) {
									alert("뭔값이?");
								} */
                            });
                            </script>
						</div>
						<div class="content">
							<p>
								<b>외주(도급) 프로젝트</b><br> 프로젝트 단위로 금액을 지급받고 원하는 장소에서 진행하는
								프로젝트를 선호하는 파트너<br> <b>상주 프로젝트</b><br> 월 단위로 금액을 지급받고
								클라이언트가 요청한 장소에서 진행하는 프로젝트를 선호하는 파트너
							</p>
						</div>
						<script>
                            /* ? hover시 보여주고 숨기기 */
                            $(".icon").hover(function () {
                                $(".content").show();
                            }, function () {
                                $(".content").hide();
                            })
                        </script>
						<div class="col-12 select-list">
							<ul>
								<li class="filter-size">파트너스 직종</li>
								<ul>
									<li class="filter-content"><input type="checkbox"
										id="development" name="partners-type">&nbsp;&nbsp; <label
										for="development">개발</label></li>
									<li class="filter-content"><input type="checkbox"
										id="design" name="partners-type">&nbsp;&nbsp; <label
										for="design">디자인</label></li>
									<li class="filter-content"><input type="checkbox" id="all"
										name="partners-type">&nbsp;&nbsp; <label for="all">개발
											+ 디자인</label></li>
								</ul>
							</ul>
						</div>
						<!-- 대표 카테고리에 따른 검색 -->
						<script type="text/javascript">
                        $(document).ready(function(){
                            $("#development").change(function(){
                                if($("#development").is(":checked")){
                                    alert("개발 선택");
                                }else{
                                    alert("개발 선택 취소");
                                }
                            });
                            $("#design").change(function(){
                                if($("#design").is(":checked")){
                                    alert("디자인 선택");
                                }else{
                                    alert("디자인 선택 취소");
                                }
                            });
                            $("#design").change(function(){
                                if($("#design").is(":checked")){
                                    alert("디자인 선택");
                                }else{
                                    alert("디자인 선택 취소");
                                }
                            });
  
                            })
                        </script>
						<div class="col-12 select-list">
							<ul>
								<li class="filter-size">파트너 형태</li>
								<ul>
									<li class="filter-content"><input type="checkbox"
										id="solo" name="partners-type">&nbsp;&nbsp; <label
										for="solo">개인</label></li>
									<li class="filter-content"><input type="checkbox"
										id="corporate" name="partners-type">&nbsp;&nbsp; <label
										for="corporate">법인</label></li>
									<li class="filter-content"><input type="checkbox"
										id="team" name="partners-type">&nbsp;&nbsp; <label
										for="team">팀</label></li>
									<li class="filter-content"><input type="checkbox"
										id="solo-work" name="partners-type">&nbsp;&nbsp; <label
										for="solo-work">개인사업자</label></li>
									<li class="filter-content"><input type="checkbox"
										id="corporate-work" name="partners-type">&nbsp;&nbsp;
										<label for="corporate-work">법인사업자</label></li>
									<li class="filter-content"><input type="checkbox"
										id="corporation" name="partners-type">&nbsp;&nbsp; <label
										for="corporation">기업</label></li>
								</ul>
							</ul>
						</div>
						<!-- 회원 형태에 따른 검색 -->
						<script type="text/javascript">
                        	
                        </script>
						<div class="col-12 select-list">
							<div class="filter-size">파트너 지역</div>
							<div class="area2-filter-check">
								<div class="partners-item">
									<button>전체선택</button>
								</div>
								<div class="partners-item-address">
									<ul style="list-style: none; padding: 0;">
										<li><input type="checkbox" id="all-address"> <label>전체선택</label>
											<ul class="address-list"
												style="list-style: none; padding: 0; font-size: 13px;">
												<li><input type="checkbox" id="address1"
													name="address-list"> <label for="address1">서울특별시</label>
												</li>
												<li><input type="checkbox" id="address2"
													name="address-list"> <label for="address2">경기도</label>
												</li>
												<li><input type="checkbox" id="address3"
													name="address-list"> <label for="address3">인청광역시</label>
												</li>
												<li><input type="checkbox" id="address4"
													name="address-list"> <label for="address4">부산광역시</label>
												</li>
												<li><input type="checkbox" id="address5"
													name="address-list"> <label for="address5">대구광역시</label>
												</li>
												<li><input type="checkbox" id="address6"
													name="address-list"> <label for="address6">광주광역시</label>
												</li>
												<li><input type="checkbox" id="address7"
													name="address-list"> <label for="address7">대구광역시</label>
												</li>
												<li><input type="checkbox" id="address8"
													name="address-list"> <label for="address8">울산광역시</label>
												</li>
												<li><input type="checkbox" id="address9"
													name="address-list"> <label for="address9">세종특별자치시</label>
												</li>
												<li><input type="checkbox" id="address10"
													name="address-list"> <label for="address10">강원도</label>
												</li>
												<li><input type="checkbox" id="address11"
													name="address-list"> <label for="address11">충청북도</label>
												</li>
												<li><input type="checkbox" id="address12"
													name="address-list"> <label for="address12">충청남도</label>
												</li>
												<li><input type="checkbox" id="address13"
													name="address-list"> <label for="address13">전라북도</label>
												</li>
												<li><input type="checkbox" id="address14"
													name="address-list"> <label for="address14">전라남도</label>
												</li>
												<li><input type="checkbox" id="address15"
													name="address-list"> <label for="address15">경상북도</label>
												</li>
												<li><input type="checkbox" id="address16"
													name="address-list"> <label for="address16">경상남도</label>
												</li>
												<li><input type="checkbox" id="address17"
													name="address-list"> <label for="address17">제주특별자치도</label>
												</li>
											</ul></li>
									</ul>
								</div>
								<div class="partners-item-btn">
									<input type="reset" class="btn btn-secondary btn-sm" value="취소"
										style="width: 40px; height: 25px; font-size: 13px; text-align: center;">
									<input type="button" class="btn btn-info btn-sm" value="확인"
										style="width: 40px; height: 25px; font-size: 13px; text-align: center;">
								</div>
							</div>
						</div>
						<!-- 오른쪽 -->
					</div>
				</div>
				<div class="col-10">
					<div class="col-12 container-inner">
						<div class="col-10 partners-select">
							<table class="border-spacing">
								<tr>
									<td><select class="btn btn-info btn-sm" id="select-type"
										name="select-type">
											<option value="">----</option>
											<option value="nickname">닉네임</option>
											<option value="project">프로젝트명</option>
									</select></td>
									<td><input type="text" id="select-form" name="select-form">
									</td>
									<td>
										<button id="MainSelect" class="btn btn-info">검색</button>
									</td>
								</tr>
							</table>
							<script type="text/javascript">
                            	$("#MainSelect").on("click",function(){
                            		var type = $("#select-type").val();
                            		var text = $("#select-form").val();
                            		
                            		console.log(type);
                            		console.log(text);
                            		
                            		$.ajax({
                            			url:"searchInput.do",
                            			data:{type:type,text:text},
                            			success:function(data){
                							
                						},
                						error:function(request, status, errorData){
                							alert("error code: " + request.status + "\n"
                									+"message: " + request.responseText
                									+"error: " + errorData);
                						}	
                            		})
                            		
                            	})
                            </script>
						</div>
						<div class="col-12 sort">
							<div class="col-3 sort-item">
								<i class="fas fa-check sort1" style="color: green;"></i> <span
									onclick="view(1);" style="cursor: pointer;">최근 등록 순</span>
							</div>
							<div class="col-3 sort-item">
								<i class="fas fa-check sort2"
									style="color: green; display: none;"></i> <span
									onclick="view(2);" style="cursor: pointer;">평가 높은 순</span>
							</div>
							<div class="col-3 sort-item" onclick="view(3);">
								<i class="fas fa-check sort3"
									style="color: green; display: none;"></i> <span
									onclick="view(3);" style="cursor: pointer;">포트폴리오 많은 순</span>
							</div>
						</div>
						<script>
                            function view(a){
                                if(a ==1){
                                    $(".sort1").css("display","");
                                    $(".sort2").css("display","none");
                                    $(".sort3").css("display","none");
                                }else if(a == 2){
                                    $(".sort1").css("display","none");
                                    $(".sort2").css("display","");
                                    $(".sort3").css("display","none");
                                }else{
                                    $(".sort1").css("display","none");
                                    $(".sort2").css("display","none");
                                    $(".sort3").css("display","");
                                }
                            }
                        </script>
						<div class="col-12 partnes-info-container">
							<div class="col-12 inner">
								<!-- 하나의 파트너스 정보 -->
								<c:forEach var="fp" items="${fpList }">
								<form method="POST" action="fpDetail.do">
									<input type="hidden" name="proId" id="proId" value="${fp.profileId }">
									<input type="text" name="memId" id="memId" value="${fp.memId }">
									<div class="col-12 partnes-info" id="${fp.profileId }">
										<div class="left">
											<div class="img">
											<!-- 로그인이 안되었으면 -->
											<c:if test="${empty sessionScope.loginUser }">
												<a href="logingo.do" class="btn btn-info btn-sm" style="margin-left: 10px; margin-bottom: 10px;">전체보기</a>
											</c:if>
											<!-- 로그인이 되었을때 -->
											<c:if test="${!empty sessionScope.loginUser }">
												<button class="btn btn-info btn-sm" style="margin-left: 10px; margin-bottom: 10px;">전체보기</button>											
											</c:if>
												<img src="image/client.png"
													style="width: 100%; height: 100%;">
											</div>
											<div class="nickname">
												<span style="font-size: 20px;">${fp.memNick }</span> <span
													class="btn btn-info btn-sm">활동가능</span>
											</div>
										</div>
										<div class="center">
											<div class="personal-info">
												<c:choose>
													<c:when test="${fp.ideStatus eq 'COMPLETE' }">
														<span>신원인증</span>
													</c:when>
													<c:otherwise>
														<span style="color: grey;">신원인증</span>
													</c:otherwise>
												</c:choose>
												<%-- <span>${mem.memType }</span> --%>
												<span>${fp.memTypeKind }</span> <span>신원인증</span>
												<c:choose>
													<c:when test="${empty fp.cellPhone }">
														<span style="border: none; color: gray;">연락처 없음</span>
													</c:when>
													<c:otherwise>
														<span style="border: none;">연락처 등록</span>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="self-introduction">
												<p>${fp.introduction }</p>
											</div>
											<div class="skill">
												<span>JAVA</span><span>JQUERY</span>
											</div>
										</div>
										<div class="hisroty">
											<div class="star">
												<span>★★★★★</span>
											</div>
											<div class="evaluation">
												<span style="font-size: 30px;">0.0</span>&nbsp;&nbsp; / 평가<span>&nbsp;0&nbsp;</span>개
											</div>
											<div class="contract" style="margin-top: 120px;">
												<span style="float: left; margin-left: 10px;">계약한
													프로젝트</span> <span style="float: right; margin-right: 30px;">0건</span>
											</div>
											<div class="portfolio" id="" style="margin-top: 180px;">
												<span style="float: left; margin-left: 10px;">포트폴리오 수</span>
												<span style="float: right; margin-right: 30px;">0개</span>
											</div>
										</div>
									</div>
									
									</form>
								</c:forEach>
								<!-- 하나의 파트너스 정보 끝 -->



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
        crossorigin="anonymous"></script> -->
	<!-- <script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script> -->
</body>

</html>