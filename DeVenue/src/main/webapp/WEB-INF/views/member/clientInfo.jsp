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
    
    /* textarea 디자인 */
        .shadow-textarea textarea.form-control::placeholder {
            font-weight: 300;
        }
        .shadow-textarea textarea.form-control {
            padding-left: 0.8rem;
        }
</style>
</head>
<body>
   <jsp:include page="../common/menubar.jsp" />
   <jsp:include page="../common/cSubMenubar.jsp" />
   
   <c:if test="${msg eq 0 }">
      <script>
         $(document).ready(function(){
            alert("평가 대상이 아닙니다.");
         });
      </script>
   </c:if>
   
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
    <jsp:include page="../common/pSideMenubar.jsp"/>
      <div class="col-10 text-white" style="font-family: 'Jua', sans-serif; margin-left:20%; min-height:900px;">
        <br>
        <div class="row">
          <div class="col-5" style="margin-left:5%; padding-right: 0;">
            <table>
              <tr>
                <td>
                  <div class="image-profile">
                    <c:if test="${!empty info.proImg }">
                  <img src="${contextPath }/resources/proImg/${info.proImg}" style="object-fit: cover; width: 80px;">
               </c:if>
               <c:if test="${empty info.proImg }">
                  <img src="${contextPath }/resources/proImg/user7.png" style="object-fit: cover; width: 80px;">
               </c:if>
                  </div>
                </td>
                <td>&emsp;&emsp;</td>
                <td>
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
                  <br>${info.contractProject }
                </td>
              </tr>
            </table>
          </div>
        </div>
        <div class="row">


          <div class="col-10 userBoard">
            &emsp;
            <input type="hidden" value="선택한 회원 ID">
            
            <form action="cMypageInfoUpdate.do">
            <input type="hidden" name="cId" value="${loginUser.memId }">
            <div class="row"
              style="margin-left:3%; margin-right:3%; padding-bottom: 3%; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
              <div class="col-12">
                <div style="margin-left: 1%; margin-bottom: 2%; margin-top: 2%; width: 80%;">
                  <b>자기 소개</b>
                </div>
                <div style="margin-left: 3%;">
                  <div id="introduceDiv" style=" width:100%;">
                    <p id="introduce" style="line-height:2.0rem;">${info.introduction }</p>
                    <!-- <a href="#" style="float: right;">자기소개 더 보기 ></a> -->
                  </div>
                </div>
              </div>
            </div>

            <div class="row"
              style="margin-left:3%; margin-right:3%; padding-bottom: 3%; border-top: 1px solid lightgray; border-bottom: 1px solid lightgray;">
              <div class="col-12">
                <div style="margin-left: 1%; margin-bottom: 2%; margin-top: 2%; width: 100%;">
                  <b>홈페이지</b>
                </div>
                <div style="margin-left: 3%;">
                  <div id="urlDiv" style=" width:100%;">
                    <a id="url" href="http://www.naver.com" style="color:white;">${info.url }</a>
                    <button id="clientInfoUpdate" class="btn-info" type="button" style="float: right; border-radius: 0.3rem; padding: 1%;">수정하기</button>
                    
                    <script>
                       $("#clientInfoUpdate").on("click",function(){
                          var introduce=$("#introduce").text();
                          var url=$("#url").text();
                          console.log(introduce);
                          console.log(url);
                          
                          $("#introduce").css("display","none");
                          $("#url").css("display","none");
                          
                          $urlDiv=$("#urlDiv");
                          $introduceDiv = $("#introduceDiv");
                          
                          var $introduceInput =$("<textarea class='form-control z-depth-1' id='introduceInput' name='introduce' rows='3'>");
                          $introduceInput.text(introduce);
                          $introduceDiv.append($introduceInput);
                          
                          var $urlInput=$("<textarea class='form-control z-depth-1' id='urlInput' name='url' rows='1' style='width:50%;'>");
                          $urlInput.text(url);
                          $urlDiv.append($urlInput);
                          
                          $("#clientInfoUpdate").css("display","none");
                          
                          var $submitBtn = $("<button id='updateBtn' class='btn-info type='submit' style='float: right; border-radius: 0.3rem; padding: 1%;'>");
                          var $cancelBtn = $("<button id='cancelBtn' class='btn-secondary type='button' style='float: right; border-radius: 0.3rem; padding: 1%;'>");
                          $cancelBtn.text("취소하기");
                          $submitBtn.text("수정하기");
                          $urlDiv.append($submitBtn);
                          $urlDiv.append($cancelBtn);
                          
                          $("#cancelBtn").on("click",function(){
                             $introduceInput.css("display","none");
                             $urlInput.css("display","none");
                             $("#introduce").css("display","");
                             $("#url").css("display","");
                             
                             $("#cancelBtn").css("display","none");
                             $("#updateBtn").css("display","none");
                             $("#clientInfoUpdate").css("display","");
                          })
                       })
                    </script>
                    
                  </div>
                </div>
              </div>
            </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    </div>
   <script>
    $(function(){
       $('.myPage_sideNav_area').height(window.innerHeight-$('#mainMenubar').height()-$('#subMenubar').height()-$('footer').height());
    })
   </script>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>