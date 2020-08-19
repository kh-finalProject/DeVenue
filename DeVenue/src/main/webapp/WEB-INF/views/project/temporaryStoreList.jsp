<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                      <td style= "color:#2098D1">닉네임</td>
                    </tr>
                    
                    <td>sailer5247@gmail.com</td>
                 
                  </tr>
              </table>

              
            </div>
            <br>

              <div>
                <li  id ="sText" > <a href ="checkingProjectList.do" style ="color:white  "> 검수중인 프로젝트</a></li>
              </div>
              <br>
              <br>
              <br>
              <div>
                  <li id ="bText" style ="color:lightslategray"> <a href ="#" style ="color: #2098d1;">임시저장</a></li>
                   <br>
                  
                  <br>
                
              </div>
              <br>
              <div>
             <li  id ="stext"  style= "color:lightslategray"> <a href ="addFailProjectList.do" style ="color: white;">등록 실패</a></li>
                  <br>
                

              </div>
          </div>
      </div>








        <!--정보입력-->
        <div class= "col-lg-6" style ="background-color: black; height:auto;  color:white">
        
        <table width="540px">
          <tr style ="border-bottom: solid 3px #2098d1;" >
           <td> <li id  ="bText">임시 저장</li></td>
           
          </tr>
        </table>
          
          <br> 

        <div id= "explainbox">
            
            <li id ="sText">1. 프로젝트 내용 작성 중 임시 저장한 프로젝트 목록입니다.<br>
              2. [수정] 버튼을 클릭하여 프로젝트의 내용을 수정할 수 있습니다.
              
            </li>
        </div>
        <br>
        <div id ="projectbox">
            <table width="540px" >
                <thead>
                  <tr >
                    <td><li style= "color: white; padding-left:10px; padding-top:10px;" >Title</li></td>
                    
                    <td colspan="5"><a id ="sText" style ="float:right; font-size:25px; padding-top:10px; padding-left:10px;" > 
  
                   
                      
  </td>
                </tr>
                  <tr id ="sText" style ="">
                    <td colspan="6" style="border-bottom:2px solid #2098d1; padding-left:10px; ">
                      <span class="badge badge-primary">개발</span>
                      <span class="badge badge-success">워드프레스</span></td>
                    
                </tr>
                 <tr style= "border-bottom:2px solid #2098d1" id ="sText" >
                     
                      <td><img
						src="${contextPath }/resources/images/money	.png" height="30px"
						 width  ="20px" style ="margin-left: 25px; padding-top:10px;  padding-bottom:10px;" >  <span class="badge badge-secondary" style ="margin-right:5px;">예상금액    </span>
                    </td>
                      <td >2000000원&nbsp;&nbsp;&nbsp;</td>
                      <td ><img
						src="${contextPath }/resources/images/period.png" height="30px"
						 width  ="20px;"> <span class="badge badge-secondary" style ="margin-right:5px;">예상기간   </span></td>
                      <td>30일&nbsp;&nbsp;&nbsp;</td>
                      <td><li><img
						src="${contextPath }/resources/images/deadline.png" height="30px"
						 width  ="20px;"> <span class="badge badge-secondary" style ="margin-right:5px;">모집마감    </span></li></td>
                      <td><li style= "margin-right:15px;">2020년 2월 30일&nbsp;&nbsp;&nbsp;</li></td>
                 
                  </tr>

                            <tr  align ="center" style= "border:1px solid black;" height="30" id ="sText">
                                <td colspan="2">  </td>
                                <td colspan="6">
                                    <div style= "margin-left:100px;">
                                    <button class="btn/middle btn-info" style= "color:black;">삭제</button>
                                    <button class="btn/middle btn-info" style= "color:black;">수정</button>
                                  
                                            </div>
                                </td>
                            </tr>
                        </table>
                    </tr>
                </thead>
                    
           
          
             
    

        </div>
        <br>
        
  
    </div>
    <div class= "col-lg-1" style ="background-color: black;">.col-lg-3</div>
</div>

</div>

<jsp:include page = "../common/footer.jsp"/>
</body>
</html>