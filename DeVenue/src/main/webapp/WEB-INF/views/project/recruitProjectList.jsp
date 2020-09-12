<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.boxbox{
width:536px;
background-color :#192424;
}
</style>

</head>
<body>


	<jsp:include page = "../common/menubar.jsp"/>
	<!-- 클라이언트 계정 로그인 -->
	<jsp:include page="../common/cSubMenubar.jsp" />
	

   <div class= "container">
<div class ="middle" style ="background-color:#212426;  font-family: 'Jua', sans-serif; " >
  <form id="regForm" action="">
      <div class="row text-white" style="border-bottom: 1px solid lightgray;">
      
            <div class="col-3" style="padding:3%; font-size: 150%; font-family: 'Jua', sans-serif;">
               모집중인 프로젝트
            </div>

        </div>


        <div class="row">
            <div class="col-2 text-white" style="border-right: 1px solid lightgray;font-family: 'Jua', sans-serif;">
                <br>
                <div style="border-bottom: 1px solid lightgray; padding-bottom: 5.5%; ">
         
                </div>
            </div>
           

        </div>

        <div class="row">
            <div class="col-2 text-white" style="border-right: 1px solid lightgray; font-family: 'Jua', sans-serif;">
                <br>
                <div style="padding-bottom: 5.5%;">
                  
                      <div class="proImg_area" style="text-align: center;margin-top:5px; margin-bottom:10px;display:flex;margin-left:15px;">
            <table border="0" style="margin-left:5px;">
               <tr>
                  <td>
                     <img id="changeImg" style="margin-bottom:5px;" src="${pageContext.servletContext.contextPath }/resources/proImg/${mImg}" class="avatar img-circle img-thumbnail" id="profileImg" alt="avatar" width="200px" height="200px" style="max-width: 100%;">
                  </td>
               </tr>
               <tr style="text-align:left;">
               
                  
                  <td style="text-indent:10px;padding:5px;max-width:80px;max-height:80px;">이름 </td>
                  <td style="padding:5px;max-width:80px;max-height:80px;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;">${loginUser.memName }</td>
               </tr>
               <tr style="text-align:left;">
                  <td style="text-indent:10px;padding:5px;max-width:80px;max-height:80px;">닉네임</td>
                  <td style="padding:5px;max-width:80px;max-height:80px;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;">${loginUser.memNick }</td>
               </tr>
               <tr>
                  <td colspan="2" style="text-indent:10px;padding:5px;max-width:80px;max-height:80px;text-align: left;">
                     <c:if test="${loginUser.memAction =='Y'}">
                        <h6><span class="badge badge-primary" style="text-indent:0px;">활동 중</span></h6>
                     </c:if>
                     <c:if test="${loginUser.memAction =='N'}">
                        <h6><span class="badge badge-secondary" style="text-indent:0px;">활동 비활성화</span></h6>
                     </c:if>
                  </td>
               </tr>
            </table>
         </div>
                 
                    
                    <hr style=" margin:0px auto; margin-top:5%; margin-bottom:10%;">
                    <div>
              
                        
                        <p id="clientEvaluate" style="cursor:pointer;">카테고리<i style="float: right; margin-right: 5%;" class="fas fa-angle-down"></i></p>
                        <div id="subClientEva" style="display:none; margin-left: 5%;">
                           <li id="btext" style ="color:blue;">검수중</li>
                  <br>
                  <c:url var="temStoreList" value="temStoreList.do">
						<c:param name="memId" value= "${loginUser.memId}" ></c:param>
						</c:url>
                  <li><a href ="${temStoreList}" style ="color :white;">임시 저장 </a></li>
                  <br>
                  <li ><a href ="addFailProjectList.do"  style ="color :white;">등록 실패</a></li>
                  <br>
                  
                            
                        </div>
                    </div>
                   
                    
                    <script>
                 

                        $("#clientEvaluate").click(function() {
                            $("#subClientEva").toggle();
                        });

                       
                    </script>

                </div>
            </div>

  
    








        <!--정보입력-->
        <div class= "col-6" style ="background-color: #212426;  margin-left:120px; height:auto;  color:white">
        
          <table width="540px">
            <tr style ="border-bottom: solid 3px #2098d1;" >
             <td> <li id  ="bText">모집중인 프로젝트</li></td>  
             
            </tr>
          </table>
            
            <br> 
  
          <div id= "explainbox" class="boxbox" style ="padding:30px;">
              
              <li id ="sText">1. 프로젝트 내용 작성 중 임시 저장한 프로젝트 목록입니다.<br>
                2. [수정] 버튼을 클릭하여 프로젝트의 내용을 수정할 수 있습니다.
                
              </li>
          </div>






