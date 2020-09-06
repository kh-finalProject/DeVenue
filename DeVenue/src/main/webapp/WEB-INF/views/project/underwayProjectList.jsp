<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
    li{
        list-style-type : none ;
    }
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
    #sText{
        font-size:15px;
    }
    #mText{
        font-size:22px;
        font-weight:bold;
        
    }
    #bText{
        font-size:30px;
    }
    
    .filebox label { display: inline-block;
     padding: .5em .75em; color: white;
      font-size: inherit;
       line-height: normal; 
       vertical-align: middle;
        background-color: skyblue;
         cursor: pointer;
          border: 1px solid #ebebeb;
           border-bottom-color: #e2e2e2;
            border-radius: .25em;
             } 
    .filebox input[type="file"]
 { /* 파일 필드 숨기기 */ 
 position: absolute; 
 width: 1px; 
 height: 1px; 
 padding: 0; 
 margin: -1px; 
 overflow: hidden; 
 clip:rect(0,0,0,0); border: 0; }

 .tab {
  /* display: none; */

}


#explainbox{
    width:100;
    height:200;
    border: 1px solid #2098d1;
  
}
#projectbox{
    width:100;
    height:200;
  border: 1px solid #2098d1;
}
#profilebox{
    width:70px;
    height: 50px; 
    border-radius: 70%;
    overflow: hidden;
   
}
.profile {
    width: 10px;
    height: 10px;
    object-fit: cover;
}
button{
  width:90px;
}
</style>

</head>
<body>
<jsp:include page = "../common/menubar.jsp"/>
	<jsp:include page="../common/cSubMenubar.jsp" />


  
<div class ="middle" style ="background-color:black;  font-family: 'Jua', sans-serif; " >
  <form id="regForm" action="">

  <div class ="container">
    <br>

    <div class="row" style ="margin-top: 60px; margin-bottom:60px;" >
      <div class="col-2 text-white" style="border-right: 2px solid #2098d1; margin-right:40px; margin-left:70px; font-family: 'Jua', sans-serif;">
         
          <div style="padding-bottom: 5.5%;  " >
            <div>
              <table  width="100px" height="100px" >
                  <td  id="bText" style ="color:white; border-bottom: 3px solid #2098D1; margin-bottom: 100px;">클라이언트</td>
                  <tr>
                    
                    <td>
                        <br>
                        <div id="profilebox">
                          <img id="profile" src="profileEx.png">
                        
                      </div>
                      
                      
                    </tr>
                    <td  id="sText" style ="color:gray">클라이언트</td>
                    
                    
                    <tr>
                      <td style= "color:#2098D1">닉네임</td>
                    </tr>
                    
                    <td>sailer5247@gmail.com</td>
                 
                  </tr>
              </table>

              
            </div>
            <br>

              <div>
                <li  id ="bText" style ="color:#2098d1  "> 지원자 모집중</li>
              </div>
             

          </div>
      </div>








        <!--정보입력-->
        <div class= "col-lg-6" style ="background-color: black; height:auto;  color:white">
        
        <table width="533px">
          <tr>
           <td> <li id  ="bText">진행중인 프로젝트 <a id ="sText" style ="color:gray;">현재 진행 중인 프로젝트를 확인할 수 있습니다.</a></li></td>
          
           
          </tr>
          <tr  style ="border-bottom: solid 3px #2098d1;">
          <td></td>
        <tr>
        </table>
          
          <br> 

        <div id= "explainbox" style= "padding:20px;">
            
            <li id ="sText">1. 프로젝트는 클라이언트의 대금 결제 이후에 진행됩니다.<br>
                2. DEVENUE은 <대금보호시스템>을 통해 프로젝트가 완료될 때까지 대금을 안전하게 보호합니다.<br>
                3. 프로젝트 계약 관리에서 진행 중인 프로젝트의 계약 정보를 확인할 수 있습니다.<Br>
                4. 프로젝트 진행 중, 문제 상황이 발생하였을 시 DEVENUE  매니저에게 문의해주세요.<br>
                문제 상황을 원활히 해결할 수 있도록 도와드립니다.
            </li>
        </div>
        <br>
           <c:choose>
       <c:when test="${!empty list1}">
       <c:forEach var ="p" items="${list1}">
             <c:if test="${loginUser.memId eq p.memId }">
        <div id ="projectbox" style ="margin-top:50px;" >
          <table width="533px"   >
              <thead>

                  <tr >
                      <td><li style= "color: white; padding-left:10px; padding-top:10px;" >${p.proName}</li></td>
                      
                      
                  </tr>
                  
                  <tr id ="sText" >
                      <td colspan="6" style="border-bottom:2px solid #2098d1; padding-left:10px; ">
                        <span class="badge badge-primary">${p.proMCId}</span>
                        <span class="badge badge-success">${p.proDCId}</span></td>
                      
                  </tr>
                  <tr style= "border-bottom:2px solid #2098d1" id ="sText" >
                     
                      <td><img
						src="${contextPath}/resources/images/money	.png" height="30px"
						 width  ="20px" style ="margin-left: 20px; padding-top:10px;  padding-bottom:10px;" >  <span class="badge badge-secondary" style ="margin-right:5px;">예상금액    </span>
                    </td>
                      <td > ${p.proPayment}원&nbsp;&nbsp;&nbsp;</td>
              
                      <td ><img
						src="${contextPath}/resources/images/period.png" height="30px"
						 width  ="20px;"> <span class="badge badge-secondary" style ="margin-right:5px;">예상기간   </span></td>
                      <td>${p.proDuration}&nbsp;&nbsp;&nbsp;</td>
                      <td><li><img
						src="${contextPath }/resources/images/deadline.png" height="30px"
						 width  ="20px;"> <span class="badge badge-secondary" style ="margin-right:5px;">모집마감    </span></li></td>
                      <td><li style= "margin-right:15px;">${p.proREndDate}&nbsp;&nbsp;&nbsp;</li></td>
                 
                  </tr>
                  <tr >
                      <table  id ="sText" width="534px">
                          <tr  align ="center" style ="border-bottom:2px solid ; padding:1px; height:50px;" id ="sText">
                            
                              <td  style =  > <span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px;  width:80px;">기획상태    </span></td>
                              <td  >${p.proPlan}</td>
                              <td  style = "  margin-left:10px;"><span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px;  width:80px;">매니징 경험</span></td>
                              <td  >${p.proManage}</td>
                              <td  style = "  padding:1px;" ><span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px;  width:80px;">예상 시작일</span></td>
                              <td  >${p.proStartDate}</td>
                              
                          </tr>
                          <tr  align ="center" style ="border-bottom:2px solid #2098d1; height:50px;" id ="sText">
                              <td  style =  ><span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px;  width:80px;">프로젝트 종류</span></td>
                              <td  >${p.proMaintain }</td>
                              <td style   ><span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px; width:80px;">위치</span></td>
                              <td >서울시<br>강남구</td>
                              <td style =  ><span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px;  width:80px;">파트너스 수 </span></td>
                              <td width="120px; " >${p.proStartDate}</td>
                            
                          </tr>
                       
                          <tr  align ="center" style= "border:1px solid black;" height="30" id ="sText">
                           
                              <td colspan="6">
                                  <div style= "float:right; margin-right:30px; padding:10px;">
                                 
                                  <!-- Button trigger modal -->
                                <button class="btn/middle btn-info" style= "color:white; width:100px; margin-top:10px;">중단 신청</button>
                                 <!-- Button trigger modal -->
