<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


    <!--responsive meta tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Landing Page - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
        type="text/css">

    <!--jQuery-->
    <script src="http://code.jquery.com/jquery-Latest.min.js"></script>

    <style>
        body {
            font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
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

        @media (min-width: 768px) {
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

        @media (min-width: 768px) {
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

        @media (max-width: 767px) {

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

        .wizard .nav-tabs>li.active>a,
        .wizard .nav-tabs>li.active>a:hover,
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

            font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif' !important;
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

        .hvr-underline-from-center:hover:before,
        .hvr-underline-from-center:focus:before,
        .hvr-underline-from-center:active:before {
            left: 0;
            right: 0;
        }

        /* 마우스 호버 끝 */

        /* 메뉴바 폰트 */
        #navbarSub ul li a,
        #navbarMain ul li a {
            font-family: 'Jua', sans-serif;
        }

        /* 메뉴바 폰트 끝 */

        /* 글자색 */
        section {
            background-color: #212426;
            width: 100%;
            height: 3000px;
            padding: 50px 0 30px 0;
            color: white;
        }

        /* input태그 size */
        .input-size {
            width: 400px;
            height: 50px;
            margin-left: 40px;
        }

        /* 평가 전체 div */
        .history-container{
            width: 100%;
            height: 260px;
            margin-left:5%;
            margin-top: 5%;
            border: 1px solid white;
            font-size: 18px;
        }

        /* 평가 안쪽 div */
        .history-inner{
            display: inline-block;
            width: 49%;
            border-right: 2px dashed white;
            margin-top: 10px;
        }

        /* 각각의 클라이언트에 평가 div */
        .client-history{
            width: 100%;
            height: auto;
            border: 1px solid white;
            margin-top: 5%;
        }

        /* 각각의 별이 보일 전체 div */
        .star-history{
            margin-top: 1%;
            border-top: 2px dashed white;
            border-bottom: 2px dashed white;
            font-size: 15px;
            padding: 15px 20px 15px 20px;
            text-align: center;
        }

        /* 각각의 별이 보일 div */
        .star{
            display: inline-block;
            padding-left: 10px;
            padding-right: 20px;
            margin-left: 5px;
            border-right: 2px dashed white;
        }

        /* 클라이언트 이미지 */
        .client-img{
            width: 70px;
            height: 70px;
            border-radius: 50px 50px 50px 50px;
            border: 1px solid white;
            display: inline-block;
        }

        /* 클라이언트 평가의 내용 */
        .history-content{
            margin-top: 3%;
            height: 50px;
            width: 100%;
            overflow: hidden;
        }

		/* a태그 밑줄없애기 */
        #subInfoMenu p a{
            text-decoration-line: none;
            color: white;
        }

    </style>
    <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

    <!--font-->
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <!-- chart -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>

<body>
   
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />

	<!--navigation bar 1-->
    <nav class="navbar navbar-expand-lg" style="background-color: black;">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMain"
            aria-controls="navbarMain" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><img src="logo.png" height="80px"
                            style="padding-bottom: 0;padding-top: 0;margin-top: 0;margin-bottom: 0;"><span
                            class="sr-only">(current)</span></a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link hvr-underline-from-center mr-2" href="#">프로젝트찾기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link hvr-underline-from-center mr-2" href="#">프로젝트등록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link hvr-underline-from-center" href="#">파트너스찾기</a>
                </li>
            </ul>

            <ul class="navbar-nav ml-auto">
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
					<c:if test="${loginUser.userType eq 'UT1' || loginUser.userType eq 'UT2'}">
						<h3 align="right" style="color: white">
							<c:out value="${loginUser.userType }관리자"/>
							<div class="btn-group">
							  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    <img src="${contextPath }/resources/images/test.png" height="50px" width="50px" style="border-radius: 50px 50px 50px 50px">
							  </button>
							  <div class="dropdown-menu">
							    <a class="dropdown-item" href="#">profile</a>
							    <div class="dropdown-divider"></div>
							    <c:url var="logout" value="logout.do"/>
							    <a class="dropdown-item" onclick="location.href='${logout }'">logout</a>
							  </div>
							</div>
						</h3>
					</c:if>
					<!-- 사용자 로그인 -->
					<c:if test="${loginUser.userType eq 'UT3' || loginUser.userType eq 'UT4'}">
						<h3 align="right" style="color: white">
							<c:out value="${loginUser.userType }사용자"/>
							<div class="btn-group">
							  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    <img src="${contextPath }/resources/images/admin.png" height="50px" width="50px" style="border-radius: 50px 50px 50px 50px">
							  </button>
							  <div class="dropdown-menu">
							    <a href="profile.do" class="dropdown-item">profile</a>
							    <div class="dropdown-divider"></div>
							    <c:url var="logout" value="logout.do"/>
							    <a class="dropdown-item" onclick="location.href='${logout }'">logout</a>
							  </div>
							</div>
						</h3>
					</c:if>
				</c:if>
				</div>
            </ul>
        </div>
    </nav>

    <script>
        $(function () {
            $("#navbarMain .nav-link").mouseenter(function () {
                $(this).css("font-size", "105%");
            })

            $("#navbarMain .nav-link").mouseleave(function () {
                $(this).css("font-size", "100%");
            })
        })
    </script>
    <!-- sidebar -->
	<jsp:include page="../common/sideMenubarAll.jsp" />


    <!-- Section -->
    <section>
        <!-- 왼쪽 공백 -->
        <!-- <div class="left-null" style="width: 15%; height: 1600px; border: 1px solid yellow; float: left;"></div> -->
        <!-- 실제 들어갈 값 -->
        <!-- <div class="center" style="width: 1140px; margin: auto; text-align: center;"> -->
        <div class="container">
            <div class="row text-white" style="border-bottom: 1px solid lightgray; width: 1000px;">
                <div class="col-12" style="padding:3%; font-size: 150%; font-family: 'Jua', sans-serif;">
                   ${loginUser.memNick } 마이페이지</div>
			</div>
			<div class="row">
				<jsp:include page="../common/myPageMenubar.jsp" />
			</div>
                <div class="col-8 text-white" style="font-family: 'Jua', sans-serif;">
                    <br>
                    <div class="row">
                        <div class="col-12"
                            style="width: 100%; height: 60px; margin-left:5%; padding-right: 0; border-bottom: 2px dashed white;">
                            <p style="float: left; font-size: 30px;">마이페이지 - 프로젝트 히스토리</p>
                            <a href="#" class="btn btn-info" style="float: right;">전체보기</a>
                        </div>
                        <div class="col-12" style="margin-left: 5%; margin-top: 5%;">
                            <h3>평가(총 평가 : ??개)</h3>
                        </div>
                        <div class="col-12 history-container">
                            <div class="col-6 history-inner">
                                <div class="col-12" style="padding: 12px;">
                                    <div class="col-8" style="display: inline-block; text-align: left;">
                                        <span>계약한 프로젝트</span>
                                    </div>
                                    <div class="col-3" style="display: inline-block; text-align: right;">
                                        <span>0 건</span>
                                    </div>
                                </div>
                                <div class="col-12" style="padding: 12px;">
                                    <div class="col-8" style="display: inline-block; text-align: left;">
                                        <span>완료한 프로젝트</span>
                                    </div>
                                    <div class="col-3" style="display: inline-block; text-align: right;">
                                        <span>0 건</span>
                                    </div>
                                </div>
                                <div class="col-12" style="padding: 12px;">
                                    <div class="col-8" style="display: inline-block; text-align: left;">
                                        <span>진행한 프로젝트</span>
                                    </div>
                                    <div class="col-3" style="display: inline-block; text-align: right;">
                                        <span>0 건</span>
                                    </div>
                                </div>
                                <div class="col-12" style="padding: 12px; border-top: 2px dashed white;">
                                    <div class="col-8" style="display: inline-block; text-align: left;">
                                        <span>누적 완료 금액 </span>
                                    </div>
                                    <div class="col-3" style="display: inline-block; text-align: right; ">
                                        <span>0 원</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6" style="display: inline-block; width: 49%; margin-top: 10px;">
                                <div class="col-12" style="padding: 10px;">
                                    <div class="col-4" style="display: inline-block; text-align: left;">
                                        <h6>평균평점</h6>
                                    </div>
                                    <div class="col-7" style="display: inline-block; text-align: right;">
                                        <span>★★★★★&nbsp;&nbsp;<span style="font-size: 30px;">0.0</span></span>
                                    </div>
                                </div>
                                <div class="col-12" style="padding: 1px;">
                                    <div class="col-6" style="display: inline-block; text-align: left;">
                                        <h6>전문성</h6>
                                    </div>
                                    <div class="col-5" style="display: inline-block; text-align: right;">
                                        <span>★★★★★&nbsp;&nbsp;<span>0.0</span></span>
                                    </div>
                                </div>
                                <div class="col-12" style="padding: 1px;">
                                    <div class="col-6" style="display: inline-block; text-align: left;">
                                        <h6>결과물 만족도</h6>
                                    </div>
                                    <div class="col-5" style="display: inline-block; text-align: right;">
                                        <span>★★★★★&nbsp;&nbsp;<span>0.0</span></span>
                                    </div>
                                </div>
                                <div class="col-12" style="padding: 1px;">
                                    <div class="col-6" style="display: inline-block; text-align: left;">
                                        <h6>의사소통</h6>
                                    </div>
                                    <div class="col-5" style="display: inline-block; text-align: right;">
                                        <span>★★★★★&nbsp;&nbsp;<span>0.0</span></span>
                                    </div>
                                </div>
                                <div class="col-12" style="padding: 1px;">
                                    <div class="col-6" style="display: inline-block; text-align: left;">
                                        <h6>일정준수</h6>
                                    </div>
                                    <div class="col-5" style="display: inline-block; text-align: right;">
                                        <span>★★★★★&nbsp;&nbsp;<span>0.0</span></span>
                                    </div>
                                </div>
                                <div class="col-12" style="padding: 1px;">
                                    <div class="col-6" style="display: inline-block; text-align: left;">
                                        <h6>적극성</h6>
                                    </div>
                                    <div class="col-5" style="display: inline-block; text-align: right;">
                                        <span>★★★★★&nbsp;&nbsp;<span>0.0</span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12"
                            style="margin-left: 5%; margin-top: 5%; border-top: 2px dashed white; padding-top: 5%;">
                            <div class="col-5" style="float: left;">
                                <h3>클라이언트 평가</h3>
                            </div>
                            <div class="col-7" style="float: right;">
                                <select name="title" style="width: 150px; height: 30px;">
                                    <option value="development">개발</option>
                                    <option value="design">디자인</option>
                                </select>
                                <select name="category" style="width: 150px; height: 30px;">
                                    <option value="web">웹</option>
                                    <option value="app">앱</option>
                                    <option value="publishing">퍼블리싱</option>
                                    <option value="etc">기타</option>
                                </select>
                                <button type="button" class="btn btn-info">검색하기</button>
                            </div>
                        </div>
                        <div class="col-12" style="width: 100%; height: auto; margin-left:5%; margin-top: 5%;">
                            <!-- 평가 시작 -->
                            <div class="col-12 client-history">
                                <div class="col-12" style="margin-top: 3%;">
                                    <h4>데이터 시각화 솔루션 프로토타입 개발</h4>
                                </div>
                                <div class="col-6" style="margin-top: 1%;">
                                    <div class="col-3" style="display: inline-block;">
                                        디자인
                                    </div>
                                    <div class="col-5" style="display: inline-block; border-left: 1px solid white;">
                                        퍼블리싱
                                    </div>
                                </div>
                                <div class="col-6" style="margin-top: 1%;">
                                    <div class="col-4" style="display: inline-block;">
                                        클라이언트
                                    </div>
                                    <div class="col-6" style="display: inline-block;">
                                        클라이언트명
                                    </div>
                                </div>
                                <div class="col-12" style="margin-top: 1%;">
                                    <table class="table">
                                        <tr>
                                            <th class="table-secondary">
                                                계약금액
                                            </th>
                                            <td class="table-light">
                                                <span>4,040,404원</span>
                                            </td>
                                            <th class="table-secondary">
                                                프로젝트 기간
                                            </th>
                                            <td class="table-light">
                                                <span>60일</span>
                                            </td>
                                            <th class="table-secondary">
                                                계약일자
                                            </th>
                                            <td class="table-light">
                                                <span>2020년 07월 07일</span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-12" style="margin-top: 1%; text-align: center;">
                                    <span style="display: inline-block;">★★★★★</span>
                                    <span style="display: inline-block;">0.0</span>
                                </div>
                                <div class="col-12 star-history">
                                    <div class="col-2 star">
                                        <span>전문성</span>
                                        <span style="display: inline-block;">★★★★★</span>
                                        <span style="display: inline-block;">0.0</span>
                                    </div>
                                    <div class="col-2 star">
                                        <span>결과물만족도</span>
                                        <span style="display: inline-block;">★★★★★</span>
                                        <span style="display: inline-block;">0.0</span>
                                    </div>
                                    <div class="col-2 star">
                                        <span>의사소통</span>
                                        <span style="display: inline-block;">★★★★★</span>
                                        <span style="display: inline-block;">0.0</span>
                                    </div>
                                    <div class="col-2 star">
                                        <span>일정준수</span>
                                        <span style="display: inline-block;">★★★★★</span>
                                        <span style="display: inline-block;">0.0</span>
                                    </div>
                                    <div class="col-2 star" style="border: none;">
                                        <span>적극성</span>
                                        <span style="display: inline-block;">★★★★★</span>
                                        <span style="display: inline-block;">0.0</span>
                                    </div>
                                </div>
                                <div class="col-12" style="margin-top: 2%;">
                                    <div class="col-2" style="display: inline-block; vertical-align: top;">
                                        <div class="client-img">
                                        </div>
                                    </div>
                                    <div class="col-9" style="display: inline-block;">
                                        <div class="col-5">
                                            <span>클라이언트</span>
                                            <span>클라이언트명</span>
                                        </div>
                                        <div class="col-12 history-content">
                                            <p>아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아
                                                아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아
                                                아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아
                                            </p>
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
                                    <div class="col-3" style="display: inline-block;">
                                        디자인
                                    </div>
                                    <div class="col-5" style="display: inline-block; border-left: 1px solid white;">
                                        퍼블리싱
                                    </div>
                                </div>
                                <div class="col-6" style="margin-top: 1%;">
                                    <div class="col-4" style="display: inline-block;">
                                        클라이언트
                                    </div>
                                    <div class="col-6" style="display: inline-block;">
                                        클라이언트명
                                    </div>
                                </div>
                                <div class="col-12" style="margin-top: 1%;">
                                    <table class="table">
                                        <tr>
                                            <th class="table-secondary">
                                                계약금액
                                            </th>
                                            <td class="table-light">
                                                <span>4,040,404원</span>
                                            </td>
                                            <th class="table-secondary">
                                                프로젝트 기간
                                            </th>
                                            <td class="table-light">
                                                <span>60일</span>
                                            </td>
                                            <th class="table-secondary">
                                                계약일자
                                            </th>
                                            <td class="table-light">
                                                <span>2020년 07월 07일</span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-12" style="margin-top: 1%; text-align: center;">
                                    <span style="display: inline-block;">★★★★★</span>
                                    <span style="display: inline-block;">0.0</span>
                                </div>
                                <div class="col-12 star-history">
                                    <div class="col-2 star">
                                        <span>전문성</span>
                                        <span style="display: inline-block;">★★★★★</span>
                                        <span style="display: inline-block;">0.0</span>
                                    </div>
                                    <div class="col-2 star">
                                        <span>결과물만족도</span>
                                        <span style="display: inline-block;">★★★★★</span>
                                        <span style="display: inline-block;">0.0</span>
                                    </div>
                                    <div class="col-2 star">
                                        <span>의사소통</span>
                                        <span style="display: inline-block;">★★★★★</span>
                                        <span style="display: inline-block;">0.0</span>
                                    </div>
                                    <div class="col-2 star">
                                        <span>일정준수</span>
                                        <span style="display: inline-block;">★★★★★</span>
                                        <span style="display: inline-block;">0.0</span>
                                    </div>
                                    <div class="col-2 star" style="border: none;">
                                        <span>적극성</span>
                                        <span style="display: inline-block;">★★★★★</span>
                                        <span style="display: inline-block;">0.0</span>
                                    </div>
                                </div>
                                <div class="col-12" style="margin-top: 2%;">
                                    <div class="col-2" style="display: inline-block; vertical-align: top;">
                                        <div class="client-img">
                                        </div>
                                    </div>
                                    <div class="col-9" style="display: inline-block;">
                                        <div class="col-5">
                                            <span>클라이언트</span>
                                            <span>클라이언트명</span>
                                        </div>
                                        <div class="col-12 history-content">
                                            <p>아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아
                                                아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아
                                                아아아아아ㅏ아아아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아아
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 평가 div끝-->
                        </div>
                    </div>
                </div>
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
                        <li class="list-inline-item">
                            <a href="#">고객센터</a>
                        </li>
                        <li class="list-inline-item">&sdot;</li>
                        <li class="list-inline-item">
                            <a href="#">운영시간</a>
                        </li>
                        <li class="list-inline-item">&sdot;</li>
                        <li class="list-inline-item">
                            <a href="#">이용약관</a>
                        </li>
                        <li class="list-inline-item">&sdot;</li>
                        <li class="list-inline-item">
                            <a href="#">공지사항</a>
                        </li>
                    </ul>
                    <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2020. All Rights Reserved.</p>
                </div>
                <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item mr-3">
                            <a href="#">
                                <i class="fab fa-facebook fa-2x fa-fw"></i>
                            </a>
                        </li>
                        <li class="list-inline-item mr-3">
                            <a href="#">
                                <i class="fab fa-twitter-square fa-2x fa-fw"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <i class="fab fa-instagram fa-2x fa-fw"></i>
                            </a>
                        </li>
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
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>