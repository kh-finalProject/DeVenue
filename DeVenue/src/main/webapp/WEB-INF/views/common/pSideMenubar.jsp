<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


	<!--responsive meta tag-->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>Landing Page - Start Bootstrap Theme</title>
	<!--jQuery-->
	<script src="http://code.jquery.com/jquery-Latest.min.js"></script>

	<!-- Bootstrap core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom fonts for this template -->
	<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
	<link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
		type="text/css">


	<!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet"
		type="text/css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

	<script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

	<!-- chart -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<style>
		body{
			background-color: #212426;
		}
		/* 마이페이지 사이드 메뉴바 전용 css */
		/* 사이드 메뉴바 전체 영역 */
		.myPage_sideNav_area {
			width: 17%;
			height: 100%;
			position: absolute;
			box-shadow: 0px 1px 1px 1px rgb(20, 20, 20);
			font-family: 'Do Hyeon', sans-serif !important;
		}

		/* 사이드바 타이틀(파트너스/클라이언트) */
		.myPage_sideNav_title {
			padding-left: 10%;
			padding-right: 5%;
			padding-top: 25px;
			border-bottom: 2px solid rgb(81, 88, 102);
			padding-bottom: 5.5%;
			font-size: 20px !important;
			border-collapse: collapse;
			background-color: #212426;
			height: 70px;
			letter-spacing: 1px;
			margin-bottom: 10px;
		}

		/* 사이드바 타이틀 제외 항목 영역 */
		.myPage_sideNav_content {
			background-color: #262a2c;
			height: 100%;
		}

		/* 사이드바 메인 항목 */
		.myPage_sideNav_mainC {
			padding-top: 15px;
			padding-bottom: 15px;
			padding-left: 15px;
			padding-right: 15px;
			font-size: 18px;
			border-bottom: 1px solid #212426;
			/* background-color: aqua; */
		}

		/* 사이드바 서브 항목 전체 영역 */
		.myPage_sideNav_serveC {
			display: none;
			margin-left: 5%;
		}

		/* 사이드바 각각의 서브 항목 */
		.myPage_sideNav_serveC div {
			padding-top: 7px;
			padding-bottom: 7px;
			padding-left: 7px;
			padding-right: 7px;
			font-size: 16px;
			color: rgb(205, 215, 226);
			/* background-color: rgb(51, 57, 61); */
		}
	</style>
</head>

<body>
	<!-- 서브 메뉴바 영역-->
	<div class="text-white myPage_sideNav_area">
		<div class="myPage_sideNav_title">
			파트너스
		</div>
		<div class="myPage_sideNav_content">
			<div id="infoMenu" class="myPage_sideNav_mainC">정보 관리<i style="float: right; margin-right: 5%;"
					class="fas fa-angle-right"></i></div>
			<div id="subInfoMenu" class="myPage_sideNav_serveC">
				<div id="userTypeInfo">파트너스 정보</div>
				<div id="pPrfile">프로필</div>
				<div id="pPR">자기소개</div>
				<div id="pPortfolio">포트폴리오</div>
				<div id="pSkill">보유기술</div>
				<div id="pCareer">경력</div>
				<div id="pLicense">학력ㆍ자격증</div>
				<div id="pProjectHistory">프로젝트 히스토리</div>
			</div>
			<div id="accountMenu" class="myPage_sideNav_mainC">계정 관리<i style="float: right; margin-right: 5%;"
					class="fas fa-angle-right"></i></div>
			<div id="subAccountMenu" class="myPage_sideNav_serveC">
				<div id="clientComment">기본 정보 수정</div>
				<div id="insertCComment">신원 인증</div>
				<div id="insertCComment">날인 방법 관리</div>
				<div id="insertCComment">비밀번호 변경</div>
				<div id="insertCComment">회원 탈퇴</div>
			</div>
			<div id="pEvaluate" class="myPage_sideNav_mainC">내게 온 제안</div>
			<script>
				var _ = jQuery.noConflict();
				_(document).ready(function () {
					var sideMainMenu1 = _("#subInfoMenu");
					var sideMainMenu2 = _("#subAccountMenu");

					_("#infoMenu").click(function () {
						if(sideMainMenu1.css('display') == 'none') {
							sideMainMenu1.show(500);
							_(this).css('background-color', 'rgb(51, 57, 61)').children('i').removeClass('fa-angle-right').addClass('fa-angle-down');
						}else {
							sideMainMenu1.hide(500);
							_(this).css('background-color', 'inherit').children('i').removeClass('fa-angle-down').addClass('fa-angle-right');
						}
					});
					_("#accountMenu").click(function () {
						if(sideMainMenu2.css('display') == 'none') {
							sideMainMenu2.show(500);
							_(this).css('background-color', 'rgb(51, 57, 61)').children('i').removeClass('fa-angle-right').addClass('fa-angle-down');
						}else {
							sideMainMenu2.hide(500);
							_(this).css('background-color', 'inherit').children('i').removeClass('fa-angle-down').addClass('fa-angle-right');
						}
					});
				});


				_("#userTypeInfo").on("click", function () {
					location.href = "../findUser/findClientDetail.html";
				}).on("mouseenter", function () {

				});

				_("#projectHistory").on("click", function () {
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
	<!-- 서브메뉴바 끝 -->

</body>

</html>