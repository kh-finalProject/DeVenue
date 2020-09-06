<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .main-title{
            width: 100%;
            height: 60px;
            margin-left:5%;
            padding-right: 0;
            border-bottom: 2px dashed white;
        }
        
        /* 포트폴리오전부를 보여줄 div*/
        .portfolio-view{
            width: 100%;
            height: 350px;
            margin-left: 5%;
            margin-top: 2%;
            border-bottom: 2px dashed grey;
            position: relative;
        }

        /* 포트폴리오의 각 div */
        .portfolio-view .portfolio-info{
            width: 220px;
            height: 310px;
            margin-left: 2%;
            border: 2px solid white;
            display: inline-block;
        }

        /* 포트폴리오의 카테고리 */
        .portfolio-category{
            position: absolute;
            text-align: center;
            margin: auto;
        }

        /* 포트폴리오의 제목 */
        .portfolio-title{
            position: absolute;
            text-align: left;
            margin: auto;
            margin-top: 10px;
        }
    </style>
    <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

    <!--font-->
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <!-- chart -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>

<body>
    <!--Top Button-->
    <a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button"><i class="fas fa-chevron-up"
            style="margin:0"></i></a>
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop() > 10) {
                    $('#back-to-top').css("display", "block")

                } else {
                    $('#back-to-top').css("display", "none")

                }
            });
            // scroll body to 0px on click
            $('#back-to-top').click(function () {
                $('body,html').animate({
                    scrollTop: 0
                }, 400);
                return false;
            });
        });
    </script>

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
                <div class="btn-group" role="group" aria-label="Basic example">
                    <button type="button" class="btn btn-secondary">LOGIN</button>
                    <button type="button" class="btn btn-info">SIGNIN</button>
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

    <!--navigation bar2-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="collapse navbar-collapse" id="navbarSub" style="margin-left: 3%;">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link ml-4 hvr-underline-from-center" href="#">검수 중</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ml-4 hvr-underline-from-center" href="#">지원자 모집 중</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ml-4 hvr-underline-from-center" href="#">진행 중인 프로젝트</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ml-4 hvr-underline-from-center" href="#">종료된 프로젝트</a>
                </li>
            </ul>
    </nav>


    <!-- Section -->
    <br>
    <section>
        <!-- 왼쪽 공백 -->
        <!-- <div class="left-null" style="width: 15%; height: 1600px; border: 1px solid yellow; float: left;"></div> -->
        <!-- 실제 들어갈 값 -->
        <!-- <div class="center" style="width: 1140px; margin: auto; text-align: center;"> -->
        <div class="container">
            <div class="row text-white" style="border-bottom: 1px solid lightgray; width: 1000px;">
                <div class="col-2" style="padding:3%; font-size: 150%; font-family: 'Jua', sans-serif;">
                    마이페이지
                </div>

            </div>
            <div class="row">
                <div class="col-2 text-white"
                    style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
                    <br>
                    <div style="border-bottom: 1px solid lightgray; padding-bottom: 5.5%;">
                        파트너스
                    </div>
                    <!-- 이미지 들어갈 공간 -->
                    <br>
                    <div class="partnes-img"
                        style="width: 90%; height: 150px; border: 1px solid white; margin: auto; border-radius: 50px 50px 50px 50px;">
                        이미지 넣자
                    </div>
                    <br>
                    <!-- 닉네임 -->
                    <div class="partnes-nickname"
                        style="width: 100%; height: 30px; border: 1px solid white; margin: auto; text-align: center;">
                        <span>키미노나마에와</span>
                    </div>
                    <br>
                    <div style="padding-bottom: 5.5%;">
                        <div>
                            <p id="infoMenu">정보 관리<i style="float: right; margin-right: 5%;"
                                    class="fas fa-angle-down"></i></p>
                            <div id="subInfoMenu" style="display:none; margin-left: 5%;">
                            	<P id="myPageDetail"><a href="mtPage.do">전체보기</a></P>
                                <p id="partnesInfo"><a href="partInfo.do">파트너스 정보</a></p>
                                <p id="pPR"><a href="PR.do">자기소개</a></p>
                                <p id="pPortfolio"><a href="portfolio.do">포트폴리오</a></p>
                                <p id="pSkill"><a href="skill.do">보유기술</a></p>
                                <p id="pCareer"><a href="career.do">경력</a></p>
                                <p id="pLicense"><a href="academic.do">학력</a></p>
                                <p id="pStack"><a href="certificate.do">자격증</a></p>
                                <p id="pProjectHistory"><a href="PH.do">프로젝트 히스토리</a></p>
                            </div>
                            <p id="accountMenu">계정 관리<i style="float: right; margin-right: 5%;"
                                    class="fas fa-angle-down"></i></p>
                            <div id="subAccountMenu" style="display:none; margin-left: 5%;">
                                <p id="clientComment">기본 정보 수정</p>
                                <p id="insertCComment">신원 인증</p>
                                <p id="insertCComment">날인 방법 관리</p>
                                <p id="insertCComment">비밀번호 변경</p>
                                <p id="insertCComment">회원 탈퇴</p>
                            </div>
                            <p id="pEvaluate">내게 온 제안</p>
                        </div>
                        <script>
                            $("#infoMenu").click(function () {

                                $("#subInfoMenu").toggle();
                            });

                            $("#accountMenu").click(function () {

                                $("#subAccountMenu").toggle();
                            });

                            $("#clientInfo").on("click", function () {
                                location.href = "../findUser/findClientDetail.html";
                            }).on("mouseenter", function () {

                            });

                            $("#projectHistory").on("click", function () {
                                location.href = "projectHistory.html";
                            });


                            $("#clientComment").on("click", function () {
                                location.href = "clientComment.html";
                            });

                            $("#insertCComment").on("click", function () {
                                location.href = "insertCComment.html";
                            });
                        </script>

                    </div>
                </div>
                <div class="col-8 text-white" style="font-family: 'Jua', sans-serif;">
                    <br>
                    <div class="row">
                        <div class="col-12 main-title">
                            <p style="float: left; font-size: 30px;">마이페이지 - 포트폴리오</p>
                            <a href="mypageAllInfo.html" class="btn btn-info" style="float: right;">내 프로필에서 보기</a>
                        </div>

                        <div class="col-12" style="margin-left: 5%; margin-top: 5%;">
                            <h4>포트폴리오<span style="color: grey;"> / 0개 </span>
                                <a href="mypagePortfolioUpdate.html" class="btn btn-info" style="float: right;">추가하기</a>
                            </h4>
                        </div>
                        <div class="col-12 portfolio-view">
                            <!-- 하나의 포트폴리오 시작 -->
                            <div class="col-4 portfolio-info">
                                <div class="col-12" style="height: 70%;">
                                    <div class="col-11 portfolio-category looking-btn" style="margin-top: 10px; margin-left: 30px; display: none;">
                                        <button type="button" class="btn btn-info">삭제</button>
                                        <a href="mypagePortfolioUpdate.html" class="btn btn-info">수정</a>
                                    </div>
                                    <div class="col-11 portfolio-category" style="margin-top: 70px;">
                                        <h4>디자인</h4>
                                    </div>
                                    <div class="col-11 portfolio-category" style="margin-top: 130px;">
                                        <h5>어플리케이션</h5>
                                    </div>
                                </div>
                                <div class="col-12" style="height: 30%; border-top: 2px dashed grey;">
                                    <!-- <h5>1. 제목을 작성하는 곳입니다.</h5> -->
                                    <div class="col-11 portfolio-title">
                                        <span>제목을 입력</span>
                                    </div>
                                </div>
                            </div>
                            <script>
                                // div 클릭시 그 포트폴리오 정보를 띄어주기
                                $(".portfolio-info").on("click",function(){
                                    location.href= "mypagePortfolio.html";
                                })

                                // 수정,삭제 숨기고 보이게하기
                                $(".portfolio-info").mouseover(function(){
                                    $(".looking-btn").show();
                                })
                                $(".portfolio-info").mouseout(function(){
                                    $(".looking-btn").hide();
                                })
                            </script>
                            <!-- 하나의 포트폴리오 끝 -->
                            <div class="col-4 portfolio-info"></div>
                            <div class="col-4 portfolio-info"></div>
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