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

    header.masthead {
      position: relative;
      background-color:  #212426;
      background: url("mainImg.jpg") no-repeat center center;
      background-size: cover;
      padding-top: 8rem;
      padding-bottom: 8rem;
      height: 50rem;
    }	

    header.masthead .overlay {
      position: absolute;
      background-color: #2124269;
      height: 100%;
      width: 100%;
      top: 0;
      left: 0;
      opacity: 0.3;
    }
.boxbox{
width:536px;
background-color :#192424;
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
form{
background:#21242;
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
<body>

<jsp:include page = "../common/menubar.jsp"/>

	
	<!-- 클라이언트 계정 로그인 -->
	<jsp:include page="../common/cSubMenubar.jsp" />

  

  <div class= "container">
<div class ="middle" style ="background-color:#212426;  font-family: 'Jua', sans-serif; " >
  <form id="regForm" action="">
      <div class="row text-white" style="border-bottom: 1px solid lightgray;">
      
            <div class="col-3" style="padding:3%; font-size: 150%; font-family: 'Jua', sans-serif;">
               프로젝트 정보 등록
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
                     <img src="${contextPath}/resources/images/money.png" onerror="this.style.visibility='hidden';" width="100px" height="100px" style="border-radius:50%;border:2px solid rgb(81, 88, 102);margin-bottom:3px;">
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
                  <li><a href ="temStoreList.do" style ="color :white;">임시 저장 </a></li>
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
        <div class= "col-lg-5" style ="background-color:#212426;margin-left:120px; height:auto;  color:white">
        
        <table width="536px">
          <tr style ="border-bottom: solid 3px white;" >
           <td> <li id  ="bText" >검수중</li></td>
           
          </tr>
        </table>
          
          <br> 

        <div class ="boxbox" id= "explainbox" style ="padding:20px;">
            
            <li id ="sText">1. DEVENUE 내부에서 검수 중인 프로젝트 목록입니다.<br> &nbsp;&nbsp; 검수에는 최대 24시간이 소요됩니다.<br>
            2. 검수 과정에서 DEVENUE 매니저가 유선 또는 이메일 연락을 할 수 있습니다.<br>
            3. 검수가 완료되면 지원자 모집이 시작됩니다.<br>
            4. 이용약관에 위배되거나 불법적인 내용이 있는 경우, 프로젝트가 등록되지 않을 수 &nbsp;&nbsp;&nbsp;있습니다.
            </li>
        </div>
        <br>
           <c:choose>
           
       <c:when test="${!empty list1}">
       <c:forEach var ="p" items="${list1}">
         
       
        <div class = "boxbox" id ="projectbox" style ="margin-top:50px;" >
          <table width="535px"   >
              <thead>
				<input type ="hidden" value = ${p.proId} >
                  <tr >
                      <td><li style= "color: white; padding-left:10px; padding-top:10px;" >${p.proName}</li></td>
                      
                      
                  </tr>
                  
                  <tr id ="sText"  >
                      <td colspan="8" style="border-bottom:2px solid #2098d1; padding-left:10px; margin-left:30px; ">
                        <span class="badge badge-primary">${p.proMCType}</span>
                        <span class="badge badge-success">${p.proDCType}</span></td>
                      
                  </tr>
                  <tr style= "border-bottom:2px solid #2098d1; border-top:2px solid #2098d1;" id ="sText" >
                     
                      <td><img
						src="${contextPath}/resources/images/money	.png" height="30px"
						 width  ="20px" style ="margin-left: 25px; padding-top:10px;  padding-bottom:10px;" >  <span class="badge badge-secondary" style ="margin-right:5px;">예상금액    </span> ${p.proPayment}원
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
                          <tr  align ="center" style ="border-bottom:2px solid  #2098d1; ; padding:1px; height:50px;" id ="sText">
                            
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
                              <td style =  ><span class="badge badge-primary" style ="font-size:15px; padding:5px; margin-left:10px;  width:80px;">모집인원 </span></td>
                              <td width="120px; " >${p.proRecruitNum}명</td>
                            
                          </tr>
                       
                          <tr  align ="center" style= "border:1px solid black;" height="30" id ="sText">
                           
                         
				
					
							
						
                              <td colspan="6" style ="border-right: 1px solid #2098d1 ">
                                  <div style= "float:right; margin-right:30px; padding:10px;">
                                  <button id ="test6" type ='button' class="btn/middle btn-info" style= "color:black; width:90px;" onclick="location.href='proDelete.do?proId='+${p.proId}">취소</button>
                                  <button type='button' class="btn/middle btn-info" style= "color:black; width:90px;" onclick="location.href='proUpdateForm.do?proId='+${p.proId}"> 수정</button>
                                  </tr>


	
    </div>
  </div>
</div>

</td>
</tr>   
                   
            </table>      
    
      </div>
       
     </c:forEach>
      <section class="mt-5 mb-5" id="pagination" style ="margin-left:70px;">

            <div class="row d-flex justify-content-around align-items-center">

              <!--페이지네이션-->
              <div class="col-12 col-md-4 text-center">
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-center mb-0 text-dark">
                  	<c:if test="${pi.currentPage eq 1 }">
                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-left"></i></a></li>
                    </c:if>
                    <c:if test="${pi.currentPage gt 1}">
                    <c:url var="clistBack" value="checkList.do">
                    	<c:param name="page" value="${pi.currentPage-1}"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${clistBack}"><i class="fas fa-chevron-left"></i></a></li>
                    </c:if>
                    
                    <c:forEach begin="${pi.startPage}" end="${pi.endPage}" step="1" var="pn">
                    <c:if test="${pi.currentPage eq pn}">
                    <li class="page-item active"><a class="page-link">${pn}</a></li>
                    </c:if>
                    <c:if test="${pi.currentPage ne pn}">
                    <c:url var="clistCheck" value="checkList.do">
                    <c:param name="page" value="${pn}"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${clistCheck}">${pn}</a></li>
                    </c:if>
                    </c:forEach>
                   
                    <c:if test="${pi.currentPage eq pi.maxPage}">
                    <li class="page-item"><a class="page-link"><i class="fas fa-chevron-right"></i></a></li>
                  	</c:if>
                  	<c:if test="${pi.currentPage lt pi.maxPage}">
                  	<c:url var="clistFront" value="checkList.do">
                    	<c:param name="page" value="${pi.currentPage+1}"/>
                    </c:url>
                    <li class="page-item"><a class="page-link" href="${clistFront}"><i class="fas fa-chevron-right"></i></a></li>
                  	</c:if>
                  </ul>
                </nav>
              </div>
            </div>

          </section>
      </c:when>
     
    <c:when test="${empty list1}">
   
    <br>
 <div id= "explainbox" class ="boxbox" style ="padding:30px;">
              
              <li id ="sText" style =" margin-left:0px; font-size:20px; text-align:center;">
              	검수중인 프로젝트를 찾을 수 없습니다!
                
              </li>
          </div>
    
    </c:when>
    </c:choose>
   
		
    </form>
  </div>
  
</div>
</div>
</div>
<jsp:include page = "../common/footer.jsp"/>
</body>
</html>