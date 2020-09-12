<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>디베뉴 관리자 채팅관리1 - 채팅 목록</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <!-- <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico"> -->
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <!-- <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css"> -->
    <!-- animate CSS
		============================================ -->
    <!-- <link rel="stylesheet" href="css/animate.css"> -->
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/normalize.css">
    <!-- meanmenu icon CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/meanmenu.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/main.css">
    <!-- morrisjs CSS
		============================================ -->
    <!-- <link rel="stylesheet" href="css/morrisjs/morris.css"> -->
    <!-- mCustomScrollbar CSS
		============================================ -->
    <!-- <link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css"> -->
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/metisMenu.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <!-- <link rel="stylesheet" href="css/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="css/calendar/fullcalendar.print.min.css"> -->
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <!-- <script src="js/vendor/modernizr-2.8.3.min.js"></script> -->
</head>

<body>
    <!-- 좌측 사이드 메뉴 -->
    <div class="left-sidebar-pro">
        <nav id="sidebar" class="">
            <div class="sidebar-header">
                <a href="#"><img class="main-logo" src="${pageContext.servletContext.contextPath }/resources/image/comLogo3.jpg" alt="" width="200" height="60" /></a>
            </div>
            <div class="left-custom-menu-adp-wrap comment-scrollbar">
                <nav class="sidebar-nav left-sidebar-menu-pro">
                    <ul class="metismenu" id="menu1">
                        <li class="active">
                            <a class="has-arrow" href="#">
                                <span class="mini-click-non">채팅</span>
                            </a>
                            <ul class="submenu-angle" aria-expanded="true">
                                <li><a title="Dashboard v.1" href="gotoChatOption.do"><span class="mini-sub-pro">채팅 설정</span></a></li>
                                <li><a title="Dashboard v.2" href="gotoChatBotManage.do"><span class="mini-sub-pro">챗봇 데이터 설정</span></a></li>
                                <li><a title="Dashboard v.3" href="goChatListManage.do"><span class="mini-sub-pro">채팅목록 관리</span></a></li>
                                <li><a title="Dashboard v.3" href="gotoIdenManage.do"><span class="mini-sub-pro">신원인증 관리</span></a></li>
                                <li><a title="Dashboard v.3" href="gotoDeclareManage.do"><span class="mini-sub-pro">신고 관리</span></a></li>
                            </ul>
                        </li>
                        <li>
                            <a title="Landing Page" href="#" aria-expanded="false">
                                <span class="mini-click-non">항목2</span>
                            </a>
                        </li>
                        <li>
                            <a class="has-arrow" href="#" aria-expanded="false">
                                <span class="mini-click-non">항목3</span>
                            </a>
                            <ul class="submenu-angle" aria-expanded="false">
                                <li><a title="All Professors" href="#"><span class="mini-sub-pro">asdf</span></a></li>
                                <li><a title="Add Professor" href="#"><span class="mini-sub-pro">sadf</span></a></li>
                                <li><a title="Edit Professor" href="#"><span class="mini-sub-pro">asdf</span></a></li>
                                <li><a title="Professor Profile" href="#"><span class="mini-sub-pro">asdf</span></a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </nav>
    </div>
    <!-- 사이드 메뉴 끝 -->
    <!-- 상단 가로메뉴 -->
    <div class="all-content-wrapper">
        <div class="container-fluid" style="background-color: rgb(10,10,10);">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="logo-pro">
                        <a href="#"><img class="main-logo" src="${pageContext.servletContext.contextPath}/resources/image/comLogo3.jpg" alt="" height="60" width="200" /></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-advance-area">
            <div class="header-top-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="header-top-wraper">
                                <div class="row">
                                    <div class="col-lg-6 col-md-7 col-sm-6 col-xs-12">
                                        <div class="header-top-menu tabl-d-n">
                                            <ul class="nav navbar-nav2 mai-top-nav">
                                                <li class="nav-item"><a href="#" class="nav-link">Home</a>
                                                </li>
                                                <li class="nav-item"><a href="#" class="nav-link">회원</a>
                                                </li>
                                                <li class="nav-item dropdown res-dis-nn">
                                                    <a href="#" data-toggle="dropdown" role="button"
                                                        aria-expanded="false" class="nav-link dropdown-toggle">프로젝트
                                                        <span class="angle-down-topmenu"><i
                                                                class="fa fa-angle-down"></i></span></a>
                                                    <div role="menu" class="dropdown-menu animated zoomIn">
                                                        <a href="#" class="dropdown-item">뭐든</a>
                                                        <a href="#" class="dropdown-item">필요한거</a>
                                                        <a href="#" class="dropdown-item">하면</a>
                                                        <a href="#" class="dropdown-item">되지</a>
                                                    </div>
                                                </li>
                                                <li class="nav-item"><a href="#" class="nav-link">채팅</a>
                                                </li>
                                                <li class="nav-item"><a href="#" class="nav-link">etc</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                        <div class="header-right-info">
                                            <ul class="nav navbar-nav2 mai-top-nav header-right-menu">
                                                <li class="nav-item">
                                                    <a href="#" data-toggle="dropdown" role="button"
                                                        aria-expanded="false" class="nav-link dropdown-toggle">
                                                        <img src="img/admin1.jpg" alt="" />
                                                        <span class="admin-name">관리자 배혜린</span>
                                                        <i class="fa fa-angle-down edu-icon edu-down-arrow"></i>
                                                    </a>
                                                    <ul role="menu"
                                                        class="dropdown-header-top author-log dropdown-menu animated zoomIn">
                                                        <li><a href="#"><span
                                                                    class="edu-icon edu-home-admin author-log-ic"></span>관리자
                                                                계정</a>
                                                        </li>
                                                        <li><a href="#"><span
                                                                    class="edu-icon edu-user-rounded author-log-ic"></span>프로필
                                                                관리</a>
                                                        </li>
                                                <li><a href="#"><span
                                                            class="edu-icon edu-settings author-log-ic"></span>설정</a>
                                                </li>
                                                <li><a href="#"><span
                                                            class="edu-icon edu-locked author-log-ic"></span>로그아웃</a>
                                                </li>
                                            </ul>
                                            </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 반응형 주메뉴 담당(사이드바가 주메뉴가 됨..?) -->
            <div class="mobile-menu-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="mobile-menu">
                                <nav id="dropdown">
                                    <ul class="mobile-menu-nav">
                                        <li><a data-toggle="collapse" data-target="#Charts" href="#">반응형항목1<span
                                                    class="admin-project-icon edu-icon edu-down-arrow"></span></a>
                                            <ul class="collapse dropdown-header-top">
                                                <li><a href="#">Dashboard v.1</a></li>
                                                <li><a href="#">Dashboard v.2</a></li>
                                                <li><a href="#">Dashboard v.3</a></li>
                                                <li><a href="#">Analytics</a></li>
                                                <li><a href="#">Widgets</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">반응형항목2</a></li>
                                        <li><a data-toggle="collapse" data-target="#demoevent" href="#">반응형항목3<span
                                                    class="admin-project-icon edu-icon edu-down-arrow"></span></a>
                                            <ul id="demoevent" class="collapse dropdown-header-top">
                                                <li><a href="#">All Professors</a>
                                                </li>
                                                <li><a href="#">Add Professor</a>
                                                </li>
                                                <li><a href="#">Edit Professor</a>
                                                </li>
                                                <li><a href="#">Professor Profile</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 반응형 메뉴 끝 -->

            <!-- 여기서부터 콘텐츠 시작하면 됨 -->
            
<!-- 메뉴바에 싸이게 하기 위해 영역을 마무리 하지 않음 -->
<!--         </div> -->
<!--     </div> -->

    <!-- jquery : 제이쿼리
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/jquery-1.12.4.min.js"></script>

    <!-- bootstrap JS : 부트스트랩 담당..?
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js"></script>

    <!-- meanmenu JS : 반응형 메뉴바 담당
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.meanmenu.js"></script>

    <!-- metisMenu JS : 사이드 메뉴바 담당
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/metisMenu.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/metisMenu-active.js"></script>

    <!-- main JS : 기본적인거 담당
		============================================ -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/main.js"></script>
</body>

</html>