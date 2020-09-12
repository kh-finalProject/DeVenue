<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html style="z-index:0 !important;">
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
         z-index:0 !important;
      }
      /* 마이페이지 사이드 메뉴바 전용 css */
      /* 사이드 메뉴바 전체 영역 */
      .myPage_sideNav_area {
         width: 17%;
         /* position: relative; */
         position: absolute;
         box-shadow: 0px 1px 1px 1px rgb(20, 20, 20);
         font-family: 'Do Hyeon', sans-serif !important;
         /* float:left; */
/*          height: 100vh; */
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
         z-index:11 !important;
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
      
      /* 서브메뉴바 */
        .aTag{
         background-color: #262a2c;
         border: none;
         /* padding-top: 7px; */
         padding-bottom: 7px;
         padding-left: 7px;
         padding-right: 7px;
         font-size: 16px;
         color: rgb(205, 215, 226);
         /* background-color: rgb(51, 57, 61); */
         
       }
       
   </style>
</head>
<script>
$(document).ready(function(){
   var mId = '${loginUser.memId}';
   
   $.ajax({
      url:"getMyPageSidebarProImg.do",
      data:{mId:mId},
      type:"get",
      success:function(proImgName){
         $('.proImg_area').find('img').css('visibility','visible').prop('src', '${pageContext.servletContext.contextPath}/resources/proImg/'+proImgName);
         $('.dropdown-toggle').find('img').css('visibility','visible').prop('src', '${pageContext.servletContext.contextPath}/resources/proImg/'+proImgName);
      },
      error:function(error){
         alert('error : ' + error);
      }
   });
});

</script>
<body>

   <!-- 서브 메뉴바 영역-->
   <c:if test="${loginUser.userType == 'UT3'}">
      <c:set var="clOrPt" value="클라이언트"/>
   </c:if>
   <c:if test="${loginUser.userType == 'UT4'}">
      <c:set var="clOrPt" value="파트너스"/>
   </c:if>
   <div class="text-white myPage_sideNav_area">
      <div class="myPage_sideNav_title">
         ${clOrPt }
      </div>
         <div class="proImg_area" style="text-align: center;margin-top:5px; margin-bottom:10px;display:flex;margin-left:15px;">
            <table border="0" style="margin-left:5px;">
               <tr style="text-align:left;">
                  <td rowspan="3">
                     <img src="" onerror="this.style.visibility='hidden';" width="100px" height="100px" style="border-radius:50%;border:2px solid rgb(81, 88, 102);margin-bottom:3px;">
                  </td>
                  <td style="text-indent:10px;padding:5px;max-width:80px;max-height:80px;">닉네임</td>
               </tr>
               <tr style="text-align:left;">
                  <td style="text-indent:10px;padding:5px;max-width:80px;max-height:80px;">${fp.memNick }</td>
               </tr>
            </table>
         </div>
      <div class="myPage_sideNav_content" style="border-top: 1px solid rgb(61, 68, 82);">
            <div id="infoMenu" class="myPage_sideNav_mainC">정보 관리<i style="float: right; margin-right: 5%;"
                  class="fas fa-angle-right"></i></div>
            <div id="subInfoMenu" class="myPage_sideNav_serveC">
               <%-- <div id="userTypeInfo">${clOrPt } 정보</div> --%>
               <form method="GET" action="fpDetail.do">
                  <input type="hidden" name="proId" value="${profileId }">
                  <input type="hidden" name="memId" value="${memId}">
                  <button class="aTag" style="cursor: text;">전체보기</button>
               </form>
               <form method="GET" action="fpIntroduce,do">
                  <input type="hidden" name="proId" value="${profileId }">
                  <input type="hidden" name="memId" value="${memId}">
                  <button class="aTag" style="cursor: text;">자기소개</button>
               </form>
               <form method="GET" action="fpPortfolioAll.do">
                  <input type="hidden" name="proId" value="${profileId }">
                  <input type="hidden" name="memId" value="${memId}">
                  <button class="aTag" style="cursor: text;">포트폴리오</button>
               </form>
               <form method="GET" action="fpSkill.do">
                  <input type="hidden" name="proId" value="${profileId }">
                  <input type="hidden" name="memId" value="${memId}">
                  <button class="aTag" style="cursor: text;">보유기술</button>
               </form>
               <form method="GET" action="fpCareer.do">
                  <input type="hidden" name="proId" value="${profileId }">
                  <input type="hidden" name="memId" value="${memId}">
                  <button class="aTag" style="cursor: text;">경력</button>
               </form>
               <form method="GET" action="fpScCareer.do">
                  <input type="hidden" name="proId" value="${profileId }">
                  <input type="hidden" name="memId" value="${memId}">
                  <button class="aTag" style="cursor: text;">학력</button>
               </form>
               <form method="GET" action="fpCertificate.do">
                  <input type="hidden" name="proId" value="${profileId }">
                  <input type="hidden" name="memId" value="${memId}">
                  <button class="aTag" style="cursor: text;">자격증</button>
               </form>
            </div>
            <div id="accountMenu" class="myPage_sideNav_mainC">평가 관리<i style="float: right; margin-right: 5%;"
                  class="fas fa-angle-right"></i></div>
            <div id="subAccountMenu" class="myPage_sideNav_serveC">
               <%-- <div id="clientComment" onclick="location.href='${pageContext.servletContext.contextPath}/fpEval.do'">평가 조회</div> --%>
               <form method="GET" action="fpEval.do">
	                  <input type="hidden" name="proId" value="${profileId }">
	                  <input type="hidden" name="memId" value="${memId}">
                  <button class="aTag" style="cursor: text;">평가조회</button>
               </form>
               <form method="GET" action="fpEvalUp.do">
	                  <input type="hidden" name="proId" value="${profileId }">
	                  <input type="hidden" name="memId" value="${memId}">
	                  <input type="hidden" name="clientId" value="${loginUser.memId }">
                  <button class="aTag" style="cursor: text;">평가등록</button>
               </form>
            </div>
      </div>
   </div>
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
      
      // 마이페이지 사이드 메뉴바 길이맞춰주는 함수(이 함수를 각페이지에 넣어주면 됨. .allWrap부분이 자신의 섹션 영역 선택자)
        $(function(){
//            $('.myPage_sideNav_area').height(window.innerHeight-$('#mainMenubar').height()-$('#subMenubar').height()-$('footer').height());
        })
   </script>
   <!-- 서브메뉴바 끝 -->

</body>

</html>