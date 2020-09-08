<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      <c:url var="clientProfile" value="clientProfile.do">
      	<c:param name="cId" value="${loginUser.memId }"/>
      </c:url>
      
        <p href="${clientProfile }">마이페이지</p>
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
	              location.href = "cMyPageProjectHistory.do?cId=${loginUser.memId}";
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
                    <img src="${contextPath }/resources/proImg/${info.proImg}" style="object-fit: cover; width:100px;">
                  </div>
                </td>
                <td>&emsp;&emsp;</td>
                <td>
                  <!-- user01(닉네임)&emsp;<a class="badge badge-info">개인</a><br>
                  <p>user01@google.com</p>
                  <i class="far fa-address-card"></i>&nbsp;신원인증
                  &emsp;<i class="fas fa-phone-alt"></i>연락처등록<br> -->
                  ${info.memNick }&emsp;<a class="badge badge-info">${info.memTypeKind }</a><br>
                  <p>${info.memEmail }</p>
                  <c:if test="${info.ideStatus eq 'COMPLETE' }">
			        <i class="far fa-address-card"></i>&nbsp;신원인증
			      </c:if>
			      <c:if test="${!empty info.phone || !empty info.cellPhone }">
			      	&emsp;<i class="fas fa-phone-alt"></i>연락처등록<br>
			      </c:if>
                  
                </td>
              </tr>
              <tr>
                <td>
                  <br>등록한 프로젝트
                </td>
                <td></td>
                <td style="padding-left:25%">
                  <br>${info.addProject }
                </td>
              </tr>
              <tr>
                <td>
                  <br>계약한 프로젝트
                </td>
                <td></td>
                <td style="padding-left:25%">
                  <br>${info.stopProject + info.ingProject }
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
                    <p style="line-height:2.0rem;">
                      ${info.introduction }
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
                    <a href="http://www.naver.com" style="color:white;">http://${info.url }</a>
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