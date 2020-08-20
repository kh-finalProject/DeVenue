<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

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

    /*--------------------- Section -----------------------------*/

    section {
      background-color: #212426;
      width: 100%;
      height: 1300px;
      padding: 50px 0 30px 0;
      color: white;
    }

    /* input태그 size */
    .input-size {
      width: 400px;
      height: 50px;
      margin-left: 40px;
    }

    /* label div */
    .form-label {
      width: 200px;
      margin-left: 100px;
      text-align: right;
      font-size: x-large;
      position: absolute;
    }

    /* form의 각각의 div들 */
    .form-submit {
      height: 80px;
    }

    /* input div */
    .form-input {
      position: absolute;
      margin-left: 300px;
    }

    /* 클라이언트/파트너스 라디오 버튼 div */
    .client-radio,
    .partnes-radio {
      width: 200px;
      height: 200px;
      border: 2px dashed white;
      display: inline-block;
      margin-left: 30px;
    }

    

    /* input 서브 설명 */
    .input-subtitle{
      color: grey;
      height: 10px;
      margin-top: -20px;
      margin-bottom: 20px; 
    }

    /* 가입하기 버튼 div */
    .form-btn{
      margin-top: 10px;
      margin-left: 20px;
    }

    /* 가입하기 버튼  */
    .form-btn button{
      font-size: 25px;
      width: 400px;
    }

    /* sns계정 회원가입/ 로그인 div */
    .area-right{
      width: 220px;
      margin-left: 900px;
      position: absolute;
      margin-top: 100px;
    }

    /* 로그인하러가기/카카오로 로그인 div */
    .sns,
    .login {
      height: 120px;
      border-bottom: 2px dashed white;
      margin-top: 20px;
    }

    /* 로그인하러가기/카카오로 로그인 button */
    .sns button,
    .login a {
      font-size: 15px;
      width: 200px;
    }

  </style>
  <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

  <!--font-->
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
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
         	<!-- <button type="button" class="btn btn-secondary">LOGIN</button> -->
			<a href="login.do" class="btn btn-secondary">LOGIN</a>
			<!-- <button type="button" class="btn btn-info" href="sign.do">SIGNIN</button> -->
			<a href="sign.do" class="btn btn-info">SIGNIN</a>
        </div>
        <script>

        </script>
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
    <div class="left-null" style="width: 20%; float: left;"></div>
    <!-- 실제 들어갈 값 -->
    <div class="sign" style="width: 1140px; margin: auto; text-align: center;">
      <!-- 제목 -->
      <div class="sign-title">
        <div class="title">
          <h1>회원가입</h1>
          <br>
        </div>
      </div>
      <div class="area" style="height: 100px;">
        <form method="GET" action="#">
          <div class="form-submit" style="height: 200px;">
            <div class="form-label">
              <label>* 이용목적</label>
            </div>
            <div class="form-input" style="margin-left: 300px;">
              <div class="client-radio">
                <br>
                <input type="radio" id="client" name="purpose" required value="client">&nbsp;&nbsp;&nbsp;클라이언트
                <p>프로젝트를 의뢰하고<br>싶습니다.</p>
                <img src="../image/client.png">
              </div>
              <div class="partnes-radio">
                <br>
                <input type="radio" id="partnes" name="purpose" required value="partnes">&nbsp;&nbsp;&nbsp;파트너스
                <p>프리랜서가 일거리를<br>찾고 있습니다.</p>
                <img src="../image/client.png">
              </div>
            </div>
          </div>
          <br>
          <div class="form-submit">
            <div class="form-label">
              <label for="name">* 이름</label>
            </div>
            <div class="form-input">
              <input type="text" class="input-size" id="name" name="name" required placeholder="성함을 입력해주세요.">
            </div>
          </div>
          <div class="form-submit">
            <div class="form-label">
              <label for="phone">* 연락처</label>
            </div>
            <div class="form-input">
              <input type="tel" class="input-size" id="phone" name="phone" required placeholder="ex) '-'를 빼고 입력해주세요">
            </div>
          </div>
          <div class="form-submit">
            <div class="form-label">
              <label for="nickname">* 닉네임</label>
            </div>
            <div class="form-input">
              <input type="text" class="input-size" id="nickname" name="nickname" required placeholder="닉네임을 입력해주세요.">
            </div>
          </div>
          <div class="form-submit">
            <div class="form-label">
              <label for="email">* 이메일</label>
            </div>
            <div class="form-input">
              <input type="email" class="input-size" id="email" name="emial" required placeholder="ex)email@.naver.com">
            </div>
          </div>
          <div class="form-submit">
            <div class="form-label">
              <label for="emailcheck">* 이메일인증</label>
            </div>
            <div class="form-input">
              <input type="text" class="input-size" id="emailcheck"  style="width: 200px;">
              <button type="button" id="email-confirm" class="btn btn-info btn-lg" style="margin-left: 30px;">인증번호
                받기</button>
            </div>
          </div>
          <div class="form-submit">
            <div class="form-label">
              <label for="pwd">* 비밀번호</label>
            </div>
            <div class="main form-input">
              <input type="password" class="input-size" id="pwd" name="pwd" required placeholder="비밀번호를 입력해 주세요.">
              <i class="fa fa-eye fa-lg"></i>
            </div>
          </div>
          <div class="input-subtitle" style="width: 500px; margin-left: 260px;">
            <span>비밀번호는 8자 이상 32자 이하로 입력해 주세요.</span>
          </div>
          <div class="form-submit">
            <div class="form-label"
              style="width: 200px; margin-left: 100px; text-align: right; font-size: x-large; position: absolute;">
              <label for="pwdcheck">* 비밀번호확인</label>
            </div>
            <div class="main form-input">
              <input type="password" class="input-size" id="pwdcheck" name="pwdcheck" required placeholder="비밀번호를 입력해 주세요.">
              <i class="fa fa-eye fa-lg"></i>
            </div>
          </div>
          <div class="input-subtitle" style="width: 300px; margin-left: 310px;">
            <span>비밀번호 동일하게 입력해 주세요.</span>
          </div>
          <div class="form-submit">
            <div class="form-label">
              <label for="address1">* 우편번호</label>
            </div>
            <div class="form-input">
              <input type="text" class="input-size" id="address1" name="address1" style="width: 200px;">
              <button type="button" id="select_btn" class="btn btn-info btn-lg" style="margin-left: 30px;">검색</button>
            </div>
          </div>
          <div class="form-submit">
            <div class="form-label">
              <label for="address2">* 도로명</label>
            </div>
            <div class="form-input">
              <input type="text" class="input-size" id="address2" name="address2">
            </div>
          </div>
          <div class="form-submit">
            <div class="form-label">
              <label for="address3">* 상세주소</label>
            </div>
            <div class="form-input">
              <input type="text" class="input-size" id="address3" name="address3">
            </div>
          </div>
          <div class="input-subtitle" style="width: 400px;  margin-left: 340px;">
            <input type="checkbox" id="agree">&nbsp;&nbsp;&nbsp;<label for="agree"><a href="https://www.wishket.com/terms-of-service/">이용약관</a> 및 <a href="https://www.wishket.com/privacy/">개인정보 처리방침</a> 에 동의합니다.</label>
          </div>
          <br>
          <div class="form-btn">
            <button type="submit" id="sign" class="btn btn-info btn-lg" disabled="true">가입하기</button>
          </div>
      </div>
      </form>
      <div class="area-right">
        <div class="sns">
          <p><b>카카오톡 계정이 있으신가요?</b></p>
          <button type="button" class="btn btn-warning btn-lg">카카오톡으로 회원가입</button>
        </div>
        <div class="login">
          <p><b>이미 회원이신가요?</b></p>
          <a href="login.do" class="btn btn-info btn-lg">로그인하러 가기</a>
        </div>
      </div>
    </div>

    <script>
      // 클라이언트/파트너스 div 클릭시 라디오 체크
      // 테두리 색도 변경
      $(".client-radio").on("click", function () {
        $("#client").prop("checked", "true");
        $("#partnes").removeAttr("checked");
        $(".client-radio").css("border-color","#165FF2");
        $(".partnes-radio").css("border-color","white");
      })
      $(".partnes-radio").on("click", function () {
        $("#partnes").prop("checked", "true");
        $("#client").removeAttr("checked");
        $(".client-radio").css("border-color","white");
        $(".partnes-radio").css("border-color","#165FF2");
      })

      // 비밀번호 보이기/숨기기
      $(document).ready(function () {
        $('.main i').on('click', function () {
          $('input').toggleClass('active');
          if ($('input').hasClass('active')) {
            $(this).attr('class', "fa fa-eye-slash fa-lg")
              .prev('input').attr('type', "text");
          } else {
            $(this).attr('class', "fa fa-eye fa-lg")
              .prev('input').attr('type', 'password');
          }
        });
      });

      // 이용약관에 동의해야지만 가입하기 버튼 활성화
      $(document).ready(function(){
          $("#agree").change(function(){
              if($("#agree").is(":checked")){
                  $("#sign").prop("disabled",false);
              }else{
                $("#sign").prop("disabled",true);
              }
          });
      });
      

    </script>

    </div>
    <!-- 오른쪽 공백 -->
    <div class="right-null" style="width: 20%; float: right;"></div>
  </section>

  <!-- Footer -->
  <footer class="footer" style="background-color: #212426; border-top: 1px solid white;">
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