<c:choose>
<c:when test="${!empty list1}">
       <c:forEach var ="p" items="${list1}">
        <div id ="projectbox" class="boxbox" style ="margin-top:50px;" >
          <table width="533px"   >
              <thead>
<input type ="hidden" value = ${p.proId} >
               
                      <li style= "color: white; width:400px; padding-left:10px; padding-top:10px;" >${p.proName}</li>
                      
                      
                 
               <tr id ="sText" >
                      <td colspan="6" style="border-bottom:2px solid #2098d1; padding-left:10px; ">
                        <span class="badge badge-primary">${p.proMCType}</span>
                        <span class="badge badge-success">${p.proDCType}</span></td>
                      
                  </tr>
                  <tr style= "border-bottom:2px solid #2098d1" id ="sText" >
                     
                      <td><img
						src="${contextPath}/resources/images/money	.png" height="30px"
						 width  ="20px" style ="margin-left: 20px; padding-top:10px;  padding-bottom:10px;" >  <span class="badge badge-secondary" style ="margin-right:5px;">예상금액    </span> ${p.proPayment}원
                    </td>
                     
              
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
                          <tr  align ="center" style ="border-bottom:2px solid #2098d1 ; padding:1px; height:50px;" id ="sText">
                            
                              <td  style =  > <span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px;  width:80px;">프로젝트번호    </span></td>
                              <td  >${p.proId}</td>
                              <td  style = "  margin-left:10px;"><span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px;  width:80px;">예상 종료일</span></td>
                              <td  >${p.proEndDate}</td>
                              <td  style = "  padding:1px;" ><span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px;  width:80px;">예상 시작일</span></td>
                              <td  >${p.proStartDate}</td>
                              
                          </tr>
                          <tr  align ="center" style ="border-bottom:2px solid #2098d1; height:50px;" id ="sText">
                              <td  style =  ><span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px;  width:80px;">회원형태</span></td>
                              <td  >${p.proMTK }</td>
                              <td style   ><span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px; width:80px;">위치</span></td>
                              <td>${p.proLocation }</td>
                              <td style =  ><span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px;  width:80px;">파트너스 수 </span></td>
                              <td width="120px; " >${p.proRecruitNum}</td>
                            
                          </tr>
                            <tr  align ="center" height="30" id ="sText">
                             
                                <td colspan="6" style= "border:1px solid #2098d1;">
                                    <div style= "float:right; margin-right:30px; padding:10px;">
                                    <button class="btn/middle btn-info" style= "color:black; width:90px;" onclick="location.href='proDelete.do?proId='+${p.proId}">취소</button>
<button type='button' class="btn/middle btn-info" style= "color:black; width:90px;" onclick="location.href='applycomfirmList.do?proId='+${p.proId}"> 지원자 목록</button>
 



        </div>
      </div>
    </div>
  </div>

</td>
</tr>   
                     
      </table>      
      </form>
      </div>
     </c:forEach>
      </c:when>
    <c:when test="${empty list1}">
    <br>
 <div id= "explainbox" style ="padding:30px;">
              
              <li id ="sText" style ="margin-left:80px; font-size:20px;">
              	모집중인 프로젝트를 찾을 수 없습니다!
                
              </li>
          </div>
    
    </c:when>
    </c:choose>
    </div>
 
	
	
	
	
	
	
<jsp:include page = "../common/footer.jsp"/>
</body>
</html>