<button type="button" class="btn/middle btn-info" style= "color:white; width:100px;" data-toggle="modal" data-target="#exampleModal">
  연장 신청
   </button>
   
   <!-- Modal -->
   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
     <div class="modal-dialog" >
       <div class="modal-content" style= "background-color:#2098d1; width:800px; ">
         <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel">연기 사유</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div>
         <div class="modal-body" style ="background-color: black;">
          <div id="intendPeriod">
              <table>
                  <tr>
                      <td>프로젝트 명 :  <i style ="color:#2098D1" id ="bText">Title</i> </td>
                     

                  </tr>
                  <tr>
                      <td>연기 사유를 작성하시오.</td>
                  </tr>
                  <tr>
                      <td><textarea rows="7" cols="50">연기 사유를 작성해 주세요</textarea></td>
                  </tr>
                  <tr>
                      <td>*DEVENUE관리자가 승인시 검수중인 프로젝트 페이지에서 변경하실수 있습니다.<BR>
                      &nbsp;&nbsp;승인까지 최대 24시간이 소요됩니다.<br>
                      &nbsp;&nbsp;사유가 부적절, 불분명할 경우 거절될수 있습니다.</td>
                  </tr>
              </table>
          </div>
          </div>
         <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Submit</button>
           <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          
         </div>
                              </div>
</div>
</div>
                                <BR><button class="btn/middle btn-info" style= "color:white; width:100px; border-top:black 2px solid" >프로젝트 열람</button>
                                <button class="btn/middle btn-info" style ="color:white; width:100px; border-top:black 2px solid; margin-bottom: 10px;">계약서 다운로드</button>
                                        
                            </td>
                        </tr>
                    </table>
                </tr>
            </thead>
                
       
              </table>      
      </form>
      </div>
      </c:if>
     </c:forEach>
      </c:when>
    <c:when test="${empty list1}">
    <br>
 <div id= "explainbox" style ="padding:30px;">
              
              <li id ="sText" style ="margin-left:80px; font-size:20px;">
              	진행중인 프로젝트를 찾을 수 없습니다!
                
              </li>
          </div>
    
    </c:when>
    </c:choose>
         


    </div>
    <br>
      <br>
     
       
    </div>
    <div class= "col-lg-1" style ="background-color: black;">.col-lg-3</div>
</div>

</div>


<jsp:include page = "../common/footer.jsp"/>
</body>
</html>