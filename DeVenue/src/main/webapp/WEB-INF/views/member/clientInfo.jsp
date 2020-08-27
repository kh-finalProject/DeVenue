<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 이미지 사이즈 맞추기 */
    .image-profile {
      width: auto;
      height: 5rem;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-top: 10%;
    }

    .image-profile img {
      object-fit: fill;
    }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<jsp:include page="../common/cSubMenubar.jsp" />
	
	<div class="container">
    <div class="row text-white" style="border-bottom: 1px solid lightgray;">
      <div class="col-2" style="padding:3%; font-size: 150%; font-family: 'Jua', sans-serif;">
        마이페이지
      </div>

    </div>


    <div class="row">
      <div class="col-2 text-white" style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
        <br>
        <div style="border-bottom: 1px solid lightgray; padding-bottom: 5.5%;">
          클라이언트
        </div>
        <br>
        <div style="padding-bottom: 5.5%;">
          <div>
            <p id="infoMenu">정보 관리<i style="float: right; margin-right: 5%;" class="fas fa-angle-down"></i></p>
            <div id="subInfoMenu" style="display:none; margin-left: 5%;">
              <p id="clientInfo">클라이언트 정보</p>
              <p id="projectHistory">프로젝트 히스토리</p>
            </div>
            <p id="accountMenu">계정 관리<i style="float: right; margin-right: 5%;" class="fas fa-angle-down"></i></p>
            <div id="subAccountMenu" style="display:none; margin-left: 5%;">
              <p id="clientComment">기본 정보 수정</p>
              <p id="insertCComment">신원 인증</p>
              <p id="insertCComment">날인 방법 관리</p>
              <p id="insertCComment">비밀번호 변경</p>
              <p id="insertCComment">회원 탈퇴</p>
            </div>
            <p>결제 관리</p>
            <p id="clientEvaluate">내게 온 제안</p>
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
      <div class="col-10 text-white" style="font-family: 'Jua', sans-serif;">
        <br>
        <div class="row">
          <div class="col-4" style="margin-left:5%; padding-right: 0;">
            <table>
              <tr>
                <td>
                  <div class="image-profile">
                    <img src="${contextPath }/resources/images/showcase.jpg" style="object-fit: cover; width:100px;">
                  </div>
                </td>
                <td>&emsp;&emsp;</td>
                <td>
                  user01(닉네임)&emsp;<a class="badge badge-info">개인</a><br>
                  <p>user01@google.com</p>
                  <i class="far fa-address-card"></i>&nbsp;신원인증
                  &emsp;<i class="fas fa-phone-alt"></i>연락처등록<br>
                </td>
              </tr>
              <tr>
                <td>
                  <br>등록한 프로젝트
                </td>
                <td></td>
                <td style="padding-left:25%">
                  <br>22
                </td>
              </tr>
              <tr>
                <td>
                  <br>계약한 프로젝트
                </td>
                <td></td>
                <td style="padding-left:25%">
                  <br>10
                </td>
              </tr>
            </table>
          </div>
        </div>
        <div class="row">


          <div class="userBoard">
            &emsp;
            <input type="hidden" value="선택한 회원 ID">

            <div class="row"
              style="margin-left:3%; margin-right:3%; padding-bottom: 3%; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
              <div class="col-12">
                <div style="margin-left: 1%; margin-bottom: 2%; margin-top: 2%; width: 80%;">
                  <b>자기 소개</b>
                </div>
                <div style="margin-left: 3%;">
                  <div style=" width:80%;">
                    <p>
                      당시 마르셀리노 감독이 경질될 때 유스 선수들을 중용하지 않는 점이 이유 중 하나로 꼽힌 바 있다. 새롭게 부임한 그라시아 감독 역시 수뇌부로부터 유스 선수들을 많이 기용하라는
                      주문을 받은 것로 알려졌다.

                      이어 페란은 “마르셀리노는 훌륭한 감독이다. 나는 그에게 많은 빚을 졌다”면서 “이강인을 정말 좋아한다. 그 역시 알고 있다. 나와 소브리노가 이강인에게 많은 도움을 줬다.
                      이강인은 위대한 선수가 될 것이다. 발렌시아가 나와 같은 실수를 하지 않기를 바란다. 이강인은 매우 힘들고 외로움을 느꼈기 때문에 사랑과 신뢰가 필요하다”고 덧붙였다.

                      한편 이강인은 2022년 6월이면 발렌시아와의 계약이 만료된다. 발렌시아는 올해 혹은 내년 이강인이 떠나지 않도록 하기 위해 재계약 제안을 건넨 것으로 알려졌다. 하지만 다수
                      스페인 매체들은 “이강인이 출전 기회를 잡고자 이적을 원한다”고 보도 중이다.
                    </p>
                    <a href="#" style="float: right;">자기소개 더 보기 ></a>
                  </div>
                </div>
              </div>
            </div>

            <div class="row"
              style="margin-left:3%; margin-right:3%; padding-bottom: 3%; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
              <div class="col-12">
                <div style="margin-left: 1%; margin-bottom: 2%; margin-top: 2%; width: 80%;">
                  <b>홈페이지</b>
                </div>
                <div style="margin-left: 3%;">
                  <div style=" width:80%;">
                    <a href="http://www.naver.com" style="color:white;">http://www.naver.com</a>
		              <button class="btn-info" type="button" style="float: right; border-radius: 0.3rem; padding: 1%;">수정하기</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>